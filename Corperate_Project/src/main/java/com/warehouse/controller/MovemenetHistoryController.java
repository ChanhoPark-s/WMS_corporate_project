package com.warehouse.controller;

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

import com.google.gson.Gson;
import com.spring.domain.PageDTO;
import com.spring.domain.WareHouseDetailVO;
import com.spring.domain.WareHouseMovementVO;
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
	public void list(Model model) {	
		model.addAttribute("warehouse", warehouseservice.list());
		model.addAttribute("area", areaservice.list());
		model.addAttribute("rack", rackservice.list());
		model.addAttribute("cell", cellservice.list());
		
		model.addAttribute("list", warehousedetailservice.itemMovement());
	}
	
	@ResponseBody
	@PostMapping(value="/get", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<PageDTO<WareHouseDetailVO>> get(Model model, @RequestBody WareHouseDetailVO vo) {
		return new ResponseEntity<>(warehousedetailservice.getListPage(vo), HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping(value="/get/ware", produces = "application/json; charset=utf-8")
	public String getWare(Model model, @RequestBody WareHouseDetailVO vo) {
		return new Gson().toJson(warehousedetailservice.getWare(vo));
	}
	
	@PostMapping(value="/update")
	public String update(Model model, @RequestBody WareHouseMovementVO vo) {
		System.out.println("ware1 : " + vo.getWare1());
		System.out.println("area1 : " + vo.getArea1());
		System.out.println("rack1 : " + vo.getRack1());
		System.out.println("cell1 : " + vo.getCell1());
		
		System.out.println("ware2 : " + vo.getWare2());
		System.out.println("area2 : " + vo.getArea2());
		System.out.println("rack2 : " + vo.getRack2());
		System.out.println("cell2 : " + vo.getCell2());
		
		System.out.println("lot_code : " + vo.getLot_code());
		warehousedetailservice.update(vo);
		return null;
	}	
}