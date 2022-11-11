package com.basicinfo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.domain.ClientVO;
import com.spring.service.ClientService;

import paging.Client_Paging;


@Controller
@RequestMapping("/basicinfo/client/*")
public class ClientController {
	

	@Autowired
	private ClientService service;
	
	private final String redirect = "redirect:/basicinfo/client/list";
	
	
	// getAll
	@GetMapping(value="/list", produces = "application/text;charset=utf8")
	public void clientlist(@RequestParam(required = false,value="select")String select,
			@RequestParam(required = false,value="whatColumn")String whatColumn,
			@RequestParam(required = false,value="keyword")String keyword,
			@RequestParam(required = false,value="pageNumber")String pageNumber,
			Model model,HttpServletRequest request) {				
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = service.getTotalCount(map);
		System.out.println("totalCount : "+totalCount);
		
		String url = request.getContextPath()+"/list";

		Client_Paging pageInfo = new Client_Paging(pageNumber,"8",totalCount,url,whatColumn,keyword,null);
		
		
		//lists = service.getAlbumList(pageInfo,map);
		
		//model.addAttribute("lists",lists);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("totalCount",totalCount);
		
		
		ArrayList<ClientVO> list = service.GetAll(select);
		model.addAttribute("list",list);
	}
	 
	// insert
	@PostMapping("/add")
	public String Add(ClientVO Vo) {
		
		service.Insert(Vo);
		return redirect;
	}
	
	
	//select_one
	@ResponseBody
	@PostMapping(value="/select",produces = "application/text;charset=utf8")
	public String select(@RequestParam("item_no")String item_no) {
		
		return new Gson().toJson(service.selectOne(item_no));
	}
	
	//update
	@PostMapping("/update")
	public String update(ClientVO VO) {
		
		service.update(VO);
		return redirect;
	}
	
	//delete one
	@GetMapping("/delete")
	public String delete(@RequestParam("item_no")String item_no) {
		
		service.deleteOne(item_no);
		
		return redirect;
	}
	
}