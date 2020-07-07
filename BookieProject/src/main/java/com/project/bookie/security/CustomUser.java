package com.project.bookie.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CustomUser extends User {

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private UserVO userVO;

	public CustomUser(String uEmail, String uPwd, Collection<? extends GrantedAuthority> authList) {
		super(uEmail, uPwd, authList);
		System.out.println("권한 없음: custom user 1 생성자");
	}

	public CustomUser(UserVO vo) {
		super(vo.getUEmail(), vo.getUPwd(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		this.userVO = vo;
		System.out.println("권한 있음: custom user 2 생성자 ");
	}

}
