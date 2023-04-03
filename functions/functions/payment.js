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
      } else {
        console.log(`Card document with email ${email} does not exist`);
      }
    });
