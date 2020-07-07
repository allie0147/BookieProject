package com.project.bookie.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bookie.dto.user.User;
import com.project.bookie.security.CustomUser;
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

	@GetMapping("/login")
	public String showLogIn() {
//		로그인화면 보여주기
		return "login/logIn";
	}

	@PostMapping("/login")
	public String getInfo(Model m, String uEmail) {
//	로그인 성공시 user 정보 session에 담기
//	시큐리티적용
		return "redirect:/";
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
	public String EmailCkForPwd(int uId) {
		// 일치하는 이메일이 있을 때 그 이메일의 유저 아이디를 가져와 그 아이디로 다시 유저 정보 가져옴(url에 파라미터로 줄 때 보안을 위해)
		// 해당 유저의 이메일로 메일을 보냄(인증 링크에는 유저의 아이디와 인증키 - 인증키는 갱신됨)
		// authKey 업데이트
		// mailService
		authService.ckUserForChangePwd(uId);

		return "login/logIn";
	}

	// 인증키 비교
	@GetMapping("/resetpwd")
	public String ModifyPwd(Model m, int uId, String authkey) {
		User user = authService.ckAuthKey(uId, authkey);
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

//	@PostMapping("/login")
//	public String getInfo(@Param("uEmail") String uEmail, @Param("uPwd") String uPwd) {
////	로그인 성공시 user 정보 session에 담기
////	시큐리티적용
//		System.out.println("login컨트롤러");
//		System.out.println("uEmail : " + uEmail);
//		System.out.println("uPwd : " + uPwd); // 입력값 그대로
//
//		CustomUser u = (CustomUser) userDetailsService.loadUserByUsername(uEmail);
//		if (u == null) {
//			System.out.println("없는 유저");
//			return "redirect:/login";
//		}
//		System.out.println("customuser email : " + u.getUsername()); // db email
//		System.out.println("customuser pwd : " + u.getPassword()); // db pwd
//		System.out.println("login 컨트롤러 2");
//		try {
//			UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(u.getUsername(),
//					u.getPassword(), u.getAuthorities());
//			System.out.println("credentials : " + token.getCredentials()); // 비번
//			System.out.println("auth : " + token.getAuthorities()); // auth
//			System.out.println("principal : " + token.getPrincipal()); // 이메일
//			System.out.println("name : " + token.getName()); // 이메일
//			if (!token.isAuthenticated()) {
//				System.out.println("auth아님");
//				throw new BadCredentialsException(u.getUsername());
//			}
//			if (encoder.matches(uPwd, u.getPassword()) == false) {
//				System.out.println("패스워드 다름");
//				throw new BadCredentialsException(u.getUsername());
//			}
//			if (!token.getPrincipal().equals(uEmail)) {
//				System.out.println("이메일 다름");
//				throw new BadCredentialsException(u.getUsername());
//			}
//			System.out.println("token principal: " + token.getPrincipal());
//			System.out.println("token credentials: " + token.getCredentials());
//			System.out.println("token authroities: " + token.getAuthorities());
//			SecurityContextHolder.getContext().setAuthentication(token);
//			System.out.println("완료!");
//		} catch (BadCredentialsException e) {
//			e.getLocalizedMessage();
//			System.out.println("BADCREDENTIAL: " + e.getLocalizedMessage()); // username 이 나와야 함
//		}
//		return "redirect:/";
//	}
}
