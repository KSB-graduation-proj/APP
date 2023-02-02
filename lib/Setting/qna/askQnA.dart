import 'package:app_test/Setting/qna/QnA.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

const List<String> list = <String>['231101esh123456', '2231478ewh391764', '230405ewh381761'];
//db에서 정보를 가져와야함
const List<String> list1 = <String>['물품 인식 오류', '포인트', '결제','기타 문의사항'];

class askqnaPage extends StatelessWidget {
  const askqnaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  resizeToAvoidBottomInset: false,
  appBar: AppBar(
  iconTheme: IconThemeData(
  color: Colors.black),
  title: const Text('1:1 문의하기',
  style:TextStyle(color:Colors.black,
  fontSize:20,
  fontWeight: FontWeight.w800)),
  backgroundColor: Colors.transparent,
  elevation: 0.0,
  centerTitle: true,
  ),
  body: Center(
  child: Column(
  //\\mainAxisAlignment: MainAxisAlignment.center,
  children: [
  SizedBox(height: 30,),

  Row(
  children: [
  SizedBox(width: 20,),
  const Text('주문 번호',
  style: TextStyle(color: Colors.black,
  fontSize:15,
  fontWeight: FontWeight.w600,
  ),
  ),
  ],
  ),

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
  const Text('문의 카테고리',
  style: TextStyle(color: Colors.black,
  fontSize:15,
  fontWeight: FontWeight.w600,
  ),
  ),
  ],
  ),
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
  const Text('문의 내용',
  style: TextStyle(color: Colors.black,
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
  child: TextField(
  maxLines: 6,
  minLines: 1,
  decoration: InputDecoration(
  contentPadding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 50.0),
  labelText: '1:1 문의하기',
  hintText: '상세 문의 내용을 입력하세요. ',
  labelStyle: TextStyle(color: Colors.black54 ),
  focusedBorder: OutlineInputBorder(),

  ),
  )
  ),
  Expanded(
  flex: 1, // 20%
  child: Container(color: Colors.transparent),
  )
  ],
  ),
  SizedBox(height: 30,),

  FloatingActionButton.extended(
  label: const Text('                          문의하기                          ',
  style:TextStyle(color:Colors.white,
  fontSize:17,
  fontWeight: FontWeight.w800)),
  backgroundColor: Color(0xff2eb67d),
  elevation: 0.5,
  onPressed: () => showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('1:1 문의 등록'),
      content: const Text('이 문의를 등록하시겠습니까?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('아니요'),
        ),
        TextButton(
          onPressed:() => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: const Text('1:1 문의 등록이 완료되었습니다.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
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
  ),
  ),
  ],
  ),
  ),
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
  style: const TextStyle(color: Colors.black54),
  focusColor: Colors.black,
  borderRadius: BorderRadius.circular(5),

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
  style: const TextStyle(color: Colors.black54),
  focusColor: Colors.black,
  borderRadius: BorderRadius.circular(10),
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


