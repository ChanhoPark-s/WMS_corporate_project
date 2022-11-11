package com.basicinfo.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.domain.ClientVO;
import com.spring.domain.ItemVO;
import com.spring.domain.MemberVO;
import com.spring.service.ClientService;
import com.spring.service.ItemService;



@Controller
@RequestMapping("/basicinfo/item/*")
public class ItemController {
	
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);

	@Autowired
	private ItemService service;
	
	@Autowired
	private ClientService clientService;
	
	@Autowired
	ServletContext servletContext;
	
	@GetMapping(value="/list")
	public void itemlist(Model model, @RequestParam(required = false,value="select")String select) {	
		List<ItemVO> lists = service.selectAll();
		model.addAttribute("lists", lists);
		
		List<ClientVO> clientList = clientService.GetAll(select);
		model.addAttribute("clientList", clientList);
		
	}
	@PostMapping(value="/insert")
	public String insert(Model model, ItemVO vo) throws Exception {
		
		service.insert(vo);
		return "redirect:/basicinfo/item/list";
	}
	
}