package com.project.bookie.dto.user;

import java.time.LocalDateTime;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import com.project.bookie.dto.board.Board;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {

	private long id;
	@NotEmpty
	@Email
	private String uEmail;

	@NotEmpty
	@Pattern(regexp = "^[가-힣a-zA-Z0-9\\S]*$")
	@Length(min = 2, max = 8)
	private String nickname;

	@Pattern(regexp = "^\\d{3}-\\d{3,4}-\\d{4}$")
	private String phone;
//	갯수 체크
	@NotEmpty
	@Size(min = 1)
	private String[] interest;
	@DateTimeFormat
	private LocalDateTime regDate;
	// password는 암호화 테이블 생성 예정
	private List<Board> boardList;
}
