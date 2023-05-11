import 'dart:async';

import 'package:app_test/admin/qrScan.dart';
import 'package:app_test/admin/refundList.dart';
import 'package:app_test/admin/viewQnaList.dart';
import 'package:app_test/firebase.dart';
import 'package:app_test/pages/point.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class adminHome extends StatefulWidget {
  const adminHome({super.key});

  @override
  State<adminHome> createState() => _adminHome();
}

class _adminHome extends State<adminHome> {

  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  String? name;
  bool? coopMember;
  String? coop;

  StreamSubscription<QuerySnapshot>? _subscription;

  static const List<Widget> _widgetOptions = <Widget>[
    QrScan(),
    refundPage(),
    viewQnaPage(),
  ];

  @override
  void initState() {
    super.initState();
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  Widget build (BuildContext context) {
    return
      Scaffold(
                  drawer: Drawer(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        UserAccountsDrawerHeader(

                          currentAccountPicture: CircleAvatar(
                            backgroundImage: AssetImage('assets/profile1.jpg'),
                          ),

                          accountEmail: Text("admin@ewhain.net"),
                          accountName: Text("Ewha Admin"),

                          decoration: BoxDecoration(

                              color: Color(0xff2eb67d),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(35),
                                bottomRight: Radius.circular(35),
                              )),
                        ),
                        ListTile(
                          title: Text('1:1 문의'),
                          onTap: () {

                          },
                        ),
                        ListTile(
                            title: Text('Logout'),
                            onTap: () {
                              FirebaseAuth.instance.signOut();
                            }
                        ),
                      ],
                    ),
                  ),
                  appBar: AppBar(
                    title: const Text('Coop Go Admin',
                        style: TextStyle(color: Color(0xff2eb67d),
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                    backgroundColor: Colors.transparent,

                    elevation: 0.0,
                    centerTitle: true,
                    leading:
                    Builder(builder: (context) {
                      return
                        IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          color: Color(0xff2eb67d),
                        );
                    }),
                    actions: [IconButton(onPressed: () {
                      FirebaseAuth.instance.signOut();
                    }, icon: Icon(Icons.logout),
                      color: Color(0xff2eb67d),)
                    ],
                  ),
                  body: SafeArea(
                    child: _widgetOptions.elementAt(_selectedIndex),
                  ),
                  bottomNavigationBar: bottomNavigationBar,
                );

}




  Widget get bottomNavigationBar {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(33), topLeft: Radius.circular(33)),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 4,)
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(33.0),
            topRight: Radius.circular(33.0),
          ),

          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.qr_code),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.inbox_rounded),
                label: 'refund',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.question_answer),
                label: 'qna',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Color(0xff2eb67d),
            onTap: _onItemTapped,
          ),
        ));
  }

}
