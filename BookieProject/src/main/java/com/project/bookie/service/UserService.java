package com.project.bookie.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.bookie.dto.interest.Interest;
import com.project.bookie.dto.user.User;
import com.project.bookie.mapper.user.UserAuthMapper;
import com.project.bookie.mapper.user.UserMapper;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

@Service
public class UserService {

	public static final String ACCOUNT_SID = "AC386670919b29b9085024047e24813d2a";
	public static final String AUTH_TOKEN = "1635d54ab2f08dfec4aa12dcd9cc82de";

	@Autowired
	UserMapper userMapper;

	@Autowired
	UserAuthMapper userAuthMapper;

	@Autowired
	TempKey tempKey;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	public void setUser(User user) {
		userMapper.insertUser(user);
	}

	public User getUserInfo(String uEmail) {
		User user = userMapper.getUserByEmail(uEmail);
		return user;
	}

	public void updateUserPwd(int uId, String uPwd) {
		String pwdEncoding = passwordEncoder.encode(uPwd);
		userMapper.updatePwdById(uId, pwdEncoding);

		String authKey = tempKey.getKey(10, false);
		userAuthMapper.updateUserWithKey(uId, authKey);

	}

	public User getUserById(int id) {
		User user = userMapper.getUserById(id);
		return user;
	}

	public List<Interest> getAllInterestList() {
		List<Interest> interestList = userMapper.getAllInterestList();
		return interestList;
	}

	public void setInterest(long userId, String[] interest) {
		for (String i : interest) {
			userMapper.insertInterest(userId, Integer.parseInt(i));
		}
	}

	// user nickname 가져오기
	public String getUserNickname(String uEmail) {
		return userMapper.getUserNicknameByEmail(uEmail);
	}

//	user pwd 가져오기
	public String getUserPwd(String uEmail) {
		return userMapper.getUserPwd(uEmail);
	}

//	 중복 체크 : 1->있음, 0->없음
	public int emailCheck(String uEmail) {
		return userMapper.countUserByEmail(uEmail);
	}

//	 중복 체크 : 1->있음, 0->없음
	public int nickCheck(String nickname) {
		return userMapper.countUserByNickname(nickname);
	}

	public User getUserId(String uEmail) {
		return userMapper.getUserByEmail(uEmail);
	}

	public long getUserIdByEmail(String uEmail) {
		return userMapper.getUserIdByEmail(uEmail);
	}

	// 핸드폰 번호로 사용자 정보 조회(이메일 찾기에 사용)
	public User getUserByPhone(String phone) {
		return userMapper.getUserByPhone(phone);
	}

	// 핸드폰 번호로 문자 보내기(인증번호를 리턴)
	public int sendMessageWithPhone(int uId) {
		// 전달받은 id와 일치하는 id의 회원 반환
		User user = userMapper.getUserById(uId);

		Twilio.init(ACCOUNT_SID, AUTH_TOKEN); // username(ACCOUNT_SID), password(AUTH_TOKEN)를 입력받음
		Random ran = new Random();

		int authNum = ran.nextInt(9000) + 1000; // => 1000 ~ 9999 범위의 난수 생성

		// phoneNum(000-0000-0000)의 가장 앞자리수를 지우고 그 자리에 +82붙이기
		String phoneNum = "+82" + user.getPhone().substring(1);

		// Message.creator("to", "from", "content").create();
		Message message = Message.creator(new PhoneNumber(phoneNum), // "+821033955304"
				new PhoneNumber("+12057827269"),
				"This message is sended from Bookie. Your Verification PIN is " + authNum).create();

		System.out.println(message.getSid());
		return authNum;
	}

//	mypage update
	public void updateMypage(long uId, String nickname, String phone, int[] interestArr) {
		userMapper.updateMypage(uId, nickname, phone);
		userMapper.deleteInterest(uId);
		for (int i : interestArr) {
			Interest interest = new Interest(0, uId, i, "");
			userMapper.insertMypageInterest(interest);
		}
	}

//	회원 탈퇴
	public void deleteUserinSystem(Long uId) {
		userMapper.deleteUser(uId);
	}
}
