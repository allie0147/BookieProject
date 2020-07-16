$(function search() {
    $(".ml").on("submit", function () {
		let option = $("select option:selected").val();
		let query = $("input[name=query]").val();

		if (query !== "") {
 			window.location.href="/club/search?option="+option+"&query="+query;
		} else {
			alert("검색 요소를 입력해주세요.");
		}
		return false;
	});
});
