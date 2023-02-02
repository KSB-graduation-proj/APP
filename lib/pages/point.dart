import 'package:flutter/material.dart';

class pointPage extends StatelessWidget {
  const pointPage({Key? key}) : super(key: key);

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


          ],
        ),

      ),



    );
  }
}

