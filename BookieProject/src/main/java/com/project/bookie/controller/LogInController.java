package com.project.bookie.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bookie.dto.user.User;
import com.project.bookie.security.CustomUser;
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

	@Autowired
	BCryptPasswordEncoder encoder;

	@RequestMapping(value = "/login", method = { RequestMethod.POST, RequestMethod.GET })
	public String showLogIn() {
//		로그인화면 보여주기
		return "login/logIn";
	}

	// 비밀번호 찾기 팝업창
	@GetMapping("/login/find-password")
	public String findPassword() {
		return "login/findPassword";
	}

	// 버튼 클릭시 해당 이메일이 존재하는지 확인
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

	@GetMapping(value = "/EmailCkForPwd", produces = "application/html; charset=utf-8")
	public String emailCkForPwd(int uId) {
		// 일치하는 이메일이 있을 때 그 이메일의 유저 아이디를 가져와 그 아이디로 다시 유저 정보 가져옴(url에 파라미터로 줄 때 보안을 위해)
		// 해당 유저의 이메일로 메일을 보냄(인증 링크에는 유저의 아이디와 인증키 - 인증키는 갱신됨)
		// authKey 업데이트
		// mailService
		authService.ckUserForChangePwd(uId);

		return "login/logIn";
	}

	// 인증키 비교
	@GetMapping("/resetpwd")
	public String modifyPwd(Model m, @RequestParam("uId") int uId, @RequestParam("authkey") String authkey) {
		User user = authService.ckAuthKey(uId, authkey);
		System.out.println("LogInCtr의 ModifyPwd에서의 userId : " + uId + ", authKey : " + authkey);
		System.out.println("LogInCtr의 ModifyPwd에서의 user email : " + user.getUEmail());
		System.out.println("LogInCtr의 ModifyPwd에서의 user : " + user.toString());
		if (user != null) {
			m.addAttribute("user", user);
		} else {
			m.addAttribute("user", user); // null을 보내는 것
		}
		return "login/modifyPassword";
	}

	// 비밀번호 수정(DB에 반영)
	@PostMapping("/resetPwdinDb")
	public String updatePwd(Model m, int uId, String uPwd) {
		userService.updateUserPwd(uId, uPwd);

		return "login/resetPwdSuccess";
	}

	@PostMapping("/loginProc")
	public void getInfo(@Param("uEmail") String uEmail, @Param("uPwd") String uPwd) {
//	로그인 성공시 user 정보 session에 담기
//	시큐리티적용
		System.out.println("login컨트롤러");
		System.out.println("uEmail : " + uEmail);
		System.out.println("uPwd : " + uPwd); // 입력값 그대로
		CustomUser u = (CustomUser) userDetailsService.loadUserByUsername(uEmail);
	}
}
