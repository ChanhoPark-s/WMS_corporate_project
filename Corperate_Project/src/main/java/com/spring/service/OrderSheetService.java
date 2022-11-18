package com.spring.service;

import java.util.List;

import com.spring.domain.OrderSheetDetailVO;
import com.spring.domain.OrderSheetVO;

public interface OrderSheetService {
	
	public int addOrderSheet(OrderSheetVO vo);					// 수주서 및 품목 디테일을 동시에 DB에 추가하는 것
	public List<OrderSheetVO> getList();						// 수주서 리스트를 모두 가져오는 것
	public List<OrderSheetDetailVO> getSubList(int mainNo);		// 수주서 번호로 품목 디테일들 모두 가져오는 것
}
