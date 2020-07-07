function popup(){                 // 전송 파라미터 값
	    let url = "/login/find-password"; // 전송 URL
	    let name ="find password";
	    window.open(url, name, "scrollbars=no,width=500,height=300,menubar=false");
	    // window.open(URL,"팝업 구분값(팝업 1개일 경우 상관없음)","팝업 창 옵션")
}

$(function() {
	$(".error").hide();
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

// 틀린 정보에 리포커스
function submitFuc(inputClass) {
	inputClass.focus();
}

$(function() {
	$("#signup").click(function() {
		location.href = "/userForm";
	})
});

// 이메일, 패스워드 체크 값
let boolChk = false;

$(function() {
	$("form").submit(
			function() {
				let u_email = $('input[name=uEmail]').val();
				let pwd = $('input[name=uPwd]').val();
				console.log(u_email);
				console.log(pwd);
				$.ajax({
					url : "/loginChk",
					type : "post",
					data : {
						'uEmail' : u_email,
						'uPwd' : pwd
					},
					success : function(data) {
						if (data == 1) {
							console.log(data);
							$('#error02').hide();
							boolChk = true;
							alert(data + "  " + boolChk);
							console.log("form submit : " + boolChk);
							if (boolChk == false) {
								console.log("if false: " + boolChk);
								$('#error02').text('이메일 또는 비밀번호를 확인하세요.').css(
										"display", "inline-block").css("color",
										"#ff070b").css("font-size", "small").css(
										'font-weight', 'bold');
								return false;
							} else {
								console.log("else true: " + boolChk);
								location.replace("/");
							}
						} else {
							$('#error02').text('이메일 또는 비밀번호를 확인하세요.').css(
									"display", "inline-block").css("color",
									"#ff070b").css("font-size", "small").css(
									'font-weight', 'bold');
						}
					},
					error : function() {
						$('#error02').text('이메일 또는 비밀번호를 확인하세요.').css(
								"display", "inline-block").css("color",
								"#ff070b").css("font-size", "small").css(
								'font-weight', 'bold');
						return false;
					}
				}); // ajax end
			});
});