package com.project.bookie.mapper.user;

import org.apache.ibatis.annotations.Param;

public interface UserAuthMapper {
	
	//회원 인증 정보에 인증키 추가
	public void updateUserWithKey(@Param("uId")long uId, @Param("authKey")String authKey);
	
	//해당 아이디가 이미 인증된 이메일인지 확인
	public int checkCertification(int uId);
	
	//해당 아이디로 존재하는 키가 있는지 확인
	public String selectKeyWithId(int uId);
	//			selectKeyWithId
	
	//키가 있을 경우 해당 아이디의 인증 여부를 변경
	public void updateUserCertification(int uId);
}
