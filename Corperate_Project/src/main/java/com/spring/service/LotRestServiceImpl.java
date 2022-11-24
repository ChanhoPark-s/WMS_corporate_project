package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.LotVO;
import com.spring.mapper.LotRestMapper;

@Service
public class LotRestServiceImpl implements LotRestService{
	
	@Autowired
	private LotRestMapper mapper;

	@Override
	public List<String> getLot(String no) {
		System.out.println("리스트 사이즈 : " + mapper.getLot(no).size() + "/ 아이템 넘버 :"+ no );
		List<String> lists = mapper.getLot(no);
		
		for(int i = 0 ; i < lists.size();i++) {
		System.out.println(lists.get(i));
		}
		return mapper.getLot(no);
	}
}
