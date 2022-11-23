package com.spring.mapper;

import java.util.List;

import com.spring.domain.BoardVO;

public interface BoardMapper {

	public List<BoardVO> list();

	public void insert(BoardVO vo);

	public void delete(int no);

	public BoardVO selectOne(int no);
}