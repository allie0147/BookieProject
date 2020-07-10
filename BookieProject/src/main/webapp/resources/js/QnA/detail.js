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
                    document.getElementById('comment').innerText = "";
                    const table = document.getElementById('commentTable');
                    const tbody = document.getElementById('commentTbody');
                    const tr = document.createElement('tr');

                    const td1 = document.createElement('td');
                    td1.innerText = comment.message;
                    td1.setAttribute("scope", "col");
                    td1.setAttribute("class", "comment_message");

                    const td2 = document.createElement('td');
                    td2.innerText = comment.writer;
                    td2.setAttribute("scope", "col");
                    td2.setAttribute("class", "comment_writer");

                    const td3 = document.createElement('td');
                    td3.innerText = comment.wtDate_str;
                    td3.setAttribute("scope", "col");
                    td3.setAttribute("class", "comment_index");

                    const td4 = document.createElement('td');
                    td4.setAttribute("scope", "col");
                    td4.setAttribute("class", "comment_button");

                    const updateBtn = document.createElement('button');
                    updateBtn.innerText = '수정';
                    updateBtn.setAttribute('class', 'commentUp');
                    updateBtn.setAttribute('id', comment.id);
                    td4.append(updateBtn);

                    const delBtn = document.createElement('button');
                    delBtn.innerText = '삭제';
                    delBtn.setAttribute('class', 'commentDel');
                    delBtn.setAttribute('id', comment.id);
                    td4.append(delBtn);

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