package com.project.bookie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bookie.service.UserService;

@Controller
public class RestLogInController {

	@Autowired
	UserService userService;

//  중복 체크 : 1->있음, 0->없음
	@GetMapping(value = "/loginEmail", produces = "text/plain")
	@ResponseBody
	public String chkEmail(@RequestParam("email") String uEmail) {
		System.out.println(uEmail);
		return String.valueOf(userService.emailCheck(uEmail));
	}

	@GetMapping(value = "/loginPwd", produces = "text/plain")
	@ResponseBody
	public String chkNick(String pwd) {
		System.out.println(pwd);
		return String.valueOf(userService.pwdCheck(pwd));
	}
}
