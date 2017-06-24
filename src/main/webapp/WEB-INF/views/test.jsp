<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#modDiv {
		width: 300px;
		height: 100px;
		background: #eee;
		position: absolute;
		top: 50%;
		left: 50%;
		margin-top: -50px;
		margin-left: -150px;
		padding: 10px;
		z-index: 1;  
		display: none;
	}
</style>
</head>
<body>

<h1> Ajax Test Page</h1>

<div>
	<div>
		Replyer <input type="text"  name="replyer" id="newReplyer">
	</div>
	<div>
		Replytext <input type="text" name="replytext" id="newReplytext">
	</div>
	<button id="btn">add</button>  
</div>

<div id="modDiv">
	<div class="modal_title"></div>
	<div>
		<input type="text" id="replytext">
	</div>
	<div>
		<button type="button" id="replyModBtn">mod</button>
		<button type="button" id="replyDelBtn">del</button>
		<button type="button" id="closeBtn">close</button>
	</div>
</div>

<ul id="replies">
	
</ul>

<ul class="pagination">
</ul>

<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		var bno = 2;
		var replyer;
		var replytext;
		//getAllList(); 
		getListPage(1);
		
		
	
		
		function getAllList() {
			$.getJSON("replies/all/" + bno , function (data) {
				console.log(data.length);
				var str = "";
				
				$(data).each(function () {
					str += "<li data-rno='" + this.rno + "'class='replyLi'>" + this.rno + ":" + this.replytext + "<button>MOD</button></li>";
					/* str += "<li data-rno='" + this.rno + "'class='replyLi'>" + this.rno + ":" + this.replytext + "</li>"; */
				});
				
				$("#replies").html(str);
			});
		//getAllList();
		}
		
		function getListPage(page) {
			$.getJSON("replies/" + bno + "/" + page , function (data) {
				console.log(data.list.length);
				var str = "";
				
				$(data.list).each(function() {
					str += "<li data-rno='"+this.rno+"' class='replyLi'>" +this.rno + ":" + this.replytext + "<button>MOD</button></li>";
					
				});
				
				$("#replies").html(str);
				printPaging(data.pageMaker);
				
			});
		}
		function printPaging(pageMaker) {
			
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
			$(".pagination").html(str);
		}
		
		$(".pagination").on("click" , "li a" ,function (e) {
			e.preventDefault();
			
			replyPage = $(this).attr("href");
			console.log(replyPage);
			getListPage(replyPage);
			
		});
		
		
		$("#replies").on("click", ".replyLi button" , function () {
			var reply = $(this).parent();
			console.log("reply :" + $(this));
			
			var rno = reply.attr("data-rno");
			var replytext = reply.text();
			
			$(".modal_title").html(rno);
			$("#replytext").val(replytext);
			$("#modDiv").show(1000);
			$("#closeBtn").click(function () {
				$("#modDiv").hide(1000);
			});
			
			$("#replyModBtn").click(function () {
				var modReply = $("#replytext").val();
				
				$.ajax({
					type : 'put',
					url : '/replies/' + rno,
					headers : {
						"Content-Type": "application/json",
						"X-HTTP-Method-Override" : "PUT"
					},
					dataType : 'text',
					data : JSON.stringify({
						replytext : modReply
					}),
					success : function (result) {
						
						if(result == 'SUCCESS') {
							alert("수정");
							getAllList();
						}
					}
					
				//.ajax
				});
			});
			$("#replyDelBtn").click(function () {
				
				$.ajax({
					type : 'delete',
					url : '/replies/' + rno,
					headers : {
						"Content-Type": "application/json",
						"X-HTTP-Method-Override" : "DELETE"
					},
					dataType : 'text',
					success : function (result) {
						
						if(result == 'SUCCESS') {
							alert("삭제");
							$("#modDiv").hide(1000);
							getAllList();
						}
					}
					
				//.ajax
				});
			});
		});
		
		
		
		
		$("#btn").click(function () {
			replyer = $("#newReplyer").val();
			replytext = $("#newReplytext").val();
			
			$.ajax({
				type : 'post',
				url : '/replies',
				headers : {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					bno : bno,
					replyer : replyer,
					replytext : replytext
				}),
				success : function (result) {
					
					if(result == 'SUCCESS') {
						alert("등록");
						getAllList();
					}
				}
				
			//.ajax
			});
		//#btn click
		});
		
	//document.ready
	});


</script>

</body>
</html>