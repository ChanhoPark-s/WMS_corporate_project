package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.ItemVO;
import com.spring.domain.PageDTO;
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;
import com.spring.paging.Criteria;

//이 인터페이스는 root-context.xml에서 mybatis-spring 으로 스캔해줌
public interface ItemMapper {
	public List<ItemVO> selectAll(Client_Paging pageInfo);
	public void insert(ItemVO vo);
	public void delete(int no);
	public ItemVO selectOne(int no);
	public void update(ItemVO vo);
	public int getTotalCount(SearchVO searchvo);
	public int code_check(String code);
	public PageDTO<ItemVO> getListPage(Criteria cri);
	
	/**
	 * ajax 전용 메서드 by song
	 */
	public int getCountAll(@Param("cri") Criteria cri);
	public List<ItemVO> getListWithPaging(@Param("cri") Criteria cri); 
	
}