package com.project.bookie.dto.boardViewList;

import java.util.List;

import com.project.bookie.dto.board.BookCardBoard;

import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class BookCardBoardViewList {
	private int boardTotalCount;
	private int boardCountPerPage;
	private List<BookCardBoard> bookCardBoardList;
	private int currentPageNumber;
	private int pageTotalCount;
	private int firstRow;
	private int endRow;

	public BookCardBoardViewList(int boardTotalCount, int boardCountPerPage, List<BookCardBoard> boardList,
			int currentPageNumber, int firstRow, int endRow) {
		this.boardTotalCount = boardTotalCount;
		this.boardCountPerPage = boardCountPerPage;
		this.bookCardBoardList = boardList;
		this.currentPageNumber = currentPageNumber;
		this.firstRow = firstRow;
		this.endRow = endRow;
		
		if(boardTotalCount == 0) {
			pageTotalCount = 1;
		}else {
			pageTotalCount = boardTotalCount / boardCountPerPage;
			
			if(boardTotalCount % boardCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}
	
	
}
