package com.project.bookie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bookie.dto.books.Books;
import com.project.bookie.mapper.books.BooksMapper;

@Service
public class BooksService {

	@Autowired
	BooksMapper booksMapper;


	public List<Books> getAllBooks() {
		List<Books> allBooks = booksMapper.getAllBooks();
		return allBooks;
	}
	
	public Books getAllBooksWithId(long id) {
		Books idBooks = booksMapper.getBooksById(id);
		return idBooks;
	}

}
