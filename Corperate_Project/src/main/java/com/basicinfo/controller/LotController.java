package com.basicinfo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.service.BoardService;


@Controller
@RequestMapping("/basicinfo/lot/*")
public class LotController {
	
	private static final Logger logger = LoggerFactory.getLogger(LotController.class);

	//@Autowired
	//private BoardService service;

	@GetMapping(value="/list")
	public void home(Model model) {				
		//model.addAttribute("item", service.get(1L));
		
		logger.info("/basicinfo/lot/list.jsp 반환");
		
		//return "list"; //요청 url과 반환해줄 jsp 파일의 이름이 일치하면 해당 함수는 void 타입이어도 된다. views/basicinfo/department/list.jsp 가 반환됨
	}
}