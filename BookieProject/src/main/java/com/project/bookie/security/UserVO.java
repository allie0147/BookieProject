package com.project.bookie.security;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {
	private String uEmail;
	private String uPwd;
	private String nickname;
	private boolean enabled;
	private List<UserAuth> authList; // role 담는 list
}
