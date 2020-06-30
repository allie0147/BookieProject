package com.project.bookie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bookie.dto.board.Board;
import com.project.bookie.dto.boardViewList.BoardViewList;
import com.project.bookie.mapper.board.QnaBoardMapper;

import lombok.NoArgsConstructor;

@Service
@NoArgsConstructor
public class QnaBoardViewListService {
	private static final int BOARD_COUNT_PER_PAGE = 15;
	private BoardViewList boardViewList;
	
	@Autowired
	QnaBoardMapper mapper;

	public BoardViewList getViewListService(int pageNum) {
		int firstRow = (pageNum - 1)*BOARD_COUNT_PER_PAGE;
		int endRow = firstRow + BOARD_COUNT_PER_PAGE;
		
		System.out.println("pageNum : "+pageNum);
		System.out.println("firstRow : "+firstRow);
		System.out.println("endRow : "+endRow);
		System.out.println("BOARD_COUNT_PER_PAGE : "+BOARD_COUNT_PER_PAGE);
		
		int boardTotalCount = mapper.getCountOfTotalBoard();
		List<Board> boardList = mapper.getBoardListByCurrentPage(firstRow, BOARD_COUNT_PER_PAGE);
		boardViewList = new BoardViewList(boardTotalCount, BOARD_COUNT_PER_PAGE, boardList, pageNum, firstRow, endRow);
		
		return boardViewList;
	}
	
	public BoardViewList getViewListSearch(int pageNum, List<Board> boardList) {
		int firstRow = (pageNum - 1)*BOARD_COUNT_PER_PAGE;
		int endRow = firstRow + BOARD_COUNT_PER_PAGE;
		
		boardViewList = new BoardViewList(boardList.size(), BOARD_COUNT_PER_PAGE, boardList, pageNum, firstRow, endRow);
		
		return boardViewList;
	}
}
