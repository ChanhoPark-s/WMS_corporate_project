package com.signin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.domain.MemberVO;
import com.spring.service.MemberService;

/**
 * Handles requests for the application home page.
 */




@Controller
public class SigninController {
	
	@Autowired
	private MemberService service;
	
	
	@GetMapping("/")
	public String home() {
		return "signin";
	}
	
	
	@ResponseBody
	@PostMapping("/check_user")
	public String check_user(MemberVO membervo,HttpSession session) {
		int result = service.check_user(membervo);
		if(result==1) {
			session.setAttribute("id",membervo.getId());
		}
		return new Gson().toJson(result);
	}
}
