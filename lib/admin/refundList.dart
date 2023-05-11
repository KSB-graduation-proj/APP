import 'package:app_test/firebase.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class refundPage extends StatefulWidget {
  const refundPage({super.key});

  @override
  State<refundPage> createState() => _refundPage();
}

class _refundPage extends State<refundPage> {
  String? name;

  @override
  void initState() {
    super.initState();
    setData();
  }

  void setData() {
  }

  @override
  Widget build(BuildContext context) {

      return
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '환불리스트',
                style: TextStyle(color: Colors.black54),
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
