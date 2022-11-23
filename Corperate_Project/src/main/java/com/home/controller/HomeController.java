package com.home.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.spring.domain.BoardVO;
import com.spring.domain.SearchVO;
import com.spring.service.BoardService;
import com.spring.service.CalculationService;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {
	
	@Autowired
	private CalculationService service;
	
	@Autowired
	private BoardService bservice;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public void home(Model model) {
		
	model.addAttribute("order_Count",service.getAllCount("order"));
	model.addAttribute("order_Money",service.getTotalMoney("order"));
	model.addAttribute("purchase_Count",service.getAllCount("purchase"));
	model.addAttribute("purchase_Money",service.getTotalMoney("purchase"));
	model.addAttribute("sell_Count",service.getAllCount("sell"));
	model.addAttribute("sell_Money",service.getTotalMoney("sell"));
	model.addAttribute("sellClientCount",service.getCountClient("수주처"));
	model.addAttribute("buyClinetCount",service.getCountClient("발주처"));
	model.addAttribute("memberCount",service.getCountMember());
	model.addAttribute("itemCount",service.getCountItem());
	
	List<BoardVO> lists = bservice.list();
	model.addAttribute("lists", lists);
	
	}
	//등록
		@PostMapping(value="/home/insert")
		public String insert(Model model, BoardVO vo){
			bservice.insert(vo);
			return "redirect:/home"; 
		}
		
	@ResponseBody
	@PostMapping(value="/home/selectOne", produces = "application/json; charset=utf8")
	public String selectOne(@RequestParam("no") int no) {
			return  new Gson().toJson(bservice.selectOne(no));
		} 
	
	//삭제
		@GetMapping(value="home/delete")
		public String delete(@RequestParam("no") int no){
			
			bservice.delete(no);
			return "redirect:/home";
		}
	
}