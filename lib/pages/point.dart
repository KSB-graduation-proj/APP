import 'package:flutter/material.dart';
import 'package:app_test/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class pointPage extends StatefulWidget {
  const pointPage({super.key});

  @override
  State<pointPage> createState() => _pointPage();
}

class _pointPage extends State<pointPage> {
  int? point;
  bool? coopMember;

  void initState() {
    super.initState();
    setData();
  }

  void setData(){
    final doc = firestore.collection('memberCoop').doc("${email}");
    doc.get().then((DocumentSnapshot doc)
    {
      setState(() {
        final data = doc.data() as Map<String,dynamic>;
        point = data['point'];
        coopMember = data['coopMember'];
      });
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black),
        title: const Text('포인트',
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
                  SizedBox(width: 120.0,),
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
            Text('$point 점', textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),



          ],
        ),

      ),



    );
  }
}

