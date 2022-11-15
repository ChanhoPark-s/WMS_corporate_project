package com.basicinfo.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.spring.domain.ItemVO;
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;
import com.spring.service.ClientService;
import com.spring.service.ItemService;
import com.spring.service.LotService;

@Controller
@RequestMapping("/basicinfo/lot/*")
public class LotController {

	@Autowired
	private LotService service;
	@Autowired
	private ItemService i_service;
	
	private final String redirect = "redirect:/basicinfo/lot/list";
	
	@GetMapping(value="/list",produces = "application/text;charset=utf8")
	public void home(SearchVO searchvo,Model model,HttpServletRequest request) {				
	
		System.out.println("seachvo.getWhat : "+searchvo.getWhatColumn());
		System.out.println("seachvo.getkey : "+searchvo.getKeyword());
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap!=null)
			searchvo =(SearchVO)flashMap.get("searchvo");
		int totalCount = service.getTotalCount(searchvo);
		
		Client_Paging pageInfo = new Client_Paging(searchvo.getPageNumber(),"10",totalCount,"/basicinfo/lot/list",searchvo.getWhatColumn(),searchvo.getKeyword(),0);

		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("list",service.GetAll(pageInfo));
		model.addAttribute("searchvo",searchvo);
	}
	
	
	
	//delete one
		@GetMapping("/delete")
		public String delete(SearchVO searchvo,RedirectAttributes rttr) {
			
			service.deleteOne(searchvo.getItem_no());
			rttr.addFlashAttribute("searchvo",searchvo);
			
			return redirect;
		}
}