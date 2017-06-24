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
        
        <!-- reply -->
        <section>
       	    <h2>Board : Reply</h2>
       	    <form >
	       	    <div class="inputText">
	 				<label for="replyer">Writer<i class="fa fa-user"></i></label><br>
	 				<input type="text" id="newReplyer" name="replyer" >
	 			</div>
	 			<div class="inputText">
	 				<label for="replytext">Reply Text<i class="fa fa-comment"></i></label><br>
	 				<input type="text" id="newReplytext" name="replytext" >
	 			</div>
	 			<div class="btnBox">
	 				<button type="button" id="addReply" >addReply</button>
 				</div>
 			</form>
 			
 			
 			<ul class="repliesList">
 			
 			</ul>
			<div class="pageBtn">
				<ul class="pagination">
				
				</ul>
			</div>
        </section>
   </main>
   <div id="mask"></div>
   <div class="modal">
   		<form>
   			<p class="modal-title blind"></p>
   		 	<div class="inputText">
 				<label for="replyer">Writer<i class="fa fa-user"></i></label><br>
 				<input type="text" id="modReplyer" name="replyer" >
 			</div>
 			<div class="inputText">
 				<label for="replytext">Reply Text<i class="fa fa-comment"></i></label><br>
 				<input type="text" id="modReplytext" name="replytext" >
 			</div>
		
 			<div class="btnBox">
				<button type="button" id="replyModBtn">Modify</button>
				<button type="button" id="replyDelBtn">Delete</button>
				<button type="button" id="closeBtn">Close</button>
			</div>
   		</form>		
   
   
   </div>
   
   <script src="//code.jquery.com/jquery.min.js"></script>
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

	<script>
		Handlebars.registerHelper("prettifyDate" , function(timeValue) {
			var dateObj = new Date(timeValue);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			return year + "/" + month + "/" + date;
		});
		
		var bno = ${vo.bno};
		var replyPage = 1;
		getPage("/replies/" + bno + "/" + replyPage);
		
		function getPage(pageInfo) {
			$.getJSON(pageInfo, function(data) {
				printData(data.list, $(".repliesList") , $("#template"));
				printPaging(data.pageMaker , $(".pagination"));
			});
		}
		/* replylist , 해당 요소가 들어갈 태그, 템플릿 */
		var printData = function (replyArr, target, templateObject){
			var template = Handlebars.compile(templateObject.html());
			var html = template(replyArr);
			
			$(".replyLi").remove();
			target.html(html);
		}
		
		/* 페이지 이동 */
		$(".pagination").on("click" , "li a" ,function (e) {
			
			e.preventDefault();
			
			var replyPage = $(this).attr("href");
			getPage("/replies/" + bno + "/" + replyPage);
			
		});
		/* 리플 추가 */
		$("#addReply").click(function () {
			var replyer = $("#newReplyer").val();
			var replytext = $("#newReplytext").val();

			if(replyer == null || replyer.trim().length == 0) {
				alert("작성자를 입력하세요");
				return; 
			}
			
			if(replytext == null || replytext.trim().length == 0) {
				alert("댓글 내용을 입력하세요");
				return; 
			}
			
			$.ajax({
				type : "post",
				url : "/replies",
				headers : {
					"Content-type" : "application/json" ,
					"X-HTTP-Method-Override" : "post"
				},
				dataType : 'text',
				data : JSON.stringify({
					bno : bno,
					replyer : replyer,
					replytext : replytext
				}),
				success : function (result) {
					if(result == "SUCCESS"){
						replyPage = 1;
						getPage("/replies/" + bno + "/" + replyPage);
						$("#newReplyer").val("");
						$("#newReplytext").val("");
					}
					 
				}
				
			/*$.ajax*/	
			});
		});
		
		/* modal 띄우기 */
	
		function modal() {

			var windowWidth = $(window).width();
			var windowHeight = $(window).height();
			$("#mask").css({width:windowWidth , height:windowHeight});
			$("#mask").fadeIn(500);
			$(".modal").stop().animate({top:"50%"} , 500);
			
			
			$("#mask , #closeBtn").click(function () {
				$(".modal").stop().animate({top:"-300px"} , 500);
				$("#mask").fadeOut(200);
			});
			
		}
		
		/* handlebars 에서 reply들의 정보를 넘겨줌 */
		$(".repliesList").on("click" , ".replyLi" , function () {
			
			var reply = $(this);
			$(".modal-title").html(reply.attr("data-rno"));
			$("#modReplytext").val(reply.find(".replyText").text());
			$("#modReplyer").val(reply.find(".replyer").text());
		});

		/* modal수정버튼 */
		$("#replyModBtn").on("click" , function () {
			
			var replyer = $("#modReplyer").val();
			var replytext = $("#modReplytext").val();
			var rno = $(".modal-title").html();
			
			$.ajax({
				type : "put",
				url : "/replies/" + rno,
				headers : {
					"Content-type" : "application/json",
					"X-HTTP-Method-Override" : "put"
				},
				dataType : 'text',
				data :JSON.stringify({
					replyer : replyer,
					replytext : replytext
				}),
				success : function (result) {
					
					$("#closeBtn").trigger('click');   
					getPage("/replies/" + bno + "/" + replyPage);
					$("#modReplyer").val("");
					$("#modReplytext").val("");
				}
				
				
			});
		}); 
		/* modal삭제버튼 */
		$("#replyDelBtn").on("click" , function () {

			var rno = $(".modal-title").html();
			
			$.ajax({
				type : "delete" ,
				url : "/replies/" + rno,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : "text",
				success : function (result) {

					$("#closeBtn").trigger('click');   
					getPage("/replies/" + bno + "/" + replyPage);
					
				}
			});
			
			
		});
		
 
		
		/* pageMaker를 이용한 page뿌리기 */
		var printPaging = function(pageMaker, target) {
			
			var str = "";
			
			if(pageMaker.prev) {
				str += "<li><a href='"+ (pageMaker.startPage - 1) +"'> << </a></li>";
			}
			
			for(i = pageMaker.startPage , len = pageMaker.endPage ; i <= len ; i ++) {
				var strClass = pageMaker.cri.page == i ? 'class=active' : '';
				str += "<li "+strClass+"><a href='"+ i +"'> " + i +"</a></li>";
			}
			
			if(pageMaker.next){
				str += "<li><a href='"+ (pageMaker.endPage + 1) +"'> >> </a></li>";
			}
			target.html(str);
			
		}
	
	</script>
   <script id="template" type="text/x-handlebars-template">
   {{#each.}}
   <li class="replyLi" data-rno={{rno}}>
 	  <div class="repliesBox">
 		  <span class="replyTime">
 			  <i class="fa fa-clock-o"></i> {{prettifyDate regdate}}
 		  </span>
 		  <h3>
  			  <i class="fa fa-comment"></i><strong>{{rno}}</strong> - <span class="replyer">{{replyer}}</span>
		  </h3>
		  <div class="replyText">{{replytext}}</div>
	      <button onclick="modal()">Modify</button>

  	  </div> 
    </li>
    {{/each}}
	</script>
	
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
   			
   			$("#modal").click(function (e) {
   				console.log($(this) + "Ddfasdf");
   			});
   			
   		});
   </script>
	

</body>
</html>