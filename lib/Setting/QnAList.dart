import 'package:app_test/Setting/qna/qnaDetail.dart';
import 'package:flutter/material.dart';

class qnalistPage extends StatelessWidget {
  const qnalistPage({Key? key}) : super(key: key);

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
        body: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Container(width: 500,
                  child: Divider(
                      height: 0.0,
                      color: Colors.black12, thickness: 1.0)),
              const MyStatelessWidget(),
            ],
          ),
        )
    );

  }
}

class _qnaDescription extends StatelessWidget {
  const _qnaDescription({
    required this.date,
    required this.qnano,
    required this.title,
    required this.category,
  });

  final String date;
  final String qnano;
  final String title;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
        child:
        Card(
          margin: EdgeInsets.fromLTRB(1.0, 7.0, 1.0, 0.0),
          color: Colors.white,
          child: ListTile(
            title: Text(qnano,style:TextStyle(color:Color(0xff2eb67d),
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
                  MaterialPageRoute(builder: (context)=>qnaDetailPage())
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
    required this.qnano,
    required this.title,
    required this.category
  });

  final String date;
  final String qnano;
  final String title;
  final String category;

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
                  qnano: qnano,
                  title: title,
                  category: category,

                ),
              ),
          ],
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              CustomListItemTwo(
               date:'2023/01/31' ,
               qnano: 'qna013140407171',
               title: '물품 인식 재오류',
               category: '물품 인식 오류',

              ),
              CustomListItemTwo(
                date:'2023/01/20' ,
                qnano: 'qna01234913671',
                title: '포인트 사용 문의',
                category: '포인트',
              ),
              CustomListItemTwo(
                date:'2023/01/04' ,
                qnano: 'qna079214910233',
                title: '결제가 안돼요',
                category: '결제',
              ),
              CustomListItemTwo(
                date:'2023/01/02' ,
                qnano: 'qna010246194619',
                title: '앱 건의사항이요',
                category: '기타',
              ),
            ],

          )
      ),

    );
  }
}


