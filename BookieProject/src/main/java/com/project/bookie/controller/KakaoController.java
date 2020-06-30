package com.project.bookie.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/bookie")
public class KakaoController {

	@RequestMapping(value = "/kakaologin", produces = "application/json", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam("code") String code, RedirectAttributes ra, HttpSession session,
			HttpServletResponse response) throws IOException {
		System.out.println("kakao code: " + code);
		return code;
	}

}
