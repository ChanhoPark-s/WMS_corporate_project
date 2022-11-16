package com.spring.service;

import java.util.List;

import com.spring.domain.MemberVO;

public interface MemberService {

	public void insert(MemberVO member) throws Exception;

	public List<MemberVO> list();

	public MemberVO get(int no);

	public void update(MemberVO member) throws Exception;

	public void delete(int no);

	public int check_user(MemberVO membervo);
}
