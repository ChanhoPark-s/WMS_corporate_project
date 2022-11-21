package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.Input_WareHouseVO;
import com.spring.domain.Input_WareHouse_DetailVO;
import com.spring.mapper.Input_WareHouseMapper;
import com.spring.mapper.Input_WareHouse_DetailMapper;

@Service
public class Input_WareHouseServiceImpl implements Input_WareHouseService{

	@Autowired
	private Input_WareHouseMapper mapper;
	
	@Autowired
	private Input_WareHouse_DetailMapper detailMapper;
	
	@Override
	public List<Input_WareHouseVO> list() {
		return mapper.selectAll();
	}	
	
	@Override
	public int insert(Input_WareHouseVO vo) {
		vo.setNo(mapper.selectNoFromDual());
		
		mapper.insertMainSheet(vo);
		ArrayList<Integer> noList = vo.getItem_no();
		ArrayList<Integer> amountList = vo.getQTY();
		
		int len = noList.size();

		for (int i = 0; i < len; i++) {
			Input_WareHouse_DetailVO detailVo = new Input_WareHouse_DetailVO();
			detailVo.setItem_No(noList.get(i));
			detailVo.setQty(amountList.get(i));
			detailVo.setInput_WareHouse_No(vo.getNo());
			detailVo.setPurchase_Sheet_Detail_No(i);
			detailVo.setArrival_Date(vo.getInput_day());
			detailVo.setWare_No(vo.getWare_no());
			detailVo.setArea_No(vo.getArea_no());
			detailVo.setRack_No(vo.getRack_no());
			detailVo.setCell_No(vo.getCell_no());
			detailVo.setLot_Code("202211171001");
			detailVo.setStatus(0);
			if(detailMapper.insert(detailVo) != 1) {
				return -1;
			}
		}
		return 1;
	}
}
