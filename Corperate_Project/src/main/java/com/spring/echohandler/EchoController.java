package com.spring.echohandler;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class EchoController {
	
	@RequestMapping("/chat")
	public String echo() {
		return "Chat/Chat";
	}
}
