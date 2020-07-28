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
	public int likeCntUp(long id) {
		int count = mapper.selectLikeCnt(id) + 1;
		System.out.println("up count: " + count);
		mapper.likeCntUp(count, id);
		return count;
	}

//	likeDown
	public int likeCntDown(long id) {
		int count = mapper.selectLikeCnt(id) - 1;
		System.out.println("down count: " + count);
		mapper.likeCntDown(count, id);
		return count;
	}

//	bookmark-added
	public int addedBookmark(long boardId, long userId) {
		try {
			mapper.addBookmark(boardId, userId);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 0;
	}

// bookmark-removed
	public int removedBookmark(long boardId, long userId) {
		try {
			mapper.deleteBookmark(boardId, userId);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 0;
	}

//	get bookmark
	public List<Long> getBookmark(long userId) {
		return mapper.selectBookmark(userId);
	}

//	검색 기능
	public List<BookCardBoard> getBoardListBySearchInfo(String query) {
		List<BookCardBoard> boardList = null;
		boardList = mapper.getListByContentOrWriter(query);
		return boardList;
	}
}
