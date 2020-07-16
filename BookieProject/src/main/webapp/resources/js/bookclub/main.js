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

$(function searchResult(option){
	$("#searchResultPgClub").on("load", function(){
		console.log("search_result.jsp의 body 실행");
		console.log("option : "+option);
		
		var optionArr = document.querySelectorAll("option"); //ml option
		optionArr.forEach(function(opt){
			console.dir(opt);
			if(opt.value == option){
				opt.selected = true;
			}
				
		});		
	});
});