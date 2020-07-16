package com.project.bookie.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.bookie.security.CustomAccessSuccessHandler;
import com.project.bookie.security.CustomUser;
import com.project.bookie.security.CustomUserDetailsService;
import com.project.bookie.service.UserService;

@RestController
public class RestLogInController {

	@Autowired
	UserService userService;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Autowired
	CustomUserDetailsService userDetailsService;

	@Autowired
	CustomAccessSuccessHandler accessSuccessHandler;

//	https://joswlv.github.io/2018/02/20/spring_security_basics/
	@PostMapping(value = "/loginChk", produces = "text/html; charset=utf8")
	public String loginChk(@RequestParam("uEmail") String uEmail, @RequestParam("uPwd") String uPwd,
			HttpServletRequest request, HttpServletResponse response, Authentication auth) {
//		System.out.println("1. ajax controller: " + uEmail);
//		System.out.println("2. ajax controller: " + uPwd);
		String password = userDetailsService.loadUserByUsername(uEmail).getPassword();
		CustomUser u = (CustomUser) userDetailsService.loadUserByUsername(uEmail);
		if (userDetailsService.loadUserByUsername(uEmail) == null) { // 권한 없음?
			return "0";
		} else {
			if ((userService.emailCheck(uEmail) == 1) && passwordEncoder.matches(uPwd, password)) {
				UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(u.getUsername(),
						u.getPassword());
				SecurityContextHolder.getContext().setAuthentication(token); // user chk 생성
//				System.out.println("SecurityContextHolder.getContext().getAuthentication()"+ SecurityContextHolder.getContext().getAuthentication());
				try {
					accessSuccessHandler.onAuthenticationSuccess(request, response, SecurityContextHolder.getContext().getAuthentication());
				} catch (IOException | ServletException e) {
					e.printStackTrace();
				}
//				session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY,
//						SecurityContextHolder.getContext()); // session 생성
//				return new AuthenticationToken(authentication.getName(), userManageService.getLevel(authentication.getAuthorities()), session.getId());
				return "1";

			} else {
				return "0";
			}
		}
	}
}
