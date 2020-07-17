function showImage(){
	var objImgs = document.querySelectorAll("div.img");
	const imgNumSet = new Set();
	var i = 0;

	while(imgNumSet.size < objImgs.length){
		var imgNum = Math.round(Math.random()*50);
		while(imgNumSet.has(imgNum)){
			imgNum = Math.round(Math.random()*50);
		}
		imgNumSet.add(imgNum);
		
		objImgs[i].style.backgroundImage = "url('../resources/images/bookcard-images-"+imgNum+".jpg')";
		i++;
	}
}