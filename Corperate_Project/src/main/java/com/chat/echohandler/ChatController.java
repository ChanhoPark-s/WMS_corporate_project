package com.chat.echohandler;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.domain.ChatVO;
import com.spring.domain.MemberVO;
import com.spring.service.ChatService;
import com.spring.service.MemberService;

@Controller
@RequestMapping("/chat/*")
public class ChatController {

	@Autowired
	private ChatService service;
	
	@Autowired
	private MemberService mservice;
	
	
	//insert
	@PostMapping("/insert")
	public void selectByCode(ChatVO chatvo,HttpSession session) {
		MemberVO mvo = mservice.getAllById((String)session.getAttribute("id"));
		chatvo.setMember_id(mvo.getId());
		chatvo.setMember_name(mvo.getName());
		
		service.insertChat(chatvo);
	}
	
	@ResponseBody
	@GetMapping(value="/getAll",produces = "application/text;charset=utf8")
	public String getAllContent() {
		return new Gson().toJson(service.getAllContent());
	}
}