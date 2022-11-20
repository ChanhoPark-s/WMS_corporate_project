package com.spring.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.spring.domain.ClientVO;
import com.spring.domain.MemberVO;
import com.spring.domain.PageDTO;
import com.spring.paging.Criteria;

public interface MemberService {

   public void insert(MemberVO member, HttpServletRequest request) throws Exception;

   public List<MemberVO> list();

   public MemberVO get(int no);

   public void update(MemberVO member, HttpServletRequest request) throws Exception;

	public void delete(int no);

	public int check_user(MemberVO membervo);
	
	/* ajax paging */
	public PageDTO<MemberVO> getListPage(Criteria cri);

	public MemberVO getAllById(String id);
}
