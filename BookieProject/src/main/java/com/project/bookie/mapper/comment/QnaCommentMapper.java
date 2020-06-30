package com.project.bookie.mapper.comment;

import java.util.List;

import com.project.bookie.dto.comment.Comment;
import com.project.bookie.dto.reply.Reply;

public interface QnaCommentMapper {
	
	//한 댓글에 대한 리플 리스트를 가져오기
	public List<Reply> getReplyListByCommentId(int commentId);

	//댓글 삽입
	public void addComment(Comment comment);
	
	//댓글 수정
	public void updateComment(Comment comment);
	
	//댓글 삭제
	public void deleteComment(int commentId);
}