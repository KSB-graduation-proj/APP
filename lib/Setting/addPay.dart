import 'package:app_test/Setting/pay.dart';
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
            addpayForm()

          ],
        ),

      ),



    );
  }
}

class addpayForm extends StatefulWidget {
  const addpayForm({super.key});
  @override
  addpayFormState createState() {
    return addpayFormState();
  }
}

class addpayFormState extends State<addpayForm> {
  final addpayKey = GlobalKey<FormState>();
  Widget build(BuildContext context){
    return Form(
      key: addpayKey,
      child: Column(
        children: [
          Container(width: 500,
              child: Divider(
                  height: 0.0,
                  color: Colors.black12, thickness: 1.0)),
          SizedBox(height: 20,),
          Row(children:[
            SizedBox(width: 15,),
            Text("카드사",
                style:TextStyle(color:Color(0xff2eb67d),
                    fontSize:17,
                    fontWeight: FontWeight.w600)),
            SizedBox(width: 75,),
            SizedBox(width:200,
              child:TextFormField(
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  hintText: '카드사',
                  labelStyle: TextStyle(color: Color(0xff2eb67d), ),
                ),
                validator: (value)=> value==null||value.isEmpty?
                '카드사를 입력해주세요.':null ,
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
              child:TextFormField(
                keyboardType: TextInputType.number,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  hintText: '0000-0000-0000-0000',
                  labelStyle: TextStyle(color: Color(0xff2eb67d), ),
                ),
                validator: (value)=> value==null||value.isEmpty?
                '카드 번호 형식에 맞게 입력해주세요.':null ,
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
              child:TextFormField(
                keyboardType: TextInputType.datetime,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  hintText: 'YYYY / MM',
                  labelStyle: TextStyle(color: Color(0xff2eb67d), ),
                ),
                validator: (value)=> value==null||value.isEmpty?
                '만료일 형식에 맞게 입력해주세요.':null ,
              ), )
          ],
          ),
          Row(children:[
            SizedBox(width: 15,),
            Text("CVS",
                style:TextStyle(color:Color(0xff2eb67d),
                    fontSize:17,
                    fontWeight: FontWeight.w600)),
            SizedBox(width: 90,),
            SizedBox(width:200,
              child:TextFormField(
                keyboardType: TextInputType.number,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  hintText: '카드 뒷면 숫자 3자리',
                  labelStyle: TextStyle(color: Color(0xff2eb67d), ),
                ),
                validator: (value)=> value==null||value.isEmpty?
                '정확한 CVS값을 입력해주세요.':null ,
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
              child:TextFormField(
                keyboardType: TextInputType.number,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  hintText: '비밀번호의 앞 2자리',
                  labelStyle: TextStyle(color: Color(0xff2eb67d), ),
                ),validator: (value)=> value==null||value.isEmpty?
              '정확한 PIN값을 입력해주세요.':null ,
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
                if (addpayKey.currentState!.validate()) {
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
                  TextButton(onPressed: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder:(context)=>payPage()));
            }, child: const Text('예'),
              ),
              ],),);
            }},
          ),
          Container(width: 500,
              child: Divider(
                  height: 0.0,
                  color: Colors.black12, thickness: 1.0)),
        ],
      )
    );
  }
}