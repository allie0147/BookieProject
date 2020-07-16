package com.project.bookie.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bookie.dto.user.User;
import com.project.bookie.security.CustomUserDetailsService;
import com.project.bookie.service.MailService;
import com.project.bookie.service.UserAuthService;
import com.project.bookie.service.UserService;

@Controller
public class LogInController {
	@Autowired
	UserService userService;

	@Autowired
	MailService mailService;

	@Autowired
	UserAuthService authService;

	@Autowired
	CustomUserDetailsService userDetailsService;

	@RequestMapping(value = "/login", method = { RequestMethod.POST, RequestMethod.GET })
	public String showLogIn() {
		// 로그인화면 보여주기
		return "login/logIn";
	}

	@PostMapping("/loginProc")
	public void getInfo(@Param("uEmail") String uEmail, @Param("uPwd") String uPwd) {
		// 시큐리티적용
//		System.out.println("login컨트롤러");
//		System.out.println("입력한 uEmail : " + uEmail);
//		System.out.println("입력한 uPwd : " + uPwd); // 입력값 그대로
		try {
			userDetailsService.loadUserByUsername(uEmail);
		} catch (UsernameNotFoundException e) {
			e.printStackTrace();
		}
	}

	// 비밀번호 찾기 - 1. 팝업창
	@GetMapping("/login/find-password")
	public String findPassword() {
		return "login/findPassword";
	}

	// 비밀번호 찾기 - 2. 확인 버튼 클릭시 해당 이메일이 존재하는지 확인
	@PostMapping(value = "/checkEmail", produces = "application/html; charset=utf8") // login/find-password/inputEmail
	public @ResponseBody String checkEmail(String email) {
		User ckUser = userService.getUserInfo(email);
		// long타입은 json의 포맷X
		String result = null;
		if (ckUser != null) {
			result = Long.toString(ckUser.getId());
		}
		return result; // 일치하는 이메일이 있다면(not null) true, 일치하는 이메일이 없다면(null) false
	}

	// 비밀번호 찾기 - 3. 인증 메일 발송, 인증키 갱신
	@GetMapping(value = "/EmailCkForPwd", produces = "application/html; charset=utf-8")
	public String EmailCkForPwd(int uId) {
		// 일치하는 이메일이 있을 때 그 이메일의 유저 아이디를 가져와 그 아이디로 다시 유저 정보 가져옴(url에 파라미터로 줄 때 보안을 위해)
		// 해당 유저의 이메일로 메일을 보냄(인증 링크에는 유저의 아이디와 인증키 - 인증키는 갱신됨)
		// authKey 업데이트
		// mailService
		authService.ckUserForChangePwd(uId);

		return "login/logIn";
	}

	// 비밀번호 찾기 - 4. 인증키 비교
	@GetMapping("/resetpwd")
	public String ModifyPwd(Model m, @RequestParam("uId") int uId, @RequestParam("authkey") String authkey) {
		User user = authService.ckAuthKey(uId, authkey);
		m.addAttribute("user", user);
		return "login/modifyPassword";
	}

	// 비밀번호 찾기 - 5. 비밀번호 수정(DB에 반영)
	@PostMapping("/resetPwdinDb")
	public String updatePwd(Model m, int uId, String uPwd) {
		userService.updateUserPwd(uId, uPwd);
		return "login/resetPwdSuccess";
	}

	// 이메일 찾기 - 1. 핸드폰 번호를 입력받아 DB에 존재하는 정보인지 확인하는 팝업창으로 이동
	@GetMapping("/login/find-email")
	public String checkPhone() {
		return "login/ckPhone";
	}

	// 이메일 찾기 - 2. 입력받은 핸드폰 번호가 DB 회원 정보 시스템에 존재하는지 확인
	@PostMapping("/login/ckPhone")
	@ResponseBody
	public User ckPhone(String phone) {
		User user = userService.getUserByPhone(phone);
		return user;
	}

	// 이메일 찾기 - 3. 입력받은 핸드폰 번호가 존재 => 이 번호로 랜덤 키를 생성(세션에 저장)하고 이를 문자로 보냄
	@GetMapping("/login/phoneCkForEmail")
	public String findEmail(Model m, String uId) {
		// 회원 아이디를 이용해 회원의
		int certifVal = userService.sendMessageWithPhone(Integer.parseInt(uId));
		m.addAttribute("certifVal", certifVal);
		m.addAttribute("uId", uId);
		return "login/certifForm";
	}

	// 이메일 찾기 - 4. 이메일을 알려주는 페이지
	@GetMapping("/login/getEmail")
	public String getEmail(Model m, int uId) {
		User user = userService.getUserById(uId);
		m.addAttribute("uEmail", user.getUEmail());
		return "login/getEmail";
	}

}
