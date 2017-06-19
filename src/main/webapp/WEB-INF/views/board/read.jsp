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
    
    <style type="text/css">
    
       .inputBox {
            border: 1px solid black;
        }
        .inputText {
            margin-bottom: 15px;
        }
        .inputText input ,.inputText textarea {
            background-color: #eee;
            line-height: 30px;
            font-size: 1.3em;
            border-radius: 2px;
            transition: all .5s;
            width: 90%;
            padding: 5px;
        }
        label { 
        	font-size: 1.2em;
        }
        form i {
        	margin-left: 5px;
        }
   	    .btnBox button{
            width: 100px;
            line-height: 30px;
            border-radius: 3px;
            background-color: #fff;
            color: #aaa;
        }
        .btnBox button:hover {
            background-color: #eee;
        }
    </style>
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
               <li><a href="#"><i class="fa fa-github"></i><span>Github</span></a></li>
           </ul>
       </nav>
   </aside>
   
   
   <main class="content">
        <section>
            <h2>Board : read</h2>
			<form role="form" method="post">
				<input type="hidden" name="bno" value="${vo.bno}">
				<input type="hidden" name="page" value="${cri.page}">
				<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
				<input type="hidden" name="keyword" value="${cri.keyword}">
				<input type="hidden" name="searchType" value="${cri.searchType}">
			
	 			<div class="inputText">
	 				<label for="writer">Writer<i class="fa fa-user"></i></label><br>
	 				<input type="text" id="writer" name="writer" value="${vo.writer}" readonly="readonly">
	 			</div>
	 			<div class="inputText">
	 				<label for="title">Title<i class="fa fa-comment"></i></label><br>
	 				<input type="text" id="title" name="title" value="${vo.title}" readonly="readonly">
	 			</div>
	 			<div class="inputText">
	 				<label for="content">Content<i class="fa fa-comments"></i></label><br>
	 				<textarea rows="10" cols="40" id="content" name="content" readonly="readonly">${vo.content}</textarea>
	 			</div>
	 			<div class="btnBox">
	 				<button type="button" id="modBtn">Modify</button>
	 				<button type="button" id="delBtn">Delete</button>
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
   				formObj.attr("method" , "get");
   				formObj.submit();
   			});
   			
   			$("#delBtn").click(function () {
   				formObj.attr("action" , "delete");
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