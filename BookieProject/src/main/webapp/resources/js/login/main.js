<<<<<<< HEAD
$("input[class=form-control]").on({
	"focus" : function() {
		$(this).css({
			"border-color" : "#28a745",
			"box-shadow" : "0 0 0 0.2rem rgba(40, 167, 69, 0.25)"
		});
	},
	"blur" : function() {
		$(this).css({
			"border-color" : "",
			"box-shadow" : ""
		});
	}
});

$(function() {
	let chkEmail = false;
	let chkPwd = false;
	function emailCheck(inputName, inputId) {
		let u_email = $(inputName).val();
		console.log(u_email);
		let emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		if (emailCheck.test(u_email) == true) {
			console.log("확인");
			$('#error01').hide();
			u_email = encodeURIComponent(u_email);
			$.ajax({
				url : "/loginEmail?email=" + u_email,
				type : "get",
				success : function(data) {
					console.log(data);
					if (data == 1) {
						console.log(data);
						chkEmail == true;
					} else {
						alert("없는 이메일");
						submitFuc(document.getElementById(inputId));
					}
					return false;
				}
			}); // ajax end
		} else if (u_email == "") {
			console.log("빈값");
			alert("이메일을 입력해주세요");
			submitFuc(document.getElementById(inputId));
			return false;
		} else if (emailCheck.test(u_email) == false) {
			console.log("false");
			alert("이메일 양식이 아닙니다");
			submitFuc(document.getElementById(inputId));
			return false;
		}
	}

	function pwdCheck(inputName, inputId) {
		let pwd = $(inputName).val();
		let num = pwd.search(/[0-9]/g);
		let eng = pwd.search(/[a-z]/ig);
		let spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		let pwdCheck = RegExp(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/);
		if (num.test(pwd) == true && eng.test(pwd) == true
				&& spe.test(pwd) == true && pwd.length < 17 && pwd.length > 7) {
			console.log("확인");
			pwd = encodeURIComponent(pwd);
			$.ajax({
				url : "/loginPwd?pwd=" + pwd,
				type : "get",
				success : function(data) {
					console.log(data);
					if (data == 1) {
						console.log(data);
						chkPwd == true;
					} else {
						submitFuc(document.getElementById(inputId));
					}
					return false;
				}
			}); // ajax end
		} else if (pwd == "") {
			console.log("빈값");
			alert("비밀번호를 입력해주세요");
			submitFuc(document.getElementById(inputId));
			return false;
		} else if ((num < 0 && eng < 0) || (eng < 0 && spe < 0)
				|| (spe < 0 && num < 0)) {
			console.log("비밀번호 양식 오류");
			alert("비밀번호 양식을 확인해주세요");
			submitFuc(document.getElementById(inputId));
			return false;
		} else if (pwd.length > 17 || pwd.length < 8) {
			console.log("짧은 비밀번호");
			alert("최소 8자리 이상 16자리 이하의 비밀번호를 입력하세요");
			submitFuc(document.getElementById(inputId));
			return false;
		}
	}

	$("form").submit(function() {
		emailCheck("input[name=uEmail]", "inputEmail1");
		pwdCheck("input[name=pwd]", "inputPassword1");
		if (chkEmail == false || chkPwd == false) {
			return false;
		}
	});
});

=======
>>>>>>> branch 'master' of https://github.com/allie0147/BookieProject.git
// 틀린 정보에 리포커스
function submitFuc(inputClass) {
	inputClass.focus();
<<<<<<< HEAD
}
=======
}

$(function() {
	$("form")
			.submit(
					function() {
						let u_email = $('input[name=uEmail]').val();
						console.log(u_email);
						let emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
						if (emailCheck.test(u_email) == true) {
							console.log("확인");
							$('#error01').hide();
							u_email = encodeURIComponent(u_email);
							$
									.ajax({
										url : "/loginEmail?email=" + u_email,
										type : "get",
										success : function(data) {
											console.log(data);
											if (data == 1) {
												console.log(data);
											} else {
												alert("없는 이메일");
												submitFuc(document
														.getElementById('inputEmail1'));
											}
											return false;
										}
									}); // ajax end
						} else if (u_email == "") {
							console.log("빈값");
							alert("이메일을 입력해주세요");
							submitFuc(document.getElementById('inputEmail1'));
							return false;
						} else if (emailCheck.test(u_email) == false) {
							console.log("false");
							alert("이메일 양식이 아닙니다");
							submitFuc(document.getElementById('inputEmail1'));
							return false;
						}

						let pwd = $('input[name=uPwd]').val();
						let num = pwd.search(/[0-9]/g);
						let eng = pwd.search(/[a-z]/ig);
						let spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
						let pwdCheck = RegExp(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/);
						if (num.test(pwd) == true && eng.test(pwd) == true
								&& spe.test(pwd) == true && pwd.length < 17
								&& pwd.length > 7) {
							console.log("확인");
							pwd = encodeURIComponent(pwd);
							$
									.ajax({
										url : "/loginPwd?pwd=" + pwd,
										type : "get",
										success : function(data) {
											console.log(data);
											if (data == 1) {
												console.log(data);
											} else {
												submitFuc(document
														.getElementById('inputPassword1'));
											}
											return false;
										}
									}); // ajax end
						} else if (pwd == "") {
							console.log("빈값");
							alert("비밀번호를 입력해주세요");
							submitFuc(document.getElementById('inputPassword1'));
							return false;
						} else if ((num < 0 && eng < 0) || (eng < 0 && spe < 0)
								|| (spe < 0 && num < 0)) {
							console.log("비밀번호 양식 오류");
							alert("비밀번호 양식을 확인해주세요");
							submitFuc(document.getElementById('inputPassword1'));
							return false;
						} else if (pwd.length > 17 || pwd.length < 8) {
							console.log("짧은 비밀번호");
							alert("최소 8자리 이상 16자리 이하의 비밀번호를 입력하세요");
							submitFuc(document.getElementById('inputPassword1'));
							return false;
						}

					});
});
>>>>>>> branch 'master' of https://github.com/allie0147/BookieProject.git
