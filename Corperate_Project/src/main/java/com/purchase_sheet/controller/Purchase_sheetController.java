package com.purchase_sheet.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.google.gson.Gson;
import com.spring.domain.ClientVO;
import com.spring.domain.Input_WareHouse_DetailVO;
import com.spring.domain.ItemVO;
import com.spring.domain.Purchase_sheetVO;
import com.spring.domain.Purchase_sheet_DetailVO;
import com.spring.domain.SearchVO;
import com.spring.domain.WareHouseVO;
import com.spring.paging.Client_Paging;
import com.spring.service.ClientService;
import com.spring.service.Input_WareHouse_DetailService;
import com.spring.service.ItemService;
import com.spring.service.OrderSheetService;
import com.spring.service.Purchase_sheetService;
import com.spring.service.WareHouseService;


@Controller

public class Purchase_sheetController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(Purchase_sheetController.class.getName());
	
	private String re = "redirect:list.ps";
	
	@Autowired
	private Purchase_sheetService ps;
	
	@Autowired
	private WareHouseService ws;
	
	@Autowired
	private ItemService is;
	
	@Autowired
	private ClientService cs;
	
	@Autowired
	private OrderSheetService os;
	
	@Autowired
	private Input_WareHouse_DetailService iwds;
	
	@RequestMapping("/statuschange.ps")
	public String status(@RequestParam int no) {
		//입고확인시 발주완료
		ps.updateStatus(no);
		
		return re;
	}
	
	
	@RequestMapping("/list.ps")
	public void list(SearchVO searchvo,HttpServletRequest request,Model model) {
		
		//날짜에 따른 상태:취소됨
		//ps.update();
		
		//창고조회
		List<WareHouseVO> WareList = ws.list();
		
		// redirect로 객체받기
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap!=null)
			searchvo =(SearchVO)flashMap.get("searchvo");
		int totalCount = ps.getTotalCount(searchvo);
		
		//페이지넘버, 페이지당 행갯수, 총레코드수, 위치, 검색명, 검색어, ?
		Client_Paging pageInfo = new Client_Paging(searchvo.getPageNumber(),"10",totalCount,"/list.ps",searchvo.getWhatColumn(),searchvo.getKeyword(),0);
		List<Purchase_sheetVO> lists = ps.GetAll(pageInfo);
		
		//totalPrice 구하기
		for(Purchase_sheetVO vo :lists) {
			System.out.println("vo"+vo);
			System.out.println("vo.getTotalPrice()"+ vo.getTotalPrice()); 
			System.out.println("vo.getAmount()"+ vo.getAmount()); 
			if(vo.getTotalPrice() != null) {
				String[] price = vo.getTotalPrice().split(",");
				String[] amount = vo.getTotalAmount().split(",");
				System.out.println("price"+price);
				System.out.println("amount"+amount);
				int totalPrice = 0;
				for(int i=0; i<price.length; i++) {
					System.out.println("x"+price[i]);
					totalPrice = (Integer.parseInt(price[i]) * Integer.parseInt(amount[i])) + totalPrice;
					System.out.println("totalPrice"+totalPrice);
				}
				vo.setTotalPrice(Integer.toString(totalPrice));
			}
		}
		
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("totalCount",totalCount);
		//페이징조회
		model.addAttribute("lists",lists);
		model.addAttribute("searchvo",searchvo);
		
		LOGGER.info("size : " + ps.GetAll(pageInfo).size());
		
		
		
		//페이징전 조회
		//model.addAttribute("lists", lists);
		model.addAttribute("WareList", WareList);
		
	}
	
	@PostMapping("/insert.ps")
	public String insert(Purchase_sheetVO vo) {
		System.out.println("vo.getOrder_no():" + vo.getOrder_no());
		System.out.println(vo.getMember_no());
		System.out.println(vo.getClient_no());
		System.out.println(vo.getDelivery_date());
		
		System.out.println("vo.getItem_no():" + vo.getItem_no());
		System.out.println(vo.getAmount());
		System.out.println(vo.getWare_no());
		System.out.println(vo.getOrder_no());
		
		int cnt = ps.insert(vo);
		System.out.println("insert 성공" + cnt);
		
		// 수주 상태 수정
		if(vo.getOrder_no() != null) {
			os.updateStatus(vo.getOrder_no());
			System.out.println("준비완료> 발주중 update 완료");
		}
		
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
	public String delete(int no) {
		System.out.println(no);
		int cnt = ps.delete(no);
		System.out.println("cnt: " + cnt);
		cnt = ps.deleteDetail(no);
		System.out.println("cnt: " + cnt);
		return re;
	}
	
	@ResponseBody
	@GetMapping(value = "detailList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> detail(String purchase_sheet_no) {
		LOGGER.info("purchase_sheet_no"+purchase_sheet_no);
		System.out.println("purchase_sheet_no"+purchase_sheet_no);
		
		//발주상세조회
		List<Purchase_sheet_DetailVO> lists = ps.selectList(purchase_sheet_no); 
		
		//금액총합
		for(Purchase_sheet_DetailVO vo :lists) {
			vo.setTotal_Price(vo.getIN_PRICE()* vo.getAMOUNT());
		}
		
		//입고상세조회
		List<Input_WareHouse_DetailVO> lists2 = iwds.getSubList2(Integer.parseInt(purchase_sheet_no));
		
		//map
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("pd", lists);
		map.put("iwd", lists2);
		
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping(value = "item", produces="application/text;charset=UTF-8")
	public String item(@RequestParam(value = "no") String no) {
		System.out.println(no);
		
		//품목조회
		ItemVO ivo = is.selectOne(Integer.parseInt(no));
		
		//거래처조회
		ClientVO cvo = cs.selectOne(Integer.toString(ivo.getClient_no()));
		
		ivo.setClient_name(cvo.getName());
		
		LOGGER.info("cvo.getName():"+cvo.getName());
		LOGGER.info("ItemVO:"+ivo);
		System.out.println("cvo.getName():"+cvo.getName());
		System.out.println("ItemVO:"+ivo);
		
		return new Gson().toJson(ivo);
	}
	
	@ResponseBody
	@PostMapping(value = "psDetail", produces="application/json;charset=UTF-8")
	public HashMap<String,String> add(@RequestParam HashMap<String,String> form) {
		System.out.println("psdetail:"+form);
		 
	    return form;
	}
	
}
