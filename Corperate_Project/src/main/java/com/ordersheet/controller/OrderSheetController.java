package com.ordersheet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.DepartmentVO;
import com.spring.service.DepartmentService;

@Controller
@RequestMapping("/ordersheet/*")
public class OrderSheetController {
	
	@Autowired
	private DepartmentService service;
	
	@GetMapping(value="/list")
	public void list(Model model) {
		//model.addAttribute("voList", service.list());
	}
	
	@PostMapping(value="/add")
	public String insert(DepartmentVO vo) {	
		service.add(vo);
		return "redirect:/basicinfo/department/list";
	}

}