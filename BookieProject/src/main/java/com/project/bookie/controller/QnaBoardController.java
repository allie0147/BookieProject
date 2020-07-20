package com.project.bookie.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bookie.dto.board.Board;
import com.project.bookie.dto.boardViewList.BoardViewList;
import com.project.bookie.dto.comment.Comment;
import com.project.bookie.dto.reply.Reply;
import com.project.bookie.dto.user.User;
import com.project.bookie.service.QnaBoardService;
import com.project.bookie.service.QnaBoardViewListService;
import com.project.bookie.service.UserService;

@Controller
@RequestMapping("/qna")
public class QnaBoardController {

	@Autowired
	QnaBoardViewListService viewListService;

	@Autowired
	QnaBoardService service;

	@Autowired
	UserService userService;

	@GetMapping("/main")
	public String goQnaMain(Model m, @RequestParam(value = "p", defaultValue = "1", required = false) int p) {
		BoardViewList boardViewList = viewListService.getViewListService(p);
		m.addAttribute("boardViewList", boardViewList);

		List<Integer> pageArray = new ArrayList<>();
		int startNum;
		int endNum;

		if (boardViewList.getPageTotalCount() <= 5) {
			for (int i = 1; i <= boardViewList.getPageTotalCount(); i++) {
				pageArray.add(i);
			}
			startNum = pageArray.get(0);
			endNum = pageArray.get(pageArray.size() - 1);
		} else { // 총 페이지 수가 5이상일 때
			int i = 1;
			endNum = (boardViewList.getPageTotalCount()
					- boardViewList.getCurrentPageNumber() >= boardViewList.getPageTotalCount() - 5) ? 5 * i
							: boardViewList.getPageTotalCount();
			while (p > 5 * i) {
				i++;
			}
			System.out.println("현재 페이지네이션 범위 : " + (i - 1) * 5 + "~" + i * 5); // p가 5*i보다 작아지게 된 i의 값
			startNum = 5 * (i - 1) + 1;

			for (int j = startNum; j <= endNum; j++) {
				pageArray.add(j);
			}
		}

		int nextNum = boardViewList.getPageTotalCount(); // viewList.getPageTotalCount()
		if (p + 5 < boardViewList.getPageTotalCount()) {
			nextNum = p + 5;
		}

		m.addAttribute("nextNum", nextNum);
		m.addAttribute("pageArray", pageArray);
		m.addAttribute("p", p);
		return "QnA/qnaMain.jsp?p=" + p;
	}

//	장르별 페이지
//	파라미터 값으로 g=장르id, p=페이지수
	@GetMapping("/board")
	public String goQnAGenre(Model m, @RequestParam(value = "p", defaultValue = "1", required = false) int p,
			@RequestParam(value = "g", defaultValue = "1", required = false) int g) {
		BoardViewList boardViewList = viewListService.getViewListByGenre(g, p);
		m.addAttribute("boardViewList", boardViewList);
		List<Integer> pageArray = new ArrayList<>();
		int startNum;
		int endNum;

		if (boardViewList.getPageTotalCount() <= 5) {
			for (int i = 1; i <= boardViewList.getPageTotalCount(); i++) {
				pageArray.add(i);
			}
			startNum = pageArray.get(0);
			endNum = pageArray.get(pageArray.size() - 1);
		} else { // 총 페이지 수가 5이상일 때
			int i = 1;
			endNum = (boardViewList.getPageTotalCount()
					- boardViewList.getCurrentPageNumber() >= boardViewList.getPageTotalCount() - 5) ? 5 * i
							: boardViewList.getPageTotalCount();
			while (p > 5 * i) {
				i++;
			}
			System.out.println("현재 페이지네이션 범위 : " + (i - 1) * 5 + "~" + i * 5); // p가 5*i보다 작아지게 된 i의 값
			startNum = 5 * (i - 1) + 1;

			for (int j = startNum; j <= endNum; j++) {
				pageArray.add(j);
			}
		}

		int nextNum = boardViewList.getPageTotalCount(); // viewList.getPageTotalCount()
		if (p + 5 < boardViewList.getPageTotalCount()) {
			nextNum = p + 5;
		}

		m.addAttribute("nextNum", nextNum);
		m.addAttribute("pageArray", pageArray);
		m.addAttribute("g", g);
		m.addAttribute("p", p);
		return "QnA/qnaGenre.jsp?g=" + g + "&p=" + p;
	}

//	한 페이지
	@GetMapping("/detail")
	public String goDetailPage(Model m, @RequestParam(value = "b", defaultValue = "1", required = false) int boardId) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String uEmail = auth.getName(); // 세션에 있는 유저이메일
		Board board = service.getBoardByBoardById(boardId);
		if (uEmail.equals("anonymousUser")) {
			m.addAttribute("board", board);
		} else {
			long userId = userService.getUserIdByEmail(uEmail);
			String nickname = userService.getUserNickname(uEmail);
			m.addAttribute("board", board);
			m.addAttribute("userId", userId);
			m.addAttribute("nickname", nickname);
		}
		return "QnA/qnaBoardDetail.jsp?b=" + boardId;
	}

//	검색기능
	@GetMapping("/search")
	public String getBoardListBySearchInfo(Model m, 
			@RequestParam(value = "option") String option,
			@RequestParam(value = "query") String query,
			@RequestParam(value = "p", defaultValue = "1", required = false) int p) {
		List<Board> boardList = service.getBoardListBySearchInfo(option, query);
		BoardViewList boardViewList = viewListService.getViewListSearch(p, boardList);
		m.addAttribute("boardViewList", boardViewList);
		
		return "QnA/search_result.jsp?option="+option+"&query="+query+"&b=" + p;
	}

//	게시글 작성 페이지 전환 GET
	@GetMapping("/write")
	public String getWriteOnQnABoard(Model m) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String uEmail = auth.getName(); // 세션에 있는 유저이메일
		User user = userService.getUserInfo(uEmail);
		m.addAttribute("user", user);
		return "QnA/qnaWrite";
	}

//	게시글 작성 후 POST
	@PostMapping(value = "/write", produces = "text/plain; charset=utf8")
	@ResponseBody
	public String insertWriteOnQnABoard(Board board) {
		long userId = userService.getUserIdByEmail(board.getUEmail());
		// user id , user nickname board에 추가
		board.setUserId(userId);
		board.setWriter(userService.getUserNickname(board.getUEmail()));
		System.out.println("board 정보 완성 : " + board);
		long boardId = service.writeOnBoard(board);
		return String.valueOf(boardId);
	}

//	게시글 수정 페이지 전환 get
	@GetMapping("/edit")
	public String getEditOnQnABoard(Model m, @RequestParam(value = "b", required = false) String b) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String uEmail = auth.getName(); // 세션에 있는 유저이메일
		User user = userService.getUserInfo(uEmail);
		Board board = service.getBoard(b);
		m.addAttribute("user", user);
		m.addAttribute("board", board);
		return "QnA/qnaWrite";
	}

//	게시글 수정후, POST
	@PostMapping(value = "/write/edit", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String editOnQnABoard(@RequestParam(value = "b") String boardId, @Param("genreId") String genreId,
			@Param("content") String content, @Param("title") String title) {
		service.updateOnBoard(boardId, genreId, title, content);
		return boardId;
	}

//	게시글 삭제
	@GetMapping("/del")
	public void delOnQnABoard(@RequestParam(value = "b") String boardId, HttpServletResponse response) {
		service.deleteOnBoard(boardId);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println(
					"<script>window.addEventListener('DOMContentLoaded', function() {alert('글이 삭제 되었습니다.'); location.replace('/club/main');});</script>");
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

//	댓글CRUD
//	댓글 작성
	@PostMapping(value = "/comment", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Comment insertCommentOnQnABoard(@Param("boardId") String boardId, @Param("comment") String comment) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String uEmail = auth.getName(); // 세션에 있는 유저이메일
		Comment c = new Comment();
		c.setUserId(userService.getUserIdByEmail(uEmail));
		c.setWriter(userService.getUserNickname(uEmail));
		c.setBoardId(Integer.parseInt(boardId));
		c.setMessage(comment);
		String date = service.writeComment(c);
		String head = date.substring(0, 10);
		String tail = date.substring(11, 16);
		date = head + " " + tail;
		c.setWtDate_str(date);
		return c;
	}

//	댓글 수정
	@PostMapping(value = "/comment/update", produces = "text/plain; charset=utf-8 ")
	@ResponseBody
	public String updateCommentOnQnABoard(@Param("commentId") String commentId, @Param("comment") String comment) {
		try {
			service.updateComment(commentId, comment);
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
		return comment;
	}

//	댓글 삭제
	@PostMapping(value = "/comment/del", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String deleteCommentOnQnABoard(@Param("commentId") String commentId) {
		System.out.println(commentId);
		try {
			service.deleteComment(commentId);
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
		return "true";
	}

//	대댓글CRUD
//	대댓글 작성
	@PostMapping(value = "/reply", produces = "application/json; charset=utf-8 ")
	@ResponseBody
	public Reply setReplyOnQnABoard(Reply reply) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String uEmail = auth.getName(); // 세션에 있는 유저이메일
		reply.setUserId(userService.getUserIdByEmail(uEmail));
		reply.setWriter(userService.getUserNickname(uEmail));
		System.out.println(reply);
		String date = service.writeReply(reply);
		String head = date.substring(0, 10);
		String tail = date.substring(11, 16);
		date = head + " " + tail;
		reply.setWtDate_str(date);
		return reply;
	}

//	대댓글 수정
	@PostMapping(value = "/reply/update", produces = "text/plain; charset=utf-8 ")
	@ResponseBody
	public String updateReplyOnQnABoard(@Param("replyId") String replyId, @Param("reply") String reply) {
		try {
			service.updateReply(replyId, reply);
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
		return reply;
	}

//	대댓글 삭제
	@PostMapping(value = "/reply/del", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String deleteReplyOnQnABoard(@Param("replyId") String replyId) {
		try {
			service.deleteReply(replyId);
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
		return "true";
	}

}
