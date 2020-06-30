package com.project.bookie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bookie.dto.board.Board;
import com.project.bookie.mapper.board.ClubBoardMapper;

@Service
public class ClubBoardService {
	@Autowired
	ClubBoardMapper mapper;
	
	public Board getBoardByBoardById(int boardId) {
		Board board = mapper.getBoardByBoardIdWithComment(boardId);
		return board;
	}
}
