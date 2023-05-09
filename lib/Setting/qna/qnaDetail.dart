import 'package:flutter/material.dart';

class qnaDetailPage extends StatefulWidget {
  final orderno;
  final title;
  final date;
  final category;
  final detail;
  final qnano;
  const qnaDetailPage(this.orderno,this.title,this.date,this.category, this.detail, this.qnano);
  @override
  State<qnaDetailPage> createState()=>_qnaDetailPage();
}
class _qnaDetailPage extends State<qnaDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black),
        title: const Text('나의 1:1 문의',
            style:TextStyle(color:Colors.black,
                fontSize:20,
                fontWeight: FontWeight.w700)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Container(width: 500,
                child: Divider(
                    height: 0.0,
                    color: Colors.black12, thickness: 1.0)),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 284,),
                Text('${widget.date}',
                  style: TextStyle(color: Colors.black45,
                    fontSize:12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 3,),
            Row(
              children: [
                SizedBox(width: 210,),
                Text('문의 번호: ${widget.qnano}',
                  style: TextStyle(color: Colors.black45,
                    fontSize:12,
                  ),
                ),

              ],
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                SizedBox(width: 20,),
                Text('${widget.orderno}',
                  style: TextStyle(color: Color(0xff2eb67d),
                    fontSize:15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 20,),
                Text('${widget.title}',
                  style: TextStyle(color: Colors.black87,
                    fontSize:18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5.0),
              child: Text('${widget.detail}',
                style:
                TextStyle(color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

