package com.project.bookie.security;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserAuth {
	private String uEmail; // user의 u_email 참조
	private String auth;
}
