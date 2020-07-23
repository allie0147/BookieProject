package com.project.bookie.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bookie.dto.interest.Interest;
import com.project.bookie.dto.user.User;
import com.project.bookie.service.UserService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	@Autowired
	UserService userService;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@GetMapping("/info")
	public String showMypage(Model m) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String uEmail = auth.getName(); // 세션에 있는 유저이메일
		User mypageInfo = userService.getUserInfo(uEmail);
		m.addAttribute("mypageInfo", mypageInfo);
		return "myPage/myPage";
	}

	@GetMapping("/updateForm")
	public String showMypageUpdate(Model m) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String uEmail = auth.getName(); // 세션에 있는 유저이메일
		User mypageInfo = userService.getUserInfo(uEmail);
		m.addAttribute("mypageInfo", mypageInfo);

		List<Interest> allInterestList = userService.getAllInterestList();
		m.addAttribute("allInterestList", allInterestList);
		return "myPage/myPageUpdate";
	}

	@PostMapping("/update")
	public String mypageUpdate(long id, String nickname, String phone,
			@RequestParam("interestArray[]") int[] interestArray) {
		userService.updateMypage(id, nickname, phone, interestArray);
		return "/myPage/myPage";
	}

	@GetMapping("/unsubscribe")
	public String unsubscribeChk(Model m) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String uEmail = auth.getName();
		m.addAttribute("uEmail", uEmail);
		return "myPage/unsubscribe";
	}

	@PostMapping(value = "/unsubscribe", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String deleteUser(@RequestParam(value = "uEmail") String uEmail, @RequestParam(value = "pwd") String pwd) {
		System.out.println(uEmail);
		System.out.println(pwd);
		String db_pwd = userService.getUserPwd(uEmail); // db의 user pwd
		if (passwordEncoder.matches(pwd, db_pwd) == true) {
			System.out.println("success!");
			userService.deleteUserinSystem(userService.getUserIdByEmail(uEmail));
			System.out.println("return");
			return "true";
		} else {
			System.out.println("false");
			return "false";
		}
	}
}
