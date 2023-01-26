import 'package:flutter/material.dart';
import 'package:app_test/Setting/pay.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class qnalistPage extends StatelessWidget {
  const qnalistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black),
        title: const Text('문의 목록',
            style:TextStyle(color:Colors.black,
                fontSize:20,
                fontWeight: FontWeight.w700)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        child: Column(

          children: [
            Container(width: 500,
                child: Divider(
                    height: 0.0,
                    color: Colors.black12, thickness: 1.0)),

            ListTile(
              minVerticalPadding: 20.0,
              title: Text('1:1 문의하기', style:TextStyle(color:Colors.black,
                  fontSize:18,
                  fontWeight: FontWeight.w500
              )),
              subtitle: Text('개별 문의 등록하기'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>payPage())
                );
              },
            ),
            Container(width: 500,
                child: Divider(
                    height: 0.0,
                    color: Colors.black12, thickness: 1.0)),

            ListTile(
              minVerticalPadding: 20.0,
              title: Text('문의 내역 보기', style:TextStyle(color:Colors.black,
                fontSize:18,
              )),
              subtitle: Text('나의 문의 모아보기 '),
              onTap: () {
                //Navigator.pop(context);
              },
            ),
            Container(width: 500,
                child: Divider(
                    height: 0.0,
                    color: Colors.black12, thickness: 1.0)),

          ],
        ),

      ),



    );
  }
}
