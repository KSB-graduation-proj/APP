import 'package:app_test/firebase.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPage();
}

class _mainPage extends State<mainPage> {
  String? name;

  @override
  void initState() {
    super.initState();
    setData();
  }

  void setData() {
    final doc = firestore.collection('member').doc("${email}");
    doc.get().then((DocumentSnapshot doc) {
      setState(() {
        final data = doc.data() as Map<String, dynamic>;
        name = data['name'];
        print(name);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (name == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return
        Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '결제 시 QR 코드를 보여주세요',
              style: TextStyle(color: Colors.black54),
            ),
            Image.network(
              'https://chart.apis.google.com/chart?cht=qr&chs=450x450&chl=' +
                  '${code}',
            ),
            Text(
              '안녕하세요, $name님 !',
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff2eb67d)),
            ),
          ],
        ),
      );
    }
  }
}
