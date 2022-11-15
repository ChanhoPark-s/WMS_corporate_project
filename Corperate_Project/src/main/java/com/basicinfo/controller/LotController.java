package com.basicinfo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.SearchVO;
import com.spring.service.ClientService;
import com.spring.service.LotService;

@Controller
@RequestMapping("/basicinfo/lot/*")
public class LotController {

	@Autowired
	private LotService service;
	

	@GetMapping(value="/list",produces = "application/text;charset=utf8")
	public void home(SearchVO searchvo,Model model) {				
	
		int totalCount = service.getTotalCount(searchvo);
	}
}