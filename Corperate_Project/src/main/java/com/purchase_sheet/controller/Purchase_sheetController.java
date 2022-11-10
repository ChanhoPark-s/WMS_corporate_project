package com.purchase_sheet.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.basicinfo.controller.DepartmentController;
import com.spring.domain.Purchase_sheetVO;
import com.spring.service.Purchase_sheetServiceImpl;


@Controller
public class Purchase_sheetController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(Purchase_sheetController.class.getName());
	
	private String re = "redirect:list.ps";
	
	@Autowired
	Purchase_sheetServiceImpl ps;
	
	@GetMapping("/list.ps")
	public ModelAndView list() {
		LOGGER.info("Hello world");
		
		ArrayList<Purchase_sheetVO> lists = (ArrayList<Purchase_sheetVO>) ps.list();
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("lists", lists);
		
		return mav;
	}
	
	@GetMapping("/insert.ps")
	public String insert(Purchase_sheetVO vo) {
		System.out.println(vo.getNo());
		
		int cnt = ps.insert(vo);
		
		return re;
	}
	
	@GetMapping("/update.ps")
	public String update(Purchase_sheetVO vo) {
		System.out.println(vo.getNo());
		
		int cnt = ps.update(vo);
		
		return re;
	}
	
	@GetMapping("/delete.ps")
	public String delete(Purchase_sheetVO vo) {
		System.out.println(vo.getNo());
		
		int cnt = ps.delete(vo);
		
		return re;
	}
}
