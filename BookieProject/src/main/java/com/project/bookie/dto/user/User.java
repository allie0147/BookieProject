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
import com.project.bookie.dto.interest.Interest;

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
	@Length(min = 8, max = 16)
	@Pattern(regexp = "^[가-힣a-zA-Z0-9\\S]+$")
	private String uPwd;

	@NotEmpty
	@Pattern(regexp = "^[가-힣a-zA-Z0-9\\S]*$")
	@Length(min = 2, max = 8)
	private String nickname;

	@NotEmpty
	@Pattern(regexp = "^\\d{3}-\\d{3,4}-\\d{4}$")
	private String phone;

	@NotEmpty
	@Size(min = 1, max = 2)
	private String[] interest;
	
	private List<Interest> interestList;
	@DateTimeFormat
	private LocalDateTime regDate;

	private List<Board> boardList;
}
