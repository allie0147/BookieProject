package com.project.bookie.security;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.project.bookie.mapper.user.UserAuthMapper;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private UserAuthMapper userAuthMapper;

	@Override
	public UserDetails loadUserByUsername(@Param("uEmail") String uEmail) throws UsernameNotFoundException {
		System.out.println("user name : " + uEmail);
		UserVO vo = userAuthMapper.read(uEmail);
		System.out.println("load user: " + uEmail);
		System.out.println("userVo: " + vo);
		if (vo == null) {
			System.out.println("vo는 null");
			return null;
		} else {
			System.out.println("vo는 new");
			return new CustomUser(vo);
		}
	}
}
