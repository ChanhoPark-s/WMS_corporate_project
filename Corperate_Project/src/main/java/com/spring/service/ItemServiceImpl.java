package com.spring.service;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.domain.ItemVO;
import com.spring.mapper.ItemMapper;

@Service
public class ItemServiceImpl implements ItemService{

	@Autowired
	private ItemMapper mapper;
	
	@Autowired
	private ServletContext servletContext;
	
	@Override
	public List<ItemVO> selectAll() {
		List<ItemVO> lists=mapper.selectAll();
		return lists;
	}

	@Override
	public void insert(ItemVO vo) throws Exception {
		
		String uploadPath = servletContext.getRealPath("/resources/assets/itemimg");
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
}
