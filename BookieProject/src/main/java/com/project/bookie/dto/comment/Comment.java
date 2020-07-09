package com.project.bookie.dto.comment;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.project.bookie.dto.reply.Reply;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
	private long id;
	private long boardId;
	private long userId;
	private String writer; //대문자 W -> 소문자 w 변경
	private String message;
	@DateTimeFormat
	private LocalDateTime wtDate;
	private String wtDate_str;
	private List<Reply> replyList;
	
}
