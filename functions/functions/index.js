const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

const orderF = require("./order");
const paymentF = require("./payment");
const refundF = require("./refund");

exports.qrDetection = functions.firestore
    .document("qr/{documentId}")
    .onCreate(async (snap, context) => {
      console.log(snap.id);
    });

exports.orderFunction = orderF.orderFunction;
exports.paymentFunction = paymentF.paymentFunction;
exports.refundFunction = refundF.refundFunction;

