package com.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.OrderSheetVO;
import com.spring.mapper.OrderSheetMapper;

@Service
public class OrderSheetServiceImpl implements OrderSheetService{

	@Autowired
	private OrderSheetMapper mapper;
	
	@Override
	public int addOrderSheet(OrderSheetVO vo) {
		
		// 이 쿼리 내부에서는 vo 객체의 no 멤버변수가 setNo(시퀀스) 되어짐.
		if(mapper.insertMainSheet(vo) != 1) {
			return -1;
		}
				
		ArrayList<Integer> noList = vo.getItem_no();
		ArrayList<Integer> amountList = vo.getAmount();
		
		int len = noList.size();

		for (int i = 0; i < len; i++) {
			int mainSheetNo = vo.getNo();
			int itemNo = noList.get(i);
			int itemAmount = amountList.get(i);
			
			if(mapper.insertDetailSheet(mainSheetNo, itemNo, itemAmount) != 1) {
				return -1;
			}
		}
		
		return 1;
	}
}
