package com.project.bookie.service;

import java.util.Random;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class MessageService {
	// Find your Account Sid and Token at twilio.com/user/account
	public static final String ACCOUNT_SID = "AC386670919b29b9085024047e24813d2a";
	public static final String AUTH_TOKEN = "1635d54ab2f08dfec4aa12dcd9cc82de";
	
	public static void main(String[] args) {
		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
		Random ran = new Random();
		StringBuffer numStr = new StringBuffer();
		
		while(numStr.length() < 4) {
			int num = ran.nextInt(10);
			numStr.append(num);
		}
		
		Message message = Message.creator(new PhoneNumber("+821033955304"),
				new PhoneNumber("+12057827269"), 
				"This message is sended from Bookie. Your Verification PIN is "+numStr).create();
		
		System.out.println(message.getSid());
	}
}
