import 'package:app_test/login/login.dart';
import 'package:app_test/pages/mainPage.dart';
import 'package:flutter/material.dart';

class profilePage extends StatelessWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black),
        title: const Text('CoopGo ID',
            style:TextStyle(color:Colors.black,
                fontSize:20,
                fontWeight: FontWeight.w700)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20.0,),
            ClipOval(
                child: Image.asset('assets/profile1.jpg',
                    width: 100,
                    height: 100,
                    fit:BoxFit.fill)
            ),
            SizedBox(height: 10.0,),
            Text('이화인', textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 50.0,),
          

            ListTile(
              minVerticalPadding: 15.0,

              title: Text('회원 번호',
                  style:TextStyle(color:Colors.black54,
                      fontSize:15,
                      fontWeight: FontWeight.w500,
                     
                  )),

              subtitle: Text('18861004',
                  style:TextStyle(color:Colors.black,
                  fontSize:18,
                  fontWeight: FontWeight.w500
              )),
              
            ),
            
            ListTile(
              minVerticalPadding: 15.0,

              title: Text('이메일',
                  style:TextStyle(color:Colors.black54,
                      fontSize:15,
                      fontWeight: FontWeight.w500
                  )),
              subtitle: Text('leewhain@ewhain.net',
                  style:TextStyle(color:Colors.black,
                      fontSize:18,
                      fontWeight: FontWeight.w500
                  )),
            ),
            ListTile(
              minVerticalPadding: 15.0,

              title: Text('포인트',
                  style:TextStyle(color:Colors.black54,
                      fontSize:15,
                      fontWeight: FontWeight.w500
                  )),
              subtitle: Text('1886'+' 점',
                  style:TextStyle(color:Colors.black,
                      fontSize:18,
                      fontWeight: FontWeight.w500
                  )),
            ),
            ListTile(
              minVerticalPadding: 15.0,

              title: Text('생협 가입 유무',
                  style:TextStyle(color:Colors.black54,
                      fontSize:15,
                      fontWeight: FontWeight.w500
                  )),
              subtitle: Text('조합원',
                  style:TextStyle(color:Colors.black,
                      fontSize:18,
                      fontWeight: FontWeight.w500
                  )),
            ),
           SizedBox(height: 70,),
            Container(width: 500,
                child: Divider(
                    height: 0.0,
                    color: Colors.black12, thickness: 1.0)),

            ListTile(
              minVerticalPadding: 20.0,

              title: Text('로그아웃',
                  textAlign: TextAlign.center,
                  style:TextStyle(color:Colors.red,
                  fontSize:18,
                  fontWeight: FontWeight.w600,

              )) ,
              onTap: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('로그아웃'),
                  content: const Text('로그아웃 하시겠습니까?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('아니요'),
                    ),
                    TextButton(
                      onPressed:() => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content: const Text('로그아웃이 완료되었습니다.'),
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
                ),
              ),
            ),
          ],
        ),

      ),



    );
  }
}

