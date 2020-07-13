package com.project.bookie.mapper.comment;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.bookie.dto.comment.Comment;
import com.project.bookie.dto.reply.Reply;

public interface ClubCommentMapper {

	// 한 댓글에 대한 리플 리스트를 가져오기
	public List<Reply> getReplyListByCommentId(long commentId);

	// 댓글 삽입
	public void addComment(Comment comment);

	// 댓글 수정
	public void updateComment(@Param("id") String commentId, @Param("message") String comment);

	// 댓글 삭제
	public void deleteComment(@Param("id") String commentId);

	// 댓글 작성시간 가져오기
	public String getCommentWdate(long commentId);

}
