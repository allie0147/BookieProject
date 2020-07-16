package com.project.bookie.dto.board;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//글(bookcard_board)의 데이터 전송에 사용
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BookCardBoard{
	private long id;
	private long userId;
	private String writer; //게시판에서 board의 '작성자id'가 아닌 '작성자명'으로 가져오기 위해 변경
	private String content;
	@DateTimeFormat
	private LocalDateTime wtDate;
	@DateTimeFormat
	private LocalDateTime upDate;
	private int likeCnt;
	private int bookmarkCnt;
	
}
