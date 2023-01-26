import 'package:flutter/material.dart';

class addpayPage extends StatelessWidget {
  const addpayPage({Key? key}) : super(key: key);

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

      body: Container(

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
              onTap: () {
              },
            ),
            Container(width: 500,
                child: Divider(
                    height: 0.0,
                    color: Colors.black12, thickness: 1.0)),
            ListTile(
              //tileColor: Color(0xffF2F1F6),
              title: Text('포인트',
                  style:TextStyle(color:Color(0xff2eb67d),
                      fontSize:17,
                      fontWeight: FontWeight.w600
                  )),
              onTap: () {
              },
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
            SizedBox(height: 20,),
            Row(children:[
              SizedBox(width: 15,),
              Text("카드 번호",
                  style:TextStyle(color:Color(0xff2eb67d),
                      fontSize:17,
                      fontWeight: FontWeight.w600)),
              SizedBox(width: 55,),
              SizedBox(width:200,
              child:TextField(
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
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
                  maxLines: 1,
                  minLines: 1,
                  decoration: InputDecoration(
                    hintText: 'YYYY / MM',
                    labelStyle: TextStyle(color: Color(0xff2eb67d), ),
                  ),
                ), )
            ],
            ),
            Row(children:[
              SizedBox(width: 15,),
              Text("PIN",
                  style:TextStyle(color:Color(0xff2eb67d),
                      fontSize:17,
                      fontWeight: FontWeight.w600)),
              SizedBox(width: 95,),
              SizedBox(width:200,
                child:TextField(
                  maxLines: 1,
                  minLines: 1,
                  decoration: InputDecoration(
                    hintText: '비밀번호의 앞 2자리',
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
                Navigator.pop(context);
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

