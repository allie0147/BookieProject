function showImage(){
	var objImgs = document.querySelectorAll("div.img");
	//document.getElementsByClassName("img"); //여러개(배열)
	console.log(objImgs);
	
	objImgs.forEach(function(element){
		var imgNum = Math.round(Math.random()*30); //0~30
		element.style.backgroundImage = "url('../resources/images/bookcard-images-"+imgNum+".jpg')";			
	});
}