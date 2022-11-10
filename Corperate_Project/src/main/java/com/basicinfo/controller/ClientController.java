package com.basicinfo.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

<<<<<<< HEAD
import com.spring.domain.ClientVO;
import com.spring.service.ClientService;


=======
>>>>>>> branch 'main' of https://github.com/ChanhoPark-s/WMS_corporate_project.git
@Controller
@RequestMapping("/basicinfo/client/*")
public class ClientController {
	

	@Autowired
	private ClientService service;
	
 
	@GetMapping(value="/list")
	public void clientlist(@RequestParam(required = false,value="select")String select,Model model) {				
		
		System.out.println("select:"+select);
		ArrayList<ClientVO> list = service.GetAll(select); 
		model.addAttribute("list",list);
		System.out.println("가져온 레코드 수:"+list.size());
	}
	
	@PostMapping(value="/add")
	public String Add(ClientVO Vo) {
		 
		if(Vo.getCategory().equals("수주"))
			Vo.setCategory("0");
		else
			Vo.setCategory("1");
		
		int result = service.Insert(Vo);
		System.out.println("삽입한 결과 :"+result);
		
		return "/basicinfo/client/list";
	}
}