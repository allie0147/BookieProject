package com.project.bookie.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.project.bookie.dto.user.User;
import com.project.bookie.mapper.user.UserAuthMapper;
import com.project.bookie.mapper.user.UserMapper;

@Service
public class MailService {
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	TempKey tempKey;
	
	@Autowired
	UserAuthMapper userAuthMapper;
	
	@Autowired
	UserMapper userMapper;
	
	public String sendMail(User user) {
		
		String authKey = tempKey.getKey(10, false);
		userAuthMapper.insertUserWithKey(user.getId(), authKey);
		
		String setFrom = "teambookiecs@gmail.com";
		String tomail = user.getUEmail();
		String title = "bookie 회원가입 인증 메일";
		String content = "<h2>안녕하세요."+user.getNickname()+"</h2>"
				+ "<p>본인이 가입하신것이 맞다면 다음 링크를 눌러주세요.</p>"
				+ "인증하기 링크 : <a href='http://localhost:8080/certificationEmail?uId="+user.getId()+"&authkey="+authKey+"'>인증하기</a>";
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setFrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content, true); //html형식으로 전송
			
			mailSender.send(message);
			return "인증 메일 전송 성공";
		} catch (MessagingException e) {
			e.printStackTrace();
			return "인증 메일 전송 실패";
		}
	}
	
	public void sendEmailForPwd(User user) {
		//인증키 갱신
		String authKey = tempKey.getKey(10, false);
		userAuthMapper.updateUserWithKey(user.getId(), authKey);
		
		String setFrom = "teambookiecs@gmail.com";
		String tomail = user.getUEmail();
		String title = "bookie 비밀번호 재설정 인증";
		String content = "<h2></h2><p>비밀번호를 재설정 하시려면 다음 링크를 눌러주세요.</p>"
				+ "인증하기 링크 : <a href='http://localhost:8080/checkEmail?uId="+user.getId()+"&authkey="+authKey+"'>";
				
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setFrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content, true);
			
			mailSender.send(message);
		}catch (Exception e) {
			e.printStackTrace();	
		}
	}
}
