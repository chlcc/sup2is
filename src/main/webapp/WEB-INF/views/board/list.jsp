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
            <h2>Board</h2>
        <div class="btnBox">
			<button type="button" id="newBtn"><i class="fa fa-pencil"></i>New</button>
			<button type="button" id="searchBtn"><i class="fa fa-search" ></i>Search</button>
			<select>
				<option value="n"<c:out value="${cri.searchType == null ?'selected':''}"/>> ---- </option>
				<option value="t"<c:out value="${cri.searchType eq 't' ?'selected':''}"/>> Title </option>
				<option value="w"<c:out value="${cri.searchType eq 'w' ?'selected':''}"/>> Writer </option>
				<option value="c"<c:out value="${cri.searchType eq 'c' ?'selected':''}"/>> Content </option>
			</select>
			<input type="text" id="inputKeyword">
        </div>
	    <table class="list">
			<tr>
			    <th scope="row" style="width:30px">NO</th>
			    <th scope="row" style="width:600px">Title</th>
			    <th scope="row">Writer</th>
			    <th scope="row">Date</th>
			    <th scope="row">View</th>
			</tr>
			<c:forEach items="${list}" var="vo">
				<tr>
					<th scope="row">${vo.bno}</th>
					<td><a href="/board/read${pageMaker.makeSearch(cri.page)}&bno=${vo.bno}">${vo.title}</a></td>
					<td>${vo.writer}</td>
					<td><fmt:formatDate value="${vo.regdate}" pattern="YYYY/MM/dd"/></td>
					<td>${vo.viewcnt}</td>
				</tr>
			</c:forEach>
		</table>
		<div class="pageBtn">
			<ul>
				<c:if test="${pageMaker.prev}">
					<li><a href="list${pageMaker.makeSearch(pageMaker.startPage-1)}">&laquo;</a></li>		
				</c:if>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx" >
				<li id="pageIdx">
					<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li>
					<a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}" style="display: block">&raquo;</a>
				</li>
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
   			
   			$("#searchBtn").click(function () {
   				self.location ="list" + 
	   				"${pageMaker.makeQuery(1)}" +  
	   				"&searchType=" +
	   				$('select option:selected').val() + 
	   				"&keyword=" + 
	   				encodeURIComponent($('#inputKeyword').val());
	   				
   			});
   		});
   </script>

</body>
</html>