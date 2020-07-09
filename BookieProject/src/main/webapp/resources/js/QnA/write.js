$(function() {
	$("form").on("submit", function() {

		let formData = $("form").eq(1).serialize();
		let title = document.getElementsByName("title")[0].value;
		let genre = document.getElementsByName("genre")[0].value;

		if (title != "" && genre != 0) {
			$.ajax({
				url : "/qna/write",
				type : "post",
				data : formData,
				dataType : "json",
				success : function(data) {
					alert("작성 되었습니다.");
					window.location.replace("/qna/detail?b=" + data);
				},
				error : function() {
					alert("글 작성에 실패 했습니다.");
				}
			}); //ajax end
			return false;
		} else {
			alert("내용 또는 장르를 선택하세요");
		}
	});
});