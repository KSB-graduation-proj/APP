import 'package:app_test/Setting/qna/qnaDetail.dart';
import 'package:app_test/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class viewQnaPage extends StatefulWidget {
  const viewQnaPage({Key? key}) : super(key: key);
  @override
  State<viewQnaPage> createState() => _viewQnaPage();
}

class _viewQnaPage extends State<viewQnaPage> {

  List<dynamic> orderId=[];
  List<dynamic> qnaId=[];
  List<dynamic> title=[];
  List<dynamic> time=[];
  List<dynamic> category=[];
  List<dynamic> detail=[];
  List<dynamic> idList=[];

  bool isLoading = true;
  bool noData = false;

  @override
  void initState() {
    super.initState();
    setData();
  }
  void setData() {
    FirebaseFirestore.instance.collection('qna').get()
        .then((QuerySnapshot querySnapshot)
    {
      setState((){

        querySnapshot.docs.forEach((DocumentSnapshot documentSnapshot) {
          Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
          if(data==null){
            noData=true;
          }
          data.forEach((qnaID, data) {
            qnaId.add(qnaID);
            orderId.add(data['orderId']);
            title.add(data['title']);
            category.add(data['category']);
            detail.add(data['detail']);
            String date1 = qnaID.substring(8);
            String formatDate =
                "20${date1.substring(0, 2)}/${date1.substring(2, 4)}/${date1.substring(4, 6)} ${date1.substring(6, 8)}:${date1.substring(8, 10)}:${date1.substring(10)}";
            time.add(formatDate);

            String id = data['orderId'].substring(0, 7);
            idList.add(id);
            isLoading = false;
          });

        });
      });
    });}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,

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
             SizedBox(height: 5.0,),
             Container(width: 700,
                 child: Divider(
                     height: 0.0,
                     color: Color(0xfff4f2f6), thickness: 1.0)),
             SizedBox(height: 15.0,),
             Row(
                 children:
                 [SizedBox(width: 20,),
                   Text('1:1 문의 목록',
                 style:TextStyle(color:Colors.black87,
                     fontSize:18,
                     fontWeight: FontWeight.bold)),]),

             SizedBox(height: 20.0,),
            for (int i=0;i<orderId.length;i++)...[
                CustomListItemTwo(
                  date: time[i],
                  orderno: orderId[i],
                  title: title[i],
                  category: category[i],
                  detail: detail[i],
                  qnano: qnaId[i],
                  id: idList[i]
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
    required this.id,
  });

  final String date;
  final String orderno;
  final String title;
  final String category;
  final String detail;
  final String qnano;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Column(
        children:[
          Container(width: 700,
              child: Divider(
                  height: 0.0,
                  color: Color(0xfff4f2f6), thickness: 5.0)),
          Card(
            margin: EdgeInsets.fromLTRB(1.0, 5.0, 1.0, 5.0),
            color: Colors.white,
            child: ListTile(
              isThreeLine: true,
              title: Text(orderno,style:TextStyle(color:Color(0xff2eb67d),
                  fontSize:11,
                  fontWeight: FontWeight.w500)),
              subtitle:
               Text('$id  $title',style:TextStyle(color:Colors.black,
              fontSize:16,
              fontWeight: FontWeight.w600)),

              trailing:
              Text(date,style:TextStyle(color:Colors.black54,
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
        ]

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
    required this.id,
  });

  final String date;
  final String orderno;
  final String title;
  final String category;
  final String detail;
  final String qnano;
  final String id;

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
                  id: id,

                ),
              ),
          ],
        ),
      ),
    );
  }
}




