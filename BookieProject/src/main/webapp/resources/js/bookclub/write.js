$(function() {
	$('.black-box').hide();
	$('.loader').hide();

	// 작성
	$("button[type=submit]").on("click", function() {
		$('.black-box').show();
		$('.loader').show();
		let formData = $("form").eq(1).serialize();
		let title = document.getElementsByName("title")[0].value;
		if (title != "") {
			$.ajax({
				url : "/club/write",
				type : "post",
				data : formData,
				dataType : "json",
				success : function(data) {
					console.log("받아온 데이터 : "+data);
					$('.black-box').hide();
					$('.loader').hide();
					alert("작성 되었습니다.");
					window.location.replace("/club/detail?b=" + data);
				},
				error : function() {
					$('.loader').hide();
					$('.black-box').hide();
					alert("글 작성에 실패 했습니다.");
					return false;
				}
			}); // ajax end
			return false;
		} else if (title == "") {
			$('.loader').hide();
			$('.black-box').hide();
			alert("제목을 입력하세요");
			return false;
		}
	});
	// 수정
	$("button[name=editButton]").on('click', function() {
		$('.black-box').show();
		$('.loader').show();
		const boardId = document.getElementById('board_id').value;
		const title = document.getElementsByName('title')[0].value;
//		summernote content 가져 오는 방법 
		const content = $('#summernote').summernote('code');
		console.log(content);
		if (title != "" && content != "") {
			$.ajax({
				url : "/club/write/edit?b=" + boardId,
				type : "post",
				data : {
					"title" : title,
					"content" : content
				},
				success : function(board) {
					$('.loader').hide();
					$('.black-box').hide();
					alert('수정 되었습니다!');
					window.location.replace('/club/detail?b=' + board);
				},
				error : function() {
					$('.loader').hide();
					$('.black-box').hide();
					alert('수정 실패 했습니다.');
					return false;
				}
			}); // ajax end
		} else {
			$('.loader').hide();
			$('.black-box').hide();
			alert("내용 또는 제목을 입력하세요.");
			return false;
		}
	});
});