<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/totalCss.css">
<link rel="stylesheet" href="/resources/css/mainview/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	.findPassword{
		margin-top:100px;
		text-align: center;
	}
	
	.findPasswordResult{
		border-radius: 6px;
		padding:10px auto 10px auto;
		background: white;
	}
</style>
<script type="text/javascript">
	$(function(){
		$("button").on("click", function(){
			console.log("button click!");
			
			let email = document.getElementById("email").value; //document.getElementById("email");
			//var formData = new FormData();
			//formData.append("email", emailValue);
			
			console.log("email", email);
			
			$.ajax({
				url:"/checkEmail",
				type:"post",
				data:{"email":email},
				success:function(data){
					console.dir(data); //user의 id(long)를 String타입으로 받아오기
					if(data != null){
						//location.href="/EmailCkForPwd?uId="+data.getId();
						//opener.location.reload(true);
						//호출 페이지에서 파라미터 값을 가지고 페이지 전환
						//EmailCkForPwd로 갔다가 컨트롤러에 의해 처리되고 return값으로 login페이지
						window.alert("해당 메일로 인증 메일이 전송됩니다.");
						opener.location.href="/EmailCkForPwd?uId="+data;
						close();
					}else{
						alert("존재하지 않는 이메일입니다.");
					}
					return false;
				}
			});
		});
	});
</script>

</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <p class="navbar-brand">BooKie</p>
	    </div>
	  </div>
	</nav>
	
	<div class="findPassword">
		<label for="email">이메일을 입력해주세요.</label><br>
		<input type="text" name="uEmail" id="email"/>
		<button>확인</button>
	</div>
</body>
</html>