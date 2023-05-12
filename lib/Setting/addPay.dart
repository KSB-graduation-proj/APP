import 'package:app_test/Setting/pay.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../firebase.dart';
import '../home.dart';

String? company;
String? number;
String? date;

class addpayPage extends StatefulWidget {
  const addpayPage({Key? key}) : super(key: key);
  @override
  State<addpayPage> createState() => _addpayPage();
}
class _addpayPage extends State<addpayPage>{
  void textClear(){
    company=null;
    number=null;
    date=null;
  }

  void initState(){
    textClear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black),
        title: const Text('지불 방법 추가',
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
            SizedBox(height: 20,),
            Row(children:[
              SizedBox(width: 15,),
              Text("지불 방법",
                  style:TextStyle(color:Colors.black54,
                      fontSize:14,
                      fontWeight: FontWeight.w600)),],

            ),
            SizedBox(height: 3,),
            Row(children:[
              SizedBox(width: 15,),
              Text("구입하기 전까지는 요금이 청구되지 않습니다.",
                  style:TextStyle(color:Colors.black45,
                      fontSize:11,
                      fontWeight: FontWeight.w600)),],

            ),
          SizedBox(height: 20,),
          Divider(
              height: 0.0,
              color: Colors.black12, thickness: 1.0),
            ListTile(

              title: Text('신용/체크',
                  style:TextStyle(color:Color(0xff2eb67d),
                      fontSize:17,
                      fontWeight: FontWeight.w600
                  )),
            ),
            Container(width: 500,
                child: Divider(
                    height: 0.0,
                    color: Colors.black12, thickness: 1.0)),

            SizedBox(height: 10,),
            Row(children:[
              SizedBox(width: 15,),
              Text("카드 정보를 입력하세요.",
                  style:TextStyle(color:Colors.black54,
                      fontSize:14,
                      fontWeight: FontWeight.w600)),],
            ),
            SizedBox(height: 10,),
            Container(width: 500,
                child: Divider(
                    height: 0.0,
                    color: Colors.black12, thickness: 1.0)),
            SizedBox(height: 10,),
            Row(children:[
              SizedBox(width: 15,),
              Text("카드사",
                  style:TextStyle(color:Color(0xff2eb67d),
                      fontSize:17,
                      fontWeight: FontWeight.w600)),
              SizedBox(width: 75,),
              SizedBox(width:200,
                child:TextField(
                  onChanged: (newText){company=newText;},
                  maxLines: 1,
                  minLines: 1,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 10.0),
                    border: InputBorder.none,
                    hintText: '카드사',
                    labelStyle: TextStyle(color: Color(0xff2eb67d), ),
                  ),
                ), )
            ],
            ),
            Row(children:[
              SizedBox(width: 15,),
              Text("카드 번호",
                  style:TextStyle(color:Color(0xff2eb67d),
                      fontSize:17,
                      fontWeight: FontWeight.w600)),
              SizedBox(width: 55,),
              SizedBox(width:200,
                child:TextField(
                  onChanged: (newText){number=newText;},
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  minLines: 1,

                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 10.0),
                    border: InputBorder.none,
                    hintText: '0000-0000-0000-0000',
                    labelStyle: TextStyle(color: Color(0xff2eb67d), ),
                  ),
                ), )
            ],
            ),
            Row(children:[
              SizedBox(width: 15,),
              Text("만료일",
                  style:TextStyle(color:Color(0xff2eb67d),
                      fontSize:17,
                      fontWeight: FontWeight.w600)),
              SizedBox(width: 75,),
              SizedBox(width:200,
                child:TextField(
                  onChanged: (newText){date=newText;},
                  keyboardType: TextInputType.datetime,
                  maxLines: 1,
                  minLines: 1,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 10.0),
                    border: InputBorder.none,
                    hintText: 'YYYY / MM',
                    labelStyle: TextStyle(color: Color(0xff2eb67d), ),
                  ),
                ), )
            ],
            ),
            SizedBox(height:30),
            Container(width: 500,
                child: Divider(
                    height: 0.0,
                    color: Colors.black12, thickness: 1.0)),

            ListTile(
              minVerticalPadding: 20.0,
              title: Text('결제수단 추가하기',
                  textAlign: TextAlign.center,
                  style:TextStyle(color:Colors.black,
                    fontSize:18,
                    fontWeight: FontWeight.w600,

                  )) ,
              onTap: () {
                if (company!=null&&number!=null&&date!=null) {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('결제수단 추가'),
                      content: const Text('이 결제수단을 등록하시겠습니까?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('아니요'),
                        ),
                        TextButton(
                            child: const Text('예'),
                            onPressed:() {
                              final card = firestore.collection("card");
                              final id = '${company}_${number}';
                              final data = <String, dynamic>
                              {
                                '${id}': {
                                  'exdate': date,
                                  'company': company,
                                  'number': number,
                                  'default': false,
                                  'balance': 50000,//임시 결제수단이라 임의로 잔액설정
                                } };
                              card.doc(email).set(data, SetOptions(merge: true));
                              showDialog<String>(
                                context: context,
                                builder: (context) =>
                                    AlertDialog(
                                      content: const Text(
                                          '카드 등록이 완료되었습니다.'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Home()));
                                           },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                              );}
                        ),
                      ],
                    ),
                  );}
                else{
                  showDialog(context: context, builder: (context)=> AlertDialog(
                      content: const Text ('모든 값의 입력은 필수입니다.'),
                      actions:<Widget>[
                        TextButton(onPressed: (){Navigator.of(context).pop();}, child: const Text('예'))
                      ]
                  ));
                }},
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
class CustomTextField extends StatelessWidget {
  String label;
  void Function(String text) onChangefunc;

  CustomTextField({
    required this.label,
    required this.onChangefunc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.fromLTRB(0.0,2.0,0.0,5.0),
      child:
      TextField(
        onChanged: (newText) {
          onChangefunc(newText);
        },
        cursorColor: Color(0xff2eb67d),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '문의 제목을 입력하세요.',
            hintStyle: TextStyle(fontSize: 14),
            focusColor: Color(0xff2eb67d),
            hoverColor: Color(0xff2eb67d)
        ),),);
  }

}



