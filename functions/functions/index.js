const functions = require("firebase-functions");
const admin = require("firebase-admin");
const axios = require("axios");

admin.initializeApp();

const orderF = require("./order");
const paymentF = require("./payment");
const refundF = require("./refund");

exports.qrDetection = functions.firestore
    .document("qr/{documentId}")
    .onCreate(async (snap, context) => {
      console.log("New document added: ", snap.id, snap.data());
      const data = {
        id: snap.id,
        data: snap.data(),
      };
      try {
        const response = await axios.post("http://192.168.137.202:8000/api/qr-detection", data);
        console.log("Response:", response.data);
      } catch (error) {
        console.error("Error:", error);
      }
    });

exports.orderFunction = orderF.orderFunction;
exports.paymentFunction = paymentF.paymentFunction;
exports.refundFunction = refundF.refundFunction;
