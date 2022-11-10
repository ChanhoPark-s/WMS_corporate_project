package com.spring.mapper;

import java.util.List;

import com.spring.domain.WareHouseVO;

public interface WareHouseMapper {
	public List<WareHouseVO> selectAll();	//창고리스트불러오기
	public int insert(int no); 				//창고추가
	public int update(int no); 				//창고수정
	public int delete(int no); 				//창고삭제
}