package com.sell.controller;


import java.util.List;
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
import org.springframework.web.servlet.support.RequestContextUtils;

import com.spring.domain.ItemVO;
import com.spring.domain.SearchVO;
import com.spring.domain.SellDetailVO;
import com.spring.domain.SellVO;
import com.spring.paging.Client_Paging;
import com.spring.service.ItemService;
import com.spring.service.SellDetailService;
import com.spring.service.SellService;


@Controller
@RequestMapping("/sell/origin/*")
public class SellController {
	
	private static final Logger logger = LoggerFactory.getLogger(SellController.class);
	
	@Autowired(required = false)
	private SellService service;
	
	@Autowired(required = false)
	private SellDetailService sdservice;
	
	@Autowired(required = false)
	private ItemService iservice; 
	
	@GetMapping(value="/list")
	public void list(SearchVO searchvo, HttpServletRequest request, Model model) {
		
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if (flashMap != null) {
			searchvo = (SearchVO) flashMap.get("searchvo"); //searchVO 를 덮어씌움
		}
		
		int totalCount = service.getTotalCount(searchvo); 
		Client_Paging pageInfo = 
				new Client_Paging
				(searchvo.getPageNumber(),"10",totalCount,"/sell/origin/list",
						searchvo.getWhatColumn(),searchvo.getKeyword(),0);
		// 원래 있던거
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("lists", service.getListByPaging(pageInfo));
		model.addAttribute("searchvo",searchvo);
		
	}
	@PostMapping(value="/insert")
	public String insertSold(Model model, SellVO sell, SellDetailVO selldetail) {
	
		
//		System.out.println("어떻게 나올까.,:"+sell.getMember_no());
//		
//		ArrayList<Integer> memlists = sell.getMember_no();
//		
//		for(int i = 0;i<sell.getMember_no().size();i++) {
//			System.out.println(memlists.get(i));
//		}
		
		System.out.println(sell.getOrder_no());
		System.out.println(sell.getDay());
		service.insert(sell);
		System.out.println("selldetail 판매상세번호:"+selldetail.getNo());
		System.out.println("selldetail 품목번호:"+selldetail.getItem_no());
		System.out.println("selldetail 품목수량:"+selldetail.getAmount());
		System.out.println("selldetail 단가:"+selldetail.getSell_price());
		System.out.println("selldetail 로트코드:"+selldetail.getLot_code());
		System.out.println("selldetail 판매번호:"+selldetail.getSell_no());
		sdservice.insert(selldetail);
		
		return "redirect:/sell/origin/list";
	}
	
	@GetMapping(value="/delete")
	public String deleteSold(Model model, @RequestParam(value="no") int no) {
		
		System.out.println(no);

		service.delete(no);
		
	
		return "redirect:/sell/origin/list";
	}
	
	@PostMapping(value="/update")
	public String updateSold(Model model, SellVO sell) {
		
		System.out.println(sell.getNo()+"/"+sell.getOrder_no()+"/"+sell.getMember_no()+"/"+sell.getDay());
		
		service.update(sell);
		
		return "redirect:/sell/origin/list";
	}
	 
	@GetMapping(value="/sellstatus")
	public void sellstatus(SearchVO searchvo,HttpServletRequest request, Model model) {
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap!=null)
			searchvo =(SearchVO)flashMap.get("searchvo");
		int totalCount = sdservice.getTotalCount(searchvo); 
		Client_Paging pageInfo = new Client_Paging(searchvo.getPageNumber(),"10",totalCount,"redirect:/sell/origin/sellstatus",searchvo.getWhatColumn(),searchvo.getKeyword(),0);
		System.out.println("토탈"+totalCount);
		model.addAttribute("itemlist", iservice.selectAll(pageInfo));
		model.addAttribute("dlists", sdservice.selectAll(pageInfo));
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("searchvo",searchvo);
	}
}
