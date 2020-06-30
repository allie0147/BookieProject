package com.project.bookie.dto.boardViewList;

import java.util.List;

import com.project.bookie.dto.board.Board;

import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class BoardViewList {
	private int boardTotalCount;
	private int boardCountPerPage;
	private List<Board> boardList;
	private int currentPageNumber;
	private int pageTotalCount;
	private int firstRow;
	private int endRow;
	
	public BoardViewList(int boardTotalCount, int boardCountPerPage, List<Board> boardList, int currentPageNumber,
			int firstRow, int endRow) {
		this.boardTotalCount = boardTotalCount;
		this.boardCountPerPage = boardCountPerPage;
		this.boardList = boardList;
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
