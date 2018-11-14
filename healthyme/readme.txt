* 설계 산출물 내역
- 비전: 아키텍처\기획\홍길동_비전.docx
- 비즈니스룰: 아키텍처\기획\홍길동_비즈니스룰분석.pptx
- 페르소나: 아키텍처\요구사항분석\홍길동_페르소나분석.pptx
- 아키텍처 정의: 아키텍처\하위설계\홍길동_아키텍처현황_정의서.docx
- 초기요구사항 리스트: 아키텍처\상위설계\홍길동_요구사항식별.emm
- Usecase Diagram: 아키텍처\상위설계\홍길동_UCX.jpg
- Usecase 명세서: 아키텍처\상위설계\홍길동_Usecase명세서.docx
- Activity Diagram: 아키텍처\상위설계\홍길동_Activity_Diagram.jpg
- Class Diagram: 아키텍처\하위설계\홍길동_Class_Diagram.jpg
- ERD Diagram: 아키텍처\하위설계\홍길동_DRD.jpg
- 작업일정: 수행관리\홍길동_ProductBacklog.xlsx

* 개발/테스트 환경
 > 운영체제: Windos7
 > 메모리: 8Gb
 > 하드디스크: 500Gb
 > CPU: Intel Pentium G4400
 > Bigdata Server: Python (개발도구: PyCharm)
 > 웹 솔루션: Eclipse
 > 형상관리: Git Client(개발도구 내장 및 Plugin) 과 GitHub 연동
 
* 운영 및 배포 환경
 > 웹서버
  - OS: Linux (Centos 7)
  - 메모리: 32 기가
  - 하드디스크: 2Tb
  - CPU: Intel Core i7
 > Bigdata Server
  - OS: Linux (Centos 7)
  - 메모리: 64 기가
  - 하드디스크: 4Tb
  - CPU: Intel Core i7 

* 구현 코드 내역
- Bigdata Server
 > 폴더: src/Bigdata_Server
 > 언어: Python
 > 형상관리: Git Client/Server
 > 통합 URI: https://github.com/hongidong92/Bigdata
- 웹 솔루션: 
 > 폴더: src/DaPalA
 > 언어: Java
 > 개발도구: STS
 > 형상관리: Git Client/Server
 > 통합 URI: https://github.com/hongidong92/DaPalA
 
* 단위 테스트 환경
 - 단위(Unit)의 정의: 구현 화면 단위
 - 단위 (Unit) 정의 근거: 프로젝트 개발 기간 및 프로젝트의 목적상 낮은 Regression Test
 - Test Basis
  > 참고 문서명: Usecase명세서
  > 경로: \TestCase\UnitTest
 - Test 방법
  > 시나리오: Usecase 명세서상의 Usecase당 기본, 선택, 예외 흐름 테스트
  > Test Oracle: 해당 스텝당 검증 항목 참조
 - Test 목표
  > 잔존 결함률 0%
  > 잔존 결함률: 미조치 결함 수 / 전체 TestCase 수