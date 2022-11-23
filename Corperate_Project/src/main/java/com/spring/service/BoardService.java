package com.spring.service;

import java.util.List;

import com.spring.domain.BoardVO;

public interface BoardService {
	
	public List<BoardVO> list();

	public void insert(BoardVO vo);

	public BoardVO selectOne(int no);

	public void delete(int no);

	
}
