package com.project.bookie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bookie.dto.board.Board;
import com.project.bookie.dto.comment.Comment;
import com.project.bookie.mapper.board.QnaBoardMapper;
import com.project.bookie.mapper.comment.QnaCommentMapper;

@Service
public class QnaBoardService {

	@Autowired
	QnaBoardMapper mapper;

	@Autowired
	QnaCommentMapper commentMapper;

	public Board getBoardByBoardById(int boardId) {
		Board board = mapper.getBoardByBoardIdWithComment(boardId);
		List<Comment> commentList = board.getCommentList();
		for (Comment comment : commentList) {
			String commentStr = comment.getWtDate().toString();
			String head = commentStr.substring(0, 10);
			String tail = commentStr.substring(11, 16);
			commentStr = head + " " + tail;
			comment.setWtDate_str(commentStr);
		}
		board.setCommentList(commentList);
		String boardDate = board.getWtDate().toString();
		String head = boardDate.substring(0, 10);
		String tail = boardDate.substring(11, 16);
		boardDate = head + " " + tail;
		board.setWtDate_str(boardDate);
		return board;
	}

	public List<Board> getBoardListBySearchInfo(String option, String searchInfo) {
		List<Board> boardList = null;
		if (option.equals("title")) {
			boardList = mapper.getListByTitle(searchInfo);

		} else if (option.equals("content")) {
			boardList = mapper.getListByContent(searchInfo);

		} else { // option.equals("writer")
			boardList = mapper.getListByWriter(searchInfo);

		}
		return boardList;
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

	public String writeReply(Comment comment) {
		commentMapper.addComment(comment);
		System.out.println(comment.getId());
		String date = commentMapper.getCommentWdate(comment.getId());
		System.out.println(date);
		return date;
	}
}
