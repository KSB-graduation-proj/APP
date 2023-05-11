import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

var email = updateEmail();

final _auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

updateEmail() {
  if (_auth.currentUser!= null) {
    email = _auth.currentUser!.email.toString();
  } else {
    email = null;
  }
  return email;
}

var code = email.replaceFirst('@ewhain.net', '');


setTime(){
  DateTime date2 = new DateTime.now();
  date2 = date2.toUtc().add(Duration(hours:9));
  final settime = DateFormat('yyMMddHHmmss').format(date2);
  return settime;
}

storeData()
{ /*
  final refundRequest = firestore.collection("refundRequest");
  final settime = setTime();
  final id = '${code}_${settime}';
  var payCardList = payCard!.split(" ");
  final cardCompany = payCardList[0];
  final cardNumber = payCardList[1];
  final data = <String, dynamic>
  {
    '${id}': {
      'card': {
        'company': cardCompany,
        'number': cardNumber,
      },
      'detail': detail,
      'errorProduct': errorProduct,
      'orderId':widget.orderId,
      'paymentId':widget.paymentId,
      'reason':reason,

    } };
  refundRequest.doc(email).set(data, SetOptions(merge: true));
  */
}



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

/*
void getBillData() {
  final doc = firestore.collection('payment').doc("${email}");
  doc.get().then((DocumentSnapshot doc)
  {
    setState(() {
      final data = doc.data() as Map<String,dynamic>; // 모든 영수증 데이터
      List<String>? bill = keytoList(data.keys);
      for(int i=0; i< bill!.length ;i++) {
        var bill1 = data[bill![i]];
        var cardMap = bill1['card']['number'];
        var product1 = bill1['buy'].keys;
        List<String>? product = keytoList(product1!); //결제번호 1번의 구매목록 [참치김밥. 제로콜라. 빈츠]
        var product2 = bill1!['buy'].values.toList(); //순서별 가격,개수
        for (int i = 0 ; i<product2.length;i++){
        var priceList = product2![i]; //totalPrice: 머시기, count: 머시기 map
        //print(priceList['totalPrice']);
        //print(priceList['count']);
        }*/

class Payment {
  final Map? buy;
  final Map? card;
  final bool? isPaid;
  final bool? isRefunded;
  final String? orderId;
  final int? point;
  final DateTime? time;
  final int? totalPrice;

  Payment({
    this.buy,
    this.card,
    this.isPaid,
    this.isRefunded,
    this.orderId,
    this.point,
    this.time,
    this.totalPrice,
  });

  factory Payment.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Payment(
      buy: data?['buy'],
      card: data?['card'],
      isPaid: data?['isPaid'],
      isRefunded: data?['isRefunded'],
      orderId: data?['orderId'],
      point: data?['point'],
      time: data?['time'],
      totalPrice: data?['totalPrice'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (buy != null) "buy": buy,
      if (card != null) "card": card,
      if (isPaid != null) "isPaid": isPaid,
      if (isRefunded != null) "isRefunded": isRefunded,
      if ( orderId!= null) "orderId": orderId,
      if (point != null) "point":point ,
      if (time != null) "time": time,
      if (totalPrice != null) "totalPrice":totalPrice ,
    };
  }
}


