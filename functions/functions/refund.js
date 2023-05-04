const functions = require("firebase-functions");
const admin = require("firebase-admin");

exports.refundFunction= functions.firestore
    .document("refundRequest/{documentId}")
    .onUpdate(async (change, context) => {
      const newValue = change.after.data();
      const previousValue = change.before.data();
      const newFields = Object.keys(newValue).filter(
          (key) => !Object.prototype.hasOwnProperty.call(previousValue, key));
      const refundID = newFields[0];
      const data = JSON.parse(JSON.stringify(newValue[refundID]));
      const email = context.params.documentId;
      const cardNumber = data.card.number;
      const cardCompany = data.card.company;
      const errorReason = data.reason;
      const errorTag = data.errorProduct;
      const orderID = data.orderId;
      console.log(orderID, email,
          cardNumber, cardCompany, errorReason, errorTag);
      if (errorReason=="잔액 부족") {
        const cardID = `${cardCompany}_${cardNumber}`;
        const orderSnapshot = await admin.firestore()
            .collection("order").doc(email).get();
        const orderData = orderSnapshot.data();
        const refundgoods = orderData[orderID];
        const totalSum = Object.values(refundgoods)
            .reduce((acc, item) => acc + item.totalPrice, 0);
        // 카드 찾기
        const cardSnapshot = await admin.firestore()
            .collection("card").doc(email).get();
        const cardData = cardSnapshot.data();
        const reCard = cardData[cardID];
        const recardBalance = reCard.balance;
        const recardCompany = reCard.company;
        const recardNumber = reCard.number;
        console.log(totalSum, reCard, recardBalance,
            recardCompany, recardNumber);
        // 카드 잔액 확인
        let repaid = false;
        let renewCardBalance = recardBalance;
        if (recardBalance >= totalSum) {
          repaid = true;
          renewCardBalance = recardBalance - totalSum;
        }
        console.log(`paid: ${repaid}, newCardBalance: ${renewCardBalance}`);
        const cardRef = admin.firestore().collection("card").doc(email);
        await cardRef.update({
          [`${cardID}.balance`]: renewCardBalance});
        // 결제 정보 변경
        const paymentid = "p"+orderID;
        const repaymentid = "r"+orderID;
        const point = totalSum * 0.05;
        const PaymentDoc = admin.firestore().collection("payment").doc(email);
        await PaymentDoc.update({
          [`${paymentid}.isRefunded`]: true});
        await PaymentDoc.update({
          [repaymentid]: {
            isPaid: repaid,
            isRefunded: false,
            buy: refundgoods,
            card: {
              number: recardNumber,
              company: recardCompany},
            orderId: orderID,
            point: point,
            totalPrice: totalSum},
        });
      } else if (errorReason=="물품 인식 오류") {
        // 라파이 전송 -> 객체재인식 -> order호출 -> payment 그대로
      } else {
        // 걍 카드 바꿔서 재결제
      }
    });
