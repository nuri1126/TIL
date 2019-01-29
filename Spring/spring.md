# Spring 

> 스프링을 공부하며 `중요한 부분이나 기억해야할 부분` 들을 정리하였습니다.
<br>

### 목차

### 1. 
<br>

---

<br>

### 폴더관리 


> (/src/main/java, /src/main/resources)
* java 폴더의 경우 특별한 것은 없고, 앞으로 만들어지는 자바 파일들이 관리되는 폴더이다.
* resources 폴더의 경우 자원을 관리하는 폴더로 스프링 설정 파일(xml)ㄷ 또는 프로퍼티 파일 등이 관리된다.
* java, resources 폴더는 스프링 프레임워크의 기본 구조를 이루는 폴더로 개발자는 이대로 폴더를 구성해야 한다.

<br>

###  pom.xml 파일

* pom.xml 파일은 메이븐 설정파일로 메이븐은 라이브러리를 연결해주고, 빌드를 위한 플랫폼이다.
*  pom.xml에 의해서 필요한 라이브러리만 다운로드 해서 사용한다.
* 라이브러리는 아래의 경로에서 확인 가능함
* .m2/repository/org/springframework
    * 참고로 모듈의 라이브러리 파일명은 artifactid  +"-"+버전명+".jar"로 표시된다.

<br>

### applicationContext.xml
* 스프링은 메모리 생성될때 스프링 컨테이너는 ioc를 큰 그릇을 만들고 거기에 객체를 생성해놓고 필요할 때 마다 가져감
* 스프링의 객체(bean을 만들어주는 것)를 생성헤 spring container 에 로딩함
* 내가 사용하려는 태그들에 대한 네임스페이스가 들어있음 
* oop 언어에서 처럼 new로 객체를 생성을 안해도 자동으로 객체(bean)를 생성해서 컨테이너에 담아줌
* xml 말고도 annotation으로 생성을 함

<br>

### GenericXml ApplicationContext
* ApplicationContext 컨테이너에 접근하기 위한 데이터 타입

<br>

### local에서 spring 프로젝트 만들기
* 프로젝트명
    * src
        * main
            * java
                * 클래스 생성
            * resources
                * applicationContext.xml
    * pom.xml
        * 내용은 기존의 것 복붙해서 사용
        * groupid랑 artifacts(프로젝트명)만 변경
        
<br>

### DI(의존주입)
* 스프링만의 기능은 아니고 oop에서의 방법론 중의 하나임,, java jsp 등등 에서 사용
* 큰 객체 안에 다른 객체가 들어있는 것
    * 자동차 안에 배터리 와 같은,,, 
* 스프링 컨테이너 생성 및 빈(bean) 객체 호출 과정
* 모든 객체가 한 db를 사용하는 것과 같은 방식
    * 한개의 dao를 여러 service가 참조하도록 한다.


<img src="./Readme_img/home.png" height="650">


<br>


<br>


```
	> cd react-youtube-search-api
	> npm install
	> npm start
```
