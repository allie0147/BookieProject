package com.project.bookie.mapper.reply;

import org.apache.ibatis.annotations.Param;

import com.project.bookie.dto.reply.Reply;

public interface QnaReplyMapper {

	// 리플 삽입
	public void addReply(Reply reply);

	// 리플 수정
	public void updateReply(@Param("id") String replyId, @Param("message") String reply);

	// 리플 삭제
	public void deleteReply(@Param("id") String replyId);

	// wdate
	public String getReplyWdate(long id);
}
