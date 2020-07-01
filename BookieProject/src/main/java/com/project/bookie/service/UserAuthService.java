package com.project.bookie.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.project.bookie.mapper.user.UserAuthMapper;

public class UserAuthService {
	
	@Autowired
	UserAuthMapper mapper;
	
	public Boolean updateCertification(int uId, String authkey) {
		Boolean result;
		int certif = mapper.checkCertification(uId); //이 회원 아이디가 최초 인증인지 검증
		if(certif == 1) { //이미 인증한 이메일일 경우(인증 메일의 링크를 두번 이상 누른 경우)
			result =  false;
		}else { //처음 인증하는 경로일 경우
			String key = mapper.selectKeyWithId(uId); //userAuth 테이블에 해당 회원 아이디의 인증키를 가져옴
			if(key.equals(authkey)) {
				mapper.updateUserCertification(uId); //user테이블에서의 회원 인증 여부를 변경(0 -> 1)
				result = true;
			}else {
				result = false;
			}
		}
		return result;
	}
}
