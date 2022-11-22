package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.ClientVO;
import com.spring.domain.MemberVO;
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;
import com.spring.paging.Criteria;

//이 인터페이스는 root-context.xml에서 mybatis-spring 으로 스캔해줌
public interface MemberMapper {			// 게시물 조회

	public void insert(MemberVO member);

	public List<MemberVO> list(Client_Paging pageInfo);

	public MemberVO get(int no);

	public void update(MemberVO member);

	public void delete(int no);

	public int check_user(MemberVO membervo);
	
	public MemberVO selectOneByNo(int no);
	
	public int idcheck(String id);
	
	public int getTotalCount(SearchVO searchvo);
	
	/* ajax paging */
	public List<MemberVO> getListWithPaging(@Param("cri") Criteria cri);
	public int getCountAll(@Param("cri") Criteria cri);

	public MemberVO getAllById(String id);

	public int selectDelete(String[] parameterValues);
}