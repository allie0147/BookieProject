package com.project.bookie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.bookie.dto.board.Board;
import com.project.bookie.dto.boardViewList.BoardViewList;
import com.project.bookie.service.BookCardBoardService;
import com.project.bookie.service.BookCardBoardViewListService;
import com.project.bookie.service.ClubBoardService;
import com.project.bookie.service.ClubBoardViewListService;
import com.project.bookie.service.QnaBoardService;
import com.project.bookie.service.QnaBoardViewListService;
import com.project.bookie.service.UserService;

@Controller
@RequestMapping("/bookie")
public class NavigateController {
	
	@Autowired
	UserService userService;
	@Autowired
	BookCardBoardService bcbViewService;
	@Autowired
	QnaBoardService qbVService;
	@Autowired
	ClubBoardService cbService;
	
	@GetMapping("/main")
	public String showMain(Model m) {
//			main화면 보여주기
		List<Board> MainQnaBoardList = qbVService.getBoardListLatest();
		List<Board> MainClubBoardList = cbService.getBoardListLatest();
		m.addAttribute("MainQnaBoardList", MainQnaBoardList);
		m.addAttribute("MainClubBoardList", MainClubBoardList);
		return "mainView/main";
	}

	@GetMapping("/QnA")
	public String showQnA() {
//		QnA화면 보여주기
		return "QnA/qnaMain";
	}

	@GetMapping("/mypage")
	public String showMypage() {
//		mypage 보여주기
		return "myPage/myPage";
	}

	@GetMapping("/bookclub")
	public String showBookclub() {
//		bookclub화면 보여주기
		return "bookClub/bookclubMain";
	}

	@GetMapping("/bookcard")
	public String showBookCard() {
//		bookcard화면 보여주기
		return "bookCard/bookcardMain";
	}

	@GetMapping("/cs")
	public String showInfo() {
//		고객센터화면 보여주기
		return "cs/cs";
	}

	@GetMapping("/login")
	public String showLogIn() {
//		로그인화면 보여주기
		return "login/logIn";
	}
	

}
