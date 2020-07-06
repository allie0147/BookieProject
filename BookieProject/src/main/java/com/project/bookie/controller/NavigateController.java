package com.project.bookie.controller;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.bookie.dto.board.Board;
import com.project.bookie.dto.board.BookCardBoard;
import com.project.bookie.dto.user.User;
import com.project.bookie.service.BookCardBoardService;
import com.project.bookie.service.ClubBoardService;
import com.project.bookie.service.QnaBoardService;
import com.project.bookie.service.UserService;

@Controller
public class NavigateController {
	
	@Autowired
	UserService userService;
	@Autowired
	BookCardBoardService bcbService;
	@Autowired
	QnaBoardService qbVService;
	@Autowired
	ClubBoardService cbService;
	
	@GetMapping("/")
	public String showMain(Model m) {
//			main화면 보여주기
		//랜덤으로 이미지 불러오기
		Random ran = new Random();
		Set<Integer> randomImageNum = new HashSet<>();
		while(randomImageNum.size() < 3) {
			int randomNum = ran.nextInt(5);
			randomImageNum.add(randomNum);
		}
		Iterator<Integer> randomImageNumIter = randomImageNum.iterator();
		m.addAttribute("randomImageNumIter", randomImageNumIter);
		
		List<BookCardBoard> bookCardBoardList = bcbService.getBoardListLatest();
		List<Board> MainQnaBoardList = qbVService.getBoardListLatest();
		List<Board> MainClubBoardList = cbService.getBoardListLatest();
		m.addAttribute("bookCardBoardList", bookCardBoardList);
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
	public String showMypage(Model m) {
		User mypageInfo = userService.getUserById(1); //세션에 있는 유저 아이디 들어갈 곳
		m.addAttribute("mypageInfo", mypageInfo);
//		mypage 보여주기
//		user 정보 받아오기
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

	@GetMapping("/mypageUpdate")
	public String showMypageUpdate() {
		return "myPage/myPageUpdate";
	}

}
