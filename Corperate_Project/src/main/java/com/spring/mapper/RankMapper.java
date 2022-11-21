package com.spring.mapper;

import java.util.List;

import com.spring.domain.RankVO;
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;

//이 인터페이스는 root-context.xml에서 mybatis-spring 으로 스캔해줌
public interface RankMapper {

	public void insert(RankVO rank);

	public List<RankVO> list(Client_Paging pageInfo);

	public void update(RankVO rank);

	public void delete(int no);

	public int getTotalCount(SearchVO vo);

	public List<RankVO> noSearchList();
	
}