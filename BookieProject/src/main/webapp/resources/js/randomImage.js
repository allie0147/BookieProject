function showImage(){
	var objImgs = document.querySelectorAll("div.img");
	var i = 0;
	objImgs.forEach(function(element){
		var imgNumArr = new Array;
		var imgNum = Math.round(Math.random()*30); //0~30
		//imgNum이라는 난수를 생성해 이 값을 imgNumArr가 가지고 있을 때에는(중복될때에는) 새로 생성
		while(imgNumArr.includes(imgNum)){
			imgnum = Math.round(Math.random()*30);
		}
		imgNumArr.push(imgNum);
		element.style.backgroundImage = "url('../resources/images/bookcard-images-"+imgNum+".jpg')";		
	});
}