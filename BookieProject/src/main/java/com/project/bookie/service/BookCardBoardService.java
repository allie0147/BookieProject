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

	public List<BookCardBoard> getBoardListBest3() {
		List<BookCardBoard> bookCardBoradListBest = mapper.getBoardListBest();
		return bookCardBoradListBest;
	}

//	board CRUD
//	insert
	public void writeOnBoard(String userId, String content) {
		mapper.insertBoard(userId, content);
	}

//	update
	public void editOnBoard(String id, String content) {
		mapper.updateBoard(id, content);
	}

//	delete
	public void deleteOnBoard(String id) {
		mapper.deleteBoard(Integer.parseInt(id));
	}

//	select like_cnt	
	public int getLikeCnt(int id) {
		return mapper.selectLikeCnt(id);
	}

//	likeUp
	public int likeCntUp(int id) {
		int count = mapper.selectLikeCnt(id) + 1;
		System.out.println("up count: " + count);
		mapper.likeCntUp(count, id);
		return count;
	}

//	likeDown
	public int likeCntDown(int id) {
		int count = mapper.selectLikeCnt(id) - 1;
		System.out.println("down count: " + count);
		mapper.likeCntDown(count, id);
		return count;
	}

//	검색 기능
	public List<BookCardBoard> getBoardListBySearchInfo(String query) {
		List<BookCardBoard> boardList = null;
		boardList = mapper.getListByContentOrWriter(query);
		return boardList;
	}
}
