package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.SearchVO;
import com.spring.domain.SellDetailVO;
import com.spring.mapper.SellDetailMapper;
import com.spring.paging.Client_Paging;

@Service
public class SellDetailServiceImpl implements SellDetailService{
	
	@Autowired
	private SellDetailMapper mapper;
	
	@Override
	public void insert(SellDetailVO selldetail) {
		
		
		int len = selldetail.getItem_no().size();

		for (int i = 0; i < len; i++) {
			int itemNo = selldetail.getItem_no().get(i);
			int itemAmount = selldetail.getAmount().get(i);
			int itemPrice = selldetail.getSell_price().get(i);
			String lot_code = selldetail.getLot_code().get(i);
			mapper.insert(itemNo,itemAmount,itemPrice,lot_code,selldetail.getOrder_sheet_no());
			}
		}
		
	
	@Override
	public List<SellDetailVO> read() {
		System.out.println("판매 리스트 불러오기");
		return mapper.read(); // 존재하지 않는 레코드를 얻으려고하면 null이 반환됨
	}
	
	@Override
	public int getTotalCount(SearchVO searchvo) {
		return mapper.getTotalCount(searchvo);
	}
	
	@Override
	public List<SellDetailVO> selectAll(Client_Paging pageInfo) {
		return mapper.selectAll(pageInfo);
	}
}
