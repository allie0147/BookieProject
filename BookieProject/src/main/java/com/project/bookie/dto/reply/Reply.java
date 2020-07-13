package com.project.bookie.dto.reply;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
	private long id;
	private long boardId;
	private long commentId;
	private long userId;
	private String writer;
	private String message;
	@DateTimeFormat
	private LocalDateTime wtDate;
	private String wtDate_str;
}
