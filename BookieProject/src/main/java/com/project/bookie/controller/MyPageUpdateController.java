package com.project.bookie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MyPageUpdateController {

	@PostMapping("/mypage")
	public String updateMyPage() {
		return "";
	}
}
