package com.project.bookie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bookie.dto.board.Board;
import com.project.bookie.dto.comment.Comment;
import com.project.bookie.dto.reply.Reply;
import com.project.bookie.mapper.board.ClubBoardMapper;
import com.project.bookie.mapper.comment.ClubCommentMapper;
import com.project.bookie.mapper.reply.ClubReplyMapper;

@Service
public class ClubBoardService {
	@Autowired
	ClubBoardMapper mapper;

	@Autowired
	ClubCommentMapper commentMapper;

	@Autowired
	ClubReplyMapper replyMapper;

//	게시글 + 댓글 + 대댓글
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
//	검색 기능
	public List<Board> getBoardListBySearchInfo(String option, String query) {
		List<Board> boardList = null;
		if (option.equals("title")) {
			boardList = mapper.getListByTitle(query);
		} else if (option.equals("content")) {
			boardList = mapper.getListByContent(query);
		} else { // option.equals("writer")
			boardList = mapper.getListByWriter(query);
		}
		return boardList;
	}
	
//  메인에 보여질 최신글 5개
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
		return board.getId(); // board id
	}

//	update board
	public void updateOnBoard(String id, String genreId, String title, String content) {
		mapper.updateBoard(id, genreId, title, content);
	}

//	delete board
	public void deleteOnBoard(String id) {
		mapper.deleteBoard(Long.parseLong(id));
	}

//	comment CRUD
//	insert comment
	public String writeComment(Comment comment) {
		commentMapper.addComment(comment);
		String date = commentMapper.getCommentWdate(comment.getId());
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
