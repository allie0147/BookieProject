package com.project.bookie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.bookie.dto.user.User;
import com.project.bookie.service.UserService;

@Controller
public class MyPageController {
	@Autowired
	UserService userService;

	@GetMapping("/mypage")
	public String showMypage(Model m) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String uEmail = auth.getName(); // 세션에 있는 유저이메일
		User mypageInfo = userService.getUserInfo(uEmail);
		m.addAttribute("mypageInfo", mypageInfo);
		return "myPage/myPage";
	}

	@GetMapping("/mypageUpdate")
	public String showMypageUpdate(Model m) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String uEmail = auth.getName(); // 세션에 있는 유저이메일
		User mypageInfo = userService.getUserInfo(uEmail);
		m.addAttribute("mypageInfo", mypageInfo);
		return "myPage/myPageUpdate";
	}
}
