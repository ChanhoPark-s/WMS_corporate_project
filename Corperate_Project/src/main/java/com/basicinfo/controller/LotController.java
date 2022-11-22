package com.basicinfo.controller;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.spring.domain.LotVO;
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;
import com.spring.service.LotService;

@Controller
@RequestMapping("/basicinfo/lot/*")
public class LotController {

	@Autowired
	private LotService service;
	
	private final String redirect = "redirect:/basicinfo/lot/list";
	
	private final DecimalFormat decFormat = new DecimalFormat("###,###");
	
	@GetMapping(value="/list",produces = "application/text;charset=utf8")
	public void home(SearchVO searchVo,Model model,HttpServletRequest request) {				
	
		System.out.println("searchVo.getWhat : "+searchVo.getWhatColumn());
		System.out.println("searchVo.getkey : "+searchVo.getKeyword());
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap!=null)
			searchVo =(SearchVO)flashMap.get("searchVo");
		int totalCount = service.getTotalCount(searchVo);
		
		Client_Paging pageInfo = new Client_Paging(searchVo.getPageNumber(),"10",totalCount,"/basicinfo/lot/list",searchVo.getWhatColumn(),searchVo.getKeyword(),0);

		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("list",service.GetAll(pageInfo));
		model.addAttribute("searchVo",searchVo);
	}
	
	
	
	//delete one
		@GetMapping("/delete")
		public String delete(SearchVO searchVo,RedirectAttributes rttr) {
			
			service.deleteOne(searchVo.getItem_no());
			rttr.addFlashAttribute("searchVo",searchVo);
			
			return redirect;
		}
		//select
		@ResponseBody
		@PostMapping(value="/selectOne",produces = "application/text;charset=utf8")
		public String selectOne(@RequestParam("code") String code) {
			
			LotVO l= service.getOne(code);
			l.setFormattedIn_price(decFormat.format(l.getIn_price()));
			l.setFormattedOut_price(decFormat.format(l.getOut_price()));
			
			return new Gson().toJson(l);
		}

}