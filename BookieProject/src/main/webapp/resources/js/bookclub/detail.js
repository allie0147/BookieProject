$(function () {
    $("form[name=replyForm]").on("submit", function () {
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
});