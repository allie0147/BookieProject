window.addEventListener("DOMContentLoaded", (e) => {
    const list = document.getElementsByClassName('breadcrumb')[0];
    const genre = getParameterByName('g');
    if (genre == "") {
        list.children[0].style.textDecoration = "underline";
    } else {
        list.children[genre].firstChild.style.textDecoration = 'underline';
    }
});
    
    function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }


    $(function search() {
        $(".ml").on(
            "submit",
            function () {
                let option = $("select option:selected").val();
                let query = $("input[name=query]").val();
                if (query !== "") {
                    window.location.href = "/qna/search?option=" + option +
                        "&query=" + query;
                } else {
                    alert("검색 요소를 입력해주세요.");
                }
                return false;
            });
    });