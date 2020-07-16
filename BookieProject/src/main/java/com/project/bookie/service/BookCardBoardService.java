package com.project.bookie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.bookie.dto.board.BookCardBoard;
import com.project.bookie.mapper.board.BookCardBoardMapper;

@Service
public class BookCardBoardService {
	@Autowired
	BookCardBoardMapper mapper;

	public List<BookCardBoard> getBoardListLatest() {
		List<BookCardBoard> bookCardBoardList = mapper.getBoardListToMain();
		return bookCardBoardList;
	}

	public List<BookCardBoard> getBoardListToMainBest3() {
		List<BookCardBoard> bookCardBoradListBest = mapper.getBoardListToMainBest();
		return bookCardBoradListBest;
	}

	public void writeOnBoard(String userId, String content) {
		mapper.insertBoard(userId, content);
	}

	public void editOnBoard(String id, String content) {
		mapper.updateBoard(id, content);
	}

	public void deleteOnBoard(String id) {
		mapper.deleteBoard(Long.valueOf(id));
	}

//	검색 기능
	public List<BookCardBoard> getBoardListBySearchInfo(String option, String query) {
		List<BookCardBoard> boardList = null;
		if (option.equals("content")) {
			boardList = mapper.getListByContent(query);
		} else { // option.equals("writer")
			boardList = mapper.getListByWriter(query);
		}
		return boardList;
	}
}
