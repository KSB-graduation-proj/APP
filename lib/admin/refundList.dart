import 'package:app_test/admin/refundDetail.dart';
import 'package:app_test/firebase.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_test/admin/qrScan.dart';
class refundPage extends StatefulWidget {
  const refundPage({super.key});

  @override
  State<refundPage> createState() => _refundPage();
}

class _refundPage extends State<refundPage> {
  String? name;

  // 데이터를 저장할 리스트
  List<String> refundIDList = [];
  List<String> reasonList = [];
  List<String> orderIdList = [];
  List<String> paymentIdList = [];
  List<String> detailList = [];
  List<String> errorProductList = [];
  List<String> numberList = [];
  List<String> companyList = [];
  List<String> idList = [];

// 오류 데이터를 저장할 리스트
  List<String> error_refundIDList = [];
  List<String> error_orderIdList = [];
  List<String> error_paymentIdList = [];
  List<String> error_detailList = [];
  List<String> error_numberList = [];
  List<String> error_companyList = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    setData();
  }

  void setData() {
    FirebaseFirestore.instance.collection('refundRequest').get()
        .then((QuerySnapshot querySnapshot)
    {
      setState((){
        querySnapshot.docs.forEach((DocumentSnapshot documentSnapshot) {
          Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
          data.forEach((refundID, data) {
            refundIDList.add(refundID);
            reasonList.add(data['reason']);
            orderIdList.add(data['orderId']);
            paymentIdList.add(data['paymentId']);
            detailList.add(data['detail']);
            errorProductList.add(data['errorProduct']);
            numberList.add(data['card']['number']);
            companyList.add(data['card']['company']);
            String id = data['orderId'].substring(0, 7);
            idList.add(id);

            // 'reason'이 '물품 인식 오류'인 경우에 대해서만 오류 데이터 리스트에 저장
            if (data['reason'] == '물품 인식 오류') {
              error_refundIDList.add(refundID);
              error_orderIdList.add(data['orderId']);
              error_paymentIdList.add(data['paymentId']);
              error_detailList.add(data['detail']);
              error_numberList.add(data['card']['number']);
              error_companyList.add(data['card']['company']);
            }
            isLoading = false;
      });

        });
      });
    });}

  @override
  Widget build(BuildContext context) {
      return
        isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : SingleChildScrollView(
          child: Column(
             children:[
              SizedBox(height: 20.0,),
              Text('환불 요청 내역', textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.0,),
              Column(
                children: [
                  for (int i=0;i<refundIDList.length;i++)...[
                      CustomListItemTwo(
                        paymentno: '${paymentIdList[i]}',
                        title: '${refundIDList[i]} ',
                        orderno: '${orderIdList[i]}',
                        reason: '${reasonList[i]}',
                        id: '${idList[i]}',
                      ),
                  ]
                ],

              )
            ],
          ),

        );
    }

}

class _refundDescription extends StatelessWidget {
  const _refundDescription({
    required this.title, //refundno
    required this.orderno,
    required this.paymentno,
    required this.reason,
    required this.id,
  });

  final String title;
  final String orderno;
  final String paymentno;
  final String reason;
  final String id;


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
          margin: EdgeInsets.fromLTRB(12.0, 8.0, 12.0,2.0),
          color: Color(0xfffbfbfb),
          elevation:1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Expanded(
                flex: 2,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(width: 20),
                      if(reason=="물품 인식 오류")...[
                        Text(
                          reason,
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        ),
                      ]
                      else...[
                        Text(
                          reason,
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2eb67d),
                          ),
                        ),
                      ]

                    ]),),
              Expanded(
                flex: 2,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(width: 20),
                      Text(
                        '$title',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 17,
                        ),
                      ),
                    ]),),
              Expanded(
                flex: 1,
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
                flex: 3,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    const SizedBox(width: 20),
                    if(reason=="물품 인식 오류")...[
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
                            MaterialPageRoute(builder:(context) => refundDetailPage(title)),//orderno전달해서 화면 이어지게
                          );
                        },
                        child: const Text('상세보기'),
                      ),
                    ]
                    else...[
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xff2eb67d),
                          padding: const EdgeInsets.fromLTRB(45.0, 7.0, 45.0, 7.0),
                          textStyle: const TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder:(context) => refundDetailPage(title)),//orderno전달해서 화면 이어지게
                          );
                        },
                        child: const Text('상세보기'),
                      ),
                    ]

                    ,const SizedBox(width: 50),
                    if(reason=="물품 인식 오류")...[
                      Text(
                        '회원 ID: $id',
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.pink,
                        ),
                      ),
                    ]
                    else...[
                      Text(
                        '회원 ID: $id',
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff2eb67d),
                        ),
                      ),
                    ]

                  ],
                ),
              ),
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
    required this.reason,
    required this.paymentno,
    required this.id,
  });

  final String title;
  final String orderno;
  final String reason;
  final String paymentno;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: SizedBox(
        height: 142,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(3.0, 0.0, 3.0, 0.0),
                child: _refundDescription(
                  title: title,
                  orderno: orderno,
                  reason: reason,
                  id: id,
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
