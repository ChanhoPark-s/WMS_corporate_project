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
			System.out.println(multi.getOriginalFilename());
			File uf = new File(uploadPath, ofn);
			multi.transferTo(uf);
			vo.setImage(multi.getOriginalFilename());
		}
		System.out.println(vo.getCode());
		System.out.println(vo.getImage());
		System.out.println(vo.getIn_price());
		System.out.println(vo.getName());
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
}
