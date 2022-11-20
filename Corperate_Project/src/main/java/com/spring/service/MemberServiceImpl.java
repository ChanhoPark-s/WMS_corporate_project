package com.spring.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.domain.ClientVO;
import com.spring.domain.MemberVO;
import com.spring.domain.PageDTO;
import com.spring.mapper.MemberMapper;
import com.spring.paging.Criteria;

@Service // 계층 구조상 비지니스 영역을 담당하는 객체임을 표시하기 위해 사용함
public class MemberServiceImpl implements MemberService{

   //spring 4.3 이상에서 자동 처리
   @Autowired
   private MemberMapper mapper;

   @Override
   public List<MemberVO> list() {
      return mapper.list(); // 존재하지 않는 레코드를 얻으려고하면 null이 반환됨
   }

   @Override
   public void insert(MemberVO member, HttpServletRequest reqeust) throws Exception {
      
      updateProfile(member, reqeust);
      mapper.insert(member);
   }

   @Override
   public MemberVO get(int no) {
      return mapper.get(no);
   }

   @Override
   public void update(MemberVO member, HttpServletRequest request) throws Exception {

      updateProfile(member, request);
      mapper.update(member);
   }

	@Override
	public void delete(int no) {
		mapper.delete(no);
	}
	
	public void updateProfile(MemberVO member, HttpServletRequest request) throws Exception {

		String realPath = request.getServletContext().getRealPath("/resources/assets/img/user");

		MultipartFile mf = member.getImage();
		if (!mf.isEmpty()) {
			String ofn = mf.getOriginalFilename();
			File uf = new File(realPath, ofn);
			mf.transferTo(uf);
			member.setFileName(mf.getOriginalFilename());
		} else {
			member.setFileName("avatar.png");
		}

	}

	@Override
	public int check_user(MemberVO membervo) {
		return mapper.check_user(membervo);
	}
	
	@Override
	public PageDTO<MemberVO> getListPage(Criteria cri) {
		
		int totalCount = mapper.getCountAll(cri);
		List<MemberVO> list = mapper.getListWithPaging(cri); 
		PageDTO<MemberVO> pageDTO = new PageDTO<MemberVO>(totalCount, list, cri);
		
		return pageDTO;
	}

	@Override
	public MemberVO getAllById(String id) {
		return mapper.getAllById(id);
	}
}