import 'package:app_test/login/login.dart';
import 'package:flutter/material.dart';

class signupPage extends StatelessWidget {
  const signupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black),
        title: const Text('회원가입',
            textAlign: TextAlign.center,
            style:TextStyle(color:Colors.black,
                fontSize:20,
                fontWeight: FontWeight.w600)),
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
            Container(width: 500,
                child: Divider(
                    height: 0.0,
                    color: Colors.black12, thickness: 1.0)),
            SizedBox(height: 30,),
            const LoginForm(),
            SizedBox(height: 20,),
            Row(children: [
              SizedBox(width: 95,),

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
  final signKey = GlobalKey<FormState>();

  bool _isChecked = false;
  Widget build(BuildContext context) {
    return Form(
      key: signKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            SizedBox(width: 20,),
            Text('이름',style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600,color: Color(0xff2eb67d)),),
          ],),
           Row(
            children: [
              Expanded(
                flex: 1, // 20%
                child: Container(color: Colors.transparent),
              ),
              Expanded(
                flex: 14, // 20%
                child: TextFormField(
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.name,
                  cursorColor: Color(0xff2eb67d),
                  decoration: InputDecoration(
                    hintText: '이름을 입력하세요',
                      hintStyle: TextStyle(fontSize: 15),
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                      hoverColor: Color(0xff2eb67d)
                  ),
                  validator: (value)=> value==null||value.length<2?
                  '정확한 값을 입력하세요':null,
                ),
              ),
              Expanded(
                flex: 1, // 20%
                child: Container(color: Colors.transparent),
              )
            ],
          ),
          SizedBox(height: 30,),
          Row(children: [
            SizedBox(width: 20,),
            Text('아이디',style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600,color: Color(0xff2eb67d)),),
          ],),
          Row(
            children: [
              Expanded(
                flex: 1, // 20%
                child: Container(color: Colors.transparent),
              ),
              Expanded(
                flex: 14, // 20%
                child: TextFormField(
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.number,
                  cursorColor: Color(0xff2eb67d),
                  decoration: InputDecoration(
                      hintText: '학번 7자리를 입력하세요',
                      hintStyle: TextStyle(fontSize: 15),
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                      hoverColor: Color(0xff2eb67d)
                  ),
                  validator: (value)=> value==null||value.isEmpty||value.length<7||value.length>7?
                  '학번은 숫자 7자리입니다.':null ,

                ),
              ),
              Expanded(
                flex: 1, // 20%
                child: Container(color: Colors.transparent),
              )
            ],
          ),
          SizedBox(height: 30,),
          Row(children: [
            SizedBox(width: 20,),
            Text('이메일',style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600,color: Color(0xff2eb67d)),),
          ],),
          Row(
            children: [
              Expanded(
                flex: 1, // 20%
                child: Container(color: Colors.transparent),
              ),
              Expanded(
                flex: 14, // 20%
                child: TextFormField(
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Color(0xff2eb67d),
                  decoration: InputDecoration(
                      hintText: '학교 이메일을 입력하세요',
                      hintStyle: TextStyle(fontSize: 15),
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                      hoverColor: Color(0xff2eb67d)
                  ),
                  validator: (value)=> value==null||value.isEmpty?
                  '이메일 형식에 맞게 입력해주세요.':null ,
                ),
              ),
              Expanded(
                flex: 1, // 20%
                child: Container(color: Colors.transparent),
              )
            ],
          ),
          SizedBox(height: 30,),
          Row(children: [
            SizedBox(width: 20,),
            Text('생협 조합원',style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600,color: Color(0xff2eb67d)),),
          ],),
          SizedBox(height: 10,),
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
          SizedBox(height: 20,),
          Row(children: [
            SizedBox(width: 20,),
            Text('비밀번호',style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600,color: Color(0xff2eb67d)),),
          ],),
          Row(
            children: [
              Expanded(
                flex: 1, // 20%
                child: Container(color: Colors.transparent),
              ),
              Expanded(
                flex: 14, // 20%
                child: TextFormField(
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: Color(0xff2eb67d),
                  decoration: InputDecoration(
                      hintText: '비밀번호를 입력하세요',
                      hintStyle: TextStyle(fontSize: 15),
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                      hoverColor: Color(0xff2eb67d)
                  ),
                  validator: (value)=> value==null||value.isEmpty?
                  '비밀번호를 입력해주세요':null ,
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
              children:[
                SizedBox(width: 90,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xff2eb67d),
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 80.0),
                    textStyle: const TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (signKey.currentState!.validate()) {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                        title: const Text('Coop-go 회원가입'),
                        content: const Text('Coop go에 가입 하시겠습니까?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('아니요'),
                          ),
                          TextButton(
                            onPressed:() => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content: const Text('회원가입이 완료되었습니다.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context)=>MyApp()));
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            ),
                            child: const Text('예'),
                          ),
                        ],
                      ),);// 로그인화면으로 돌아감
                    }
                  },
                  child: const Text('가입하기'),
                ),
              ]

          ),


        ],
      ),
    );
  }
}
