$(function search() {
    $("form")
        .on(
            "submit",
            function () {
                var formData = $("form").eq(0).serialize();

                console.log(formData);

                if (formData.searchInfo !== "") {
                    $
                        .ajax({
                            url: "/qna/main",
                            type: "post",
                            data: formData,
                            success: function (boardViewList) {

                                console.dir(boardViewList);

                                if (boardViewList.boardList != null) {
                                    $("#boardList")
                                        .html(
                                            "<table style='border:1px solid black'>" +
                                            +"<thead>" +
                                            "<tr>" +
                                            "<td>글번호</td>" +
                                            "<td>제목</td>" +
                                            "<td>작성자명</td>" +
                                            "<td>작성일시</td>" +
                                            "</tr>" +
                                            "</thead>");
                                    $("#boardList").append(
                                        "<tbody>");
                                    boardViewList.boardList
                                        .forEach(function (
                                            board) {
                                            console
                                                .dir(board);
                                            $("#boardList")
                                                .append(
                                                    "<tr><td>" +
                                                    board.id +
                                                    "</td>");
                                            $("#boardList")
                                                .append(
                                                    "<td>" +
                                                    board.title +
                                                    "</td>");
                                            $("#boardList")
                                                .append(
                                                    "<td>" +
                                                    board.writer +
                                                    "</td>");
                                            $("#boardList")
                                                .append(
                                                    "<td>" +
                                                    board.wtDate +
                                                    "</td></tr>");
                                        });
                                    $("#boardList").append(
                                        "</tbody>");
                                    $("#boardList").append(
                                        "</table>")
                                } else {
                                    $("#boardList")
                                        .html(
                                            "해당 조건을 만족하는 게시글이 없습니다.");
                                }
                            }
                        });
                } else {
                    alert("검색 요소를 입력해주세요.");
                }
                return false;
            });
});