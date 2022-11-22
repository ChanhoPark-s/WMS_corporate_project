package com.warehouse.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.google.gson.Gson;
import com.spring.domain.PageDTO;
import com.spring.domain.SearchVO;
import com.spring.domain.WareHouseDetailVO;
import com.spring.domain.WareHouseMovementVO;
import com.spring.paging.Client_Paging;
import com.spring.service.AreaService;
import com.spring.service.CellService;
import com.spring.service.RackService;
import com.spring.service.WareHouseDetailService;
import com.spring.service.WareHouseService;


@Controller
@RequestMapping("/warehouse/movementHistory/*")
public class MovemenetHistoryController {
	
	private static final Logger logger = LoggerFactory.getLogger(MovemenetHistoryController.class);
	
	@Autowired
	private WareHouseService warehouseservice;
	
	@Autowired
	private WareHouseDetailService warehousedetailservice;
	
	@Autowired
	private AreaService areaservice;
	
	@Autowired
	private RackService rackservice;
	
	@Autowired
	private CellService cellservice;
	
	@GetMapping(value="/list")
	public void list(Model model, HttpServletRequest request, SearchVO searchvo) {	
		
		model.addAttribute("warehouse", warehouseservice.list());
		model.addAttribute("area", areaservice.list());
		model.addAttribute("rack", rackservice.list());
		model.addAttribute("cell", cellservice.list());
		
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap!=null)
			searchvo =(SearchVO)flashMap.get("searchvo");
		int totalCount = warehousedetailservice.getTotalCount(searchvo);
		Client_Paging pageInfo = new Client_Paging(searchvo.getPageNumber(),"10",totalCount,"/warehouse/movementHistory/list",searchvo.getWhatColumn(),searchvo.getKeyword(),0);
		
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("searchvo",searchvo);
		model.addAttribute("list", warehousedetailservice.itemMovement(pageInfo));
	}
	
	// 출고 품목 선택
	@ResponseBody
	@PostMapping(value="/get", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<PageDTO<WareHouseDetailVO>> get(Model model, @RequestBody WareHouseDetailVO vo) {
		return new ResponseEntity<>(warehousedetailservice.getListPage(vo), HttpStatus.OK);
	}
	
	// 입고 창고 선택
	@ResponseBody
	@PostMapping(value="/get/ware", produces = "application/json; charset=utf-8")
	public String getWare(Model model, @RequestBody WareHouseDetailVO vo) {
		return new Gson().toJson(warehousedetailservice.getWare(vo));
	}
	
	@PostMapping(value="/update")
	public String update(Model model, @RequestBody WareHouseMovementVO vo) {
		warehousedetailservice.update(vo);
		return null;
	}	
}