package com.project.bookie.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomLogOutSuccessHandler implements LogoutSuccessHandler {

	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		if (authentication != null) {
			try {
				System.out.println("authentication : " + authentication);
				request.getSession().invalidate(); // session 삭제 처리
				System.out.println("User Successfully Logout");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		response.setStatus(HttpServletResponse.SC_OK);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(
				"<script>window.addEventListener('DOMContentLoaded', function() {alert('로그아웃 되었습니다.'); location.replace('/');});</script>");
		out.flush();
	}

}
