import 'package:app_test/firebase_options.dart';
import 'package:app_test/login/signup.dart';
import 'package:app_test/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';

import '../admin/adminhome.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //비로그인
          if (!snapshot.hasData) {
            return SignInScreen(
              showAuthActionSwitch: false,

              subtitleBuilder: (context, action){
                return Padding(padding: const EdgeInsets.only(bottom: 10),
                child:Row(children:[
                  Text(
                      'coop-go 회원이 아니시라면? '),
                  const signupBtn()
                ]

                )
                );
              },

              headerBuilder: (context, constraints, _){
                return Padding(padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                child:  AspectRatio(
                  aspectRatio: 1,
                    child: Image.network('https://www.ewha.ac.kr/cms/fileDownload.do?path=%2F_res%2Fewha%2Fetc%2Fsymbol-mark.png'),
                ),);
              },
              providerConfigs: [
                EmailProviderConfiguration(),
               // GoogleProviderConfiguration(clientId: '203574439395-epjjo0om4bc88utncu51mr3spdggdfih.apps.googleusercontent.com')
              ],
            );
          } else {
            User? user =FirebaseAuth.instance.currentUser;
            if(user?.email=="admin@ewhain.net"){
              return adminHome();
            }
            else{
              return Home();
            }

          }
        }
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