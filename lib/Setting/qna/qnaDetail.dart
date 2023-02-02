import 'package:flutter/material.dart';

class qnaDetailPage extends StatelessWidget {
  const qnaDetailPage({Key? key}) : super(key: key);

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
                SizedBox(width: 210,),
                const Text('문의 번호: qna221108174523lwi',
                  style: TextStyle(color: Colors.black45,
                    fontSize:13,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 20,),
                const Text('23/02/02',
                  style: TextStyle(color: Colors.black87,
                    fontSize:14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                SizedBox(width: 20,),
                const Text('물품 인식 재오류',
                  style: TextStyle(color: Color(0xff2eb67d),
                    fontSize:16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5.0),
              child: Text('아니 물품인식이 또 오류났어요 제대로 확인좀해주세요 ㅡㅡ 이번이 두번째에요 직접 확인좀해주세요 머하는겅믜',
                style: TextStyle(color: Colors.black,
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

