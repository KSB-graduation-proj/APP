import 'package:app_test/login/signup.dart';
import 'package:app_test/home.dart';
import 'package:flutter/material.dart';

class loginPage extends StatelessWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
            color: Colors.black),
            title: const Text('Coop Go',
                textAlign: TextAlign.center,
                style:TextStyle(color:Colors.black,
                    fontSize:20,
                    fontWeight: FontWeight.w500)),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
          ),

      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 130,),
           const LoginForm(),
            SizedBox(height: 20,),
                Row(children: [
                  SizedBox(width: 95,),
                  Text('coop-go 회원이 아니시라면?'),
                  SizedBox(width: 5,),
                  const signupBtn(),
                ]
                ),

          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _LoginKey = GlobalKey<FormState>();


  Widget build(BuildContext context) {
    return Form(
        key: _LoginKey,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1, // 20%
                child: Container(color: Colors.transparent),
              ),
              Expanded(
                flex: 14, // 20%
                child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  cursorColor: Color(0xff2eb67d),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 20),
                    contentPadding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 0.0),
                    labelText: '아이디',labelStyle: TextStyle(color: Color(0xff2eb67d),fontWeight: FontWeight.bold, fontSize: 15)
                      ,focusColor: Color(0xff2eb67d),
                    hoverColor: Color(0xff2eb67d)
                  ),
                  validator: (value)=> value==null||value.isEmpty?
                  '아이디를 입력하세요':null,
                ),
              ),
              Expanded(
                flex: 1, // 20%
                child: Container(color: Colors.transparent),
              )
            ],
          ),
      SizedBox(height: 30,),
          Row(
            children: [
              Expanded(
                flex: 1, // 20%
                child: Container(color: Colors.transparent),
              ),
              Expanded(
                flex: 14, // 20%
                child: TextFormField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: Color(0xff2eb67d),
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 20),
                      contentPadding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 0.0),
                      labelText: '비밀번호',labelStyle: TextStyle(color: Color(0xff2eb67d),fontWeight: FontWeight.bold, fontSize: 15)
                      ,focusColor: Color(0xff2eb67d),
                      hoverColor: Color(0xff2eb67d)
                  ),
                  validator: (value)=> value==null||value.isEmpty?
                  '비밀번호를 입력하세요':null,
                ),
              ),
              Expanded(
                flex: 1, // 20%
                child: Container(color: Colors.transparent),
              )
            ],
          ),
          SizedBox(height: 50,),
      Row(
        children:[
          SizedBox(width: 110,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color(0xff2eb67d),
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 70.0),
              textStyle: const TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              if (_LoginKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('로그인 중 ...')),
                );
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>MyApp()));
                    //이부분 argument 전달로 바꿔야함
              }
            },
            child: const Text('로그인'),
          ),
      ]

      ),


    ],
        ),
    );
  }
}
class signupBtn extends StatelessWidget {
  const signupBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder:(context) => signupPage()),
        );
      },
      child: const Padding(
        padding: EdgeInsets.all(0.0),
        child: Text('회원가입', style: TextStyle(color: Color(0xff2eb67d),
          fontSize: 15),
         ),
      ),
    );
  }
}