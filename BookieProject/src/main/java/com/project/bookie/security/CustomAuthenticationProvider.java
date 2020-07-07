package com.project.bookie.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

public class CustomAuthenticationProvider implements AuthenticationProvider {

	private CustomUser customUser;

	@Autowired
	private CustomUserDetailsService userDetailsService;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		System.out.println("authenticate 들어옴"); // 들어옴
		String username = (String) authentication.getPrincipal();
		System.out.println("username: " + (String) authentication.getPrincipal());
		String password = (String) authentication.getCredentials();
		System.out.println("password: " + (String) authentication.getCredentials());

		customUser = (CustomUser) userDetailsService.loadUserByUsername(username);
		System.out.println("custom user : " + customUser);

		if (!matchPassword(password, customUser.getPassword())) {
			throw new BadCredentialsException(username);
		}
		if (!customUser.isEnabled()) {
			throw new BadCredentialsException(username);
		}
		return new UsernamePasswordAuthenticationToken(username, password, customUser.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

	private boolean matchPassword(String loginPwd, String password) {
		return loginPwd.equals(password); // boolean
	}

}
