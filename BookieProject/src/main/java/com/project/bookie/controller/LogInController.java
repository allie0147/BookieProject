package com.project.bookie.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.bookie.service.UserService;

@Controller
public class LogInController {
	@Autowired
	UserService userService;

	@GetMapping("/login")
	public String showLogIn() {
//		로그인화면 보여주기
		return "login/logIn";
	}

	@PostMapping("/login")
	public String getInfo(Model m, String uEmail) {
//	로그인 성공시 user 정보 session에 담기
//	시큐리티적용
		return "redirect:main";
	}
}
