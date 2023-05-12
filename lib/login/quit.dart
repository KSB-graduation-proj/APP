import 'package:app_test/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class quitPage extends StatefulWidget {
  @override
  State<quitPage> createState() => _quitPage();

}

class _quitPage extends State<quitPage>{
  TextEditingController _passwordController = TextEditingController();

  // 사용자 삭제 함수
  void deleteUser() async {
    String password = _passwordController.text.trim();

    // Firebase 인증 객체 생성
    FirebaseAuth auth = FirebaseAuth.instance;

    // 현재 인증된 사용자 가져오기
    User? user = auth.currentUser;
    Navigator.push(
      context,
      MaterialPageRoute(builder:(context) => loginPage(),),
    );
    if (user != null) {
      // 사용자의 비밀번호 재인증
      AuthCredential credential = EmailAuthProvider.credential(email: user.email!, password: password);
      try {
        await user.reauthenticateWithCredential(credential);
        // 사용자 삭제
        await user.delete();
        print('사용자가 성공적으로 삭제되었습니다.');
      } catch (e) {
        print('사용자 삭제 오류: $e');
      }
    }
  }
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
              Icons.account_circle,
              size: 200.0,
              color: Color(0xff2eb67d),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  flex: 1, // 20%
                  child: Container(color: Colors.transparent),
                ),
                Expanded(
                  flex: 14, // 20%
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: Color(0xff2eb67d),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 17,color:  Color(0xff2eb67d),),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                      border: InputBorder.none,
                      hintText: '비밀번호를 입력하세요',
                    ),
                  ),
                ),
                Expanded(
                  flex: 1, // 20%
                  child: Container(color: Colors.transparent),
                )
              ],
            ),
        SizedBox(height: 40,),
        ElevatedButton(
          onPressed:deleteUser,
          child: Text('사용자 삭제'),
          style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Color(0xff2eb67d),
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 70.0),
          textStyle: const TextStyle(fontSize: 20,
          fontWeight: FontWeight.bold),
          ),
        ),

          ],
        ),
      ),
    );
  }
}




