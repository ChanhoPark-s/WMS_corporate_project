package com.basicinfo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.DepartmentVO;
import com.spring.service.DepartmentService;

@Controller
@RequestMapping("/basicinfo/department/*")
public class DepartmentController {
	
	private static final Logger logger = LoggerFactory.getLogger(DepartmentController.class);

	@Autowired
	private DepartmentService service;

	@GetMapping(value="/list")
	public void list(Model model) {
		model.addAttribute("voList", service.list());
	}
	
	@PostMapping(value="/insert")
	public String insert(DepartmentVO vo) {	
		service.add(vo);
		return "redirect:/basicinfo/department/list";
	}
	
	@PostMapping(value="/update")
	public String update(DepartmentVO vo) {				
		service.modify(vo);
		return "redirect:/basicinfo/department/list";
	}
	
	@GetMapping(value="/delete/{no}")
	public String delete(DepartmentVO vo, @PathVariable(value="no") int no) {				
		service.delete(no);
		return "redirect:/basicinfo/department/list";
	}
	
	// 전체 부서코드 리턴용도의 메서드
	public List<DepartmentVO> getDeptList() {
		return service.getDeptList();
	}
}