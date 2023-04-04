const functions = require("firebase-functions");
const admin = require("firebase-admin");
const fetch = require("node-fetch");

admin.initializeApp();

const orderF = require("./order");
const paymentF = require("./payment");

exports.qrDetection = functions.firestore
    .document("qr/{documentId}")
    .onCreate((snap, context) => {
    // 새로운 문서가 추가될 때마다 실행되는 코드
      console.log("New document added: ", snap.id, snap.data());
      const data = {
        id: snap.id,
        data: snap.data(),
      };
      // 라즈베리파이의 IP 주소와 포트번호
      const raspberryPiIp = "192.168.137.202";
      const port = 8000;
      // 라즈베리파이에 POST 요청 보내기
      return fetch(`http://${raspberryPiIp}:${port}/api/qr-detection`, {
        method: "POST",
        body: JSON.stringify(data),
        headers: {"Content-Type": "application/json"},
      })
          /* .then((res) => {
            console.log(`statusCode: ${res.status}`);
            return res.text();
          })
          .then((body) => {
            console.log(body);
            return null;
          })*/
          .catch((err) => {
            console.error(err);
            return null;
          });
    });
exports.orderFunction = orderF.orderFunction;
exports.paymentFunction = paymentF.paymentFunction;
