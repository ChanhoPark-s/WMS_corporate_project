package com.basicinfo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.RequestParam;
=======
>>>>>>> branch 'main' of https://github.com/ChanhoPark-s/WMS_corporate_project.git

@Controller
@RequestMapping("/basicinfo/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	//@Autowired
	//private BoardService service;

	@GetMapping(value="/list")
	public String home(Model model) {				
		
		logger.info("/basicinfo/member/list.jsp 반환");
		
		return "/basicinfo/member/list"; // 요청 url과 반환해줄 jsp 파일의 이름이 일치하면 해당 함수는 void 타입이어도 된다.
											// views/basicinfo/department/list.jsp 가 반환됨
	}
}