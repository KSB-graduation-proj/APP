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

  bool isLoading = true;
  bool noData = false;
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
        if(doc.data()==null){
          noData=true;
        }
        else{
          final data = doc.data() as Map<String,dynamic>;
          // 모든 영수증 데이터
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
            isLoading = false;
        }

        }print('$cardId, $company,$number, $isDefault');
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

      body:
      noData ?
      Column(
        children: [
          SizedBox(height: 100,),
          Text("등록된 결제수단이 존재하지 않습니다."),
          SizedBox(height: 100,),
          Container(width: 500,
              child: Divider(
                  height: 0.0,
                  color: Colors.black12, thickness: 1.0)),

          ListTile(
            minVerticalPadding: 20.0,
            title: Text('지불 방법 추가',
                textAlign: TextAlign.center,
                style:TextStyle(color:Colors.black,
                  fontSize:18,
                  fontWeight: FontWeight.w600,
                )) ,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder:(context) => addpayPage(),),
              );
            },),
          Container(width: 500,
              child: Divider(
                  height: 0.0,
                  color: Colors.black12, thickness: 1.0)),

        ],
      )
          :
     isLoading
        ?
          Center(child: CircularProgressIndicator(),)
        : SingleChildScrollView(
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
            SizedBox(height: 10,),
            Column(
              children:[
                for (int i=0;i<cardId.length;i++)...[
                    CustomListItemTwo(
                      cardno: cardId[i],
                      company: company[i],
                      number: number[i],
                    ),
                ],
              SizedBox(height: 20,),
              ListTile(
              minVerticalPadding: 20.0,
              title: Text('지불 방법 추가',
              textAlign: TextAlign.center,
              style:TextStyle(color:Colors.black,
              fontSize:18,
              fontWeight: FontWeight.w600,
              )) ,
              onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder:(context) => addpayPage(),),
              );
              },),
                Container(width: 500,
                    child: Divider(
                        height: 0.0,
                        color: Colors.black12, thickness: 1.0)),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

class _cardDescription extends StatelessWidget {
  const _cardDescription({
    required this.cardno,
    required this.number,
    required this.company,
  });

  final String cardno;
  final String number;
  final String company;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children:[
          ListTile(
            minVerticalPadding: 25.0,
            leading: Icon(Icons.account_balance_wallet,
              color: Color(0xff2eb67d),
              size: 45,),
            title: Text(company,
                style:TextStyle(color:Colors.black54,
                    fontSize:15,
                    fontWeight: FontWeight.w500
                )),
            subtitle: Text(number,
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
          Container(width: 500,
              child: Divider(
                  height: 0.0,
                  color: Colors.black12, thickness: 1.0)),
          SizedBox(height: 5,)
        ]
         )


    );
  }
}

class CustomListItemTwo extends StatelessWidget {
  const CustomListItemTwo({
    super.key,
    required this.cardno,
    required this.number,
    required this.company,
  });

  final String cardno;
  final String number;
  final String company;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: _cardDescription(
                cardno: cardno,
                number: number,
                company: company,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

