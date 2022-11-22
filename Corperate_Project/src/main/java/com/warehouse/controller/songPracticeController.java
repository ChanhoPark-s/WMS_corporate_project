package com.warehouse.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.domain.MemberVO;
import com.spring.mapper.MemberMapper;

/**
 * Handles requests for the application home page.
 */

@Controller
public class songPracticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(songPracticeController.class);
	
   @Autowired
   private MemberMapper mapper;
	
	@RequestMapping(value = "/song", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		
		MemberVO m = new MemberVO();
		m.setNo(1);
		
		mapper.example(m);
		System.out.println(m.getNo());
		
		return null;
	}
}
