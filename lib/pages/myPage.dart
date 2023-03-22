import 'package:app_test/bill/bill.dart';
import 'package:flutter/material.dart';
import 'package:app_test/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class myPage extends StatefulWidget {
  const myPage({Key? key}) : super(key: key);
  @override
  State<myPage> createState() => _myPage();
}



class _myPage extends State<myPage>{
  String? name;
  bool? coopMember;
  String? coop;
  List<dynamic> orderId=[];
  List<dynamic> paymentId=[];
  List<dynamic> time=[];
  List<dynamic> isPaid=[];
  List<dynamic> isRefunded=[];
  List<dynamic> totalPrice=[];

  @override
  void initState() {
    super.initState();
    setData();
    getBillData();
  }

  void setData(){
    final doc = firestore.collection('member').doc("${email}");
    doc.get().then((DocumentSnapshot doc)
    {
      setState(() {
        final data = doc.data() as Map<String,dynamic>;
        name = data['name'];
        coopMember = data['coopMember'];
        if(coopMember==true){
          coop='조합원';}
        else{coop='비조합원';}
      });
    },);
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
          var time1 = bill1['time'].toDate().toUtc().add(Duration(hours:9));
          var date1 = DateFormat('yy/MM/dd HH:mm').format(time1);
          print(time1); print(date1);
          time.add(date1);
          var isPaid1 = bill1['isPaid'];
          var isPaid2;
          if(isPaid1==true){
            isPaid2='결제완료';}
          else{isPaid2='결제실패';}
          isPaid.add(isPaid2);
          var isRefunded1 = bill1['isRefunded'];
          isRefunded.add(isRefunded1);
          var totalPrice1 = bill1['totalPrice'];
          var f = NumberFormat("#,###");
          totalPrice.add(f.format(totalPrice1));
        }print('$orderId,$paymentId, $time,$isPaid,$totalPrice');
      });
    },);

    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
           // mainAxisSize: MainAxisSize.max,
           // mainAxisAlignment: MainAxisAlignment.center,
            children:[
              SizedBox(height: 20.0,),
              ClipOval(
                  child: Image.asset('assets/profile1.jpg',
                      width: 90,
                      height: 90,
                      fit:BoxFit.fill)
              ),
              SizedBox(height: 10.0,),
               Text('$name', textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
             SizedBox(height: 10.0,),
             Text('$coop',textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              )
              ,SizedBox(height: 10.0,),
              Column(
                children: [
                  for (int i=0;i<orderId.length;i++)
                    if(isRefunded[i]==false)
                      CustomListItemTwo(
                        paymentno: '${paymentId[i]}',
                        title: '${time[i]} 결제 영수증',
                        orderno: '${orderId[i]}',
                        payment: '${isPaid[i]}',
                        price: '${totalPrice[i]}',
                      ),

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
          color: Color(0xfffbfbfb),
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
                    if(payment=="결제실패")...[
                      Text(
                        payment,
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                        ),
                      ),
                    ]
                      else...[
                      Text(
                        payment,
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2eb67d),
                        ),
                      ),
                    ]

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
                    if(payment=="결제실패")...[
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
                            MaterialPageRoute(builder:(context) => billPage(payment,paymentno,price,orderno)),//orderno전달해서 화면 이어지게
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
                            MaterialPageRoute(builder:(context) => billPage(payment,paymentno,price,orderno)),//orderno전달해서 화면 이어지게
                          );
                        },
                        child: const Text('상세보기'),
                      ),
                    ]

                    ,const SizedBox(width: 50),
                    if(payment=="결제실패")...[
                      Text(
                        '미결제 금액 ₩ $price',
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.pink,
                        ),
                      ),
                    ]
                    else...[
                      Text(
                        '결제 금액 ₩ $price',
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


