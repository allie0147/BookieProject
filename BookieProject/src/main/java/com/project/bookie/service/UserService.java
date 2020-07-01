package com.project.bookie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bookie.dto.user.User;
import com.project.bookie.mapper.user.UserMapper;

@Service
public class UserService {
	@Autowired
	UserMapper userMapper;

	public void setUser(User user) {
		userMapper.insertUser(user);
	}

	public User getUserInfo() {
		User user = new User();
		return user;
	}

	public void setInterest(long userId, String[] interest) {
		for (String i : interest) {
			System.out.println(Integer.parseInt(i));
			userMapper.insertInterest(userId, Integer.parseInt(i));
		}
	}

//	 중복 체크 : 1->있음, 0->없음
	public int emailCheck(String uEmail) {
		return userMapper.countUserByEmail(uEmail);
	}

//	 중복 체크 : 1->있음, 0->없음
	public int nickCheck(String nickname) {
		return userMapper.countUserByNickname(nickname);
	}

//	 중복 체크 : 1->있음, 0->없음
	public int pwdCheck(String pwd) {
		return userMapper.countUserByPwd(pwd);
	}

	public User getUserId(String uEmail) {
		return userMapper.getUserByEmail(uEmail);
	}

}
