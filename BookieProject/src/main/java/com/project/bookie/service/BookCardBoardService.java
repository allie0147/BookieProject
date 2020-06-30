package com.project.bookie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bookie.dto.board.Board;
import com.project.bookie.dto.board.BookCardBoard;
import com.project.bookie.mapper.board.BookCardBoardMapper;

@Service
public class BookCardBoardService {
	@Autowired
	BookCardBoardMapper mapper;

	public BookCardBoard getBoardByBoardById(int boardId) {
		BookCardBoard board = mapper.getBoardByBoardId(boardId);
		return board;
	}
	
	public List<BookCardBoard> getBoardListLatest(){
		List<BookCardBoard> bookCardBoardList = mapper.getBoardListToMain();
		return bookCardBoardList;
	}
	
}
