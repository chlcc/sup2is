<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>sup2is : board</title>
    <link rel="stylesheet" href="/resources/css/normalize.css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    
    <style type="text/css">
    	    table.list {
			border-collapse: separate;
			border-spacing: 1px;
			text-align: left;
			line-height: 1.5;
			border-top: 1px solid #ccc;
			margin : 20px 10px;
            width: 100%;
            text-align: center;
		}
		tr:hover {
            background-color: #eee;
        }
		table.list th {
			padding: 10px;
			font-weight: bold;
			vertical-align: top;
			border-bottom: 1px solid #ccc;
		}
		table.list th:nth-child(2), table.list td:nth-child(2){
			text-align: left;
		}
		table.list td {
			padding: 10px;
			vertical-align: top;
			border-bottom: 1px solid #ccc;
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
        .pageBtn {
            border: 1px solid black;
            width: 100%;
            text-align: center;
        }
        .pageBtn li {
            display: inline-block;
            padding: 3px;
            margin: 0;
            border: 1px solid black; 
        }
        .pageBtn li a {
            display: block;
            color: #222;
        }
        .pageBtn li a:visited {
        	color: #aaa;
        	
        }
        .pageBtn li a:focus { 
			color: red;
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
               <li><a href="/"><i class="fa fa-home"></i>Main</a></li>
               <li><a href="/board/listCri"><i class="fa fa-book"></i>Board</a></li>
               <li><a href="#"><i class="fa fa-picture-o"></i>Galley</a></li>
               <li><a href="#"><i class="fa fa-github"></i>GitHub</a></li>
           </ul>
       </nav>
   </aside>
   
   
   <main class="content">
        <section>
            <h2>Board</h2>
        <div class="btnBox">
			<button type="button" id="newBtn"><i class="fa fa-pencil"></i>New Board</button>
			<button type="button" id="searchBtn"><i class="fa fa-search" ></i>Search</button>
			<select>
				<option value="n"<c:out value="${cri.searchType == null ?'selected':''}"/>> ---- </option>
				<option value="t"<c:out value="${cri.searchType eq 't' ?'selected':''}"/>> Title </option>
				<option value="w"<c:out value="${cri.searchType eq 'w' ?'selected':''}"/>> Writer </option>
				<option value="c"<c:out value="${cri.searchType eq 'c' ?'selected':''}"/>> Content </option>
			</select>
		
			<input type="text" id="inputText">
        </div>
	    <table class="list">
			<tr>
			    <th scope="row" style="width: 100px">글번호</th>
			    <th scope="row" style="width:600px">내용</th>
			    <th scope="row" style="width: 100px">작성자</th>
			    <th scope="row">작성일</th>
			    <th scope="row">조회수</th>
			</tr>
			<c:forEach items="${list}" var="vo">
				<tr>
					<th scope="row">${vo.bno}</th>
					<td><a href="/board/read?bno=${vo.bno}&page=${cri.page}&perPageNum=${cri.perPageNum}">${vo.title}</a></td>
					<td>${vo.writer}</td>
					<td><fmt:formatDate value="${vo.regdate}" pattern="YYYY/MM/dd (E)"/></td>
					<td>${vo.viewcnt}</td>
				</tr>
			</c:forEach>
		</table>
		<div class="pageBtn">
			<ul>
				<c:if test="${pageMaker.prev}">
					<li><a href="listCri?page=${pageMaker.startPage-1}&perPageNum=${cri.perPageNum}">&laquo;</a></li>		
				</c:if>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx" >
				<li id="pageIdx">
					<a href="listCri?page=${idx}&perPageNum=${cri.perPageNum}">${idx}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a href="listCri?page=${pageMaker.endPage +1}&perPageNum=${cri.perPageNum}" style="display: block">&raquo;</a>
			</c:if>
					
			</ul>
			
		</div>
        </section>
   </main>
   <script src="//code.jquery.com/jquery.min.js"></script>
   <script type="text/javascript">
   		$(document).ready(function () {
   			
   			
   			$("#newBtn").click(function () {
   				self.location = "regist";
   			});
   		});
   </script>

</body>
</html>