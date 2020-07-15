package com.project.bookie.dto.interest;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Interest {
	private long id;
	private long userId;
	private int genreId;
	private String genreName;

}
