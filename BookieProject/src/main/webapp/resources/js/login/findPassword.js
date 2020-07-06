$(function resetPwd(){
	$("form").on("submit", function(){
		let pwd = $("input[name=uPwd]").eq(0).val();
		let ckPwd = $("input[name=uPwdCheck]").eq(0).val();
		
		if(pwd == ckPwd){
            let num = pwd.search(/[0-9]/g);
            let eng = pwd.search(/[a-z]/ig);
            let spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
            let pwdCheck = RegExp(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/);
             
            if (pwdCheck.test(pwd) == true) {
                let conf = confirm("비밀번호를 수정하시겠습니까?");
                if(conf){
                 	 
                }
                let formData = $("form").eq(0).serialize();
					
    			$.ajax({
    				url:"/resetPwdinDb",
    				type:"post",
    				data:formData,
    				success:function(){
    					alert("비밀번호가 변경되었습니다.");
    					location.href="/";
    				}
    			});
             } else if (pwd == "") {
                 alert('비밀번호를 입력해주세요');
             } else if ((num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0)) {
                 alert('사용불가능한 비밀번호입니다');
             } else if (pwd.length > 17||pwd.length < 8) {
                alert('최소 8자리 이상 16자리 이하의 비밀번호를 입력하세요');
             }
		}else {
			alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		}
		return false;
	});
});

function popup(){                 // 전송 파라미터 값
	    let url = "/login/find-password"; // 전송 URL
	    let name ="find password";
	    window.open(url, name, "scrollbars=no,width=500,height=300,menubar=false");
	    // window.open(URL,"팝업 구분값(팝업 1개일 경우 상관없음)","팝업 창 옵션")
}