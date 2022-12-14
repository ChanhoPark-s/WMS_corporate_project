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
	public String deleteMainOneAndAllSub(SearchVO searchvo, @RequestParam int no, RedirectAttributes rttr) {
		
		service.deleteOrderSheet(no);
		rttr.addFlashAttribute("searchvo",searchvo);
		
		return redirect;
	}
	
	@PostMapping(value="/delete/many")
	public String deleteMainManyAndAllSub(SearchVO searchvo, @RequestParam String[] checkedMain, RedirectAttributes rttr) {
		
		for(String order_no : checkedMain) {
			service.deleteOrderSheet(Integer.parseInt(order_no));			
		}
		
		rttr.addFlashAttribute("searchvo",searchvo);
		
		return redirect;
	}
	
	@GetMapping(value="/statuschange")
	public String chnageStatus(@RequestParam("ordersheetno") int ordersheetno, @RequestParam("status") int status, RedirectAttributes rttr) {
		
		System.out.println("ordersheetno: " + ordersheetno);
		System.out.println("status: " + status);
		service.changeStatusOrderSheet(ordersheetno, status);
		//rttr.addFlashAttribute("searchvo",searchvo);
		
		return redirect;
	}
}