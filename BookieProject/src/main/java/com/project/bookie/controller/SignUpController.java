package com.project.bookie.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.bookie.dto.user.User;
import com.project.bookie.service.MailService;
import com.project.bookie.service.UserService;

@Controller
public class SignUpController {

	@Autowired
	UserService userService;

	@Autowired
	MailService mailService;

	@Autowired
	BCryptPasswordEncoder pwdEncoder;

	@GetMapping("/userForm")
	public String getForm() {
//		회원가입페이지 이동
		return "signUp/signupForm";
	}

	@PostMapping("/userForm")
	public String signupProc(Model m, @ModelAttribute @Valid User user, BindingResult bindingResult,
			RedirectAttributes rttr, HttpServletRequest request) {
//		회원가입 완료 후 페이지 이동(alert만 있는 logInAgain)
		if (bindingResult.hasErrors()) {
			List<FieldError> errors = bindingResult.getFieldErrors();
			for (FieldError fe : errors) {
//				System.out.println(fe.getField());
				m.addAttribute("E" + fe.getField(), fe.getField());
			}
			return "signUp/signupForm";
		} else {
			// 패스워드 인코딩
			String uPwd = user.getUPwd();
			String encodePwd = pwdEncoder.encode(uPwd);
			user.setUPwd(encodePwd);
			// 회원 정보 DB에 등록
			userService.setUser(user);
			// 회원 정보를 DB에서 불러와(auto_increment인 id까지 가져오기 위함)
			User u = userService.getUserInfo(user.getUEmail()); // id 뽑기
			userService.setInterest(u.getId(), user.getInterest());
//			m.addAttribute("user", user);
			// 계정 인증 메일 전송
			String message = mailService.sendMail(u);
			System.out.println(message);
			return "mainView/logInAgain";
		}
	}

}
