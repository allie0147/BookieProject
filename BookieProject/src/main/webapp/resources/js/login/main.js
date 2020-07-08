/*비밀번호 찾기 팝업(login.jsp)*/
function popupPassword(){
	let url = "/login/find-password"; 
	let name = "find password";
	window.open(url, name, "scrollbars=no,width=500,height=300,menubar=false");
	// window.open(URL,"팝업 구분값(팝업 1개일 경우 상관없음)","팝업 창 옵션")
}

/*이메일 찾기 팝업(login.jsp)*/
function popupEmail(){
	let url = "/login/find-email";
	let name = "find email";
	window.open(url, name, "scrollbars=no,width=500,height=300,menubar=false");
}

/*핸드폰 번호 유효성 검사(ckPhone.jsp)*/
$(function(){
	$("#ckPhoneFormSubmit").click(function(){
		let phoneCheck = RegExp(/^(01[016789]{1})(\d{3,4})(\d{4})$/);
		let phone = $('input[name=phone]').val().replace(/-/gi, '');
		
		if(phone == ""){
			alert("핸드폰 번호를 입력해주세요.");
		} else if (phoneCheck.test(phone) == false) {
			alert('핸드폰 번호 양식을 확인해주세요');
		} else if(phone.length < 10 || phone.length > 11){ 
			alert("핸드폰 번호를 확인해주세요.");
		} else { 
			phone = phone.replace(/[^0-9]/g, "").replace(/(^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--", "-");

			$.ajax({
				url:"/login/ckPhone",
				type:"post",
				data:{
					"phone":phone
				},
				success:function(data){
//					console.log("ajax result : "+data);
//					console.dir(data);
					
					if(data == "" || data.length == 0){
						alert("해당하는 회원정보가 존재하지 않습니다.");
					}else{
						var conf = window.confirm("해당하는 번호로 인증 문자를 보냅니다.");
						if(conf){
							location.href="/login/phoneCkForEmail?uId="+data.id;
						}
					}
					return false;
				}
			});
		}
	});
});

/*인증 문자메세지가 발송된 상태에서 새로고침시 경고(certifForm.jsp) */
function showNoticeRefresh(){
	
	console.log("돌아가시겠습니까? 새로운 인증이 요구됩니다.");
	let conf = confirm("돌아가시겠습니까? 새로운 인증이 요구됩니다.");
	if(conf){
		history.back();
	}else{
		return false;
	}
	
	return "돌아가시겠습니까?";
}

/* 문자로 보낸 인증메세지 일치 여부 확인 기능(certifForm.jsp) */
function certif(certifVal){
	let certifNum = $("input[name=certifNum]").val();
	let uId = $("input[name=uId]").val();
	console.log("certifVal", certifVal);
//	console.log("certifNum", certifNum);
//	console.log("uId", uId);
	
	if(certifVal == certifNum){
		alert("인증되었습니다.");
		opener.location.href="/login/getEmail?uId="+uId;
		window.onbeforeunload = null;
		close();
	}else{
		alert("인증번호가 틀렸습니다.");
	}	
}

$(function() {
	$("input[class=form-control]").on({
		"focus" : function() {
			$(this).css({
				"border-color" : "#28a745",
				"box-shadow" : "0 0 0 0.2rem rgba(40, 167, 69, 0.25)"
			});
		},
		"blur" : function() {
			$(this).css({
				"border-color" : "",
				"box-shadow" : ""
			});
		}
	});
});

$(function() {
	$("#signup").click(function() {
		location.href = "/userForm";
	})
});