package com.project.bookie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bookie.dto.board.Board;
import com.project.bookie.mapper.board.ClubBoardMapper;
import com.project.bookie.mapper.user.UserMapper;

@Service
public class ClubBoardService {
	@Autowired
	ClubBoardMapper mapper;


	public Board getBoardByBoardById(long boardId) {
		Board board = mapper.getBoardByBoardIdWithComment(boardId);
		return board;
	}

	public List<Board> getBoardListLatest() {
		List<Board> boardList = mapper.getBoardListToMain();
		return boardList;
	}

	public long writeOnBoard(Board board) {
		mapper.insertBoard(board);
		System.out.println(board.getId());
		return board.getId(); // board id
	}
}
