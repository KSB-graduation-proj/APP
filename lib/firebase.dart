import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

var email = _auth.currentUser!.email.toString();
var code = email.replaceFirst('@ewhain.net', '');


getData(collection, field)  async{
  final doc = await firestore.collection('$collection').doc("${email}");
  doc.get().then(
        (DocumentSnapshot doc) {
      final data =  doc.data() as Map<String, dynamic>;
      var fieldData= data['$field'];
      print('fb$fieldData');
      return(fieldData);
    },
  );
}

