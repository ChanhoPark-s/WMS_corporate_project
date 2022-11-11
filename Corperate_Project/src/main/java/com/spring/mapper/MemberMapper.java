package com.spring.mapper;

import java.util.List;

import com.spring.domain.MemberVO;

//이 인터페이스는 root-context.xml에서 mybatis-spring 으로 스캔해줌
public interface MemberMapper {			// 게시물 조회

	public void insert(MemberVO member);

	public List<MemberVO> list();

	public MemberVO get(int no);

	public void update(MemberVO member);

	public void delete(int no);
	
}