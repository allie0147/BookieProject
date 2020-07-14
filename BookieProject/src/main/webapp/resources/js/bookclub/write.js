$(function() {
	// 작성
	$("form").on("submit", function() {
		let formData = $("form").eq(1).serialize();
		let title = document.getElementsByName("title")[0].value;
		let genre = document.getElementsByName("genre")[0].value;
		if (title != "" && genre != 0) {
			$('button[name=submitButton]').css({'opacity':'0.3','pointer-events':'none'});
			$.ajax({
				url : "/club/write",
				type : "post",
				data : formData,
				dataType : "json",
				success : function(data) {
					alert("작성 되었습니다.");
					window.location.replace("/club/detail?b=" + data);
				},
				error : function() {
					alert("글 작성에 실패 했습니다.");
					return false;
				}
			}); // ajax end
			return false;
		} else if (title == "") {
			alert("제목을 입력하세요");
			return false;
		} else if (genre == 0) {
			alert("장르를 선택하세요");
			return false;
		}
	});
	// 수정
	$("button[name=editButton]").on('click', function() {
		const boardId = document.getElementById('board_id').value;
		const title = document.getElementsByName('title')[0].value;
		const genre = document.getElementsByName("genre")[0].value;
//		summernote content 가져 오는 방법 
		const content = $('#summernote').summernote('code');
		console.log(content);
		if (title != "" && content != "" && genre != 0) {
			$(this).css({'opacity':'0.3','pointer-events':'none'});
			$.ajax({
				url : "/club/write/edit?b=" + boardId,
				type : "post",
				data : {
					"title" : title,
					"content" : content
				},
				success : function(board) {
					alert('수정 되었습니다!');
					window.location.replace('/club/detail?b=' + board);
				},
				error : function() {
					alert('수정 실패 했습니다.');
					return false;
				}
			}); // ajax end
		} else if (genre == 0) {
			alert('장르를 선택하세요.');
			return false;
		} else {
			alert("내용 또는 제목을 입력하세요.");
			return false;
		}
	});
});