package com.project.bookie.mapper.books;

import java.util.List;


import com.project.bookie.dto.books.Books;

public interface BooksMapper {

	
	//전체 books 조회
	public List<Books> getAllBooks();
	
	//id로 books 조회
	public Books getBooksById(long id);

}
