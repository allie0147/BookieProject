package com.project.bookie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.bookie.service.UserAuthService;

@Controller
public class CertificationEmailController {

	@Autowired
	UserAuthService service;

	@RequestMapping("/certificationEmail")
	public String emailConfirm(Model m, long uId, String authkey) {
		Boolean result = service.updateCertification(uId, authkey);
		if (result) { // 인증성공
			m.addAttribute("result", true);
		} else {
			m.addAttribute("result", false);
		}
		return "/mainView/cr";
	}
}
