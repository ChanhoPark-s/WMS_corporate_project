package com.spring.mapper;

import java.util.List;

import com.spring.domain.CellVO;

public interface CellMapper {
	public List<CellVO> selectAll();			//셀리스트불러오기
	public int insert(int no); 					//셀추가
	public int update(int no); 					//셀수정
	public int delete(int no); 					//셀삭제
}