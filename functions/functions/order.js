const functions = require("firebase-functions");
const admin = require("firebase-admin");

const db = admin.firestore();

exports.orderFunction = functions.firestore
    .document("detection/{detectionId}")
    .onCreate(async (snap, context) => {
      try {
        const detectionData = snap.data();
        const detectID = snap.id;
        const detectionFields = Object.keys(detectionData);
        const detectionCounts = Object.values(detectionData);
        console.log("detectionData: ", detectionData);
        console.log("detectionFields: ", detectionFields);
        console.log("detectionCounts: ", detectionCounts);
        console.log("detectID: ", detectID);
        // 디텍션 데이터의 키값이랑 프로덕트 태그 값 비교해서 같은 값 데이터
        const query = await db
            .collection("product")
            .where("tag", "in", detectionFields)
            .get();
        const matchingProducts = query.docs.map((doc) => {
          const data = doc.data();
          return {id: doc.id, data};
        });
        console.log("matching: ", matchingProducts);

        // 매칭되는 상품 정보를 이용해 주문 정보 생성
        const goods = {};
        matchingProducts.forEach((product) => {
          const productData = product.data;
          const productID = product.id;
          const productCount = detectionData[productData.tag];
          const productPrice = productData.price;
          const totalPrice = productPrice * productCount;
          if (!goods[productID]) {
            goods[productID] = {
              count: productCount,
              totalPrice: totalPrice,
            };
          } else {
            goods[productID].count += productCount;
            goods[productID].totalPrice += totalPrice;
          }
        });
        console.log("order: ", goods);

        // 주문 정보를 저장
        const email = detectID.substring(0, 7) + "@ewhain.net";
        const orderDoc = db.collection("order").doc(email);
        try {
          const docSnapshot = await orderDoc.get();
          if (docSnapshot.exists) {
            // 문서가 이미 존재하는 경우 업데이트
            await orderDoc.update({
              [detectID]: goods,
            });
          } else {
            // 문서가 존재하지 않는 경우 생성 후 필드 값 저장
            await orderDoc.set({
              [detectID]: goods,
            });
          }
        } catch (error) {
          console.error("Error processing detection:", error);
          return null;
        }
      } catch (error) {
        console.error("Error processing detection: ", error);
        return null;
      }
    });
