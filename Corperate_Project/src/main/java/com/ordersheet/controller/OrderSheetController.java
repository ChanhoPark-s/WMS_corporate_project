package com.ordersheet.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.spring.domain.OrderSheetVO;
import com.spring.domain.SearchVO;
import com.spring.mapper.OrderSheetMapper;
import com.spring.paging.Client_Paging;
import com.spring.service.OrderSheetService;

@Controller
@RequestMapping("/ordersheet/*")
public class OrderSheetController {
	
	@Autowired
	private OrderSheetService service;
	
	@GetMapping(value="/list")
	public void list(SearchVO searchvo, HttpServletRequest request, Model model) {
		//페이징 없이 전부 출력하던 코드
		//model.addAttribute("voList", service.getList());
		
		int totalCount = service.getTotalCount(searchvo); 
		Client_Paging pageInfo = new Client_Paging(searchvo.getPageNumber(),"10",totalCount,"/ordersheet/list",searchvo.getWhatColumn(),searchvo.getKeyword(),0);
		
		// 원래 있던거
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("voList", service.getListByPaging(pageInfo));
		model.addAttribute("searchvo",searchvo);
		
		/*
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("list",service.GetAll(pageInfo));
		*/
	}
	
	@PostMapping(value="/add")
	public String add(OrderSheetVO vo) {
		
//		System.out.println(vo.getOut_day());
//		System.out.println(vo.getMember_no());
//		System.out.println(vo.getClient_no());
//		System.out.println(vo.getItem_no());
//		System.out.println(vo.getAmount());
		
		service.addOrderSheet(vo);
		
		return "redirect:/ordersheet/list";
	}

}