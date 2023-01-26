import 'package:flutter/material.dart';


class refundbillScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black),
        title: const Text('환불 영수증',
            style:TextStyle(color:Colors.black,
                fontSize:20,
                fontWeight: FontWeight.w800)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),

      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children:<Widget> [
                Card(
                  elevation: 0.0,
                  color: Color(0xfffbfbfb),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 30,),
                      Row(
                        children:
                        [
                          SizedBox(width: 20,),
                          Text('구매 물품',
                              style:TextStyle(color:Colors.black,
                                  fontSize:20,
                                  fontWeight: FontWeight.w800)),
                        ],
                      ),

                      SizedBox(height: 20,),
                      Row(
                        children: [
                          SizedBox(width: 40,),
                          SizedBox(
                            child: Text('참치 김밥',
                                style:TextStyle(color:Colors.black45,
                                  fontSize:18,
                                  fontWeight: FontWeight.bold,
                                )),
                            width:180,
                          ),
                          SizedBox(
                            child: Text('X '+'1',
                                style:TextStyle(color:Colors.black45,
                                  fontSize:18,
                                  fontWeight: FontWeight.bold,
                                )),
                            width:80,
                          ),
                          SizedBox(
                            child: Text('₩ '+'2,300',
                                style:TextStyle(color:Colors.black45,
                                  fontSize:18,
                                  fontWeight: FontWeight.bold,
                                )),
                            width:80,
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          SizedBox(width: 40,),
                          SizedBox(
                            child: Text('코카콜라 제로',
                                style:TextStyle(color:Colors.black45,
                                  fontSize:18,
                                  fontWeight: FontWeight.bold,
                                )),
                            width:180,
                          ),
                          SizedBox(
                            child: Text('X '+'1',
                                style:TextStyle(color:Colors.black45,
                                  fontSize:18,
                                  fontWeight: FontWeight.bold,
                                )),
                            width:80,
                          ),
                          SizedBox(
                            child: Text('₩ '+'2,300',
                                style:TextStyle(color:Colors.black45,
                                  fontSize:18,
                                  fontWeight: FontWeight.bold,
                                )),
                            width:80,
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          SizedBox(width: 40,),
                          SizedBox(
                            child: Text('아몬드맛 빼빼로',
                                style:TextStyle(color:Colors.black45,
                                  fontSize:18,
                                  fontWeight: FontWeight.bold,
                                )),
                            width:180,
                          ),
                          SizedBox(
                            child: Text('X '+'2',
                                style:TextStyle(color:Colors.black45,
                                  fontSize:18,
                                  fontWeight: FontWeight.bold,
                                )),
                            width:80,
                          ),
                          SizedBox(
                            child: Text('₩ '+'2,600',
                                style:TextStyle(color:Colors.black45,
                                  fontSize:18,
                                  fontWeight: FontWeight.bold,
                                )),
                            width:80,
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          SizedBox(width: 40,),
                          SizedBox(
                            child: Text('고구마 츄',
                                style:TextStyle(color:Colors.black45,
                                  fontSize:18,
                                  fontWeight: FontWeight.bold,
                                )),
                            width:180,
                          ),
                          SizedBox(
                            child: Text('X '+'1',
                                style:TextStyle(color:Colors.black45,
                                  fontSize:18,
                                  fontWeight: FontWeight.bold,
                                )),
                            width:80,
                          ),
                          SizedBox(
                            child: Text('₩ '+'3,500',
                                style:TextStyle(color:Colors.black45,
                                  fontSize:18,
                                  fontWeight: FontWeight.bold,
                                )),
                            width:80,
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(width: 500,
                          child: Divider(
                              indent: 10.0,
                              endIndent: 10.0,
                              color: Colors.black45, thickness: 1.0)),
                      SizedBox(height: 10,),
                      Row(
                          children:
                          [
                            SizedBox(width: 20,),
                            SizedBox(
                              width: 310,
                              child: Text('적립 포인트',
                                  style:TextStyle(color:Colors.black,
                                      fontSize:20,
                                      fontWeight: FontWeight.w800)),
                            ),
                            Text('470',
                                style:TextStyle(color:Colors.black54,
                                    fontSize:20,
                                    fontWeight: FontWeight.w700)),
                          ]),
                      SizedBox(height: 10,),
                      Container(width: 500,
                          child: Divider(
                              indent: 10.0,
                              endIndent: 10.0,
                              color: Colors.black45, thickness: 1.0)),
                      SizedBox(height: 10,),
                      Row(
                          children:
                          [
                            SizedBox(width: 20,),
                            SizedBox(
                              width: 280,
                              child: Text('총 금액',
                                  style:TextStyle(color:Colors.black,
                                      fontSize:20,
                                      fontWeight: FontWeight.w800)),
                            ),
                            Text('₩ '+'9,400',
                                style:TextStyle(color:Colors.pink,
                                    fontSize:20,
                                    fontWeight: FontWeight.w700)),
                          ]),
                      SizedBox(height: 10,),
                      Container(width: 500,
                          child: Divider(
                              indent: 10.0,
                              endIndent: 10.0,
                              color: Colors.black45, thickness: 1.0)),
                      SizedBox(height: 10,),
                      Row(
                          children:
                          [
                            SizedBox(width: 20,),
                            Text('결제 수단',
                                style:TextStyle(color:Colors.black,
                                    fontSize:20,
                                    fontWeight: FontWeight.w800)),
                          ]),
                      SizedBox(height: 20,),
                      Row(
                          children:
                          [
                            SizedBox(width: 20,),
                            Icon(
                              Icons.wallet,
                              color: Colors.black45,
                            ),
                            SizedBox(width: 20,),
                            Text('카카오뱅크 1234 **** **** 5678',
                                style:TextStyle(color:Colors.black45,
                                  fontSize:18,
                                )),
                          ]),
                      SizedBox(height: 10,),
                      Container(width: 500,
                          child: Divider(
                              indent: 10.0,
                              endIndent: 10.0,
                              color: Colors.black45, thickness: 1.0)),

                      SizedBox(height: 10,),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:
                          [

                            Text('환불 일시: '+'2022 11 08 17:45:23',
                                style:TextStyle(color:Colors.black45,
                                  fontSize:15,
                                )),
                            SizedBox(width: 20,),
                          ]),
                      SizedBox(height: 10,),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:
                          [

                            Text('환불 번호: '+'eng221108174523lwi',
                                style:TextStyle(color:Colors.black45,
                                  fontSize:15,
                                )),
                            SizedBox(width: 20,),
                          ]),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          FloatingActionButton.extended(
                            label: const Text('        확인        ', style:TextStyle(color:Colors.white,
                                fontSize:15,
                                fontWeight: FontWeight.w800)),
                            backgroundColor: Colors.pink,
                            elevation: 0.5,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),


                        ],
                      ),
                      SizedBox(height: 30,)
                    ],
                  ),),

              ],
            ),
          ),
        ),

      ),
    );
  }
}