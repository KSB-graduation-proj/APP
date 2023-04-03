import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

String? lastDocumentId;

StreamSubscription<QuerySnapshot>  subscribeToQrCollection() {
  return FirebaseFirestore.instance.collection('qr').snapshots().listen((querySnapshot) {
    querySnapshot.docChanges.forEach((docChange) {
      if (docChange.type == DocumentChangeType.added) {
        final String documentId = docChange.doc.id;
        if (documentId != lastDocumentId) {
          final Map<String, dynamic>? documentData = docChange.doc.data();
          myFunction(documentId, documentData!);
          lastDocumentId = documentId;
        }
      }
    });
  });
}

void myFunction(String documentId, Map<String, dynamic> documentData) {
  // order목록에서 같은 값 있으면 실행 ㄴ?
  print('myfunciont 실행');
  print(documentId);
  print(documentData);


}
