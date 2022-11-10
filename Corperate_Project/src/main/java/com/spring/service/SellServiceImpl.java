package com.spring.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.SellVO;
import com.spring.mapper.SellMapper;

@Service
public class SellServiceImpl implements SellService{
	
	@Autowired
	private SellMapper mapper;

	@Override
	public void get(SellVO sell) {
		
		System.out.println("SellServiceImpl member_no :"+sell.getMember_no());
		System.out.println("SellServiceImpl order_no :"+sell.getOrder_no());
		System.out.println("SellServiceImpl day :"+sell.getDay());
		
		mapper.insert(sell); // 존재하지 않는 레코드를 얻으려고하면 null이 반환됨
	}
	
	@Override
	public List<SellVO> read() {
		System.out.println("판매 리스트 불러오기");
		return mapper.read(); // 존재하지 않는 레코드를 얻으려고하면 null이 반환됨
	}
}
