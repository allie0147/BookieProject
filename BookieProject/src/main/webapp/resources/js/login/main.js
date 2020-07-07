function popup(){                 // 전송 파라미터 값
	    let url = "/login/find-password"; // 전송 URL
	    let name ="find password";
	    window.open(url, name, "scrollbars=no,width=500,height=300,menubar=false");
	    // window.open(URL,"팝업 구분값(팝업 1개일 경우 상관없음)","팝업 창 옵션")
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