package com.basicinfo.controller;


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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

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
	public void clientlist(SearchVO searchvo,HttpServletRequest request,Model model) {				
		
		// redirect로 객체받기
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap!=null)
			searchvo =(SearchVO)flashMap.get("searchvo");
		System.out.println("category:는?"+searchvo.getCategory());
		int totalCount = service.getTotalCount(searchvo);
		Client_Paging pageInfo = new Client_Paging(searchvo.getPageNumber(),"10",totalCount,"/basicinfo/client/list",searchvo.getWhatColumn(),searchvo.getKeyword(),0);
		
		
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("list",service.GetAll(pageInfo));
		model.addAttribute("searchvo",searchvo);
		
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
	public String update(ClientVO VO,SearchVO searchvo,RedirectAttributes rttr) {
		service.update(VO);
		rttr.addFlashAttribute("searchvo",searchvo);
		return redirect;
	}
	
	//delete one
	@GetMapping("/delete")
	public String delete(SearchVO searchvo,RedirectAttributes rttr) {
		service.deleteOne(searchvo.getItem_no());
		rttr.addFlashAttribute("searchvo",searchvo);
		return redirect;
	}
	
}