package com.purchase_sheet.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.google.gson.Gson;
import com.spring.domain.ClientVO;
import com.spring.domain.ItemVO;
import com.spring.domain.MemberVO;
import com.spring.domain.PageDTO;
import com.spring.domain.Purchase_sheetVO;
import com.spring.domain.Purchase_sheet_DetailVO;
import com.spring.domain.SearchVO;
import com.spring.domain.WareHouseVO;
import com.spring.paging.Client_Paging;
import com.spring.paging.Criteria;
import com.spring.service.ClientService;
import com.spring.service.ItemService;
import com.spring.service.MemberService;
import com.spring.service.Purchase_sheetService;
import com.spring.service.Purchase_sheet_DetailService;
import com.spring.service.WareHouseService;


@Controller

public class Purchase_sheetController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(Purchase_sheetController.class.getName());
	
	private String re = "redirect:list.ps";
	
	@Autowired
	private Purchase_sheetService ps;
	
	@Autowired
	private Purchase_sheet_DetailService pds;
	
	@Autowired
	private WareHouseService ws;
	
	@RequestMapping("/list.ps")
	public void list(SearchVO searchvo,HttpServletRequest request,Model model) {
		
		//발주조회
		List<Purchase_sheetVO> lists = ps.list();
		
		//창고조회
		List<WareHouseVO> WareList = ws.list();
		
		// redirect로 객체받기
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap!=null)
			searchvo =(SearchVO)flashMap.get("searchvo");
		int totalCount = ps.getTotalCount(searchvo);
		
		//페이지넘버, 페이지당 행갯수, 총레코드수, 위치, 검색명, 검색어, ?
		Client_Paging pageInfo = new Client_Paging(searchvo.getPageNumber(),"10",totalCount,"/list.ps",searchvo.getWhatColumn(),searchvo.getKeyword(),0);
		
		
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("totalCount",totalCount);
		//페이징조회
		model.addAttribute("lists",ps.GetAll(pageInfo));
		model.addAttribute("searchvo",searchvo);
		
		LOGGER.info("size : " + lists.size());
		
		//페이징전 조회
		//model.addAttribute("lists", lists);
		model.addAttribute("WareList", WareList);
		
	}
	
	@GetMapping("/insert.ps")
	public String insert(Purchase_sheetVO vo) {
		
		int cnt = ps.insert(vo);
		
		return re;
	}
	
	@ResponseBody
	@GetMapping("/update.ps")
	public String update(String no,Model model) {
		System.out.println(no);
		
		Purchase_sheetVO psvo = ps.selectOne(no);
		LOGGER.info("psvo : " + psvo);
		
		return new Gson().toJson(psvo);
	}
	
	@ResponseBody
	@GetMapping("/delete")
	public String delete(Purchase_sheetVO vo) {
		System.out.println(vo.getNo());
		int cnt = ps.delete(vo);
		System.out.println("cnt: " + cnt);
		cnt = pds.delete(vo.getNo());
		System.out.println("cnt: " + cnt);
		return re;
	}
	
	@ResponseBody
	@GetMapping(value = "detailList", produces="application/json;charset=UTF-8")
	public String detail(String purchase_sheet_no) {
		LOGGER.info("purchase_sheet_no"+purchase_sheet_no);
		System.out.println("purchase_sheet_no"+purchase_sheet_no);
		
		//발주상세조회
		List<Purchase_sheet_DetailVO> lists = pds.selectList(purchase_sheet_no);
		
		return new Gson().toJson(lists);
	}
	
	
}
