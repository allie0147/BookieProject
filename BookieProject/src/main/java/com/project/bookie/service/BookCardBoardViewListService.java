package com.project.bookie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bookie.dto.board.Board;
import com.project.bookie.dto.board.BookCardBoard;
import com.project.bookie.dto.boardViewList.BoardViewList;
import com.project.bookie.dto.boardViewList.BookCardBoardViewList;
import com.project.bookie.mapper.board.BookCardBoardMapper;

import lombok.NoArgsConstructor;

@Service
@NoArgsConstructor
public class BookCardBoardViewListService {
	private static final int BOARD_COUNT_PER_PAGE = 9;
	private BookCardBoardViewList boardViewList;

	@Autowired
	BookCardBoardMapper mapper;

	public BookCardBoardViewList getViewListService(int pageNum) {
		int firstRow = (pageNum - 1) * BOARD_COUNT_PER_PAGE;
		int endRow = firstRow + BOARD_COUNT_PER_PAGE;
		int boardTotalCount = mapper.getCountOfTotalBoard();

		List<BookCardBoard> boardList = mapper.getBoardListByCurrentPage(firstRow, BOARD_COUNT_PER_PAGE);
		boardViewList = new BookCardBoardViewList(boardTotalCount, BOARD_COUNT_PER_PAGE, boardList, pageNum, firstRow,
				endRow);

		return boardViewList;
	}

	public BookCardBoardViewList getViewListSearch(int pageNum, List<BookCardBoard> boardList) {
		int firstRow = (pageNum - 1) * BOARD_COUNT_PER_PAGE;
		int endRow = firstRow + BOARD_COUNT_PER_PAGE;

		BookCardBoardViewList boardViewList = new BookCardBoardViewList(boardList.size(), BOARD_COUNT_PER_PAGE, boardList, pageNum, firstRow, endRow);

		return boardViewList;
	}

}
