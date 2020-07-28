$(function() {
	$('.black_box').hide();
	$('.loader_card').hide();

//	개인 유저 북마크 체크
	let bookmark = document.getElementById("bmList").innerText;
    bookmark = bookmark.substring(1, bookmark.length - 1);
    const bookmarkList = bookmark.split(", ");
    console.dir(bookmarkList);
	let boardIdList = document.querySelectorAll(".board_id");
	console.dir(boardIdList);
	for (let i = 0; i < bookmarkList.length; i++) {
		for (let j = 0; j < boardIdList.length; j++) {
			if (bookmarkList[i] == boardIdList[j].innerText) {
				$(boardIdList[j]).next().addClass("bookmarked");
			}
		}
	}
	
	var click = true;
	// write
	$('.write-button')
			.on(
					"click",
					function() {
						const cardForm = '<div class="write_div container"><a class="exit_reg"><span class="glyphicon glyphicon-remove"></span></a><form name="write_card"><textarea autofocus="autofocus" maxlength="111" rows="1" placeholder="나만의 글귀를 작성해보세요" name="content" id="textarea" style="resize:none;height: 40px;width: 40%;"></textarea><span id="counter">###</span><input class="btn btn-default submit_card" type="submit" value="등록"/></form></div>';
						if (click == true) {
							$('#wrapBtn').after(cardForm);
							$('#textarea').on("keyup", function() {
								var content = $(this).val();
								$('#counter').html(content.length + '/111');
							});
							$('#textarea').keyup();
							click == false;
						} else {
							$('.write_div').remove();
							click == true;
						}
						$('form[name=write_card]').on("submit", function() {
							$('.black_box').show();
							$('.loader_card').show();
							const userId = $('#id').text();
							const content = $('#textarea').val();
							alert("userId : " + userId);
							alert("content : " + content);
							$.ajax({
								url : "/bookcard/write",
								type : "post",
								data : {
									"userId" : userId,
									"content" : content
								},
								success : function(e) {
									if (e == "true") {
										$('.black_box').hide();
										$('.loader').hide();
										location.replace("/bookcard/main");
									} else {
										$('.black_box').hide();
										$('.loader_card_card').hide();
										alert("오류가 발생했습니다. 재시도 해주세요.");
										return false;
									}
								},
								error : function() {
									$('.black_box').hide();
									$('.loader_card').hide();
									alert("오류가 발생했습니다. 재시도 해주세요.");
									return false;
								}
							});
							return false;
						});
						$('.exit_reg').on("click", function() {
							$('.write_div').detach();
						});
					});
	// 수정
	$('.edit')
			.on(
					"click",
					function() {
						$('.black_box').show();
						const div = $(this).parent().next();
						const inner = div.text();
						const div_form = '<div class="div_edit"><a class="exit"><span class="glyphicon glyphicon-remove"></span></a><form name="edit_card"><textarea autofocus="autofocus" maxlength="111" rows="1" name="content" id="textarea_edit">'
								+ inner
								+ '</textarea><span id="counter" style="float: right;">###</span><input class="btn btn-default submit_card" type="submit" value="수정"/></form></div>';
						$('.black_box').after(div_form);
						$('#textarea_edit').on("keyup", function() {
							var content = $(this).val();
							$('#counter').html(content.length + '/111');
						});
						$('#textarea_edit').keyup();

						$('form[name=edit_card]').on("submit", function() {
							console.log($(this));
							$('.loader').show();
							const content = $('#textarea_edit').val();
							const id = div.prev().children(1).text();
							$.ajax({
								url : "/bookcard/edit",
								type : "post",
								data : {
									"id" : id,
									"content" : content
								},
								success : function(e) {
									if (e == "true") {
										$('.div_edit').remove();
										$('.black_box').hide();
										$('.loader').hide();
										console.log(content);
										div.text(content);
										alert('수정 되었습니다!');
									} else {
										$('.loader').hide();
										alert("오류가 발생했습니다. 재시도 해주세요.");
										return false;
									}
								},
								error : function() {
									$('.loader').hide();
									alert("오류가 발생했습니다. 재시도 해주세요.");
									return false;
								}
							});
							return false;
						});

						$('.exit').on("click", function() {
							$('.div_edit').detach();
							$('.black_box').hide();
						});
					});

	// 삭제
	$('.delete').on("click", function() {
		if (confirm("정말 삭제하시겠습니까?")) {
			$('.black_box').show();
			$('.loader').show();
			const id = $(this).parent().children(1).text();
			$.ajax({
				url : "/bookcard/delete",
				type : "post",
				data : {
					"id" : id,
				},
				success : function(e) {
					if (e == "true") {
						$('.black_box').hide();
						$('.loader').hide();
						alert('삭제 되었습니다!');
						location.replace("/bookcard/main");
					} else {
						$('.loader').hide();
						alert("오류가 발생했습니다. 재시도 해주세요.");
						return false;
					}
				},
				error : function() {
					$('.loader').hide();
					alert("오류가 발생했습니다. 재시도 해주세요.");
					return false;
				}
			}); // ajax end
			return false;
		} else {
			alert('취소 되었습니다.');
			return false;
		}
	});

	// 좋아요 기능, 북마크 기능: 로그인 전
	$('.any').on("click", function() {
		alert("로그인 후 이용하세요.");
		return false;
	});

	// 좋아요 기능: 로그인 후
	$('.heart_auth')
			.on(
					"click",
					function() {
						let like_dislike;
						const heart_count = $(this).next();
						const div = $(this).parent().parent();
						const id = div.siblings().eq(0).children(1).text();
						$(":first-child", $(this)).toggleClass(
								'glyphicon-heart');
						$(":first-child", $(this)).toggleClass(
								'glyphicon-heart-empty');

						if ($(":first-child", $(this)).hasClass(
								'glyphicon-heart')) {
							like_dislike = 'like';
						} else if ($(":first-child", $(this)).hasClass(
								'glyphicon-heart-empty')) {
							like_dislike = 'dislike';
						}
						$.ajax({
							url : "/bookcard/likes",
							type : "post",
							data : {
								"id" : id,
								"likeCnt" : like_dislike
							},
							success : function(like) {
								if (like === "-1") {
									alert("오류가 발생했습니다. 재시도 해주세요.");
									return false;
								} else {
									heart_count.text(like);
									return false;
								}
							},
							error : function() {
								alert("오류가 발생했습니다. 재시도 해주세요.");
								return false;
							}
						}); // ajax end
						return false;
					});
	// 북마크 기능: 로그인 후
	$('.bookmark_auth').on("click", function() {
		let chk;
		const boardId = $(this).parent().children('p').text();
		console.log(boardId);
		const userId = $("#id").text();
		console.log(userId);
		$(this).toggleClass("bookmarked");
		if ($(this).hasClass("bookmarked")) {
			chk = "added";
		} else {
			chk = "removed";
		}
		$.ajax({
			url : "/bookcard/bookmark",
			type : "post",
			data : {
				"boardId" : boardId,
				"userId" : userId,
				"chk" : chk
			},
			success : function(i) {
				if (i === "1") {
					alert("북마크 되었습니다.");
					return false;
				} else if (i === "0") {
					alert("북마크가 제거되었습니다.");
					return false;
				} else {
					alert("오류가 발생했습니다. 재시도 해주세요.");
					return false;
				}
			},
			error : function() {
				alert("에러");
				alert("오류가 발생했습니다. 재시도 해주세요.");
				return false;
			}
		}); // ajax end
		return false;
	});
	// 검색
	$("#bcbSearchSb").on("click", function() {
		let query = $("input[name=query]").val();
		if (query !== "") {
			location.href = "/bookcard/search?query=" + query;
		} else {
			alert("검색하고자 하는 내용 혹은 글쓴이를 입력하세요.");
		}
	});
});