package com.spring.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.SearchVO;
import com.spring.domain.SellDetailVO;
import com.spring.domain.SellVO;
import com.spring.mapper.SellMapper;
import com.spring.paging.Client_Paging;

@Service
public class SellServiceImpl implements SellService{
	
	@Autowired
	private SellMapper mapper;

	@Override
	public void insert(SellVO sell) {
		
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
	
	@Override
	public void delete(int no) {
		System.out.println("판매 리스트 불러오기");
		mapper.delete(no); // 존재하지 않는 레코드를 얻으려고하면 null이 반환됨
	}
	
	@Override
	public void update(SellVO sell) {
		System.out.println("판매 리스트 불러오기");
		mapper.update(sell); // 존재하지 않는 레코드를 얻으려고하면 null이 반환됨
	}
	
	@Override
	public List<SellDetailVO> getSubList(int mainNo) {
		System.out.println("판매 리스트 불러오기");
		return mapper.getSubList(mainNo); // 존재하지 않는 레코드를 얻으려고하면 null이 반환됨
	}
}
