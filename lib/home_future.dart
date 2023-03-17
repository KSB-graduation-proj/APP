import 'package:app_test/firebase.dart';
import 'package:app_test/login/login.dart';
import 'package:app_test/pages/point.dart';
import 'package:flutter/material.dart';
import 'package:app_test/pages/mainPage.dart';
import 'package:app_test/pages/myPage.dart';
import 'package:app_test/pages/settingsPage.dart';
import 'package:app_test/Setting/profile.dart';
import 'package:app_test/Setting/qna/QnA.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  final _auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final name = getData('member', 'name')!;

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    mainPage(),
    myPage(),
    settingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
    Widget build (BuildContext context) {
      var email = _auth.currentUser!.email.toString();
      var code = email.replaceFirst('@ewhain.net', '');

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

                           accountEmail: Text("$email"),
                          accountName: Text('$name'),


                          decoration: BoxDecoration(

                              color: Color(0xff2eb67d),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(35),
                                bottomRight: Radius.circular(35),
                              )),
                        ),
                        ListTile(
                          title: Text('Profile'),
                          onTap: () {
                                                      },
                        ),
                        ListTile(
                          title: Text('1:1 문의'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => qnaPage())
                            );
                          },
                        ),
                        ListTile(
                          title: Text('포인트'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => pointPage(),),
                            );
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
                    title: const Text('Coop Go',
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
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'MyPage',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Color(0xff2eb67d),
            onTap: _onItemTapped,
          ),
        ));
  }

}
