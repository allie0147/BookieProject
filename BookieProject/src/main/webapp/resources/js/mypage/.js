$(function() {
	// 회원 탈퇴
	$("#unsubscribe").on("click", function() {
		const email = document.getElementById('user').innerText;
		if (confirm("정말 탙퇴하시겠습니까?")) {
			$.ajax({
				url : "/mypage/delete",
				type : "post",
				data : {
					"uEmail" : email
				},
				success : function(bool) {
					if (bool == "true") {
						alert("탈퇴 되었습니다.");
						location.replace("/logout");
					} else {
						alert("오류가 발생했습니다. 재시도 해주세요.");
						return false;
					}
				},
				error : function() {
					alert("오류가 발생했습니다. 재시도 해주세요.");
					return false;
				}
			});
		} else {
			return false;
		}
	});
});