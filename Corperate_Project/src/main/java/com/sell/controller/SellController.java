package com.sell.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.domain.SellVO;
import com.spring.service.SellService;

import lombok.Data;
import lombok.Getter;

@Controller
@RequestMapping("/sell/origin/*")
public class SellController {
	
	private static final Logger logger = LoggerFactory.getLogger(SellController.class);
	
	@Autowired(required = false)
	private SellService service;
	
	@GetMapping(value="/list")
	public void list(Model model) {				
		
		List<SellVO> lists = service.read();
		model.addAttribute("lists", lists);
		System.out.println("리스트의 개수: " + lists.size());
		logger.info("/sell/origin/list.jsp 반환");
		
		//return "list"; //요청 url과 반환해줄 jsp 파일의 이름이 일치하면 해당 함수는 void 타입이어도 된다. views/basicinfo/department/list.jsp 가 반환됨
	}
	
	@PostMapping(value="/insert")
	public String insertSold(Model model, SellVO sell) {
	
		System.out.println(sell.getMember_no());
		System.out.println(sell.getOrder_no());
		System.out.println(sell.getDay());
		service.get(sell);

		
		return "redirect:/sell/origin/list";
	}
	
	@GetMapping(value="/delete")
	public String deleteSold(Model model, @RequestParam(value="no") int no) {
		
		System.out.println(no);

		service.delete(no);
		
	
		return "redirect:/sell/origin/list";
	}
	
	@PostMapping(value="/update")
	public String updateSold(Model model, SellVO sell) {
		
		System.out.println(sell.getNo()+"/"+sell.getOrder_no()+"/"+sell.getMember_no()+"/"+sell.getDay());
		
		service.update(sell);
		
		return "redirect:/sell/origin/list";
	}

}
