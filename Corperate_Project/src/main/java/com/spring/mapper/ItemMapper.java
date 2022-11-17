package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.ItemVO;
import com.spring.paging.Criteria;

//이 인터페이스는 root-context.xml에서 mybatis-spring 으로 스캔해줌
public interface ItemMapper {
	public List<ItemVO> selectAll();
	public void insert(ItemVO vo);
	public void delete(int no);
	public ItemVO selectOne(int no);
	public void update(ItemVO vo);
	
	/* ajax paging */
	public List<ItemVO> getListWithPaging(@Param("cri") Criteria cri);
	public int getCountAll(@Param("cri") Criteria cri);
}