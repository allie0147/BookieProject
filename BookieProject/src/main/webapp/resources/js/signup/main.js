$(function () {
    $(".error").hide();

    $("input[class=form-control]").on({
        "focus": function () {
            $(this).css({
            "border-color": "#28a745",
        	"box-shadow": "0 0 0 0.2rem rgba(40, 167, 69, 0.25)"
            });
        },
        "blur": function () {
            $(this).css({
            	"border-color": "",
            	"box-shadow": ""
            });
        }
    });
    // submit시 사용할 focus
    function submitFuc(classname) {
        classname.focus();
    }
    // submit시 확인할 변수
    let submitEmail = false;
    let submitPwd = false;
    let submitPwdRe = false;
    let submitNickname = false;
    let submitInterest = false;
    let submitphone = false;

    // 이메일
    // email @, . 확인
    $("button[name=emailBtn]")
        .on(
            "click",
            function () {
            	$(this).css("background", "#33d299").css("border-color", "#33d299")
                let u_email = $("input[name=uEmail]").val();
                console.log(u_email);
                let emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
                if (emailCheck.test(u_email) == true) {
                    console.log("확인");
                    $('#error01').hide();
                    u_email = encodeURIComponent(u_email);
                    $
                        .ajax({
                            url: "/chkEmail?email=" +
                                u_email,
                            type: "get",
                            success: function (data) {
                                console.log(data);
                                if (data == 0) {
                                    submitEmail = true;
                                    console.log(data);
                                    $('#error01').text(
                                            '사용가능한 이메일입니다.').css(
                                            "display",
                                            "inline-block").css(
                                            "color",
                                            "#ff070b").css(
                                            "font-size", "small")
                                        .css('font-weight',
                                            'bold');
                                } else {
                                    $('#error01').text(
                                            '이미 사용중인 이메일입니다.').css(
                                            "display",
                                            "inline-block").css(
                                            "color",
                                            "#ff070b").css(
                                            "font-size", "small")
                                        .css('font-weight',
                                            'bold');
                                    document
                                        .getElementById("email").value = "";
                                }
                                return false;
                            }
                        });
                } else if (u_email == "") {
                    console.log("빈값");
                    $('#error01').text('이메일을 입력해주세요').css("display",
                            "inline-block").css("color",
                            "#ff070b")
                        .css("font-size", "small").css(
                            'font-weight', 'bold');
                } else if (emailCheck.test(u_email) == false) {
                    console.log("false");
                    $('#error01').text('이메일 양식이 아닙니다').css("display",
                            "inline-block").css("color",
                            "#ff070b")
                        .css("font-size", "small").css(
                            'font-weight', 'bold');
                }
            });

    // 비밀번호 사용 버튼 클릭 시
    // pwd 8자리이상 특수문자 1개이상
    $('input[name=uPwd]')
        .on({
            "focusout": function () {
                let pwd = $(this).val();
                let num = pwd.search(/[0-9]/g);
                let eng = pwd.search(/[a-z]/ig);
                let spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
                let pwdCheck = RegExp(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/);
                if (pwdCheck.test(pwd) == true) {
                    submitPwd = true;
                    $('#error02').text("사용가능한 비밀번호입니다");
                } else if (pwd == "") {
                    $('#error02').text('비밀번호를 입력해주세요').css(
                        "display", "inline-block").css("color",
                        "#ff070b").css("font-size",
                        "small").css('font-weight', 'bold');
                } else if ((num < 0 && eng < 0) ||
                    (eng < 0 && spe < 0) ||
                    (spe < 0 && num < 0)) {
                    $('#error02').text('사용불가능한 비밀번호입니다').css(
                        "display", "inline-block").css("color",
                        "#ff070b").css("font-size",
                        "small").css('font-weight', 'bold');
                } else if (pwd.length > 17||pwd.length < 8) {
                    $('#error02').text(
                        '최소 8자리 이상 16자리 이하의 비밀번호를 입력하세요').css(
                        'display', 'inline-block').css("color",
                        "#ff070b").css("font-size",
                        "small").css('font-weight', 'bold');
                }
            }
        });
    // pwd 재입력 같은지 확인 및 사용하기
    $('input[name=uPwdRe]').on({
        "focusout": function () {
            let uPwdRe = $('input[name=uPwdRe]').val();
            let uPwd = $('input[name=uPwd]').val();
            if (uPwdRe == uPwd) {
                submitPwdRe = true;
                $('#error03').hide();
            } else {
                $('#error03').text('비밀번호가 다릅니다').css('display',
                        'inline-block').css("color", "#ff070b")
                    .css("font-size", "small").css('font-weight',
                        'bold');
            }
        }
    });
    // 닉네임
    // 한글, 영문(대,소), 숫자 가능, 띄워쓰기 불가능
    $("button[name=nickBtn]")
        .on({
            "click": function () {
                let nickname = $('input[name=nickname]').val();
                let nicknameChk = /^[가-힣|a-z|A-Z|0-9|\S]+$/;
                let nicknameChk2 = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
                if (nicknameChk.test(nickname) == true &&
                    !nicknameChk2.test(nickname)) {
                    console.log("확인");
                    if (nickname.length < 2 || nickname.length > 11) {
                        $('#error04').text('닉네임은 2~11길이로 정하세요').css(
                            "display", "inline-block").css(
                            "color", "#ff070b").css(
                            "font-size", "small").css(
                            'font-weight', 'bold');
                    } else {
                        $('#error04').hide();
                        nickname = encodeURIComponent(nickname);
                        $
                            .ajax({
                                url: "/chkNick?nickname=" +
                                    nickname,
                                type: "get",
                                success: function (data) {
                                    console.log(data);
                                    if (data == 0) {
                                        console.log(data);
                                        submitNickname = true;
                                        $('#error04')
                                            .text(
                                                '사용가능한 닉네임입니다.')
                                            .css("display",
                                                "inline-block")
                                            .css("color",
                                                "#ff070b")
                                            .css(
                                                "font-size",
                                                "small")
                                            .css(
                                                'font-weight',
                                                'bold');
                                    } else {
                                        $('#error04')
                                            .text(
                                                '이미 사용중인 닉네임입니다.')
                                            .css("display",
                                                "inline-block")
                                            .css("color",
                                                "#ff070b")
                                            .css(
                                                "font-size",
                                                "small")
                                            .css(
                                                'font-weight',
                                                'bold');
                                        document
                                            .getElementById("nickname").value = "";
                                    }
                                    return false;
                                }
                            });
                    }
                } else if (nickname == "") {
                    $('#error04').text('닉네임을 입력해주세요').css(
                        "display", "inline-block").css("color",
                        "#ff070b").css("font-size",
                        "small").css('font-weight', 'bold');
                } else {
                    $('#error04').text('한글,영문,숫자만 가능합니다').css(
                        "display", "inline-block").css("color",
                        "#ff070b").css("font-size",
                        "small").css('font-weight', 'bold');
                }
            }
        });
    // 핸드폰번호
    $('input[name=phone]')
        .on({
            "keyup": function () {
                let phoneCheck = RegExp(/^(01[016789]{1})(\d{3,4})(\d{4})$/);
                let trans_phone = $(this).val().replace(/-/gi, '');
                if (phoneCheck.test(trans_phone) == false) {
                    $('#error05').text('핸드폰 번호 양식이 아닙니다').css(
                        "display", "inline-block").css("color",
                        "#ff070b").css("font-size",
                        "small").css('font-weight', 'bold');
                } else {
                    submitphone = true;
                    $(this)
                        .val(
                            $(this)
                            .val()
                            .replace(/[^0-9]/g, "")
                            .replace(
                                /(^0[0-9]{2})([0-9]+)?([0-9]{4})/,
                                "$1-$2-$3")
                            .replace("--", "-"));
                    $('#error05').hide();
                }
            }
        });
// interest checked max 2
    const limit = 2;
    $('input[name=interest]').on('change', function(evt) {
       if($(this).siblings(':checked').length >= limit) {
           this.checked = false;
           alert("최대 2개까지 선택가능합니다.");
       }
    });
    
    // interest submit
    $('input[name=interest]').on({
        "submit": function () {
            let interest = $('input[name=interest]');
            console.log(interest);
            if (interest.length == 0 || interest.length > 2) {
                $('#error06').text('하나 또는 두개의 관심분야를 선택하세요').css(
                        "display", "inline-block").css("color",
                        "#ff070b").css("font-size", "small")
                    .css('font-weight', 'bold');
                return false;
            } else {
                $('#error06').hide();
            }
        }
    });
    
    $('input[name=submit]').on("click",function(){
    	$(this).css("background","#33d299").css("border-color", "#33d299");
    })
    
        	
        	
    // submit
    $("form").submit(
        function () {
            if (submitEmail == false) {
                $('#error01').text('이메일 양식을 확인해주세요').css("display",
                        "inline-block").css("color", "#ff070b")
                    .css("font-size", "small").css('font-weight',
                        'bold');
                submitFuc(document.getElementById('email'));
                return false;
                 } else if (submitPwd == false) {
                 $('#error02').text('비밀번호 양식을 확인해주세요').css("display",
                 "inline-block").css(
                 "color", "#ff070b").css("font-size",
                 "small").css('font-weight',
                 'bold');
                 submitFuc(document.getElementById('uPwd'));
                 return false;
                 } else if (submitPwdRe == false) {
                 $('#error03').text('비밀번호가 다릅니다').css("display",
                 "inline-block").css(
                 "color", "#ff070b").css("font-size",
                 "small").css('font-weight',
                 'bold');
                 submitFuc(document.getElementById('uPwdRe'));
                 return false;
            } else if (submitNickname == false) {
                $('#error04').text('닉네임 양식을 확인해주세요').css("display",
                        "inline-block").css("color", "#ff070b")
                    .css("font-size", "small").css('font-weight',
                        'bold');
                submitFuc(document.getElementById('nickname'));
                return false;
            } else if (submitphone == false) {
                $('#error05').text('핸드폰번호 양식을 확인해주세요').css("display",
                        "inline-block").css("color", "#ff070b")
                    .css("font-size", "small").css('font-weight',
                        'bold');
                submitFuc(document.getElementById('phone'));
                return false;
            }
        });
});