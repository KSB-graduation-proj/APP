import 'package:app_test/bill/bill.dart';
import 'package:flutter/material.dart';
import 'package:app_test/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class myPage extends StatefulWidget {
  const myPage({Key? key}) : super(key: key);
  @override
  State<myPage> createState() => _myPage();
}

class _myPage extends State<myPage>{
  String? name;
  bool? coopMember;
  String? coop;

  @override
  void initState() {
    super.initState();
    setData();
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
              const MyStatelessWidget(),
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
    required this.payment,
    required this.price,
  });

  final String title;
  final String orderno;
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
                    Text(
                      payment,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2eb67d),
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
                        orderno,
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
                        backgroundColor: Color(0xff2eb67d),
                        padding: const EdgeInsets.fromLTRB(45.0, 7.0, 45.0, 7.0),
                        textStyle: const TextStyle(fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder:(context) => billScreen()),
                        );
                      },
                      child: const Text('상세보기'),
                    ),
                    const SizedBox(width: 50),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff2eb67d),
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
    required this.price,
  });

  final String title;
  final String orderno;
  final String payment;
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

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
                title: '2022 11 11 결제 영수증',
                orderno: '주문번호: eng20221111125835lwi',
                payment: '결제완료',
                price: '결제 금액 ₩ 14,800',
              ),
              CustomListItemTwo(
                title: '2022 11 10 결제 영수증',
                orderno: '주문번호: ssg202211101045231lwi',
                payment: '결제완료',
                price: '결제 금액 ₩ 9,400',
              ),
              CustomListItemTwo(
                  title: '2022 11 09 결제 영수증',
                  orderno: '주문번호: pos20221109132519lwi',
                  payment: '결제완료',
                  price: '결제 금액 ₩ 5,200'
              ),
            ],

          )
      ),

    );
  }
}
