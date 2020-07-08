package com.project.bookie.mapper.user;

import org.apache.ibatis.annotations.Param;

import com.project.bookie.security.UserVO;

public interface UserAuthMapper {

	// 권한 확인~~~
	public UserVO read(@Param("uEmail") String uEmail);

	// 권한 부여
	public void insertUserAuthWithuEmail(@Param("uEmail") String uEmail, @Param("auth") String auth);

	// 회원 인증 정보에 인증키 추가
	public void insertUserWithKey(@Param("uId") long uId, @Param("authKey") String authKey);

	// 비밀번호 재설정 전단계/이후에 인증키 갱신
	public void updateUserWithKey(@Param("uId") long uId, @Param("authKey") String authKey);

	// 해당 아이디가 이미 인증된 이메일인지 확인
	public int checkCertification(long uId);

	// 해당 아이디로 존재하는 키가 있는지 확인
	public String selectKeyWithId(long uId);
	// selectKeyWithId

	// 키가 있을 경우 해당 아이디의 인증 여부를 변경
	public void updateUserCertification(long uId);
}
