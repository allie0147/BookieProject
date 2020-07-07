package com.project.bookie.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import lombok.Data;

@Data
public class LoginFailureHandler implements AuthenticationFailureHandler {

	private String loginEmail;
	private String loginPwd;
	private String errorMsg;
	private String defaultFailureUrl; // "/login"으로 post -> controller에서 실행

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		System.out.println("~~~~~~~failure 들어옴");
		String username = request.getParameter(loginEmail);
		String password = request.getParameter(loginPwd);
		String errormsg = null;
		System.out.println(username + "  " + password);

		if (exception instanceof BadCredentialsException) {
			System.out.println(MessageUtils.getMessage("error.BadCredentials"));
			errormsg = MessageUtils.getMessage("error.BadCredentials");
		} else if (exception instanceof InternalAuthenticationServiceException) {
			System.out.println(MessageUtils.getMessage("error.BadCredentials"));
			errormsg = MessageUtils.getMessage("error.BadCredentials");
		} else if (exception instanceof DisabledException) {
			errormsg = MessageUtils.getMessage("error.Disaled");
		} else if (exception instanceof CredentialsExpiredException) {
			errormsg = MessageUtils.getMessage("error.CredentialsExpired");
		}
		request.setAttribute(loginEmail, username);
		request.setAttribute(loginPwd, password);
		request.setAttribute(errorMsg, errormsg);
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
	}
}
