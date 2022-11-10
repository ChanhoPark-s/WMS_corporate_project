package com.basicinfo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.DepartmentVO;
import com.spring.service.DepartmentService;

@Controller
@RequestMapping("/basicinfo/modal/*")
public class ModalEaxmpleController {

	@GetMapping(value="/modal_example")
	public void list(Model model) {		
		
	}
}