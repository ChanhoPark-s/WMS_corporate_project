package com.purchase_sheet.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.domain.ClientVO;
import com.spring.domain.ItemVO;
import com.spring.domain.Purchase_sheet_DetailVO;
import com.spring.service.ClientService;
import com.spring.service.ItemService;
import com.spring.service.Purchase_sheet_DetailService;

@Controller
public class Purchase_sheet_DetailController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(Purchase_sheet_DetailController.class);
	
	//private String re = "redirect:list.ps";
	
	@Autowired
	private Purchase_sheet_DetailService pds;
//	
//	@Autowired
//	private MemberService ms;
	
	@Autowired
	private ClientService cs;
	
	@Autowired
	private ItemService is;
	
	@ResponseBody
	@PostMapping(value = "item", produces="application/text;charset=UTF-8")
	public String item(@RequestParam(value = "no") String no) {
		System.out.println(no);
		
		//품목조회
		ItemVO ivo = is.selectOne(Integer.parseInt(no));
		
		//거래처조회
		ClientVO cvo = cs.selectOne(Integer.toString(ivo.getClient_no()));
		
		ivo.setClient_name(cvo.getName());
		
		LOGGER.info("cvo.getName():"+cvo.getName());
		LOGGER.info("ItemVO:"+ivo);
		System.out.println("cvo.getName():"+cvo.getName());
		System.out.println("ItemVO:"+ivo);
		
		return new Gson().toJson(ivo);
	}
	
	@ResponseBody
	@PostMapping(value = "psDetail", produces="application/json;charset=UTF-8")
	public HashMap<String,String> add(@RequestParam HashMap<String,String> form) {
		System.out.println("psdetail:"+form);
		 
	    return form;
	}
}
