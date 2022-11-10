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
@RequestMapping("/ordersheet/masdsadd/*")
public class OrderSheetController {
	

	@Autowired
	private DepartmentService service;

	@GetMapping(value="/list")
	public void list(Model model) {
		System.out.println("/basicinfo/department/list.jsp 반환");
		model.addAttribute("voList", service.list());
		//return "list"; //요청 url과 반환해줄 jsp 파일의 이름이 일치하면 해당 함수는 void 타입이어도 된다. views/basicinfo/department/list.jsp 가 반환됨
	}
	
	@PostMapping(value="/add")
	public String insert(DepartmentVO vo) {	
		service.add(vo);
		return "redirect:/basicinfo/department/list";
	}

}