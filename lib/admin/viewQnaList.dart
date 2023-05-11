import 'package:app_test/firebase.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class viewQnaPage extends StatefulWidget {
  const viewQnaPage({super.key});

  @override
  State<viewQnaPage> createState() => _viewQnaPage();
}

class _viewQnaPage extends State<viewQnaPage> {

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
              '큐앤에이 리스트',
              style: TextStyle(color: Colors.black54),
            ),

          ],
        ),
      );
  }

}
