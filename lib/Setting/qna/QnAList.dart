import 'package:app_test/Setting/qna/qnaDetail.dart';
import 'package:app_test/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class qnalistPage extends StatefulWidget {
  const qnalistPage({Key? key}) : super(key: key);
  @override
  State<qnalistPage> createState() => _qnalistPage();
}

class _qnalistPage extends State<qnalistPage> {

  List<dynamic> orderId=[];
  List<dynamic> qnaId=[];
  List<dynamic> title=[];
  List<dynamic> time=[];
  List<dynamic> category=[];
  List<dynamic> detail=[];

  bool isLoading = true;
  bool noData = true;

  @override
  void initState() {
    super.initState();
    getQnaData();
  }

  List<String>? keytoList(Map){
    List<String> list =[];
    for (String temp in Map){
      list.add(temp);
    }
    return list;
  }

  void getQnaData(){
    final doc = firestore.collection('qna').doc("${email}");
    doc.get().then((DocumentSnapshot doc) {
      setState(() {
        final data = doc.data() as Map<String,dynamic>; // 모든 영수증 데이터
        List<String>? qna = keytoList(data.keys);
        print('qna:$qna');
        for(int i = 0; i<qna!.length;i++){
          qnaId.add(qna![i]);
          var qna1 = data[qna![i]]; // 모든 결제번호 데이터
          var orderId1 =qna1!['orderId'].toString();
          orderId.add(orderId1);
          String date1 = qna[i].substring(8);
          String formatDate =
              "20${date1.substring(0, 2)}/${date1.substring(2, 4)}/${date1.substring(4, 6)} ${date1.substring(6, 8)}:${date1.substring(8, 10)}:${date1.substring(10)}";
          print(formatDate);
          time.add(formatDate);
          var category1 = qna1['category'];
          category.add(category1);
          var title1 = qna1['title'];
          title.add(title1);
          var detail1 = qna1['detail'];
          detail.add(detail1);
          noData=false;
          isLoading=false;
        }print('$orderId,$category, $time,$title,$qnaId');
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
          title: const Text('나의 문의 목록',
              style:TextStyle(color:Colors.black,
                  fontSize:20,
                  fontWeight: FontWeight.w800)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
        ),
        body: noData
        ? Center(
        child: Text('1:1 문의가 존재하지 않습니다.')
    )
        :
        isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : SingleChildScrollView(
          child: Column(
           children:[
            for (int i=0;i<orderId.length;i++)...[
                CustomListItemTwo(
                  date: time[i],
                  orderno: orderId[i],
                  title: title[i],
                  category: category[i],
                  detail: detail[i],
                  qnano: qnaId[i],
                  ),
              ]
           ],
          ),
        )
    );

  }
}

class _qnaDescription extends StatelessWidget {
  const _qnaDescription({
    required this.date,
    required this.orderno,
    required this.title,
    required this.category,
    required this.detail,
    required this.qnano,
  });

  final String date;
  final String orderno;
  final String title;
  final String category;
  final String detail;
  final String qnano;

  @override
  Widget build(BuildContext context) {
    return Container(
        child:
        Card(
          margin: EdgeInsets.fromLTRB(1.0, 7.0, 1.0, 0.0),
          color: Colors.white,
          child: ListTile(
            title: Text(orderno,style:TextStyle(color:Color(0xff2eb67d),
                fontSize:11,
                fontWeight: FontWeight.w500)),
            subtitle:
            Text(title,style:TextStyle(color:Colors.black,
                fontSize:16,
                fontWeight: FontWeight.w600)),

            trailing: Text(date,style:TextStyle(color:Colors.black54,
                fontSize:13,
                fontWeight: FontWeight.w400)),

            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>qnaDetailPage(orderno,title,date,category, detail,qnano))
              );
            },
            ),
          ),
      );
  }
}

class CustomListItemTwo extends StatelessWidget {
  const CustomListItemTwo({
    super.key,
    required this.date,
    required this.orderno,
    required this.title,
    required this.category,
    required this.detail,
    required this.qnano,
  });

  final String date;
  final String orderno;
  final String title;
  final String category;
  final String detail;
  final String qnano;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: _qnaDescription(
                  date: date,
                  orderno: orderno,
                  title: title,
                  category: category,
                  detail: detail,
                  qnano: qnano,

                ),
              ),
          ],
        ),
      ),
    );
  }
}




