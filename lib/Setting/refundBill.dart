import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../firebase.dart';

class refundbillPage extends StatefulWidget {
  final paymentId;
  final totalPrice;
  final orderId;
  const refundbillPage(this.paymentId, this.totalPrice,this.orderId, );

  @override
  State<refundbillPage> createState() => _refundbillPage();
}

class _refundbillPage extends State<refundbillPage> {
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
        var time1 = bill['time'].toDate().toUtc().add(Duration(hours:9));
        var date1 = DateFormat('yyyy년 MM월 dd일 HH시 mm분 ss초').format(time1);
        time = date1;

        var cardC = bill['card']['company'];
        cardCompany = cardC;
        var cardN = bill['card']['number'];
        cardNumber = cardN;
        var pointt = bill['point'];
        point = pointt;

        var product0 = bill['buy'].keys;
        List<String>? product1 = keytoList(product0!); //구매목록 (참치김밥, ,)
        var product2 = bill!['buy'].values.toList(); //순서별 가격,개수
        for (int i = 0 ; i<product2.length;i++){
          product.add(product1![i]);
          var priceList = product2![i]; //totalPrice: 머시기, count: 머시기 map
          var f = NumberFormat.currency(locale: "ko_KR", symbol: "￦");
          price.add(f.format(priceList['totalPrice']));
          count.add(priceList['count']);
        }
        isLoading = false;
        print('$product, $price, $count');


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
                          Text('환불 물품',
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
                            ),
                        ],

                      ),
                      SizedBox(height: 20,),
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
                            SizedBox(
                              width: 310,
                              child: Text('적립 포인트',
                                  style:TextStyle(color:Colors.black,
                                      fontSize:20,
                                      fontWeight: FontWeight.w800)),
                            ),
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
                            SizedBox(
                              width: 280,
                              child: Text('총 금액',
                                  style:TextStyle(color:Colors.black,
                                      fontSize:20,
                                      fontWeight: FontWeight.w800)),
                            ),
                            Text('₩ ${widget.totalPrice}',
                                style:TextStyle(color:Colors.pink,
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
                            Text('$cardCompany $cardNumber',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          FloatingActionButton.extended(
                            label: const Text('        확인        ', style:TextStyle(color:Colors.white,
                                fontSize:15,
                                fontWeight: FontWeight.w800)),
                            backgroundColor: Colors.pink,
                            elevation: 0.5,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),


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


  });

  final String product;
  final String count;
  final String price;

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