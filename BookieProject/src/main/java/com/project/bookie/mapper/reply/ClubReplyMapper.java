package com.project.bookie.mapper.reply;

import com.project.bookie.dto.reply.Reply;

public interface ClubReplyMapper {
	// 리플 삽입
	public void addReply(Reply reply);

	// 리플 수정
	public void updateReply(Reply reply);

	// 리플 삭제
	public void deleteReply(int replyId);

	// wdate
	public String getReplyWdate(long id);
}
