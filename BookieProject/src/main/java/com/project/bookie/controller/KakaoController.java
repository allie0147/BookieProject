package com.project.bookie.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.project.bookie.service.KakaoAccessToken;
import com.project.bookie.service.KakaoUserInfo;

@Controller
public class KakaoController {

	@RequestMapping(value = "/kakaologin", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String kakaoLogin(@RequestParam("code") String code, RedirectAttributes ra, HttpSession session,
			HttpServletResponse response, Model m) throws IOException {
//		System.out.println("kakao code: " + code);
		JsonNode accessToken;

		// JsonNode트리형태로 토큰받아온다
		JsonNode jsonToken = KakaoAccessToken.getKakaoAccessToken(code);
		// 여러 json객체 중 access_token을 가져온다
		accessToken = jsonToken.get("access_token");

//		System.out.println("access_token : " + accessToken);

		// access_token을 통해 사용자 정보 요청
		JsonNode userInfo = KakaoUserInfo.getKakaoUserInfo(accessToken);

		// 유저정보 카카오에서 가져오기 Get properties
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");

		// 정보 파싱
		String id = userInfo.path("id").asText();
		String nickname = properties.path("nickname").asText();
		String uEmail = kakao_account.path("email").asText();

//		System.out.println("id : " + id);
//		System.out.println("nickname : " + nickname);
//		System.out.println("uEmail : " + uEmail);

		m.addAttribute("nickname", nickname);
		m.addAttribute("uEmail", uEmail);

		return "signUp/signupForm"; // 회원가입으로 돌리기
	}

}
