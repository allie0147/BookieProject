package com.project.bookie.mapper.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.bookie.dto.board.BookCardBoard;

public interface BookCardBoardMapper {

	// 게시판 글 전체를 불러오는 기능
	public List<BookCardBoard> getAllBoards();

	// 메인화면에 표시할 최신 글 조회
	public List<BookCardBoard> getBoardListToMain();

	// 메인화면에 표시할 좋아요 높은 글 조회
	public List<BookCardBoard> getBoardListBest();

	// 조건(내용 혹은 작성자)에 따른 검색
	public List<BookCardBoard> getListByContentOrWriter(@Param("query") String query);

	// 작성자에 따른 검색(사용자의 자신이 쓴 글 조회 기능)
	public List<BookCardBoard> getListByUserId(long userId); // select * from board.user_id = #{작성자 id}(로그인 되어있는 세션에서
																// 정보를 받아옴)

	// 글 조회
	public BookCardBoard selectBoard(@Param("userId") String userId);

	// 글 등록
	public void insertBoard(@Param("userId") String userId, @Param("content") String content);

	// 글 수정
	public void updateBoard(@Param("id") String id, @Param("content") String content);

	// 글 삭제
	public void deleteBoard(long id);

	// 좋아요 count
	public int selectLikeCnt(long id);

	// 좋아요 버튼 클릭시 like_cnt = like_cnt + 1
	public void likeCntUp(@Param("likeCnt") int likeCnt, @Param("id") long id);

	// 좋아요 버튼 다시 클릭시 like_cnt = like_cnt - 1
	public void likeCntDown(@Param("likeCnt") int likeCnt, @Param("id") long id);

	// 북마크 버튼 
	public void addBookmark(@Param("boardId") long boardId, @Param("userId") long userId);

	// 북마크 버튼 
	public void deleteBookmark(@Param("boardId") long boardId, @Param("userId") long userId);
	
	// 유저 1명의 북마크 가져오기
	public List<Long> selectBookmark(@Param("userId") long userId);

	// 페이지네이션
	// 한 페이지에 보여질 게시글 리스트
	public List<BookCardBoard> getBoardListByCurrentPage(@Param("firstRow") int firstRow, @Param("endRow") int endRow);

	// 총 게시글 수
	public int getCountOfTotalBoard();

}
