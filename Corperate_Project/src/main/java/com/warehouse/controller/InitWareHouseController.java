package com.warehouse.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.domain.AreaVO;
import com.spring.domain.CellVO;
import com.spring.domain.Input_WareHouseVO;
import com.spring.domain.ItemVO;
import com.spring.domain.RackVO;
import com.spring.domain.WareHouseVO;
import com.spring.service.AreaService;
import com.spring.service.CellService;
import com.spring.service.Input_WareHouseService;
import com.spring.service.ItemService;
import com.spring.service.RackService;
import com.spring.service.WareHouseService;


@Controller
@RequestMapping("/warehouse/init/*")
public class InitWareHouseController {
	
	private static final Logger logger = LoggerFactory.getLogger(InitWareHouseController.class);
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private WareHouseService warehouseservice;
	
	@Autowired
	private AreaService areaservice;
	
	@Autowired
	private RackService rackservice;
	
	@Autowired
	private CellService cellservice;
	
	@Autowired
	private Input_WareHouseService input_WareHouseService;
	
	@GetMapping(value="/insert")
	public void insert(Model model) {	
		
		System.out.println("Dsfdsfsdf");
	}
	
	@ResponseBody
	@PostMapping(value="/item/get", produces = "application/json; charset=utf8")
	public String get(Model model) {
		
		List<ItemVO> lists = itemService.selectAll();
		return new Gson().toJson(lists);
	}
	
	@ResponseBody
	@GetMapping(value="/geti/{no}", produces = "application/json; charset=utf8")
	public String get2(Model model, @PathVariable(value="no") int no) {
		
		ItemVO vo = itemService.selectOne(no);
		return new Gson().toJson(vo);
	}
	
	@ResponseBody
	@GetMapping(value="/warehouse/get", produces = "application/json; charset=utf8")
	public String getw(Model model) {
		List<WareHouseVO> wLists = warehouseservice.list();
		return new Gson().toJson(wLists);
	}
	
	@ResponseBody
	@GetMapping(value="/area/get/{no}", produces = "application/json; charset=utf8")
	public String geta(Model model, @PathVariable(value="no") int no) {
		List<AreaVO> aLists = areaservice.getListByWareNo(no);
		return new Gson().toJson(aLists);
	}
	
	@ResponseBody
	@GetMapping(value="/rack/get/{no}", produces = "application/json; charset=utf8")
	public String getr(Model model, @PathVariable(value="no") int no) {
		List<RackVO> aLists = rackservice.getListByAreaNo(no);
		return new Gson().toJson(aLists);
	}
	
	@ResponseBody
	@GetMapping(value="/cell/get/{no}", produces = "application/json; charset=utf8")
	public String getc(Model model, @PathVariable(value="no") int no) {
		List<CellVO> aLists = cellservice.getListByRackNo(no);
		return new Gson().toJson(aLists);
	}
	
	@ResponseBody
	@PostMapping(value="/save")
	public String save(Model model, @RequestBody Input_WareHouseVO vo) {
		Collections.sort(vo.getDetail());
		input_WareHouseService.save(vo);
		return "1";
	}
}