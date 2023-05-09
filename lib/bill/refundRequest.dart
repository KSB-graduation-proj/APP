import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:app_test/home.dart';
import 'package:app_test/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

List<String> list = [];
const List<String> list1 = <String>['물품 인식 오류', '기타'];
 List<String> list2 = [];
//주문번호, 결제번호, ispaid, 주문리스트 받아오기
String? payCard;
String? reason;
String? errorProduct;
String? detail;

class refundRequest extends StatefulWidget {
  final orderId;
  final paymentId;
  final payment;
  final productList;

  const refundRequest(this.orderId, this.paymentId, this.payment,this.productList );

  @override
  State<refundRequest> createState() => _refundRequest();
}

class _refundRequest extends State<refundRequest> {
  List<String> product= [];
  List<String> card=[];

  void print1(){
    print('$payCard, $reason, $errorProduct, $detail');
  }
  void textClear(){
    payCard=null;
    reason=null;
    errorProduct=null;
    detail=null;
  }
  @override
  void initState() {
    super.initState();
    textClear();
    getCardData();

  }

  List<String>? keytoList(Map){
    List<String> list =[];
    for (String temp in Map){
      list.add(temp);
    }
    return list;
  }

  void getCardData() {
    final doc = firestore.collection('card').doc("${email}");
    doc.get().then((DocumentSnapshot doc)
    {
      setState(() {
        list.clear();
        list2.clear();
        final data = doc.data() as Map<String,dynamic>; // 모든 영수증 데이터
        List<String>? card0 = keytoList(data.keys);
        for(int i=0; i< card0!.length ;i++) {
          var card1 = data[card0![i]];
          var number1 = card1!['number'].toString();
          //var number2 = number1.replaceRange(5,14 ,'****-****');
          var company1 = card1!['company'].toString();
          var card2 = '$company1 $number1';
          list.add(card2);
        }
        for(int i =0; i< widget.productList.length;i++){
          product.add(widget.productList[i]);
        }print(product.runtimeType);
        list2.addAll(product);
        list2.add('없음');
        print('$list, $list2');

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
        title: const Text('환불 요청',
            style:TextStyle(color:Colors.black,
                fontSize:20,
                fontWeight: FontWeight.w800)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(height: 30,),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 190,),
                      Text('결제 번호: ${widget.paymentId}',
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
                          child: detailTextField(label: "detail",onChangefunc: (newText){detail=newText;}),

                      ),
                      Expanded(
                        flex: 1, // 20%
                        child: Container(color: Colors.transparent),
                      )
                    ],
                  ),
                  SizedBox(height: 50,),

                  FloatingActionButton.extended(
                      label: const Text('                         제출                         ',
                          style:TextStyle(color:Colors.white,
                              fontSize:17,
                              fontWeight: FontWeight.w800)),
                      backgroundColor: Color(0xff2eb67d),
                      elevation: 0.5,
                      onPressed: () {
                        print1();
                        if(payCard!=null&&reason!=null&&errorProduct!=null&&detail!=null)
                          {showDialog<String>(
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
                                  child: const Text('예'),
                                  onPressed:() {
                                    final refundRequest = firestore.collection("refundRequest");
                                    final settime = setTime();
                                    final id = '${code}_${settime}';
                                    var payCardList = payCard!.split(" ");
                                    final cardCompany = payCardList[0];
                                    final cardNumber = payCardList[1];
                                    final data = <String, dynamic>
                                      {
                                        '${id}': {
                                          'card': {
                                            'company': cardCompany,
                                            'number': cardNumber,
                                          },
                                          'detail': detail,
                                          'errorProduct': errorProduct,
                                          'orderId':widget.orderId,
                                          'paymentId':widget.paymentId,
                                          'reason':reason,

                                        } };
                                    refundRequest.doc(email).set(data, SetOptions(merge: true));
                                    showDialog<String>(
                                      context: context,
                                      builder: (context) =>
                                          AlertDialog(
                                            content: const Text(
                                                '환불 신청이 완료되었습니다.'),
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
                                    );

                                  }),
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
              )
              ]
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
          payCard = value;
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
          reason = value!;
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
      onChanged: (dynamic value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value;
          errorProduct = value;
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

      child:TextField(
        onChanged: (newText){
          onChangefunc(newText);
        },
        maxLines: 6,
        minLines: 1,
        decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 50.0, 0.0, 50.0),

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
    ));

}
}



