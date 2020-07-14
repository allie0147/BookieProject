package com.project.bookie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bookie.dto.board.Board;
import com.project.bookie.dto.comment.Comment;
import com.project.bookie.dto.reply.Reply;
import com.project.bookie.mapper.board.QnaBoardMapper;
import com.project.bookie.mapper.comment.QnaCommentMapper;
import com.project.bookie.mapper.reply.QnaReplyMapper;

@Service
public class QnaBoardService {

	@Autowired
	QnaBoardMapper mapper;

	@Autowired
	QnaCommentMapper commentMapper;

	@Autowired
	QnaReplyMapper replyMapper;

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
		String boardDate = board.getWtDate().toString();
		String head = boardDate.substring(0, 10);
		String tail = boardDate.substring(11, 16);
		boardDate = head + " " + tail;
		board.setWtDate_str(boardDate);
		return board;
	}

// 	검색기능
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

//	메인에 보여질 최신글 5개
	public List<Board> getBoardListLatest() {
		List<Board> boardList = mapper.getBoardListToMain();
		return boardList;
	}

//	board CRUD
//	select board
	public Board getBoard(String id) {
		return mapper.selectBoard(id);
	}
	
//	insert board
	public long writeOnBoard(Board board) {
		mapper.insertBoard(board);
		System.out.println(board.getId());
		return board.getId(); // board id
	}
//	update board
	public void updateOnBoard(String id, String title, String content) {
		mapper.updateBoard(id, title, content);
	}
	
//	delete board
	public void deleteOnBoard(String id) {
		mapper.deleteBoard(Long.parseLong(id));
	}

//	comment CRUD
//	insert comment
	public String writeComment(Comment comment) {
		commentMapper.addComment(comment);
		System.out.println(comment.getId());
		String date = commentMapper.getCommentWdate(comment.getId());
		System.out.println(date);
		return date;
	}

//	update comment
	public void updateComment(String commentId, String comment) {
		commentMapper.updateComment(commentId, comment);
	}

//	delete comment
	public void deleteComment(String commentId) {
		commentMapper.deleteComment(commentId);
	}

//	reply CRUD
//	insert reply
	public String writeReply(Reply reply) {
		replyMapper.addReply(reply);
		String date = replyMapper.getReplyWdate(reply.getId());
		return date;
	}

//	update reply
	public void updateReply(String replyId, String reply) {
		replyMapper.updateReply(replyId, reply);
	}

//	delete reply
	public void deleteReply(String replyId) {
		replyMapper.deleteReply(replyId);
	}
}
