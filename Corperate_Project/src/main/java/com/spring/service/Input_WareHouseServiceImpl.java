package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.Input_WareHouseVO;
import com.spring.mapper.Input_WareHouseMapper;

@Service
public class Input_WareHouseServiceImpl implements Input_WareHouseService{

	@Autowired
	private Input_WareHouseMapper mapper;
	
	@Override
	public List<Input_WareHouseVO> list() {
		return mapper.selectAll();
	}	
	
	@Override
	public int insert(Input_WareHouseVO vo) {
		if(mapper.insertMainSheet(vo) != 1) { 
			return -1;
		}
		ArrayList<Integer> noList = vo.getItem_no();
		ArrayList<Integer> amountList = vo.getQTY();
		
		int len = noList.size();

		for (int i = 0; i < len; i++) {
			int mainSheetNo = vo.getNo();
			int itemNo = noList.get(i);
			int itemAmount = amountList.get(i);
			
			//if(mapper.insertDetailSheet(mainSheetNo, itemNo, itemAmount) != 1) {
			//	return -1;
			//}
		}
		return 1;
	}

}
