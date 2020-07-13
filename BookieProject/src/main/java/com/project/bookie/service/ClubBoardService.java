package com.project.bookie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bookie.dto.board.Board;
import com.project.bookie.dto.comment.Comment;
import com.project.bookie.mapper.board.ClubBoardMapper;
import com.project.bookie.mapper.comment.ClubCommentMapper;

@Service
public class ClubBoardService {
	@Autowired
	ClubBoardMapper mapper;

	@Autowired
	ClubCommentMapper commentMapper;

	public Board getBoardByBoardById(long boardId) {
		Board board = mapper.getBoardByBoardIdWithComment(boardId);
		List<Comment> commentList = board.getCommentList();
		for (Comment comment : commentList) {
			String commentStr = comment.getWtDate().toString();
			String head = commentStr.substring(0, 10);
			String tail = commentStr.substring(11, 16);
			commentStr = head + " " + tail;
			comment.setWtDate_str(commentStr);
		}
		String boardDate = board.getWtDate().toString();
		String head = boardDate.substring(0, 10);
		String tail = boardDate.substring(11, 16);
		boardDate = head + " " + tail;
		board.setWtDate_str(boardDate);
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

	public String writeComment(Comment comment) {
		commentMapper.addComment(comment);
		System.out.println(comment.getId());
		String date = commentMapper.getCommentWdate(comment.getId());
		System.out.println(date);
		return date;
	}

	public void updateComment(String commentId, String comment) {
		commentMapper.updateComment(commentId, comment);
	}

	public void deleteComment(String commentId) {
		commentMapper.deleteComment(commentId);
	}

}
