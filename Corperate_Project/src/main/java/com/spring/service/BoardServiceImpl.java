package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.BoardVO;
import com.spring.mapper.BoardMapper;

@Service // 계층 구조상 비지니스 영역을 담당하는 객체임을 표시하기 위해 사용함
public class BoardServiceImpl implements BoardService{

	//spring 4.3 이상에서 자동 처리
	@Autowired
	private BoardMapper mapper;

	@Override
	public BoardVO get(Long bno) {
		System.out.println("get......" + bno);
		return mapper.read(bno); // 존재하지 않는 레코드를 얻으려고하면 null이 반환됨
	}
}