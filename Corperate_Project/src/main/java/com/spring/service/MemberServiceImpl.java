package com.spring.service;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.domain.MemberVO;
import com.spring.mapper.MemberMapper;

@Service // 계층 구조상 비지니스 영역을 담당하는 객체임을 표시하기 위해 사용함
public class MemberServiceImpl implements MemberService{

	//spring 4.3 이상에서 자동 처리
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private ServletContext servletContext;

	@Override
	public List<MemberVO> list() {
		return mapper.list(); // 존재하지 않는 레코드를 얻으려고하면 null이 반환됨
	}

	@Override
	public void insert(MemberVO member) throws Exception {
		
		String realPath = servletContext.getRealPath("/resources/assets/files/member");
		
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		MultipartFile mf = member.getImage();
		if(!mf.isEmpty()) {
			String ofn = mf.getOriginalFilename();
			File uf = new File(realPath, ofn);
			mf.transferTo(uf);
			member.setFileName(mf.getOriginalFilename());
		}
		
		mapper.insert(member);
	}

	@Override
	public MemberVO get(int no) {
		return mapper.get(no);
	}

	@Override
	public void update(MemberVO member) throws Exception {
		
		String realPath = servletContext.getRealPath("/resources/assets/files/member");
		
		MultipartFile mf = member.getImage();
		if(!mf.isEmpty()) {
			String ofn = mf.getOriginalFilename();
			File uf = new File(realPath, ofn);
			mf.transferTo(uf);
			member.setFileName(mf.getOriginalFilename());
		}
		
		mapper.update(member);
	}

	@Override
	public void delete(int no) {
		mapper.delete(no);
	}
}