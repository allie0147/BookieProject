package com.project.bookie.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.bookie.dto.user.User;
import com.project.bookie.service.UserService;

@Controller
@RequestMapping("/bookie")
public class SignUpController {

	@Autowired
	UserService userService;

	@GetMapping("/userForm")
	public String getForm() {
//		회원가입페이지 이동
		System.out.println("get");
		return "signUp/signupForm";
	}

	@PostMapping("/userForm")
	public String signupProc(Model m, @ModelAttribute @Valid User user, BindingResult bindingResult,
			RedirectAttributes rttr) {
//		회원가입 완료 후 페이지 이동(alert만 있는 logInAgain)
		System.out.println("post: " + user);
		if (bindingResult.hasErrors()) {
			System.out.println(bindingResult);
			List<FieldError> errors = bindingResult.getFieldErrors();
			for (FieldError fe : errors) {
				System.out.println(fe.getField());
				m.addAttribute("E" + fe.getField(), fe.getField());
			}
			return "signUp/signupForm";
		} else {
			System.out.println("회원가입성공");
			userService.setUser(user);
			User u = userService.getUserId(user.getUEmail());
			userService.setInterest(u.getId(), user.getInterest());
			m.addAttribute("user", user);
			return "mainView/logInAgain";
		}
	}

}
