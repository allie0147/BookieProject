package com.project.bookie.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.bookie.dto.board.Board;
import com.project.bookie.dto.board.BookCardBoard;
import com.project.bookie.dto.books.Books;
import com.project.bookie.service.BookCardBoardService;
import com.project.bookie.service.BooksService;
import com.project.bookie.service.ClubBoardService;
import com.project.bookie.service.QnaBoardService;
import com.project.bookie.service.UserService;

@Controller
public class CommonController {

	@Autowired
	UserService userService;
	@Autowired
	BookCardBoardService bcbService;
	@Autowired
	QnaBoardService qbVService;
	@Autowired
	ClubBoardService cbService;
	@Autowired
	BooksService booksService;

	@GetMapping("/")
	public String showMain(Model m) {
		List<Books> slideBooks = booksService.getAllBooks();
		List<String> imgList= new ArrayList<String>();
		for (Books books : slideBooks) {
			imgList.add(books.getImg());
		}
		m.addAttribute("imgList", imgList);
		
		m.addAttribute("slideBooks", slideBooks);
		
		Books slideBooksWithId6 = booksService.getAllBooksWithId(6);
		Books slideBooksWithId7 = booksService.getAllBooksWithId(7);
		Books slideBooksWithId8 = booksService.getAllBooksWithId(8);
		m.addAttribute("slideBooksWithId6", slideBooksWithId6);
		m.addAttribute("slideBooksWithId7", slideBooksWithId7);
		m.addAttribute("slideBooksWithId8", slideBooksWithId8);
		
		
//			main화면 보여주기
		// 랜덤으로 이미지 불러오기
		Random ran = new Random();
		Set<Integer> randomImageNum = new HashSet<>();
		while (randomImageNum.size() < 3) {
			int randomNum = ran.nextInt(5);
			randomImageNum.add(randomNum);
		}
		Iterator<Integer> randomImageNumIter = randomImageNum.iterator();
		m.addAttribute("randomImageNumIter", randomImageNumIter);

		List<BookCardBoard> bookCardBoardList = bcbService.getBoardListLatest();
		List<Board> MainQnaBoardList = qbVService.getBoardListLatest();
		List<Board> MainClubBoardList = cbService.getBoardListLatest();
		m.addAttribute("bookCardBoardList", bookCardBoardList);
		m.addAttribute("MainQnaBoardList", MainQnaBoardList);
		m.addAttribute("MainClubBoardList", MainClubBoardList);
		return "mainView/main";
	}

	@GetMapping("/cs")
	public String showInfo() {
//		고객센터화면 보여주기
		return "cs/cs";
	}

}
