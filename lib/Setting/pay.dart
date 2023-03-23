import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app_test/Setting/addPay.dart';

import '../firebase.dart';

class payPage extends StatefulWidget {
  const payPage({Key? key}) : super(key: key);
  @override
  State<payPage> createState() => _payPage();
}

class _payPage extends State<payPage> {
  List<dynamic> cardId=[];
  List<dynamic> company=[];
  List<dynamic> number=[];
  List<dynamic> isDefault=[];
  @override
  void initState() {
    super.initState();
    getCardData();
  }
  List<String>? keytoList(Map){
    List<String> list =[];
    for (String temp in Map){
      list.add(temp);
    }
    return list;
  }
  void getCardData() {
    final doc = firestore.collection('card').doc("${email}");
    doc.get().then((DocumentSnapshot doc)
    {
      setState(() {
        final data = doc.data() as Map<String,dynamic>; // 모든 영수증 데이터
        List<String>? card = keytoList(data.keys);
        print('bill:$card');
        for(int i=0; i< card!.length ;i++) {
          cardId.add(card![i]);
          var card1 = data[card![i]]; // 모든 카드 데이터

          var company1 =card1!['company'];
          company.add(company1);
          var number1 =card1!['number'];
          number.add(number1);
          var isDefault1 = card1['default'];
          isDefault.add(isDefault1);

        }print('$company,$number, $isDefault');
      });
    },);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black),
        title: const Text('결제 수단',
            style:TextStyle(color:Colors.black,
                fontSize:20,
                fontWeight: FontWeight.w700)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(width: 500,
                child: Divider(
                    height: 0.0,
                    color: Colors.black12, thickness: 1.0)),
            SizedBox(height: 30,),
            Row(children:[
              SizedBox(width: 15,),
              Text("지불 방법",
                  style:TextStyle(color:Color(0xff2eb67d),
                  fontSize:14,
                  fontWeight: FontWeight.w600)),],

            ),
            ListTile(
              minVerticalPadding: 15.0,
              leading: Icon(Icons.account_balance_wallet,
                color: Color(0xff2eb67d),
              size: 45,),
              title: Text('카카오뱅크',
                  style:TextStyle(color:Colors.black54,
                      fontSize:15,
                      fontWeight: FontWeight.w500
                  )),
              subtitle: Text('1234-5678-0000-1886',
                  style:TextStyle(color:Colors.black,
                      fontSize:18,
                      fontWeight: FontWeight.w500
                  )),
              trailing:  IconButton(
                icon: const Icon(Icons.more_vert),
                color: Colors.black54,
                onPressed: (){
                },
              ),
            ),
            Row(children:[
              SizedBox(width: 20,),
              Text("기본 지불 방법입니다.",
                  style:TextStyle(color:Colors.black45,
                      fontSize:14,
                      )),],

            ),
            SizedBox(height: 20,),
            ListTile(
              minVerticalPadding: 15.0,
              leading: Icon(Icons.account_balance_wallet,
                color: Color(0xff2eb67d),
                size: 45,),
              title: Text('우리은행',
                  style:TextStyle(color:Colors.black54,
                      fontSize:15,
                      fontWeight: FontWeight.w500
                  )),
              subtitle: Text('1234-5678-0000-1886',
                  style:TextStyle(color:Colors.black,
                      fontSize:18,
                      fontWeight: FontWeight.w500
                  )),
              trailing:  IconButton(
                icon: const Icon(Icons.more_vert),
                color: Colors.black54,
                onPressed: (){
                },
              ),
            ),
            SizedBox(height: 20,),
            ListTile(
              minVerticalPadding: 15.0,
              leading: Icon(Icons.account_balance_wallet,
                color: Color(0xff2eb67d),
                size: 45,),
              title: Text('삼성카드',
                  style:TextStyle(color:Colors.black54,
                      fontSize:15,
                      fontWeight: FontWeight.w500
                  )),
              subtitle: Text('1234-5678-0000-1886',
                  style:TextStyle(color:Colors.black,
                      fontSize:18,
                      fontWeight: FontWeight.w500
                  )),
              trailing:  IconButton(
                icon: const Icon(Icons.more_vert),
                color: Colors.black54,
                onPressed: (){
                },
              ),
            ),
            SizedBox(height: 30,),
            Container(width: 500,
                child: Divider(
                    height: 0.0,
                    color: Colors.black12, thickness: 1.0)),
            ListTile(
              minVerticalPadding: 20.0,
              title: Text('지불 방법 추가',
                  //textAlign: TextAlign.center,
                  style:TextStyle(color:Colors.black,
                    fontSize:18,
                    fontWeight: FontWeight.w600,

                  )) ,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) => addpayPage(),),
                );
              },
            ),
            Container(width: 500,
                child: Divider(
                    height: 0.0,
                    color: Colors.black12, thickness: 1.0)),

          ],
        ),

      ),



    );
  }
}

