package com.spring.mapper;

import java.util.List;

import com.spring.domain.WareHouseAllAreaVO;
import com.spring.domain.WareHouseVO;

public interface WareHouseMapper {
	public List<WareHouseVO> selectAll();	//창고리스트불러오기
	public int insert(WareHouseAllAreaVO vo); 				//창고추가
	public int update(int no); 				//창고수정
	public int delete(int no); 				//창고삭제
	public int deleteWareHouseByNo(String ware_no);
}