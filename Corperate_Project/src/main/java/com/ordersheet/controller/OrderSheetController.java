package com.ordersheet.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.spring.domain.OrderSheetVO;
import com.spring.domain.SearchVO;
import com.spring.mapper.OrderSheetMapper;
import com.spring.paging.Client_Paging;
import com.spring.service.OrderSheetService;

@Controller
@RequestMapping("/ordersheet/*")
public class OrderSheetController {
	
	@Autowired
	private OrderSheetService service;
	
	private final String redirect = "redirect:/ordersheet/list";
	
	@GetMapping(value="/list")
	public void list(SearchVO searchvo, HttpServletRequest request, Model model) {

		// 레코드 삭제 또는 수정후 여기로 올 때 redirect로 searchvo 객체받기
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if (flashMap != null) {
			searchvo = (SearchVO) flashMap.get("searchvo"); //searchVO 를 덮어씌움
		}
			
		int totalCount = service.getTotalCount(searchvo); 
		Client_Paging pageInfo = new Client_Paging(searchvo.getPageNumber(),"10",totalCount,"/ordersheet/list",searchvo.getWhatColumn(),searchvo.getKeyword(),0);
		
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("voList", service.getListByPaging(pageInfo));
		model.addAttribute("searchvo",searchvo);
		
	}
	
	@PostMapping(value="/add")
	public String add(OrderSheetVO vo) {

		service.addOrderSheet(vo);
		
		return redirect;
	}
	
	@PostMapping(value="/update")
	public String update(SearchVO searchvo, OrderSheetVO vo, RedirectAttributes rttr) {
	
		service.updateOrderSheet(vo);
		rttr.addFlashAttribute("searchvo",searchvo);
		
		return redirect;
	}
	
	@PostMapping(value="/delete/one")
	public String deleteMainAndSub(SearchVO searchvo, @RequestParam int no, RedirectAttributes rttr) {
		
		service.deleteOrderSheet(no);
		rttr.addFlashAttribute("searchvo",searchvo);
		
		return redirect;
	}

}