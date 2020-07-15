package com.project.bookie.dto.board;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.project.bookie.dto.comment.Comment;
import com.project.bookie.dto.interest.Interest;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//글(qna_board, club_board)의 데이터 전송에 사용
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private long id;
	private String title;
	private long userId;
	private String uEmail; // 게시판에 hidden input
	private String writer; // 게시판에서 board의 '작성자id'가 아닌 '작성자명'으로 가져오기 위해 사용
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime wtDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime upDate;
	private List<Comment> commentList;
	private String wtDate_str;
	private int genreId;
	private String genre;
}
