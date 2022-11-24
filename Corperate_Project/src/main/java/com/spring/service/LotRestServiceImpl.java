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
		for(LotVO vo :lists) {
			System.out.println("!");
			System.out.println("vo.getCode()" + vo.getCode());
			if (vo.getCode() != null) {
				//재고현황
				
				List<WareHouseDetailVO> wdvoList = wdm.getWareDetail(vo.getCode());
				
				if (wdvoList != null) {
					int amount = 0;
					
					for(WareHouseDetailVO whvo :wdvoList) {
						amount += whvo.getAmount();
						
					}
					
					vo.setAmount(amount);
				}
					
			}
			
			System.out.println(vo);
			

		}
		return lists;
	}
}
