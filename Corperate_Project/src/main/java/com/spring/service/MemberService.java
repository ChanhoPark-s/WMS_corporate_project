package com.spring.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.spring.domain.MemberVO;

public interface MemberService {

	public void insert(MemberVO member, HttpServletRequest request) throws Exception;

	public List<MemberVO> list();

	public MemberVO get(int no);

	public void update(MemberVO member, HttpServletRequest request) throws Exception;

	public void delete(int no);
}
