$(function() {
	// 회원 탈퇴
	$("form[name=unsubscribe]").on("submit", function() {
		const email = document.getElementById('user').innerText;
		const uPwd = document.getElementById('password').value;
		console.log(email);
		console.log(uPwd);
		if (uPwd != "") {
			if (confirm("정말 탙퇴하시겠습니까?")) {
				$.ajax({
					url : "/mypage/unsubscribe",
					type : "post",
					data : {
						"uEmail" : email,
						"pwd" : uPwd
					},
					success : function(e) {
						console.log(e);
						if (e == "true") {
							alert("탈퇴 되었습니다.");
							window.location.replace("/logout");
						} else {
							alert("오류가 발생했습니다. 재시도 해주세요.");
							return false;
						}
					},
					error : function(e) {
						alert(e);
						console.log(e);
						alert("오류가 발생했습니다. 재시도 해주세요.");
						return false;
					}
				});// ajax end
				return false;
			} else {
				alert("오류가 발생했습니다. 재시도 해주세요.");
				return false;
			}
		} else {
			alert("비밀번호를 입력하세요");
			return false;
		}
	});
});