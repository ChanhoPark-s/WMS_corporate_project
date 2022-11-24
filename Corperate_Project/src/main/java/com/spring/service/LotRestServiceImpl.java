package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.LotVO;
import com.spring.domain.WareHouseDetailVO;
import com.spring.mapper.LotRestMapper;
import com.spring.mapper.WareHouseDetailMapper;

@Service
public class LotRestServiceImpl implements LotRestService{
	
	@Autowired
	private LotRestMapper mapper;
	
	@Autowired
	private WareHouseDetailMapper wdm;

	@Override
	public List<LotVO> getLot(String no) {
		System.out.println("리스트 사이즈 : " + mapper.getLot(no).size() + "/ 아이템 넘버 :"+ no );
		List<LotVO> lists = mapper.getLot(no);
		
		
		//LotVO 에 재고수량 넣기
		for(int i = 0 ; i < lists.size();i++) {
			
			//재고현황
			if(lists.get(i).getCode() != null) {
				WareHouseDetailVO wdvo = wdm.getWareDetail(lists.get(i).getCode());
				
				System.out.println("재고수량" + wdvo.getAmount());
				
				lists.get(i).setAmount(wdvo.getAmount());
				
				System.out.println(lists.get(i));
			}
			
		}
		return lists;
	}
}
