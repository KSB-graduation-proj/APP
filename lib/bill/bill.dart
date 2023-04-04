import 'package:app_test/bill/refundRequest_insuffBal.dart';
import 'package:flutter/material.dart';
import 'package:app_test/bill/refundRequest.dart';
import 'package:app_test/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class billPage extends StatefulWidget {
  final orderId;
  final payment;
  final paymentId;
  final totalPrice;
  const billPage(this.payment,this.paymentId, this.totalPrice,this.orderId, );

  @override
  State<billPage> createState() => _billPage();
}

class _billPage extends State<billPage> {
  String? time;
  String? cardCompany;
  String? cardNumber;
  int? point;
  List<dynamic> product=[];
  List<dynamic> price=[];
  List<dynamic> count=[];
  bool isLoading = true;

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
        final data = doc.data() as Map<String,dynamic>;
        var bill = data[widget.paymentId]; //특정 결제번호 데이터
        String date1 = widget.orderId.substring(8);
        String formatDate =
            "20${date1.substring(0, 2)}년 ${date1.substring(2, 4)}월 ${date1.substring(4, 6)}일 ${date1.substring(6, 8)}시 ${date1.substring(8, 10)}분 ${date1.substring(10)}초";
        print(formatDate);
        time = formatDate;
        var cardC = bill['card']?['company'];
        cardCompany = cardC;
        var cardN = bill['card']?['number'];
        cardNumber = cardN;
        var pointt = bill?['point'];
        point = pointt;
        print('card: ${bill.containsKey('card')}');
        var product0 = bill['buy'].keys;
        List<String>? product1 = keytoList(product0!); //구매목록 (참치김밥, ,)
        var product2 = bill!['buy'].values.toList(); //순서별 가격,개수
        for (int i = 0 ; i<product2.length;i++){
          product.add(product1?[i]);
          var priceList = product2[i]; //totalPrice: 머시기, count: 머시기 map
            var f = NumberFormat.currency(locale: "ko_KR", symbol: "￦");
            price.add(f.format(priceList['totalPrice']));
            count.add(priceList['count']);
        }
        isLoading = false;
        print('$product, $price, $count $cardCompany $cardNumber');

      },
           );

      },
        onError: (e) => print("Error getting document: $e"),
    );

  }

  @override
  Widget build(BuildContext context) {
    print(widget.payment);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black),
        title:
        Text('결제 영수증',
            style:TextStyle(color:Colors.black,
                fontSize:20,
                fontWeight: FontWeight.w800)),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                centerTitle: true,
        ),

      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children:<Widget> [
                Card(
                  elevation: 0.0,
                  color: Color(0xfffbfbfb),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 30,),
                      Row(
                        children:
                        [
                          SizedBox(width: 20,),
                          Text('구매 물품',
                              style:TextStyle(color:Colors.black,
                                  fontSize:20,
                                  fontWeight: FontWeight.w800)),
                        ],
                      ),

                      SizedBox(height: 20,),
                      Column(
                        children: [
                          for (int i=0;i<product.length;i++)
                            //if(isRefunded[i]==false)
                              _billDescription(
                                product: '${product[i]}',
                                count: '${count[i]}',
                                price: '${price[i]}',
                                payment:'${widget.payment}'
                              ),
                        ],

                      ),

                      SizedBox(height: 5,),
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
                            if(widget.payment == "결제실패")...[
                              SizedBox(
                                width: 310,
                                child: Text('적립 예정 포인트',
                                    style:TextStyle(color:Colors.black,
                                        fontSize:20,
                                        fontWeight: FontWeight.w800)),
                              ),
                            ]
                            else...[
                              SizedBox(
                                width: 310,
                                child: Text('적립 포인트',
                                    style:TextStyle(color:Colors.black,
                                        fontSize:20,
                                        fontWeight: FontWeight.w800)),
                              ),
                            ],
                            Text('$point',
                                style:TextStyle(color:Colors.black54,
                                    fontSize:20,
                                    fontWeight: FontWeight.w700)),
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
                            if(widget.payment == "결제실패")...[
                              SizedBox(
                                width: 280,
                                child: Text('총 미납 금액',
                                    style:TextStyle(color:Colors.black,
                                        fontSize:20,
                                        fontWeight: FontWeight.w800)),
                              ),
                              Text('₩ ${widget.totalPrice}',
                                  style:TextStyle(color:Colors.pink,
                                      fontSize:20,
                                      fontWeight: FontWeight.w700)),
                            ]
                            else...[
                              SizedBox(
                                width: 280,
                                child: Text('총 금액',
                                    style:TextStyle(color:Colors.black,
                                        fontSize:20,
                                        fontWeight: FontWeight.w800)),
                              ),Text('₩ ${widget.totalPrice}',
                                  style:TextStyle(color:Color(0xff2eb67d),
                                      fontSize:20,
                                      fontWeight: FontWeight.w700)),
                            ]
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
                            Text('결제 수단',
                                style:TextStyle(color:Colors.black,
                                    fontSize:20,
                                    fontWeight: FontWeight.w800)),
                          ]),
                      SizedBox(height: 20,),
                      Row(
                          children:
                          [
                            SizedBox(width: 20,),
                            Icon(
                              Icons.wallet,
                              color: Colors.black45,
                            ),
                            SizedBox(width: 20,),
                            Text('${cardCompany} ${cardNumber}',
                                style:TextStyle(color:Colors.black45,
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

                            Text('결제 일시: $time',
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
                            Text('결제 번호: ${widget.paymentId}',
                                style:TextStyle(color:Colors.black45,
                                  fontSize:15,
                                )),
                            SizedBox(width: 20,),
                          ]),
                      SizedBox(height: 20,),
                      if(widget.payment=="결제실패")...[
                        Text('재결체 요청을 영수증 발급 후 60분 내에 하지 않을 시 '+'\n'
                            '법적 조치 및 Coop-Go 회원정지가 시행될 수 있습니다.',
                          style:TextStyle(color:Colors.pink,
                              fontSize:15,
                              fontWeight: FontWeight.w800
                          ),textAlign: TextAlign.center,),
                      ],
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          const SizedBox(width:15),
                          if(widget.payment=="결제완료")...[
                            FloatingActionButton.extended(
                              heroTag: 'ok',
                              label: const Text('    확인    ', style:TextStyle(color:Colors.white,
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
                          if(widget.payment=="결제완료")...[
                            FloatingActionButton.extended(
                              heroTag: 'refund',
                              label: const Text(' 환불 요청 ', style:TextStyle(color:Colors.white,
                                  fontSize:15,
                                  fontWeight: FontWeight.w800)),
                              backgroundColor: Colors.pink,
                              elevation: 0.5,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)
                                  => refundRequest(widget.orderId, widget.paymentId, widget.payment, product ),),
                                );
                              },
                            ),
                          ]
                          else...[
                            FloatingActionButton.extended(
                              heroTag: 'repay',
                              label: const Text('   재결제 요청   ', style:TextStyle(color:Colors.white,
                                  fontSize:15,
                                  fontWeight: FontWeight.w800)),
                              backgroundColor: Colors.pink,
                              elevation: 0.5,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)
                                  => refundRequest_i(widget.orderId, widget.paymentId, widget.payment, product ),),
                                );
                              },
                            ),
                          ]

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