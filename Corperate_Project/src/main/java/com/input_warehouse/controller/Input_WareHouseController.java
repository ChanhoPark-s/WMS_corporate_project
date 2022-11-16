package com.input_warehouse.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.Input_WareHouseVO;
import com.spring.service.Input_WareHouseService;

@Controller
@RequestMapping("/input_warehouse/*")
public class Input_WareHouseController {
	
	private static final Logger logger = LoggerFactory.getLogger(Input_WareHouseController.class);

	@Autowired
	private Input_WareHouseService service;


	@GetMapping(value="/list")
	public void list(Model model) {
		List<Input_WareHouseVO> lists = service.list();
		model.addAttribute("lists", lists);
		logger.info("/input_warehouse/list.jsp 반환");
	}
	

}