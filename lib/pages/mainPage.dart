import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class mainPage extends StatelessWidget {
  const mainPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    var email = _auth.currentUser!.email.toString();
    var code = email.replaceFirst('@ewhain.net', '');

    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('결제 시 QR 코드를 보여주세요', style: TextStyle(color: Colors.black54),),
            Image.network(
              'https://chart.apis.google.com/chart?cht=qr&chs=450x450&chl='+'${code}',
            ),
            Text('안녕하세요, ${code}님 !',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold,
                  color: Color(0xff2eb67d)),),
          ],
        )
    );
  }

}