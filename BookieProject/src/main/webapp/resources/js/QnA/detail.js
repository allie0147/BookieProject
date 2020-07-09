$(function () {
    $("form[name=replyForm]").on("submit", function () {
        const boardId = document.getElementsByName('board_id')[0].value;
        const comment = document.getElementsByName('comment')[0].value;
        if (comment != "") {
            $.ajax({
                url: "/qna/comment",
                type: "post",
                data: {
                    "boardId": boardId,
                    "comment": comment
                },
                success: function (comment) {
                    // comment== comment object
                    document.getElementById('comment').value = "";
                    let table = document.getElementById('commentTable');
                    let tbody = document.getElementById('commentTbody');
                    let tr = document.createElement('tr');
                    let td1 = document.createElement('td');
                    td1.innerText = comment.message;
                    td1.setAttribute("scope", "col");
                    td1.setAttribute("class", "comment_message");
                    let td2 = document.createElement('td');
                    td2.innerText = comment.writer;
                    td2.setAttribute("scope", "col");
                    td2.setAttribute("class", "comment_writer");
                    let td3 = document.createElement('td');
                    td3.innerText = comment.wtDate_str;
                    td3.setAttribute("scope", "col");
                    td3.setAttribute("class", "comment_index");
                    let td4 = document.createElement('td');
                    td4.setAttribute("scope", "col");
                    td4.setAttribute("class", "comment_button");
                    let updateBtn = document.createElement('button');
                    updateBtn.innerText = '수정';
                    updateBtn.setAttribute('class', 'commentUp');
                    updateBtn.setAttribute('id', comment.id);
                    let delBtn = document.createElement('button');
                    delBtn.innerText = '삭제';
                    delBtn.setAttribute('class', 'commentDel');
                    delBtn.setAttribute('id', comment.id);
                    td4.appendChild(updateBtn);
                    td4.appendChild(delBtn);
                    tr.append(td1);
                    tr.append(td2);
                    tr.append(td3);
                    tr.append(td4);
                    tbody.append(tr);
                    table.append(tbody);
                    alert("댓글이 작성 되었습니다.");
                },
                error: function () {
                    alert("댓글 작성에 실패 했습니다.");
                }
            }); // ajax end
            return false;
        } else {
            alert("내용을 입력하세요");
        }
    });
});
$(document).on('click', '.commentUp', function () {
    alert(this.id);
})