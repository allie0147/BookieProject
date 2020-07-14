$(function(){
	$("input[type=submit]").on("click", function(){
		let id = document.getElementsByName("id")[0].value;
		console.log("id", id);
		let nickname = document.getElementsByName("nickname")[0].value;
		let phone = document.getElementsByName("phone")[0].value;
		let interestList = document.getElementsByName("interest");
		
		var interestArray = new Array();
		
		interestList.forEach(function(interest, index, array){
			
			if($(interest).prop("checked")){ 
				interestArray.push(interest.value);
			}
		});

		let data = {
				"id":id,
				"nickname":nickname,
				"phone":phone,
				"interestArray":interestArray
		}
			
		if(interestArray.length < 1 || interestArray.length > 2){
			alert("관심 장르는 최소 1개, 최대 2개까지 선택할 수 있습니다.");
		}else{
			$.ajax({
				url:"/mypage/update",
				type:"post",
				data:data,
				success:function(data){
					console.log(interestArray);
					location.href="/mypage/info";
				}
			});
			return false;
		}
		return false;
	});
});
	
	
