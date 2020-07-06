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

$(function resetPwd(){
	$("#submit").on("click", function(){
		let pwd = $("input[name=uPwd]").eq(0).val();
		let ckPwd = $("input[name=uPwdCheck]").eq(0).val();
		
		if(pwd == ckPwd){
            let num = pwd.search(/[0-9]/g);
            let eng = pwd.search(/[a-z]/ig);
            let spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
            let pwdCheck = RegExp(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/);
             
            if (pwdCheck.test(pwd) == true) {
                let conf = confirm("비밀번호를 수정하시겠습니까?");
                if(conf){
	                let formData = $("form").eq(0).serialize();
						
	    			$.ajax({
	    				url:"/resetPwdinDb",
	    				type:"post",
	    				data:formData,
	    				success:function(){
	    					alert("비밀번호가 변경되었습니다.");
	    					location.href="/";
	    				}
	    			}); 
                }else{
//					alert("비밀번호 변경이 취소되었습니다.");
					return false;
				}
             } else if (pwd == "") {
                 alert('비밀번호를 입력해주세요');
             } else if (pwd.length > 17||pwd.length < 8) {
                alert('최소 8자리 이상 16자리 이하의 비밀번호를 입력하세요');
             }
		}else {
			alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		}
		return false;
	});
});
