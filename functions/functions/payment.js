const functions = require("firebase-functions");
const admin = require("firebase-admin");

const db = admin.firestore();

exports.paymentFunction = functions.firestore
    .document("order/{orderId}")
    .onCreate(async (snap, context) => {
      try {
        const orderData = snap.data();
        const email = snap.id;
        // 주문번호 추출하고 주문값 추출하고
        console.log("New order created: ", orderData, email);
        const paymentResult = await makePayment(orderData);
        console.log("Payment result: ", paymentResult);
      } catch (error) {
        console.error("Error processing payment: ", error);
      }
    });

async function makePayment(orderData) {
  // 총가격 구한다음에 card 컬렉션 default = true 가져와서 카드번호, 회사, 잔액
  // 잔액 < 총가격 = > false
  // 잔액 > 총가격 , 잔액에서 총가격 뺀 값으로 업데이트하고
  // true값 반환
  return {status: "success", amount: 100};
}
