package com.spring.mapper;

import java.util.List;

import com.spring.domain.RackVO;

public interface RackMapper {
	public List<RackVO> selectAll();			//랙리스트불러오기
	public int insert(int no); 					//랙추가
	public int update(int no); 					//랙수정
	public int delete(int no); 					//랙삭제
}