$(function () {
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
    let toggle_bool = true;
    $(document).on('click', '.commentUp', function () {
        const commentId = this.id;
        const nickname = document.getElementsByClassName('comment_nickname')[0].innerHTML;
        const inner =
            "<div class='comment_box temp' ><div class='writer comment_nickname'>" + nickname + "</div><form name='editForm'><label for='submit' class='label_summit'>" + "<textarea rows='1' name='comment' id='update_comment' class='comment_input' placeholder='댓글을 수정하세요' width='700px'></textarea>" + " <input type='submit' class='comment_submit'value='등록' name='submit'></label></form></div>";
        if (toggle_bool) {
            $('#div_' + commentId).eq(0).after(inner);
            toggle_bool = false;
        } else { //toggle event
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
                }); //ajax end
                return false;
            } else {
                alert('내용을 입력하세요');
            }
        });
    });
    
    
    let toggle_reply = true;
    $(document).on('click', '.writeReply', function () {
        const nickname = document.getElementsByClassName('comment_nickname')[0].innerHTML;
        const inner =
            "<div class='comment_box temp'><div class='writer comment_nickname'>" + nickname + "</div><form name='editForm'><label for='submit' class='label_summit'>" + "<textarea rows='1' name='comment' id='comment' class='comment_input' placeholder='댓글을 작성하세요' width='700px'></textarea>" + " <input type='submit' class='comment_submit'value='등록' name='submit'></label></form></div>";
        if (toggle_reply) {
            $('#div_' + this.id).eq(0).after(inner);
            toggle_reply = false;
        } else {
            $('.temp').detach();
            toggle_reply = true;
        }
    });
});