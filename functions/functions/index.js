const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

const orderF = require("./order");
const paymentF = require("./payment");

exports.qrDetection = functions.firestore
    .document("qr/{documentId}")
    .onCreate((snap, context) => {
    // 새로운 문서가 추가될 때마다 실행되는 코드
      console.log("New document added: ", snap.id, snap.data());


    // 여기에 추가로 실행할 코드를 작성합니다.
    // 라즈베리파이에 전달할 코드 작성
    // 예를 들어, FCM 알림 전송 등의 기능을 수행할 수 있습니다.
    });

exports.orderFunction = orderF.orderFunction;
exports.paymentFunction = paymentF.paymentFunction;
