import 'package:app_test/home.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:app_test/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<String> list = [];
const List<String> list1 = <String>['물품 인식 오류', '포인트', '결제','기타 문의사항'];
String? orderId;
String? detail;
String? title;
String? category;

class askqnaPage extends StatefulWidget{
  const askqnaPage({Key? key}) : super(key: key);
  @override
  State<askqnaPage> createState() => _askqnaPage();
}

class _askqnaPage extends State<askqnaPage> {

  List<String> orderNo =[];
  bool noData=false;
  bool isLoading = true;

  void textClear(){
    orderId=null;
    detail=null;
    category=null;
    title=null;
  }
  @override
  void initState() {
    super.initState();
    textClear();
    getQnaData();
  }

  List<String> keytoList(Map){
    List<String> list =[];
    for (String temp in Map){
      list.add(temp);
    }
    return list;
  }

  void getQnaData(){
    final doc = firestore.collection('order').doc("${email}");
    if(doc!=null){
      noData = false;
    }
    doc.get().then((DocumentSnapshot doc)
    {
      setState(() {
        if(doc.data()==null){
          noData=true;
        }
        else{
          list.clear();
          final data = doc.data() as Map<String, dynamic>;
          orderNo = keytoList(data.keys); //주문번호 저장
          list.addAll(orderNo);
          print('order:$list');
          isLoading = false;
        }
      });
  },);
  }

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
    body: isLoading ?
    noData ?
    Center(
      child: Text("주문 데이터가 존재하지 않습니다."),
    )
    : Center(
      child: CircularProgressIndicator(),
    )
        :
    Center(
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
          const Text('문의 제목',
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
            flex: 14,
            child: CustomTextField(label: "title",onChangefunc: (newText){title=newText;}),
// 60%

          ),
          Expanded(
            flex: 1, // 20%
            child: Container(color: Colors.transparent),
          )
        ],
      ),
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
              flex: 14,
              child: detailTextField(label: "detail",onChangefunc: (newText){detail=newText;}),
// 60%

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
          onPressed: () {
            if(title!=null&&orderId!=null&&category!=null&&detail!=null) {
              showDialog<String>(
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
                      child: const Text('예'),
                        onPressed:() {
                          final qnaRequest = firestore.collection("qna");
                          final settime = setTime();
                          final id = '${code}_${settime}';
                          final data = <String, dynamic>
                          {
                            '${id}': {
                              'detail': detail,
                              'title': title,
                              'category': category,
                              'orderId': orderId,
                            } };
                          qnaRequest.doc(email).set(data, SetOptions(merge: true));
                          showDialog<String>(
                            context: context,
                            builder: (context) =>
                                AlertDialog(
                                  content: const Text(
                                      '1:1 문의 등록이 완료되었습니다.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Home()));
                                        //Navigator.popUntil(context, (route) => route.isFirst);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                          );}
                    ),
                  ],
                ),
              );}
            else{
              showDialog(context: context, builder: (context)=> AlertDialog(
                  content: const Text ('모든 값의 선택 및 입력은 필수입니다.'),
                  actions:<Widget>[
                    TextButton(onPressed: (){Navigator.of(context).pop();}, child: const Text('예'))
                  ]
              ));
            }
          }

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
  orderId = value;
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
  category = value;
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

class detailTextField extends StatelessWidget{
  String label;
  void Function(String text) onChangefunc;

  detailTextField({
    required this.label,
    required this.onChangefunc,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
          onChanged: (newText){
            onChangefunc(newText);
          },
          maxLines: 6,
          minLines: 1,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 50.0),
            labelText: '1:1 문의하기',
            hintText: '상세 문의 내용을 입력하세요. ',
            labelStyle: TextStyle(color: Colors.black54),
            focusedBorder: OutlineInputBorder(),
          ),

        ));
  }
}
class CustomTextField extends StatelessWidget {
  String label;
  void Function(String text) onChangefunc;

  CustomTextField({
    required this.label,
    required this.onChangefunc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.fromLTRB(0.0,2.0,0.0,5.0),
      child:
      TextField(
        onChanged: (newText) {
          onChangefunc(newText);
        },
        cursorColor: Color(0xff2eb67d),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '문의 제목을 입력하세요.',
            hintStyle: TextStyle(fontSize: 14),
            focusColor: Color(0xff2eb67d),
            hoverColor: Color(0xff2eb67d)
        ),),);
  }

}