package com.project.bookie.dto.books;

import java.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Books {
	private long id;
	private String title;
	private long genreId;
	private String writer;
	private String publisher;
	@DateTimeFormat
	private LocalDate pubDate;
	private String img;
}
