package com.project.bookie.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;
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
import com.project.bookie.dto.board.BookCardBoard;
import com.project.bookie.dto.boardViewList.BoardViewList;
import com.project.bookie.dto.boardViewList.BookCardBoardViewList;
import com.project.bookie.service.BookCardBoardService;
import com.project.bookie.service.BookCardBoardViewListService;
import com.project.bookie.service.UserService;

@Controller
@RequestMapping("/bookcard")
public class BookCardBoardController {
	@Autowired
	BookCardBoardViewListService viewListService;
	@Autowired
	BookCardBoardService service;
	@Autowired
	UserService userService;

	@GetMapping("main")
	public String goBookCardBoardMain(Model m, @RequestParam(value = "p", defaultValue = "1", required = false) int p) {

		BookCardBoardViewList boardVL = viewListService.getViewListService(p);
		m.addAttribute("boardViewList", boardVL);
		List<BookCardBoard> boardViewListBest = service.getBoardListToMainBest3();
		m.addAttribute("boardViewListBest", boardViewListBest);

		// 랜덤으로 이미지 불러오기
		Set<Integer> randomImageNum = new HashSet<>();
		for (int i = 0; i < 50; i++) { // 순서 보장 X
			randomImageNum.add(i);
		}
		Iterator<Integer> randomImageNumIter = randomImageNum.iterator();
		m.addAttribute("randomImageNumIter", randomImageNumIter);

		// 페이지네이션
		List<Integer> pageArray = new ArrayList<>();
		int startNum;
		int endNum;

		if (boardVL.getPageTotalCount() <= 5) {
			for (int i = 1; i <= boardVL.getPageTotalCount(); i++) {
				pageArray.add(i);
			}
			startNum = pageArray.get(0);
			endNum = pageArray.get(pageArray.size() - 1);
		} else { // 총 페이지 수가 5이상일 때
			int i = 1;
			endNum = (boardVL.getPageTotalCount() - boardVL.getCurrentPageNumber() >= boardVL.getPageTotalCount() - 5)
					? 5 * i
					: boardVL.getPageTotalCount();
			while (p > 5 * i) {
				i++;
			}
//			System.out.println("현재 페이지네이션 범위 : " + (i - 1) * 5 + "~" + i * 5); // p가 5*i보다 작아지게 된 i의 값
			startNum = 5 * (i - 1) + 1;

			for (int j = startNum; j <= endNum; j++) {
				pageArray.add(j);
			}
		}
		int nextNum = boardVL.getPageTotalCount(); // viewList.getPageTotalCount()
		if (p + 5 < boardVL.getPageTotalCount()) {
			nextNum = p + 5;
		}
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String uEmail = auth.getName();
		if (!uEmail.equals("anonymousUser")) {
			long userId = userService.getUserIdByEmail(uEmail);
			m.addAttribute("userId", userId);
		}
		m.addAttribute("nextNum", nextNum);
		m.addAttribute("pageArray", pageArray);
		m.addAttribute("p", p);
		return "bookCard/bookcardMain.jsp?p=" + p;
	}
	
	@GetMapping("/search")
	public String getBoardListBySearchInfo(Model m, 
			@RequestParam(value = "query") String query,
			@RequestParam(value = "p", defaultValue = "1", required = false) int p) {
		List<BookCardBoard> boardList = service.getBoardListBySearchInfo(query);
		BookCardBoardViewList boardViewList = viewListService.getViewListSearch(p, boardList);
		m.addAttribute("boardViewList", boardViewList);
		
		return "bookCard/search_result.jsp?query=" + query + "&b=" + p;
	}
	
	@PostMapping(value = "/write", produces = "text/plain; charset=utf8")
	@ResponseBody
	public String writeOnBookCardBoard(@Param("userId") String userId, @Param("content") String content) {
		try {
			service.writeOnBoard(userId, content);
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
		return "true";
	}

	@PostMapping(value = "/edit", produces = "text/plain; charset=utf8")
	@ResponseBody
	public String editOnBookCardBoard(@Param("id") String id, @Param("content") String content) {
		try {
			service.editOnBoard(id, content);
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
		return "true";
	}
	@PostMapping(value = "/delete", produces = "text/plain; charset=utf8")
	@ResponseBody
	public String editOnBookCardBoard(@Param("id") String id) {
		try {
			service.deleteOnBoard(id);
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
		return "true";
	}
}
