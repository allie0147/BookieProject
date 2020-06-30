package com.project.bookie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bookie.dto.board.Board;
import com.project.bookie.mapper.board.QnaBoardMapper;

@Service
public class QnaBoardService {
	
	@Autowired
	QnaBoardMapper mapper;
	
	public Board getBoardByBoardById(int boardId) {
		Board board = mapper.getBoardByBoardIdWithComment(boardId);
		return board;
	}
	
	
	public List<Board> getBoardListBySearchInfo(String option, String searchInfo){
		List<Board> boardList = null;
		if(option.equals("title")) {
			boardList = mapper.getListByTitle(searchInfo);
			
		}else if(option.equals("content")) {
			boardList = mapper.getListByContent(searchInfo);
			
		}else { //option.equals("writer")
			boardList = mapper.getListByWriter(searchInfo);
			
		}
		return boardList;
	}
	
	public List<Board> getBoardListLatest(){
		List<Board> boardList = mapper.getBoardListToMain();
		return boardList;
	}
}
