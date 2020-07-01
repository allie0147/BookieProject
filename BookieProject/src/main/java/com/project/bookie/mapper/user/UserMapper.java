package com.project.bookie.mapper.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.bookie.dto.user.User;

public interface UserMapper {

	// 전체 회원 조회
	public List<User> getAllUser(); // admin용

	// 유저 id로 회원 조회
	public User getUserById();

	// 이메일로 회원 조회(비밀번호 찾기)
	public User getUserByEmail(String Email);

	// 연락처로 회원 조회(아이디 찾기, 비밀번호 찾기)
	public User getUserByPhone(String phone);

	// 이메일 검사!!! (login, signup)
	public int countUserByEmail(String uEmail);

	// 닉네임 검사!!! (signup)
	public int countUserByNickname(String nickname);

	// 비밀번호 검사 !!! (login, signup)
	public int countUserByPwd(@Param("pwd")String pwd);

	// 회원 정보 등록
	public void insertUser(User user);

	// 회원 정보 등록2: interest
	public void insertInterest(@Param("userId") long userId, @Param("genreId") int genreId);

	// 회원 연락처 변경
	public void updateUserWithPhone(User user);

	// 회원 별명 변경
	public void updateUserWithNickName(User user);
	
	//회원 이메일 인증 여부 변경
	public void updateUserWithId(int uId);
	
	// 회원 정보 삭제(탈퇴)
	public void deleteUser(int id);

}
