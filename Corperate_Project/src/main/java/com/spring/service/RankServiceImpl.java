package com.spring.service;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.RankVO;
import com.spring.mapper.RankMapper;

@Service // 계층 구조상 비지니스 영역을 담당하는 객체임을 표시하기 위해 사용함
public class RankServiceImpl implements RankService{

	//spring 4.3 이상에서 자동 처리
	@Autowired
	private RankMapper mapper;
	
	@Autowired
	private ServletContext servletContext;

	@Override
	public void insert(RankVO rank) {
		mapper.insert(rank);
	}

	@Override
	public List<RankVO> list() {
		return mapper.list();
	}

	@Override
	public void update(RankVO rank) {
		mapper.update(rank);
	}

	@Override
	public void delete(int no) {
		mapper.delete(no);
	}

}