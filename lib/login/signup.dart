import 'package:app_test/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class signupPage extends StatefulWidget {
  @override
  _signupPage createState() => _signupPage();
}

class _signupPage extends State<signupPage> {
  bool _isChecked = false;
  String? name;
  String? email;
  String? password;
  String? repassword;
  String? number;
  String? company;
  String? date;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black),
        title: const Text('Sign Up',
            textAlign: TextAlign.center,
            style:TextStyle(color:Colors.black,
                fontSize:23,
                fontWeight: FontWeight.w400)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
          SizedBox(height: 40,),
            Row(children:[
              SizedBox(width: 25,),
              Text("Coop-Go 회원 정보를 등록하세요.",
                  style:TextStyle(color:Color(0xff2eb67d),
                      fontSize:17,
                      fontWeight: FontWeight.w600)),],
            ),
            SizedBox(height: 10,),
            CustomTextField(label: "Name", onChangefunc: (newText){name= newText;}, isPassword: false,),
            SizedBox(height: 5,),
            CustomTextField(label: "Email" ,onChangefunc: (newText){email= newText;}, isPassword: false,),
            Row(
              children: [
                SizedBox(width: 30,),
                Text('학번7자리@ewhain.net 형태로 입력하세요.',style: TextStyle(color: Colors.grey),),

              ],
            ),
            SizedBox(height: 5,),
            CustomTextField(label: "Password", onChangefunc: (newText){password= newText;}, isPassword: true,),
            SizedBox(height: 5,),
            CustomTextField(label: "Re-Password", onChangefunc: (newText){repassword= newText;}, isPassword: true,),
            SizedBox(height: 5,),
            Row(children: [
              SizedBox(width: 25,),
              Text('이화여대 생협 조합원인가요?',style: TextStyle(fontSize: 15, color: Colors.black54),),
              Switch(
                  activeColor: Color(0xff2eb67d),
                  inactiveThumbColor: Colors.pink,
                  activeTrackColor: Colors.black12,
                  inactiveTrackColor: Colors.black12,
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value;
                    });}),
            ],),
            SizedBox(height: 40,),
            Row(children:[
              SizedBox(width: 25,),
              Text("Coop-Go 기본 결제 수단을 등록하세요.",
                  style:TextStyle(color:Color(0xff2eb67d),
                      fontSize:17,
                      fontWeight: FontWeight.w600)),],
            ),
            SizedBox(height: 20,),
            Container(width: 380,
                child: Divider(
                    height: 0.0,
                    color: Colors.black12, thickness: 1.0)),
            SizedBox(height: 10,),
            SizedBox(height: 10,),
            Row(children:[
              SizedBox(width: 25,),
              Text("카드사",
                  style:TextStyle(color:Colors.black54,
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
              SizedBox(width: 25,),
              Text("카드 번호",
                  style:TextStyle(color:Colors.black54,
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
              SizedBox(width: 25,),
              Text("만료일",
                  style:TextStyle(color:Colors.black54,
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
            SizedBox(height:15),
            Container(width: 380,
                child: Divider(
                    height: 0.0,
                    color: Colors.black12, thickness: 1.0)),
            SizedBox(height: 50,),
            ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Color(0xff2eb67d),
            padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 70.0),
            textStyle: const TextStyle(fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
          onPressed: () async{
            if(password != repassword){
              showDialog(context: context,
                  builder: (context){
                    return AlertDialog(
                      content: Text('비밀번호가 일치하지 않습니다.'),
                      actions: [TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("OK"))],
                    );
                  });
            }
            else if(number==null||company==null||date==null){
              showDialog(context: context,
                  builder: (context){
                    return AlertDialog(
                      content: Text("카드 정보를 모두 입력하세요."),
                      actions: [TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text('OK'))],
                    );
                  });
            }
            else{
              if(name!=null && email !=null && password !=null && number!=null && company!=null&&date!=null){
                try{
                  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email!,
                      password: password!,
                  );
                  FirebaseFirestore firestore = FirebaseFirestore.instance;
                  final member = firestore.collection("member");
                  final data = <String, dynamic>{
                    'coopMember': _isChecked,
                    'email':email,
                    'id': email.toString().replaceFirst('@ewhain.net', ''),
                    'name':name,
                    'password':password,
                  };
                  member.doc(email).set(data);
                  final card = firestore.collection("card");
                  final id = '${company}_${number}';
                  final data2 = <String, dynamic>
                  {
                    '${id}': {
                      'exdate': date,
                      'company': company,
                      'number': number,
                      'default': true,
                      'balance': 50000,//임시 결제수단이라 임의로 잔액설정
                    } };
                  card.doc(email).set(data2, SetOptions(merge: true));

                  /*firestore.collection('member').add(
                      {'coopMember': _isChecked,
                        'email':email,
                        'id': email.toString().replaceFirst('@ewhain.net', ''),
                        'name':name,
                        'password':password,
                      }
                  );*/
                  showDialog(context: context,
                      builder: (context){
                        return AlertDialog(
                          content: Text('회원가입이 완료되었습니다.'),
                          actions: [TextButton(onPressed: (){Navigator.push(
                            context,
                              MaterialPageRoute(builder:(context) => loginPage())
                            //MaterialPageRoute(builder:(context) => loginPage(name: name!, coop: _isChecked!))
                          );}, child: Text("OK"))],
                        );
                      });
                  }on FirebaseAuthException catch(e){
                  if(e.code == "weak-password"){
                    print('비밀번호 보안 약함');
                    showDialog(context: context,
                        builder: (context){
                          return AlertDialog(
                            content: Text("비밀번호 보안이 약합니다."),
                            actions: [TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text('OK'))],
                          );
                        });
                  }else if (e.code == 'email-already-in-use'){
                    print('이미 사용중인 이메일');
                    showDialog(context: context,
                        builder: (context){
                          return AlertDialog(
                            content: Text("이미 사용중인 이메일입니다."),
                            actions: [TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text('OK'))],
                          );
                        });
                  }
                }catch(e){
                  print(e);
                }
              }
            }
          },
          child:  Container(
            width: 210,
            child: const Text('Sign up', textAlign: TextAlign.center,),
          )
        ),
            SizedBox(height: 30,),

          ],
        ),
      ),
    );
  }
}
class CustomTextField extends StatelessWidget {
  String label;
  void Function(String text) onChangefunc;
  bool isPassword;

  CustomTextField({
    required this.label,
    required this.onChangefunc,
    required this.isPassword,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.fromLTRB(30.0,10.0,30.0,5.0),
      child:
      TextField(
        onChanged: (newText) {
          onChangefunc(newText);
        },
        obscureText: isPassword? true : false,
        textAlign: TextAlign.center,
        cursorColor: Color(0xff2eb67d),
        decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 20),
            contentPadding: EdgeInsets.symmetric(
                vertical: 20.0, horizontal: 10.0),
            labelText: label,
            labelStyle: TextStyle(color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 16)
            ,
            focusColor: Color(0xff2eb67d),
            hoverColor: Color(0xff2eb67d)
        ),),);
  }

}



