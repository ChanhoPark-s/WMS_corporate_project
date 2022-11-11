package com.spring.mapper;

import java.util.List;

import com.spring.domain.ItemVO;

//이 인터페이스는 root-context.xml에서 mybatis-spring 으로 스캔해줌
public interface ItemMapper {
	public List<ItemVO> selectAll();
	
	public void insert(ItemVO vo);
	
}