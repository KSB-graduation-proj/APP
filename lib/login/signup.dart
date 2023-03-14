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
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          SizedBox(height: 80,),
            CustomTextField(label: "Name", onChangefunc: (newText){name= newText;}, isPassword: false,),
            SizedBox(height: 5,),
            CustomTextField(label: "Email" ,onChangefunc: (newText){email= newText;}, isPassword: false,),
            Row(
              children: [
                SizedBox(width: 30,),
                Text('학번@ewhain.net 형태로 입력하세요.',style: TextStyle(color: Colors.grey),),

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
            SizedBox(height: 50,),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Color(0xff2eb67d),
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 70.0),
            textStyle: const TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold),
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
            }else{
              if(name!=null && email !=null && password !=null){
                try{
                  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email!,
                      password: password!,
                  );
                  FirebaseFirestore firestore = FirebaseFirestore.instance;
                  final member = firestore.collection("member");
                  final data = <String, dynamic>{'coopMember': _isChecked,
                    'email':email,
                    'id': email.toString().replaceFirst('@ewhain.net', ''),
                    'name':name,
                    'password':password,
                  };
                  member.doc(email).set(data);
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
            child: const Text('회원가입', textAlign: TextAlign.center,),
          )
        ),

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



