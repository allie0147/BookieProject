package com.project.bookie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.bookie.service.UserService;

@RestController
public class RestSignupController {
	@Autowired
	UserService userService;

//  중복 체크 : 1->중복, 0->가능
	@GetMapping(value = "/chkEmail", produces = "text/plain")
	@ResponseBody
	public String chkEmail(@RequestParam("email") String uEmail) {
//		System.out.println(uEmail);
		return String.valueOf(userService.emailCheck(uEmail));
	}

	@GetMapping(value = "/chkNick", produces = "text/plain")
	@ResponseBody
	public String chkNick(String nickname) {
//		System.out.println(nickname);
		return String.valueOf(userService.nickCheck(nickname));
	}

}
