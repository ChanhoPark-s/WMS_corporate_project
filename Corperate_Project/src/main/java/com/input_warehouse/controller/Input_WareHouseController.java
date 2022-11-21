package com.input_warehouse.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.Input_WareHouseVO;
import com.spring.service.AreaService;
import com.spring.service.CellService;
import com.spring.service.Input_WareHouseService;
import com.spring.service.RackService;
import com.spring.service.WareHouseService;

@Controller
@RequestMapping("/input_warehouse/*")
public class Input_WareHouseController {

	@Autowired
	private Input_WareHouseService service;
	@Autowired
	private WareHouseService warehouseservice;
	@Autowired
	private AreaService areaservice;
	@Autowired
	private RackService rackservice;
	@Autowired
	private CellService cellservice;

	@GetMapping(value="/list")
	public void list(Model model) {
		List<Input_WareHouseVO> lists = service.list();
		model.addAttribute("warehouseLists",warehouseservice.list());
		model.addAttribute("areaLists",areaservice.list());
		model.addAttribute("rackLists",rackservice.list());
		model.addAttribute("cellLists",cellservice.list());
		model.addAttribute("lists", lists);
	}
	

}