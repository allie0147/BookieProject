package com.project.bookie.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.project.bookie.dto.user.User;
import com.project.bookie.mapper.user.UserAuthMapper;
import com.project.bookie.mapper.user.UserMapper;

@Service
public class UserAuthService {

	@Autowired
	UserAuthMapper authMapper;

	@Autowired
	UserMapper userMapper;

	@Autowired
	UserAuthMapper userAuthMapper;

	@Autowired
	TempKey tempKey;

	@Autowired
	JavaMailSender mailSender;

	public Boolean updateCertification(long uId, String authkey) {
		Boolean result;
		int certif = authMapper.checkCertification(uId); // 이 회원 아이디가 최초 인증인지 검증
		if (certif == 1) { // 이미 인증한 이메일일 경우(인증 메일의 링크를 두번 이상 누른 경우)
			result = false;
		} else { // 처음 인증하는 경로일 경우
			String key = authMapper.selectKeyWithId(uId); // userAuth 테이블에 해당 회원 아이디의 인증키를 가져옴
			if (key.equals(authkey)) {
				authMapper.updateUserCertification(uId); // user테이블에서의 회원 인증 여부를 변경(0 -> 1)
				User u = userMapper.getUserById(uId); // user정보 가져오기 : userAuthMapper.read(u.getUEmail()) 사용하려고
				authMapper.insertUserAuthWithuEmail(u.getUEmail(), "ROLE_MEMBER"); // 메일 승인 후, 권한 부여
				result = true;
			} else {
				result = false;
			}
		}
		return result;
	}

	// 비밀번호 재설정을 위해 새로운 인증키를 생성하고 이를 이용해 DB의 인증키 업데이트, 인증 메일 전송
	public void ckUserForChangePwd(int uId) {
		User user = userMapper.getUserById(uId);

		// 인증키 갱신
		String authKey = tempKey.getKey(10, false);
		authMapper.updateUserWithKey(user.getId(), authKey);

		String setFrom = "teambookiecs@gmail.com";
		String tomail = user.getUEmail();
		String title = "bookie 비밀번호 재설정 인증";
		String content = "<h2></h2><p>비밀번호를 재설정 하시려면 다음 링크를 눌러주세요.</p>"
				+ "인증하기 링크 : <a href='http://localhost:8080/resetpwd?uId=" + user.getId() + "&authkey=" + authKey + "'>"
				+ "인증하기</a>";
		MimeMessage message = mailSender.createMimeMessage();

		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setFrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content, true);

			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 링크에서 제공한 인증키가 현재 DB의 인증키와 일치하는지
	public User ckAuthKey(int uId, String authKey) {
		String authKeyRs = authMapper.selectKeyWithId(uId);
		User user;

		if (authKeyRs.equals(authKey)) {
			user = userMapper.getUserById(uId);
		} else {
			user = null;
		}
		return user;
	}

}
