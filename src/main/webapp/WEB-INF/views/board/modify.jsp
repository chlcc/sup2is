<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>sup2is : board</title>
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
            <h2>Board : Modify</h2>
			<form role="form" method="post">
				<input type="hidden" name="bno" value="${vo.bno}">
				<input type="hidden" name="page" value="${cri.page}">
				<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
				<input type="hidden" name="keyword" value="${cri.keyword}">
				<input type="hidden" name="searchType" value="${cri.searchType}">
			
	 			<div class="inputText">
	 				<label for="writer">Writer<i class="fa fa-user"></i></label><br>
	 				<input type="text" id="writer" name="writer" placeholder="${vo.writer}" autocomplete="off" required="required">
	 			</div>
	 			<div class="inputText">
	 				<label for="title">Title<i class="fa fa-comment"></i></label><br>
	 				<input type="text" id="title" name="title" placeholder="${vo.title}"  autocomplete="off" required="required">
	 			</div>
	 			<div class="inputText">
	 				<label for="content">Content<i class="fa fa-comments"></i></label><br>
	 				<textarea rows="10" cols="40" id="content" name="content" placeholder="${vo.content}" required="required"></textarea>
	 			</div>
	 			<div class="btnBox">
	 				<button type="submit" id="modBtn">Submit</button>
	 				<button type="button" id="listBtn">List</button>
	 			</div>
	   		</form>
        </section>
   </main>
   
   <script src="//code.jquery.com/jquery.min.js"></script>
   <script type="text/javascript">
   		$(document).ready(function () {
 
   			var formObj = $("form[role='form']");
   			
   			$("#modBtn").click(function () {
   				formObj.attr("action" , "modify");
   				formObj.submit();
   			});
   	
   			$("#listBtn").click(function () {
   				formObj.attr("method" , "get");
   				formObj.attr("action" , "list");
   				formObj.submit();
   			}); 
   		});
   </script>

</body>
</html>