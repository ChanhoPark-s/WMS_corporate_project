package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.BoardVO;
import com.spring.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service // 계층 구조상 비지니스 영역을 담당하는 객체임을 표시하기 위해 사용함
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{

	//spring 4.3 이상에서 자동 처리
	private BoardMapper mapper;

	@Override
	public BoardVO get(Long bno) {
		log.info("get......" + bno);
		return mapper.read(bno); // 존재하지 않는 레코드를 얻으려고하면 null이 반환됨
	}
}