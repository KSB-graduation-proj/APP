import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class refundDetailPage extends StatefulWidget {
  final refundId;
  const refundDetailPage(this.refundId);

  @override
  State<refundDetailPage> createState() => _refundDetailPage();
}

class _refundDetailPage extends State<refundDetailPage> {
  String? time;
  String? reason;
  String? orderId;
  String? paymentId;
  String? paymentTime;
  String? detail;
  String? errorProduct;
  String? cardnumber;
  String? company;
  String? id;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    id = widget.refundId.substring(0, 7);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String email = "${widget.refundId.substring(0, 7)}@ewhain.net";
    print(email);

    final doc = firestore.collection('refundRequest').doc("${email}");
    doc.get().then((DocumentSnapshot doc)
    {
      setState(() {
        final data = doc.data() as Map<String,dynamic>;
        //환불요청 시간
        String date1 = widget.refundId.substring(8);
        time = "20${date1.substring(0, 2)}년 ${date1.substring(2, 4)}월 ${date1.substring(4, 6)}일 ${date1.substring(6, 8)}시 ${date1.substring(8, 10)}분 ${date1.substring(10)}초";
        var refundData = data[widget.refundId.trim()];
        reason = refundData['reason'];
        orderId = refundData['orderId'];
        paymentId = refundData['paymentId'];
        String? date2 = orderId!.substring(8);
        paymentTime = "20${date2!.substring(0, 2)}년 ${date2.substring(2, 4)}월 ${date2.substring(4, 6)}일 ${date2.substring(6, 8)}시 ${date2.substring(8, 10)}분 ${date2.substring(10)}초";

        detail = refundData['detail'];
        errorProduct = refundData['errorProduct'];
        cardnumber= refundData['card']['number'];
        company=refundData['card']['company'];

        isLoading = false;
      });
    });


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xfff2f4f6),
      appBar: AppBar(

        iconTheme: IconThemeData(
            color: Colors.black),
        title:
        Text('환불 요청 상세',
            style:TextStyle(color:Colors.black,
                fontSize:20,
                fontWeight: FontWeight.w800)),
                backgroundColor: Colors.white,
                elevation: 0.0,
                centerTitle: true,
        ),

      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Container(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children:<Widget> [
                SizedBox(height: 10,),
                Container(width: 700,
                    child: Divider(
                        height: 0.0,
                        color: Color(0xfff4f2f6), thickness: 10.0)),

                Card(
                  elevation: 1.0,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Row(
                          children: [
                            SizedBox(width: 20,),
                            Text('환불 요청이 들어왔습니다',
                          style:TextStyle(color:Color(0xff2eb67d),
                              fontSize:17,
                              fontWeight: FontWeight.w600)),]),
                     SizedBox(height: 5,),
                      Row(
                        children:
                        [
                          SizedBox(width: 20,),
                          Text('회원 아이디 : $id',
                              style:TextStyle(color:Colors.black,
                                  fontSize:20,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                          children:
                          [
                            SizedBox(width: 20,),
                              Text('$reason',
                                    style:TextStyle(color:Colors.black54,
                                        fontSize:17,
                                        fontWeight: FontWeight.w600)),
                          ]),
                      SizedBox(height: 10,),
                      Container(width: 500,
                          child: Divider(
                              indent: 10.0,
                              endIndent: 10.0,
                              color: Colors.black45, thickness: 1.0)),
                      SizedBox(height: 10,),
                      Row(
                          children:
                          [
                            SizedBox(width: 20,),
                            Text('주문번호 : $orderId',
                                    style:TextStyle(color:Colors.black38,
                                        fontSize:16,
                                        fontWeight: FontWeight.w600)),
                            ]
                          ),
                      SizedBox(height: 5,),
                      Row(
                          children:
                          [
                            SizedBox(width: 20,),
                            Text('환불 요청 시간 : $time',
                                style:TextStyle(color:Colors.black38,
                                    fontSize:16,
                                    fontWeight: FontWeight.w600)),
                          ]),

                      SizedBox(height: 10,),
                      Row(
                          children:
                          [
                            SizedBox(width: 20,),
                            Text('오류 물품 : $errorProduct',
                                style:TextStyle(color:Color(0xff2eb67d),
                                    fontSize:18,
                                    fontWeight: FontWeight.w600)),

                          ]),
                      SizedBox(height: 10,),
                      Row(
                          children:
                          [
                            SizedBox(width: 20,),
                            Text('환불 요청 내용 : ',
                                style:TextStyle(color:Colors.black54,
                                    fontSize:16,
                                    fontWeight: FontWeight.w600)),
                          ]),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        child: Text('${detail}',
                          style:
                          TextStyle(fontSize: 16,color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(width: 500,
                          child: Divider(
                              indent: 10.0,
                              endIndent: 10.0,
                              color: Colors.black45, thickness: 1.0)),
                      SizedBox(height: 10,),
                      Row(
                          children:
                          [
                            SizedBox(width: 20,),
                            Text('재결제 요청 카드 : ',
                                style:TextStyle(color:Colors.black38,
                                    fontSize:16,
                                    fontWeight: FontWeight.w600)),
                          ]),
                      SizedBox(height: 8,),
                      Row(
                          children:
                          [
                            SizedBox(width: 20,),
                            Icon(
                              Icons.wallet,
                              color: Colors.black45,
                            ),
                            SizedBox(width: 20,),
                            Text('$company  $cardnumber',
                                style:TextStyle(color:Colors.black54,
                                  fontSize:18,
                                )),
                          ]),
                      SizedBox(height: 10,),
                      Container(width: 500,
                          child: Divider(
                              indent: 10.0,
                              endIndent: 10.0,
                              color: Colors.black45, thickness: 1.0)),

                      SizedBox(height: 10,),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:
                          [

                            Text('주문 일시: $paymentTime.',
                                style:TextStyle(color:Colors.black45,
                                  fontSize:15,
                                )),
                            SizedBox(width: 20,),
                          ]),
                      SizedBox(height: 10,),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:
                          [
                            Text('결제 번호: $paymentId',
                                style:TextStyle(color:Colors.black45,
                                  fontSize:15,
                                )),
                            SizedBox(width: 20,),
                          ]),
                      SizedBox(height: 40,),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [

                            FloatingActionButton.extended(
                              heroTag: 'ok',
                              label: const Text('       확인       ', style:TextStyle(color:Colors.white,
                                  fontSize:15,
                                  fontWeight: FontWeight.w800)),
                              backgroundColor: Color(0xff2eb67d),
                              elevation: 0.5,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            const SizedBox(width:50),
                          ],

                      ),
                      SizedBox(height: 30,)
                    ],
                  ),),

              ],
            ),
          ),
        ),

            ),
        );
  }
}

class _billDescription extends StatelessWidget {
  const _billDescription({
    required this.product,
    required this.count,
    required this.price,
    required this.payment,

  });

  final String product;
  final String count;
  final String price;
  final String payment;


  @override
  Widget build(BuildContext context) {
  return Container(
    child: Column(
      children: [
       Row(
    children: [
      SizedBox(width: 40,),
      SizedBox(
        child: Text(product,
            style:TextStyle(color:Colors.black45,
              fontSize:18,
              fontWeight: FontWeight.bold,
            )),
        width:180,
      ),
      SizedBox(
        child: Text('X $count',
            style:TextStyle(color:Colors.black45,
              fontSize:18,
              fontWeight: FontWeight.bold,
            )),
        width:80,
      ),
      SizedBox(
        child: Text(price,
            style:TextStyle(color:Colors.black45,
              fontSize:18,
              fontWeight: FontWeight.bold,
            )),
        width:80,
      ),
    ],
  ),
    SizedBox(height: 15,),
  ]),);
  }
}