package com.project.bookie.mapper.user;

public interface UserAuthMapper {
	
	//해당 아이디가 이미 인증된 이메일인지 확인
	public int checkCertification(int uId);
	
	//해당 아이디로 존재하는 키가 있는지 확인
	public String selectKeyWithId(int uId);
	
	//키가 있을 경우 해당 아이디의 인증 여부를 변경
	public void updateUserCertification(int uId);
}
