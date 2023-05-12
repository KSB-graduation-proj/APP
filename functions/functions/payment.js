const functions = require("firebase-functions");
const admin = require("firebase-admin");

exports.paymentFunction = functions.firestore
    .document("order/{orderId}")
    .onUpdate(async (change, context) => {
      const newValue = change.after.data();
      const previousValue = change.before.data();
      const newFields = Object.keys(newValue).filter(
          (key) => !Object.prototype.hasOwnProperty.call(previousValue, key));
      const orderID = newFields[0];
      const goods = JSON.parse(JSON.stringify(newValue[orderID])); // 객체로 변환
      const email = context.params.orderId;
      const totalSum = Object.values(goods)
          .reduce((acc, item) => acc + item.totalPrice, 0);
      console.log(orderID, goods, email, totalSum);

      const cardSnapshot = await admin.firestore()
          .collection("card").doc(email).get();
      if (cardSnapshot.exists) {
        const cardData = cardSnapshot.data();
        const selectedCard = Object.keys(cardData).find(
            (key) => cardData[key].default === true);
        const cardBalance = cardData[selectedCard].balance;
        const cardCompany = cardData[selectedCard].company;
        const cardNumber = cardData[selectedCard].number;
        console.log(orderID, goods,
            email, totalSum, selectedCard, cardBalance,
            cardCompany, cardNumber);
        // 카드 잔액 확인
        let paid = false;
        let newCardBalance = cardBalance;
        if (cardBalance >= totalSum) {
          paid = true;
          newCardBalance = cardBalance - totalSum;
        }
        console.log(`paid: ${paid}, newCardBalance: ${newCardBalance}`);
        const cardRef = admin.firestore().collection("card").doc(email);
        await cardRef.update({
          [`${selectedCard}.balance`]: newCardBalance});
        // 결제정보 저장
        const paymentID = "p"+orderID;
        const point = totalSum * 0.05;
        const PaymentDoc = admin.firestore().collection("payment").doc(email);
        try {
          const docSnapshot = await PaymentDoc.get();
          if (docSnapshot.exists) {
            // 문서가 이미 존재하는 경우 업데이트
            await PaymentDoc.update({
              [paymentID]: {
                isPaid: paid,
                isRefunded: false,
                buy: goods,
                card: {
                  number: cardNumber,
                  company: cardCompany},
                orderId: orderID,
                point: point,
                totalPrice: totalSum},
            });
          } else {
            // 문서가 존재하지 않는 경우 생성 후 필드 값 저장
            await PaymentDoc.set({
              [paymentID]: {
                isPaid: paid,
                isRefunded: false,
                buy: goods,
                card: {
                  number: cardNumber,
                  company: cardCompany},
                orderId: orderID,
                point: point,
                totalPrice: totalSum},
            });
          }
        } catch (error) {
          console.error("Error processing detection:", error);
          return null;
        }
      } else {
        console.log(`Card document with email ${email} does not exist`);
      }
    });
