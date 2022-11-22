package com.spring.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.domain.ItemVO;
import com.spring.domain.PageDTO;
import com.spring.domain.SearchVO;
import com.spring.mapper.ItemMapper;
import com.spring.paging.Criteria;
import com.spring.paging.Client_Paging;

@Service
public class ItemServiceImpl implements ItemService{

	@Autowired
	private ItemMapper mapper;
	
	@Override
	public List<ItemVO> selectAll(Client_Paging pageInfo) {
		List<ItemVO> lists=mapper.selectAll(pageInfo);
		return lists;
	}

	@Override
	public void insert(ItemVO vo, HttpServletRequest request) throws Exception {
		
		String uploadPath = request.getServletContext().getRealPath("/resources/assets/img/item/");
		System.out.println(uploadPath);
		File file = new File(uploadPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		System.out.println(1);
		MultipartFile multi = vo.getUpload();
		if(!multi.isEmpty()) {
			String ofn = multi.getOriginalFilename();
			System.out.println("파일위치"+multi.getOriginalFilename());
			File uf = new File(uploadPath, ofn);
			multi.transferTo(uf);
			vo.setImage(multi.getOriginalFilename());
		}
		System.out.println("코드"+vo.getCode());
		System.out.println("이미지"+vo.getImage());
		System.out.println("입고가"+vo.getIn_price());
		System.out.println("품목"+vo.getName());
		mapper.insert(vo);
	}

	@Override
	public void delete(int no) {
		
		mapper.delete(no);
	}
	
	@Override
	public ItemVO selectOne(int no) {
		return mapper.selectOne(no);
	}

	@Override
	public void update(ItemVO vo, HttpServletRequest request) throws Exception {
		String deletePath = request.getServletContext().getRealPath("/resources/assets/img/item/"); // 실제 이미지 파일이 들어있는 경로
		File deletefile = new File(deletePath + vo.getImage()); // 기존 이미지 삭제
		
		System.out.println("이미지 파일 경로 : " + deletePath);
		if (deletefile.exists()) {
			if (deletefile.delete()) {
				System.out.println("이미지 삭제 성공");
			} else {
				System.out.println("이미지 삭제 실패");
			}
		} else {
			System.out.println("이미지 파일이 존재하지 않음");
		}
	

		String uploadPath = request.getServletContext().getRealPath("/resources/assets/img/item/");
		System.out.println(uploadPath);
		File file = new File(uploadPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		System.out.println(1);
		MultipartFile multi = vo.getUpload();
		if(!multi.isEmpty()) {
			String ofn = multi.getOriginalFilename();
			System.out.println(multi.getOriginalFilename());
			File uf = new File(uploadPath, ofn);
			multi.transferTo(uf);
			vo.setImage(multi.getOriginalFilename());
		}
		System.out.println("살려줘");
		mapper.update(vo);
	}
	
	@Override
	public PageDTO<ItemVO> getListPage(Criteria cri) {
		int totalCount = mapper.getCountAll(cri);
		List<ItemVO> list = mapper.getListWithPaging(cri);
		PageDTO<ItemVO> pageDTO = new PageDTO<ItemVO>(totalCount, list, cri);
	
		return pageDTO;
	}

	@Override
	public int getTotalCount(SearchVO searchvo) { 
		return mapper.getTotalCount(searchvo);
	}
	
	@Override
	public int code_check(String code) { 
		return mapper.code_check(code);
	}
	
	@Override
	public int selectDelete(String[] parameterValues) {
		return mapper.selectDelete(parameterValues);
	}
	
	@Override
	public int getPrice(int no) {
		return mapper.getPrice(no);
	}
}
