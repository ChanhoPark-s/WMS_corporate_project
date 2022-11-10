package com.spring.mapper;

import java.util.List;

import com.spring.domain.RankVO;

//이 인터페이스는 root-context.xml에서 mybatis-spring 으로 스캔해줌
public interface RankMapper {

	public void insert(RankVO rank);

	public List<RankVO> list();

	public void update(RankVO rank);

	public void delete(int no);
	
}