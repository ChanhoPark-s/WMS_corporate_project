package com.purchase_sheet.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.spring.domain.ClientVO;
import com.spring.domain.ItemVO;
import com.spring.domain.MemberVO;
import com.spring.domain.Purchase_sheetVO;
import com.spring.domain.Purchase_sheet_DetailVO;
import com.spring.paging.Client_Paging;
import com.spring.service.ClientService;
import com.spring.service.ItemService;
import com.spring.service.MemberService;
import com.spring.service.Purchase_sheetService;
import com.spring.service.Purchase_sheetServiceImpl;
import com.spring.service.Purchase_sheet_DetailService;


@Controller

public class Purchase_sheetController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(Purchase_sheetController.class.getName());
	
	private String re = "redirect:list.ps";
	
	@Autowired
	private Purchase_sheetService ps;
	
	@Autowired
	private Purchase_sheet_DetailService pds;
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	private ClientService cs;
	
	@Autowired
	private ItemService is;
	
	@RequestMapping("/list.ps")
	public ModelAndView list(Model model) {
		ModelAndView mav = new ModelAndView();
		
		//발주조회
		List<Purchase_sheetVO> lists = ps.list();
		
		//맴버조회
		List<MemberVO> memberList = ms.list();
		
		//거래처조회
		List<ClientVO> clientList = cs.GetAllClient();
		
		//품목조회
		List<ItemVO> itemList = is.selectAll();
		
		
		LOGGER.info("size : " + lists.size());
		LOGGER.info("size : " + memberList.size());
		LOGGER.info("size : " + clientList.size());
		
		mav.addObject("lists", lists);
		mav.addObject("memberList", memberList);
		mav.addObject("clientList", clientList);
		mav.addObject("itemList", itemList);
		
		return mav;
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
	
	@GetMapping("/delete.ps")
	public String delete(Purchase_sheetVO vo) {
		
		int cnt = ps.delete(vo);
		pds.delete(vo.getNo());
		
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
