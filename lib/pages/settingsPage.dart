import 'package:app_test/Setting/refundInfo.dart';
import 'package:app_test/login/quit.dart';
import 'package:flutter/material.dart';
import 'package:app_test/Setting/profile.dart';
import 'package:app_test/Setting/pay.dart';
import 'package:app_test/Setting/qna/QnA.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class settingsPage extends StatelessWidget {
  const settingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(

              children: [
                Container(width: 500,
                    child: Divider(
                        height: 0.0,
                        color: Colors.black12, thickness: 1.0)),

                ListTile(
                  minVerticalPadding: 20.0,

                  title: Text('Profile',
                      style:TextStyle(color:Colors.black,
                      fontSize:18,
                        fontWeight: FontWeight.w500
           )),
                  subtitle: Text('나의 회원 정보 보기'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>profilePage())
                    );
                  },
                ),
                Container(width: 500,
                    child: Divider(
                        height: 5.0,
                        color: Colors.black12, thickness: 5.0)),
                ListTile(
                  minVerticalPadding: 20.0,
                  title: Text('결제 수단 관리', style:TextStyle(color:Colors.black,
                    fontSize:18,
                      fontWeight: FontWeight.w500
                  )),
                  subtitle: Text('결제수단 등록/제거 '),
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
                  title: Text('나의 문의 내역', style:TextStyle(color:Colors.black,
                    fontSize:18,
                  )),
                  subtitle: Text('1:1/환불 문의 '),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>qnaPage())
                    );
                  },
                ),
                Container(width: 500,
                    child: Divider(
                        height: 0.0,
                        color: Colors.black12, thickness: 1.0)),

                ListTile(
                  minVerticalPadding: 15.0,
                  title: Text('환불 정보', style:TextStyle(color:Colors.black,
                    fontSize:18,
                  )),
                  subtitle: Text('나의 환불 영수증'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>refundInfo())
                    );
                  },
                ),
                Container(width: 500,
                    child: Divider(
                        height: 5.0,
                        color: Colors.black12, thickness: 5.0)),

                ListTile(
                  minVerticalPadding: 20.0,
                  title: Text('회원 탈퇴', style:TextStyle(color:Colors.black,
                    fontSize:18,
                    fontWeight: FontWeight.w600
                  )),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>quitPage())
                    );
                  },
                ),
              ],
            ),

      ),



    );
  }
}

