package com.project.bookie.mapper.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.bookie.dto.board.Board;

//고객센터 게시판의 매퍼(DB의 cs_board테이블 사용)
public interface CSBoardMapper {

	// 게시판 글 전체를 불러오는 기능
	public List<Board> getAllBoards();

	// 글 등록
	public void insertBoard(@Param("board") Board board, @Param("role") String role);

	// 글 수정
	public void updateBoard(Board board);

	// 글 삭제
	public void deleteBoard(int id);

	// 페이지네이션
	// 한 페이지에 보여질 게시글 리스트
	public List<Board> getBoardListByCurrentPage(@Param("firstRow") int firstRow, @Param("endRow") int endRow);

	// 총 게시글 수
	public int getCountOfTotalBoard();

}
