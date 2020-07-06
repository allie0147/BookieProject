package com.project.bookie.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.bookie.dto.board.BookCardBoard;
import com.project.bookie.dto.boardViewList.BookCardBoardViewList;
import com.project.bookie.service.BookCardBoardService;
import com.project.bookie.service.BookCardBoardViewListService;

@Controller
@RequestMapping("/bookcard")
public class BookCardBoardController {
	@Autowired
	BookCardBoardViewListService viewListService;
	@Autowired
	BookCardBoardService service;
	
	@GetMapping("main")
	public String goBookCardBoardMain(Model m, @RequestParam(value="p", defaultValue = "1", required = false)int pageNum) {
		BookCardBoardViewList boardViewList = viewListService.getViewListService(pageNum);
		List<BookCardBoard> boardViewListBest = service.getBoardListToMainBest3();
		m.addAttribute("boardViewListBest", boardViewListBest);
		m.addAttribute("boardViewList", boardViewList);
		
		List<Integer> pageArray = new ArrayList<>();
		int startNum;
		int endNum;
		
		if(boardViewList.getPageTotalCount() <= 5) {
			for(int i=1; i <= boardViewList.getPageTotalCount(); i++) {
				pageArray.add(i);
			}
			startNum = pageArray.get(0);
			endNum = pageArray.get(pageArray.size()-1);
		}else { //총 페이지 수가 5이상일 때
			int i = 1;
			while(pageNum > 5*i) {
				i++;
			}
			
			System.out.println("현재 페이지네이션 범위 : "+(i-1)*5+"~"+i*5); //p가 5*i보다 작아지게 된 i의 값
			
			startNum = 5*(i - 1) + 1;
			endNum = 5*i;
			for(int j = startNum; j <= endNum; j++) {
				pageArray.add(j);
			}
		}
		
		int prevNum = 1;
		if(pageNum - 5 > 0) {
			prevNum = pageNum - 5;
		}
		int nextNum = boardViewList.getPageTotalCount(); //viewList.getPageTotalCount()
		if(pageNum + 5 < boardViewList.getPageTotalCount()) {
			nextNum = pageNum + 5;
		}
		
		m.addAttribute("prevNum", prevNum);
		m.addAttribute("nextNum", nextNum);
		m.addAttribute("pageArray", pageArray);
		return "bookCard/bookcardMain.jsp?p="+pageNum;
	}
	
	@GetMapping("/detail")
	public String goDetailPage(Model m, @RequestParam(value="b", defaultValue = "1", required = false)int boardId) {
		BookCardBoard board = service.getBoardByBoardById(boardId);
		m.addAttribute("board", board);
		return "bookCard/bookCardBoardDetail.jsp?b="+boardId;
	}

}
