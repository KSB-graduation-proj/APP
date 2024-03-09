# Coop-Go App 
<a href= "https://soobang-dev.tistory.com/"><img src="https://img.shields.io/badge/Tistory-white?style=for-the-badge&logo=Tistory&logoColor=black"/></a>
</br>
개발환경 구축방법 => <a href= "https://soobang-dev.tistory.com/3"><img src="https://img.shields.io/badge/Tistory-blue?style=for-the-badge&logo=Tistory&logoColor=black"/></a>

<br> 정적 페이지 구축으로 인해 특정 크기의 화면이 아닐 시 over pixel 위험 존재</br>
<h6> * 가상 에뮬레이터 AVD "Pixel 3 XL API 30" 크기 (갤럭시 s8 size) 사용 필수!! *</h6>

## 개발 
<img src="https://img.shields.io/badge/Android-green?style=for-the-badge&logo=Android&logoColor=black"/></a>
<img src="https://img.shields.io/badge/Flutter-blue?style=for-the-badge&logo=Flutter&logoColor=black"/></a>
<img src="https://img.shields.io/badge/Dart-navy?style=for-the-badge&logo=Dart&logoColor=white"/></a>
<img src="https://img.shields.io/badge/Firebase-yellow?style=for-the-badge&logo=Firebase&logoColor=white"/></a>
<img src="https://img.shields.io/badge/Node.js-darkgreen?style=for-the-badge&logo=DartNode.js&logoColor=white"/></a>

### Tools
- flutter : 안드로이드 기반 coop-go 애플리케이션 제작을 위해 프레임워크 flutter 사용
- firebase : noSQL DB firestore로 데이터 저장 및 noServer backend functions로 결제 함수 작성

## 파일 소개
<br>
firebase.dart
home.dart
main.dart
<br><br>

1. admin folder
- adminhome.dart
- qrScan.dart
- refundDetail.dart
- refundList.dart
- viewQnaList.dart

<br><b> 관리자 version과 관련한 파일 폴더 </b>
<br> 관리자 main화면, qrscan이 가능한 전/후면 카메라 화면, 환불 영수증 및 디테일 화면, QnA List 화면 </br>


2. login folder
- login.dart
- quit.dart
- signup.dart

<br><b> 로그인과 관련한 파일 폴더 </b>
<br> 로그인, 회원 탈퇴, 회원 가입 화면 </br>

3. pages folder
- mainPage.dart
- myPage.dart
- point.dart
- settingsPage.dart

<br><b> 페이지와 관련한 파일 폴더 </b>
<br> 메인 화면, 마이페이지 화면 (구매영수증 확인), 생협 포인트 화면, 세팅 화면 </br>

4. bill folder
- bill.dart
- refundRequest.dart
- refundRequest_insuffBal.dart

<br><b> 영수증과 관련한 파일 폴더 </b>
<br> 영수증 개별 화면, 환불 요청 화면, (e) 잔액 부족으로 인한 환불 요청 화면 </br>

5. Setting folder
- qna folder
   - askQnA.dart
   - QnA.dart
   - qnaDetail.dart
   - QnAList.dart
- addPay.dart
- pay.dart
- profile.dart
- refundBill.dart
- refundInfo.dart

<br><b> 기본 세팅과 관련한 파일 폴더 </b>
<br> QnA화면 (QnA 작성, 개별 View, List View), 결제 화면 (결제 수단 List view, 결제 수단 추가), 프로필, 환불 영수증 화면 </br>

6. functions folder
- index.js
- order.js
- payment.js
- refund.js

<br><b> 결제 및 환불 <기능>과 관련한 함수 파일 폴더 </b>
<br> Firebase의 Functions 기능 활용해 DB 변화 감지 시 함수 trigger </br>
<br> 주문, 결제, 환불 기능 </br>

## 보완할 점
1. 앱결제의 현실적인 어려움 (PG사 수반 및 사업자 등록, 개인정보 문제)으로 인해 가상의 결제 시스템 설정 </br>
2. QR생성 시 사용자 확인을 위해 학번을 사용했으나 보안 문제 발생 위험이 크므로 학번과 hash함수 등을 결합한 새로운 qr 생성 방식 필요 </br>
3. sns 로그인 등 간편 로그인 도입 </br>
   

## made by
방현수



## Reference
[Flutter Documentation]
   [https://flutter-ko.dev/docs/development/ui/widgets]
    




