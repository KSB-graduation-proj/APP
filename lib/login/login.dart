import 'package:app_test/home.dart';
import 'package:app_test/pages/mainPage.dart';
import 'package:flutter/material.dart';

class loginPage extends StatelessWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black),
        title: const Text('로그인',
            style:TextStyle(color:Colors.black,
                fontSize:20,
                fontWeight: FontWeight.w700)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 140.0,),
            Row(
                children:[
                  SizedBox(width: 100.0,),
                  Icon(
                    Icons.sports_score,
                    size: 200.0,
                    color: Color(0xff2eb67d),
                  ),
                ]
            ),
            SizedBox(height: 30.0,),
            Text('누적 포인트', textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),),
            Text('1886' +' 점', textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xff2eb67d),
                padding: const EdgeInsets.fromLTRB(45.0, 7.0, 45.0, 7.0),
                textStyle: const TextStyle(fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) => MyApp(),),
                );
              },
              child: const Text('상세보기'),
            ),


          ],
        ),

      ),



    );
  }
}

