package com.project.bookie.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bookie.dto.board.Board;
import com.project.bookie.dto.boardViewList.BoardViewList;
import com.project.bookie.service.QnaBoardService;
import com.project.bookie.service.QnaBoardViewListService;

@Controller
@RequestMapping("/qna")
public class QnaBoardController {

	@Autowired
	QnaBoardViewListService viewListService;
	@Autowired
	QnaBoardService service;

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
			endNum = (boardViewList.getPageTotalCount()
					- boardViewList.getCurrentPageNumber() >= boardViewList.getPageTotalCount() - 5) ? 5 * i
							: boardViewList.getPageTotalCount();
			while (p > 5 * i) {
				i++;
			}
			System.out.println("현재 페이지네이션 범위 : " + (i - 1) * 5 + "~" + i * 5); // p가 5*i보다 작아지게 된 i의 값
			startNum = 5 * (i - 1) + 1;

			for (int j = startNum; j <= endNum; j++) {
				pageArray.add(j);
			}
			System.out.println(pageArray);
		}

		int nextNum = boardViewList.getPageTotalCount(); // viewList.getPageTotalCount()
		if (p + 5 < boardViewList.getPageTotalCount()) {
			nextNum = p + 5;
		}

		m.addAttribute("nextNum", nextNum);
		m.addAttribute("pageArray", pageArray);
		m.addAttribute("p", p);
		return "QnA/qnaMain.jsp?p=" + p;
	}

	@GetMapping("/detail")
	public String goDetailPage(Model m, @RequestParam(value = "b", defaultValue = "1", required = false) int boardId) {
		Board board = service.getBoardByBoardById(boardId);
		m.addAttribute("board", board);
		return "QnA/qnaBoardDetail.jsp?b=" + boardId;
	}

	@PostMapping("/main")
	@ResponseBody
	public BoardViewList getBoardListBySearchInfo(@RequestParam(value = "option") String option,
			@RequestParam(value = "searchInfo") String searchInfo,
			@RequestParam(value = "p", defaultValue = "1", required = false) int pageNum) {
		List<Board> boardList = service.getBoardListBySearchInfo(option, searchInfo);
		BoardViewList boardViewList = viewListService.getViewListSearch(pageNum, boardList);

		return boardViewList;
	}

	@GetMapping("/write")
	public String getWriteOnQnABoard() {
		return "QnA/qnaWrite";
	}
	
}
