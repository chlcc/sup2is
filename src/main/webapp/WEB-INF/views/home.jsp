<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>sup2is : main</title>
    <link rel="stylesheet" href="/resources/css/normalize.css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
   <!--header-->
   <header>
       <h1>sup2's portfolio</h1>
       <nav class="sub">
           <h2 class="blind">서브메뉴</h2>
           <ul>
               <li><a href="#"><i class="fa fa-sign-in"></i><span class="blind">login</span></a></li>
               <li><a href="#"><i class="fa fa-user-plus"></i><span class="blind">join us</span></a></li>
           </ul>
       </nav>
   </header>
   
   <!--aside-->
  <aside>
       <nav class="gnb">
          <h2 class="blind">주메뉴</h2>
           <ul>    
          	   <li><a href="/"><i class="fa fa-home"></i><span>Main</span></a></li>
               <li><a href="/board/list"><i class="fa fa-book"></i><span>Board</span></a></li>
               <li><a href="#"><i class="fa fa-picture-o"></i><span>Gallery</span></a></li>
               <li><a href="https://github.com/chlcc/sup2is" target="_blank"><i class="fa fa-github"></i><span>Github</span></a></li>
           </ul>
       </nav>
   </aside>
   
   
   <main class="content">
        <section>
            <h2>Main</h2>
            <h3>About</h3>
            <p>
            	개발환경 : JDK1.8/Spring Tool Suite 3.8.3.RELEASE/Mybatis/Apache Tomcat 8.0/MySQL/웹호스팅 : cafe24 <br>
            	개발기간 : 2017/6/5 ~ ing
            </p>
            <h3>Skills</h3>
            <p>
               	HTML5 & CSS3 , Javascript & JQuery , JAVA , Spring Framework , JSP , Mybatis
            </p>
            <h3>Introduce</h3>
            <p>
            	Spring framework MVC기반으로 작성한 게시판CRUD, 검색기능 , Ajax를 활용한 댓글CRUD 기능을 가지고 있는 게시판 포트폴리오입니다. <br>
        		소스코드는 좌측 Github에서 확인하실수 있습니다.<br>
            </p>
            <h3>Process</h3>
           	<ul>
				<li>
			 		- 2016.10 ~ 2017.02 (국비지원)웹모바일 응용소프트웨어 프로그래머 양성과정
				</li>
				<li>
					- 2017.05 ~ 2017.06 HTML5 & CSS3 웹표준 코딩
				</li>
				<li>
					- 2017.05 ~ 2017.06 JQuery
				</li>
				<li>
					- 2017 05 ~ 정보처리 산업기사 준비중
				</li>
				<li>
					- 2018 학점은행제 4년제 컴퓨터공학사 예정
				</li>
           	</ul>
        
            
        </section>
   </main>

</body>
</html>