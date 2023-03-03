import 'dart:ui';

import 'package:app_test/home.dart';
import 'package:app_test/pages/myPage.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['카카오뱅크 3333 **** **** 1234', '우리은행 2345 **** **** 1886', '삼성카드 9877 **** **** 1111'];
const List<String> list1 = <String>['물품 인식 오류', '결제 카드 변경', '기타'];
const List<String> list2 = <String>['참치 김밥', '코카콜라 제로', '아몬드맛 빼뺴로', '고구마 츄','없음'];

class refundRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black),
        title: const Text('환불 요청',
            style:TextStyle(color:Colors.black,
                fontSize:20,
                fontWeight: FontWeight.w800)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              RefundForm(),
              ]
        ),
      ),
    );
  }
}

class RefundForm extends StatefulWidget {
  const RefundForm({super.key});
  @override
  RefundFormState createState() {
    return RefundFormState();
  }
}

class RefundFormState extends State<RefundForm>{
  final refundKey = GlobalKey<FormState>();

  Widget build(BuildContext){
    return Form(
      key: refundKey,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 210,),
              const Text('주문번호: eng221108174523lwi',
                style: TextStyle(color: Colors.black45,
                  fontSize:13,
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 20,),
              const Text('결제 수단',
                style: TextStyle(color: Colors.black87,
                  fontSize:15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1, // 20%
                child: Container(color: Colors.transparent),
              ),
              Expanded(
                flex: 14, // 60%
                child: DropdownButtonExample(),
              ),
              Expanded(
                flex: 1, // 20%
                child: Container(color: Colors.transparent),
              )
            ],
          ),

          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 20,),
              const Text('환불 이유',
                style: TextStyle(color: Colors.black87,
                  fontSize:15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1, // 20%
                child: Container(color: Colors.transparent),
              ),
              Expanded(
                flex: 14, // 60%
                child: DropdownButtonExample1(),
              ),
              Expanded(
                flex: 1, // 20%
                child: Container(color: Colors.transparent),
              )
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 20,),
              const Text('문제 물품',
                style: TextStyle(color: Colors.black87,
                  fontSize:15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1, // 20%
                child: Container(color: Colors.transparent),
              ),
              Expanded(
                flex: 14, // 60%
                child: DropdownButtonExample2(),
              ),
              Expanded(
                flex: 1, // 20%
                child: Container(color: Colors.transparent),
              )
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 20,),
              const Text('문의 내용',
                style: TextStyle(color: Colors.black87,
                  fontSize:15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1, // 20%
                child: Container(color: Colors.transparent),
              ),
              Expanded(
                  flex: 14, // 60%
                  child: TextFormField(
                    maxLines: 6,
                    minLines: 1,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 50.0, 0.0, 50.0),
                      labelText: 'Detail',
                      hintText: '상세 문의 내용을 입력하세요. ',
                      labelStyle: TextStyle(color: Colors.black, ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(width: 0.5, color: Colors.black54),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(width: 1, color: Colors.black54),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                      validator: (value)=> value==null||value.isEmpty?
                      '문의 내용을 입력해주세요.':null
                  )
              ),
              Expanded(
                flex: 1, // 20%
                child: Container(color: Colors.transparent),
              )
            ],
          ),
          SizedBox(height: 50,),

          FloatingActionButton.extended(
            label: const Text('                           제출                           ',
                style:TextStyle(color:Colors.white,
                    fontSize:17,
                    fontWeight: FontWeight.w800)),
            backgroundColor: Color(0xff2eb67d),
            elevation: 0.5,
            onPressed: () {
              if(refundKey.currentState!.validate()){
                showDialog<String>(
                    context: context,
                    builder: (context) => AlertDialog(
                    title: const Text('환불 요청'),
                    content: const Text('이 주문의 환불을 신청하시겠습니까?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('아니요'),
                      ),
                      TextButton(
                        onPressed:() => showDialog<String>(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: const Text('환불 신청이 완료되었습니다.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>Home()));
                                  //Navigator.popUntil(context, (route) => route.isFirst);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                        child: const Text('예'),
                      ),
                    ],
                  ),
                );
              }
            }
          ),
        ],
      )
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      iconEnabledColor: Colors.black,
      isExpanded: true,
      elevation: 5,
      style: const TextStyle(color: Color(0xff2eb67d)),
      focusColor: Colors.black,
      borderRadius: BorderRadius.circular(10),
      underline: Container(
        color: Colors.transparent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
class DropdownButtonExample1 extends StatefulWidget {
  const DropdownButtonExample1({super.key});

  @override
  State<DropdownButtonExample1> createState() => _DropdownButtonExampleState1();
}

class _DropdownButtonExampleState1 extends State<DropdownButtonExample1> {
  String dropdownValue = list1.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      iconEnabledColor: Colors.black,
      isExpanded: true,
      elevation: 5,
      style: const TextStyle(color: Color(0xff2eb67d)),
      focusColor: Colors.black,
      borderRadius: BorderRadius.circular(10),
      underline: Container(
        color: Colors.transparent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list1.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
class DropdownButtonExample2 extends StatefulWidget {
  const DropdownButtonExample2({super.key});

  @override
  State<DropdownButtonExample2> createState() => _DropdownButtonExampleState2();
}

class _DropdownButtonExampleState2 extends State<DropdownButtonExample2> {
  String dropdownValue = list2.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      iconEnabledColor: Colors.black,
      isExpanded: true,
      elevation: 5,
      style: const TextStyle(color: Color(0xff2eb67d)),
      focusColor: Colors.black,
      borderRadius: BorderRadius.circular(10),
      underline: Container(
        color: Colors.transparent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list2.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}