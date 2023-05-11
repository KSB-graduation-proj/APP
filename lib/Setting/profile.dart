import 'package:app_test/login/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_test/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class profilePage extends StatefulWidget {
  final name;
  final coop;
  const profilePage(this.name, this.coop);

  @override
  State<profilePage> createState() => _profilePage();
}

class _profilePage extends State<profilePage> {
  var point;
  var code;
  bool isLoading=true;
  void initState() {
    super.initState();
    setData();
  }

  void setData(){
    final doc = firestore.collection('memberCoop').doc("${email}");
    doc.get().then((DocumentSnapshot doc)
    {
      code = email.replaceFirst('@ewhain.net', '');
      setState(() {
        if(doc.data()==null){
          if(widget.coop=="조합원"){
            point = "생협 연결 후 포인트 표시";
          }else{
            point=0;
          }
        }
        else{
          final data = doc.data() as Map<String,dynamic>;
          point = data['point'];
        }
        isLoading = false;
      });
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black),
        title: const Text('CoopGo ID',
            style:TextStyle(color:Colors.black,
                fontSize:20,
                fontWeight: FontWeight.w700)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body:
      isLoading
        ?
        Center(child: CircularProgressIndicator(),)
        :
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20.0,),
            ClipOval(
                child: Image.asset('assets/profile1.jpg',
                    width: 100,
                    height: 100,
                    fit:BoxFit.fill)
            ),
            SizedBox(height: 10.0,),
            Text('${widget.name}', textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 50.0,),
          

            ListTile(
              minVerticalPadding: 15.0,

              title: Text('회원 번호',
                  style:TextStyle(color:Colors.black54,
                      fontSize:15,
                      fontWeight: FontWeight.w500,
                     
                  )),

              subtitle: Text('${code}',
                  style:TextStyle(color:Colors.black,
                  fontSize:18,
                  fontWeight: FontWeight.w500
              )),
              
            ),
            
            ListTile(
              minVerticalPadding: 15.0,

              title: Text('이메일',
                  style:TextStyle(color:Colors.black54,
                      fontSize:15,
                      fontWeight: FontWeight.w500
                  )),
              subtitle: Text('${email}',
                  style:TextStyle(color:Colors.black,
                      fontSize:18,
                      fontWeight: FontWeight.w500
                  )),
            ),
            ListTile(
              minVerticalPadding: 15.0,

              title: Text('포인트',
                  style:TextStyle(color:Colors.black54,
                      fontSize:15,
                      fontWeight: FontWeight.w500
                  )),
              subtitle: Text('$point 점',
                  style:TextStyle(color:Colors.black,
                      fontSize:18,
                      fontWeight: FontWeight.w500
                  )),
            ),
            ListTile(
              minVerticalPadding: 15.0,

              title: Text('생협 가입 유무',
                  style:TextStyle(color:Colors.black54,
                      fontSize:15,
                      fontWeight: FontWeight.w500
                  )),
              subtitle: Text('${widget.coop}',
                  style:TextStyle(color:Colors.black,
                      fontSize:18,
                      fontWeight: FontWeight.w500
                  )),
            ),
           SizedBox(height: 70,),
            Container(width: 500,
                child: Divider(
                    height: 0.0,
                    color: Colors.black12, thickness: 1.0)),

            ListTile(
              minVerticalPadding: 20.0,

              title: Text('로그아웃',
                  textAlign: TextAlign.center,
                  style:TextStyle(color:Colors.red,
                  fontSize:18,
                  fontWeight: FontWeight.w600,

              )) ,
              onTap: () {FirebaseAuth.instance.signOut();
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context) => loginPage(),),
                        );}
            ),
          ],
        ),

      ),



    );
  }
}

