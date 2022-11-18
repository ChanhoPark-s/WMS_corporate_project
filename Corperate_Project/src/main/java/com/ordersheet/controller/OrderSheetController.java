package com.ordersheet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.OrderSheetVO;
import com.spring.service.OrderSheetService;

@Controller
@RequestMapping("/ordersheet/*")
public class OrderSheetController {
	
	@Autowired
	private OrderSheetService service;
	
	@GetMapping(value="/list")
	public void list(Model model) {
		model.addAttribute("voList", service.getList());

	}
	
	@PostMapping(value="/add")
	public String add(OrderSheetVO vo) {
		
		System.out.println(vo.getOut_day());
		System.out.println(vo.getMember_no());
		System.out.println(vo.getClient_no());
		System.out.println(vo.getItem_no());
		System.out.println(vo.getAmount());
		
		service.addOrderSheet(vo);
		
		return "redirect:/ordersheet/list";
	}

}