import 'package:app_test/Setting/refundBill.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../firebase.dart';

class refundInfo extends StatefulWidget {
  const refundInfo({Key? key}) : super(key: key);

  @override
  State<refundInfo> createState() => _refundInfo();

}

class _refundInfo extends State<refundInfo> {
  List<dynamic> orderId=[];
  List<dynamic> paymentId=[];
  List<dynamic> time=[];
  List<dynamic> isRefunded=[];
  List<dynamic> totalPrice=[];

  @override
  void initState() {
    super.initState();
    getBillData();

  }

  List<String>? keytoList(Map){
    List<String> list =[];
    for (String temp in Map){
      list.add(temp);
    }
    return list;
  }

  void getBillData() {
    final doc = firestore.collection('payment').doc("${email}");
    doc.get().then((DocumentSnapshot doc)

    {
      setState(() {
        final data = doc.data() as Map<String,dynamic>; // 모든 영수증 데이터
        List<String>? bill = keytoList(data.keys);
        print('bill:$bill');
        for(int i=0; i< bill!.length ;i++) {
          paymentId.add(bill![i]);
          var bill1 = data[bill![i]]; // 모든 결제번호 데이터

          var orderId1 =bill1!['orderId'].toString();
          orderId.add(orderId1);
          String date1 = orderId1.substring(8);
          String formatDate =
              "${date1.substring(0, 2)}/${date1.substring(2, 4)}/${date1.substring(4, 6)} ${date1.substring(6, 8)}:${date1.substring(8, 10)}:${date1.substring(10)}";
          print(formatDate);
          time.add(formatDate);
          var isRefunded1 = bill1['isRefunded'];
          isRefunded.add(isRefunded1);
          var totalPrice1 = bill1['totalPrice'];
          var f = NumberFormat("#,###");
          totalPrice.add(f.format(totalPrice1));
        }print('$orderId,$paymentId, $time,$totalPrice');
      });
    },);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.black),
          title: const Text('환불 영수증',
              style:TextStyle(color:Colors.black,
                  fontSize:20,
                  fontWeight: FontWeight.w700)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.center,
            children:[
              SizedBox(height: 20.0,),
              Column(
                children: [
                  for (int i=0;i<orderId.length;i++)...[
                    if(isRefunded[i]==true)...[
                      CustomListItemTwo(
                        paymentno: '${paymentId[i]}',
                        title: '${time[i]} 환불 영수증',
                        orderno: '${orderId[i]}',
                        payment: '환불완료',
                        price: '${totalPrice[i]}',
                      ),
                    ]
                  ]


                ],
              )

            ],
          ),

        )
    );

  }
}

class _billDescription extends StatelessWidget {
  const _billDescription({
    required this.title,
    required this.orderno,
    required this.paymentno,
    required this.payment,
    required this.price,
  });

  final String title;
  final String orderno;
  final String paymentno;
  final String payment;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
          margin: EdgeInsets.fromLTRB(12.0, 8.0, 12.0,2.0),
          color: Color(0xffe2e2e2),
          elevation:1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex:4,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.more_vert),
                      color: Colors.black54,
                      onPressed: (){
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(width: 20),
                      Text(
                        payment,
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                        ),
                      ),
                    ]),),
              Expanded(
                flex: 4,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(width: 20),
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 17,
                        ),
                      ),
                    ]),),
              Expanded(
                flex: 3,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(width: 20),
                      Text(
                        '주문번호: $orderno',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 11.0,
                          color: Colors.black54,
                        ),
                      ),

                    ]),),
              SizedBox(height: 5),
              Expanded(
                flex: 6,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    const SizedBox(width: 20),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.pink,
                        padding: const EdgeInsets.fromLTRB(45.0, 7.0, 45.0, 7.0),
                        textStyle: const TextStyle(fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder:(context) => refundbillPage(paymentno,price,orderno),),
                        );
                      },
                      child: const Text('상세보기'),
                    ),
                    const SizedBox(width: 50),
                    Text(
                      '환불 금액 ₩ $price',
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex:1,
                  child: Column(
                      children: <Widget>[
                        //const SizedBox(width: 10),
                      ]
                  )
              )
            ],

          ),
        )
    );
  }
}

class CustomListItemTwo extends StatelessWidget {
  const CustomListItemTwo({
    super.key,
    required this.title,
    required this.orderno,
    required this.payment,
    required this.paymentno,
    required this.price,
  });

  final String title;
  final String orderno;
  final String payment;
  final String paymentno;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: SizedBox(
        height: 160,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(3.0, 0.0, 3.0, 0.0),
                child: _billDescription(
                  title: title,
                  orderno: orderno,
                  payment: payment,
                  price: price,
                  paymentno: paymentno,

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: Column(
            //physics: const AlwaysScrollableScrollPhysics(),
            //scrollDirection: Axis.vertical,
            //shrinkWrap: true,
            //padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              CustomListItemTwo(
                title: '2022 11 11 환불 영수증',
                orderno: '환불번호: eng20221111125835lwi',
                payment: '환불완료',
                price: '환불 금액 ₩ 14,800',
              ),
            ],

          )
      ),

    );
  }
}
*/