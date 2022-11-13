package com.basicinfo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;
import com.spring.service.ClientService;


@Controller
@RequestMapping("/basicinfo/client/*")
public class ClientController {
	

	@Autowired
	private ClientService service;
	
	private final String redirect = "redirect:/basicinfo/client/list";
	
	
	
	// getAll
	@GetMapping(value="/list", produces = "application/text;charset=utf8")
	public void clientlist(@RequestParam(required = false,value="select")String select,
			@RequestParam(required = false,value="pageNumber")String pageNumber,
			SearchVO searchvo,
			Model model,HttpServletRequest request) {				
		
		searchvo.setKeyword("%"+searchvo.getKeyword()+"%");
		
		  
		// Client getAllCount
		int totalCount = service.getTotalCount(searchvo);
		System.out.println("내가확인 : totalCount : "+totalCount);
		
		String url = request.getContextPath()+"/list";

		Client_Paging pageInfo = new Client_Paging(pageNumber,"2",totalCount,url,searchvo.getWhatColumn(),searchvo.getKeyword(),null);
		
		ArrayList<ClientVO> list = service.GetAll(pageInfo);
		
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("totalCount",totalCount);
		
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