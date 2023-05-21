# Coop-Go APP
coop-go 앱 개발 repository
</br>
"flutterfire" brunch에서 현재 앱개발 진행상황 확인 가능 : https://github.com/KSB-graduation-proj/APP/blob/flutterfire/README.md

<h3>시연영상</h3>
coop-go 시연영상 유튜브 링크 : https://www.youtube.com/watch?v=ExPrby0-4T8
</br>

## 개발 
<img src="https://img.shields.io/badge/Android-green?style=for-the-badge&logo=Android&logoColor=black"/></a>
<img src="https://img.shields.io/badge/Ios-pink?style=for-the-badge&logo=Ios&logoColor=black"/></a>
<img src="https://img.shields.io/badge/Flutter-blue?style=for-the-badge&logo=Flutter&logoColor=black"/></a>
<img src="https://img.shields.io/badge/Dart-orange?style=for-the-badge&logo=Dart&logoColor=black"/></a>
<img src="https://img.shields.io/badge/Firebase-yellow?style=for-the-badge&logo=Firebase&logoColor=black"/></a>
<img src="https://img.shields.io/badge/Node.js-green?style=for-the-badge&logo=Node.js&logoColor=white"/></a>

## 사용 기술
- 앱: flutter
- 데이터베이스: firebase firestore
- 백엔드 서버: firebase functions 

## 프로젝트 목적
본 프로젝트에서는 이화여자대학교 아산공학관 매점이 공간 특성상 쉬는 시간같은 일정 시간대에는 사람이 붐비어 결제를 하기 위한 줄을 과도하게 길게 선다는 문제점을 인식했다. 따라서, 물건 구매 과정 중 결제 과정을 자동화하여 줄을 서는 시간을 단축시키기 위한 방법을 고안해 이 문제를 해결하고자 한다.


## 프로젝트 개발배경
1. 구매 실패 문제 발생</br> 
- 교내 매점 이용자 90명 대상 설문조사 결과 매점 특정 시간대에 사람이 붐비어 구매 실패 경험이 있는 학생이 75%로 드러났다.</br>

2. 대기 줄 문제</br>
- 매점 이용 시 불편한 점으로 67%의 학생들이 줄이 길다는 문제를 선택했으며 64%의 학생들이 사람이 너무 많다는 점을 지적했다.</br>

→ 줄 대기 시간 및 혼잡도 감소를 위한 물건 결제 시간 단축의 필요성 인지</br>



## 유사 서비스 

1. Amazon Go는 인공지능 기술을 활용한 무인 매장으로, 구매한 제품의 정보를 자동으로 인식하여 계산하고, 결제가 완료되면 소비자는 매장을 나갈 수 있다.</br>

2. 셀프 바코드 계산대는 고객이 제품의 바코드를 스캔하여 가격을 계산하고, 결제하는 시스템이다. 이를 위해 매장 내에는 바코드 스캐너와 결제 시스템이 설치되어 있다.</br>

Coop-Go 서비스의 차별성:

<h3>비용 효율성</h3>

Amazon Go와 달리 센서인식은 도입하지 않고 카메라가 달린 계산대에 물체를 인식시키는 과정을 추가해 Amazon Go가 소비하는 수많은 카메라와 센서인식 비용을 줄여 현실적인 실효성을 확보했다. 

<h3>간편한 사용방식</h3>

셀프 계산대와 다르게 바코드를 태깅하는 번거로움을 없앴고 비교적 간단한 방식으로 인해 소비자의 편의를 확보했다.</br>

## 소개
<h3> COOP-GO </h3>
: 대학생을 대상으로 교내 매점 계산대의 카메라를 통해 실시간으로 객체인식을 진행하여 결제 물건을 판단하고 모바일 앱에서 해당 물건의 결제 및 영수증을 발급하는 서비스
</br>
# Just GRAP, SCAN, and GO! 
</br>
사용자는 물건을 집어 계산대에 올려둔 후, QR을 스캔하고, 그냥 매점 밖으로 나가면 된다.
결제는 앱에서 미리 등록해둔 결제 수단으로 진행되며 결제 영수증은 결제 이후 1분 이내로 발급된다.

<h3> COOP-GO organization </h3>
https://github.com/KSB-graduation-proj

<h3> 프로젝트 레포지토리 정리 </h3>
https://github.com/KSB-graduation-proj/APP : 어플 </br>
https://github.com/KSB-graduation-proj/AI : 객체인식 모델

<h3> 팀원 기술블로그 </h3>
https://soobang-dev.tistory.com/category/졸업프로젝트/앱 : 방현수[APP, Server] </br>
https://grdnr13.tistory.com/category/졸업%20프로젝트: 김정원[AI-Model Trainig, Dataset Building]</br> 
https://dontvisit.tistory.com/49 : 서동은[AI-Raspberry pi]</br>


<h3> Coop-go Application </h3>
: QR스캔 및 영수증 발급을 위한 애플리케이션
</br>
회원 정보 등록/관리 및 사용자 인식을 위한 QR 생성/인식, 결제영수증 발급, 환불 및 문의 등록 기능 등을 탑재한 애플리케이션
</br>
Coop-go 서비스 사용자 및 관리자는 필수적으로 애플리케이션 설치가 요구된다.
</br>
객체 인식 오류 및 에러 상황 발생 시 관리자와 소비자의 원활한 소통을 위한 부가 기능 존재.
</br>

<h3>[Customer ver.]</h3>
QR 생성으로 사용자 등록 & 인식 기능</br>
매점 결제 및 영수증 발급 </br>
환불/1:1 문의 </br>

<h3>[Manager ver.]</h3>
QR 인식으로 사용자 관리</br>
환불/1:1 문의 검토</br>

## Prototype
<img src = https://user-images.githubusercontent.com/90560533/204531213-05b78ce9-c3fc-416c-aaab-13942cb8cb83.png width="60%" height="60%">

## 시스템 아키텍쳐
![아키텍쳐](https://github.com/KSB-graduation-proj/APP/assets/90560533/21b4a76c-094a-4901-a8df-fdadffe8bcac)

## 포스터
![그로쓰_02_김서방_2022-05-19_포스터_방현수.pdf](https://github.com/KSB-graduation-proj/APP/files/11524209/_02_._2022-05-19_._.pdf)

## 팀원
Coop-go app 개발 팀원
|방현수|
|:---:|
|Frontend&Backend|

