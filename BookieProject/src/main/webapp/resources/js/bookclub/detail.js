$(function () {
	// comment작성시,
    $("form[name=commentForm]").on("submit", function () {
        const boardId = document.getElementsByName('board_id')[0].value;
        const commentInput = document.getElementById('comment');
        const comment = commentInput.value;
        if (comment != "") {
            $.ajax({
                url: "/club/comment",
                type: "post",
                data: {
                    "boardId": boardId,
                    "comment": comment
                },
                success: function (comment) {
                    // comment== comment object
                    commentInput.value = "";
                    let ul = document.getElementById('com_ul').lastElementChild;
                    if (ul == null) {
                        ul = document.getElementById('com_ul');
                    }
                    const li = document.createElement('li');
                    li.setAttribute("class", "comment_list");
                    li.setAttribute("id", "li_" + comment.id);

                    const div_top = document.createElement('div');
                    div_top.setAttribute("class", "boardContainer");
                    div_top.style.cssText = "margin: 12px 0 10px 0;";

                    const div_bottom = document.createElement('div');
                    div_bottom.setAttribute("class", "commentContainer");

                    const span1 = document.createElement('span');
                    span1.innerText = comment.writer;
                    const div1 = document.createElement('div');
                    div1.setAttribute("class", "comment_writer");
                    div1.style.cssText = "font-weight: 900; margin-bottom: 2px;";
                    div1.append(span1);

                    const span2 = document.createElement('span');
                    span2.innerText = comment.message;
                    const div2 = document.createElement('div');
                    div1.setAttribute("class", "comment_message");
                    div1.setAttribute("id", comment.id);
                    div2.append(span2);

                    const span3 = document.createElement('span');
                    span3.setAttribute("class", "wadte");
                    span3.innerText = comment.wtDate_str;
                    const div3 = document.createElement('div');
                    div3.setAttribute("class", "comment_index");
                    div3.append(span3);

                    const div4 = document.createElement('div');
                    const updateAtag = document.createElement('a');
                    updateAtag.setAttribute("class", "commentUp");
                    updateAtag.setAttribute("id", comment.id);
                    updateAtag.style.cssText = "font-size: 12px;";
                    updateAtag.innerText = "수정";
                    div4.append(updateAtag);

                    const deleteAtag = document.createElement('a');
                    deleteAtag.setAttribute("class", "commentDel");
                    deleteAtag.setAttribute("id", comment.id);
                    deleteAtag.style.cssText = "font-size: 12px;";
                    deleteAtag.innerText = " 삭제";
                    div4.append(deleteAtag);

                    div_bottom.append(div1);
                    div_bottom.append(div2);
                    div_bottom.append(div3);
                    div_bottom.append(div4);

                    console.log(div_bottom);

                    div_top.append(div_bottom);
                    li.append(div_top);
                    ul.append(li);
                    alert("댓글이 작성 되었습니다.");
                },
                error: function () {
                    alert("댓글 작성에 실패 했습니다.");
                }
            }); // ajax end
            return false;
        } else {
            alert("내용을 입력하세요");
            return false;
        }
    });
// comment 수정 클릭시 ,
    let toggle_bool = true;
    $(document).on('click', '.commentUp', function () {
        const commentId = this.id;
        const nickname = document.getElementsByClassName('comment_nickname')[0].innerHTML;
        const inner =
            "<div class='temp'><div class='writer comment_nickname'>" + nickname + "</div><form name='editForm'><label for='submit' class='label_summit'>" + "<textarea rows='1' name='comment' id='update_comment' class='comment_input_temp' placeholder='댓글을 수정하세요'></textarea>" + " <input type='submit' class='comment_submit'value='등록' name='submit'></label></form></div>";
        if (toggle_bool) {
            $('#div_' + commentId).eq(0).after(inner);
            toggle_bool = false;
        } else { // toggle event
            $('.temp').detach();
            toggle_bool = true;
        }
        $('form[name=editForm]').on('submit', function () {
            const comment = document.getElementById('update_comment').value;
            if (comment != "") {
                $.ajax({
                    url: "/club/comment/update",
                    type: "post",
                    data: {
                        "commentId": commentId,
                        "comment": comment
                    },
                    success: function (comment) {
                        if (comment != "false") {
                            $('.temp').detach();
                            toggle_bool = true;
                            const div = document.getElementById(commentId);
                            div.innerText = comment;
                            alert('댓글이 수정되었습니다.');
                        }else{
                            alert("댓글 수정에 실패 했습니다.");
                        }
                    },
                    error: function () {
                        alert('댓글 수정에 실패 했습니다.');
                    }
                }); // ajax end
                return false;
            } else {
                alert('내용을 입력하세요');
            }
        });
    });
// comment 삭제 click시,
    $(document).on('click', '.commentDel', function () {
        const commentId = this.id;
        if (confirm("정말 삭제하시겠습니까?")) {
            $.ajax({
                url: "/club/comment/del",
                type: "post",
                data: {
                    "commentId": commentId
                },
                success: function (e) {
                    if (e == "true") {
                        const del = document.getElementById('li_' + commentId);
                        del.remove();
                        alert("댓글이 삭제되었습니다.");
                    } else {
                        alert("삭제 실패했습니다.");
                    }
                },
                error: function () {
                    alert("삭제 실패했습니다.");
                }
            });
        } else {
            return false;
        }
    });
// 댓글달기(reply) click시,
    $(document).on('click', '.writeReply', function () {
        const commentId = this.id;
        const boardId = document.getElementsByName('board_id')[0].value;
        const nickname = document.getElementsByClassName('comment_nickname')[0].innerHTML;
        const inner =
            "<div class='temp'><div class='writer comment_nickname'>" + nickname + "</div><form name='replyForm'><label for='submit' class='label_summit'>" + "<textarea rows='1' name='comment' id='reply_comment' class='comment_input_temp' placeholder='댓글을 작성하세요'></textarea>" + "<input type='submit' class='reply_submit' value='등록' name='submit'></label></form></div>";
        if (toggle_bool) {
            $('#div_' + commentId).eq(0).after(inner);
            toggle_bool = false;
        } else { // toggle event
            $('.temp').detach();
            toggle_bool = true;
        }
        $('form[name=replyForm]').on('submit', function () {
            const reply = document.getElementById('reply_comment').value;
            if (reply != "") {
                $.ajax({
                    url: "/club/reply",
                    type: "post",
                    data: {
                        "boardId": boardId,
                        "commentId": commentId,
                        "message": reply,
                    },
                    success: function (reply) {
                        $('.temp').detach();
                        toggle_bool = true;

                        const div = "<li class='comment_list'><div class = 'container boardContainer replyContainer'><div class = 'commentContainer'><div class = 'reply_rep'><span class = 'glyphicon glyphicon-hand-right'></span></div>" +
                        "<div class = 'reply_writer writer'><span>" + reply.writer + "</span></div><div class = 'reply_message' id ='" + reply.id + "'><span>" + reply.message + "</span></div><div class = 'comment_index'><span class='wdate'>" + reply.wtDate_str + "</span></div><div class = 'reply_aTag'><a class = 'replyUp' id='" + reply.id + "'> 수정 </a><a class = 'replyDel' id = '" + reply.id + "'> 삭제 </a></div></div> </div> </li>";
                        $('#li_' + commentId).eq(0).after(div);
                        alert('댓글이 작성되었습니다.');
                    },
                    error: function () {
                        alert('댓글 작성에 실패 했습니다.');
                    }
                }); // ajax end
                return false;
            } else {
                alert('내용을 입력하세요');
                return false;
            }
        });
    }); 
// 대댓글 수정
    $(document).on('click', '.replyUp', function () {
        const replyId = this.id;
        const nickname = document.getElementsByClassName('comment_nickname')[0].innerHTML;
        const inner =
            "<div class='temp'><div class='writer comment_nickname'>" + nickname + "</div><form name='editReplyForm'><label for='submit' class='label_summit'>" + "<textarea rows='1' name='comment' id='update_reply' class='comment_input_temp' placeholder='댓글을 수정하세요'></textarea>" + " <input type='submit' class='comment_submit'value='등록' name='submit'></label></form></div>";
        if (toggle_bool) {
            $('#div_R' + replyId).eq(0).after(inner);
            toggle_bool = false;
        } else { // toggle event
            $('.temp').detach();
            toggle_bool = true;
        }
        $('form[name=editReplyForm]').on('submit', function () {
            const comment = document.getElementById('update_reply').value;
            if (comment != "") {
                $.ajax({
                    url: "/club/reply/update",
                    type: "post",
                    data: {
                        "replyId": replyId,
                        "reply": comment
                    },
                    success: function (comment) {
                        if (comment != "false") {
                            $('.temp').detach();
                            toggle_bool = true;
                            const div = document.getElementById('R' + replyId);
                            div.innerText = comment;
                            alert('댓글이 수정되었습니다.');
                        } else {
                            alert("댓글 수정에 실패 했습니다.");
                        }
                    },
                    error: function () {
                        alert('댓글 수정에 실패 했습니다.');
                    }
                }); // ajax end
                return false;
            } else {
                alert('내용을 입력하세요');
                return false;
            }
        });
    });
    // 대댓글 삭제
    $(document).on('click', '.replyDel', function () {
        const replyId = this.id;
        if (confirm("정말 삭제하시겠습니까?")) {
            $.ajax({
                url: "/club/reply/del",
                type: "post",
                data: {
                    "replyId": replyId
                },
                success: function (e) {
                    if (e == "true") {
                        const del = $('#div_R' + replyId).parent().parent();
                        console.log(del);
                        del.remove();
                        alert("댓글이 삭제되었습니다.");
                    } else {
                        alert("삭제 실패했습니다.");
                    }
                },
                error: function () {
                    alert("삭제 실패했습니다.");
                }
            });
        } else {
            return false;
        }
    });
});