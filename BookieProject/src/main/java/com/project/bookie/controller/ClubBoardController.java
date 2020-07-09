package com.project.bookie.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bookie.dto.board.Board;
import com.project.bookie.dto.boardViewList.BoardViewList;
import com.project.bookie.dto.user.User;
import com.project.bookie.service.ClubBoardService;
import com.project.bookie.service.ClubBoardViewListService;
import com.project.bookie.service.UserService;

@Controller
@RequestMapping("/club")
public class ClubBoardController {

	@Autowired
	ClubBoardViewListService viewListService;

	@Autowired
	ClubBoardService service;

	@Autowired
	UserService userService;

	@GetMapping("/main")
	public String goQnaMain(Model m, @RequestParam(value = "p", defaultValue = "1", required = false) int p) {
		BoardViewList boardViewList = viewListService.getViewListService(p);
		m.addAttribute("boardViewList", boardViewList);

		List<Integer> pageArray = new ArrayList<>();
		int startNum;
		int endNum;

		if (boardViewList.getPageTotalCount() <= 5) {
			for (int i = 1; i <= boardViewList.getPageTotalCount(); i++) {
				pageArray.add(i);
			}
			startNum = pageArray.get(0);
			endNum = pageArray.get(pageArray.size() - 1);
		} else { // 총 페이지 수가 5이상일 때
			int i = 1;
			while (p > 5 * i) {
				i++;
			}

//			System.out.println("현재 페이지네이션 범위 : "+(i-1)*5+"~"+i*5); //p가 5*i보다 작아지게 된 i의 값

			startNum = 5 * (i - 1) + 1;
			endNum = 5 * i;
			for (int j = startNum; j <= endNum; j++) {
				pageArray.add(j);
			}
		}

		int prevNum = 1;
		if (p - 5 > 0) {
			prevNum = p - 5;
		}
		int nextNum = boardViewList.getPageTotalCount(); // viewList.getPageTotalCount()
		if (p + 5 < boardViewList.getPageTotalCount()) {
			nextNum = p + 5;
		}

		m.addAttribute("prevNum", prevNum);
		m.addAttribute("nextNum", nextNum);
		m.addAttribute("pageArray", pageArray);
		return "bookClub/bookclubMain.jsp?p=" + p;
	}

	@GetMapping("/detail")
	public String goDetailPage(Model m, @RequestParam(value = "b", defaultValue = "1", required = false) long boardId) {
		Board board = service.getBoardByBoardById(boardId);
		m.addAttribute("board", board);
		return "bookClub/bookClubBoardDetail.jsp?b=" + boardId;
	}

	@GetMapping("/write")
	public String getWriteOnClubBoard(Model m) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String uEmail = auth.getName(); // 세션에 있는 유저이메일
		User user = userService.getUserInfo(uEmail);
		m.addAttribute("user", user);
		return "bookClub/bookClubWrite";
	}

	@PostMapping(value = "/write", produces = "text/plain; charset=utf8")
	@ResponseBody
	public String insertWriteOnClubBoard(Board board) {
		long userId = userService.getUserIdByEmail(board.getUEmail());
		// user id , user nickname board에 추가
		board.setUserId(userId);
		board.setWriter(userService.getUserNickname(board.getUEmail()));
		System.out.println("board 정보 완성 : " + board);
		long boardId = service.writeOnBoard(board);
		return String.valueOf(boardId);
	}

}
