package com.spring.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.BoardVO;
import com.spring.domain.ItemVO;
import com.spring.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> list() {
		return mapper.list();
	}
	
	@Override
	public void insert(BoardVO vo){
		mapper.insert(vo);
	}
	
	@Override
	public void delete(int no) {
		
		mapper.delete(no);
	}
	
	@Override
	public BoardVO selectOne(int no) {
		return mapper.selectOne(no);
	}
}
	
	


