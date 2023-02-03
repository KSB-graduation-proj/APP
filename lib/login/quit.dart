import 'package:app_test/login/login.dart';
import 'package:app_test/login/signup.dart';
import 'package:app_test/home.dart';
import 'package:flutter/material.dart';

class quitPage extends StatelessWidget {
  const quitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black),
        title: const Text('계정 삭제',
            textAlign: TextAlign.center,
            style:TextStyle(color:Colors.black,
                fontSize:20,
                fontWeight: FontWeight.w600)),
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
            Container(width: 500,
                child: Divider(
                    height: 0.0,
                    color: Colors.black12, thickness: 1.0)),

            SizedBox(height: 120,),
            Text('정말로 탈퇴하시겠습니까?',style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),),
            SizedBox(height: 10,),
            Text('계정을 삭제하려면 비밀번호를 입력하세요',style: TextStyle(fontSize: 15,color: Colors.black54),),
            SizedBox(height: 10,),
            Icon(
              Icons.dangerous_outlined,
              size: 200.0,
              color: Color(0xff2eb67d),
            ),
            SizedBox(height: 10,),
            const LoginForm(),

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
  final _quitKey = GlobalKey<FormState>();


  Widget build(BuildContext context) {
    return Form(
      key: _quitKey,
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
                  obscureText: true,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: Color(0xff2eb67d),
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 17,color:  Color(0xff2eb67d)),
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                      hintText: '비밀번호를 입력하세요',
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
          SizedBox(height: 40,),
          Row(
              children:[
                SizedBox(width: 100,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xff2eb67d),
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 70.0),
                    textStyle: const TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (_quitKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('계정 삭제 중 ...')),
                      );
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                        content: const Text('회원 탈퇴가 완료되었습니다.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>MyApp()));
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),);
                    }
                  },
                  child: const Text('계정 삭제'),
                ),
              ]

          ),


        ],
      ),
    );
  }
}
