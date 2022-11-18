package com.warehouse.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.service.AreaService;
import com.spring.service.CellService;
import com.spring.service.Init_Input_WareHouseService;
import com.spring.service.ItemService;
import com.spring.service.RackService;
import com.spring.service.WareHouseService;


@Controller
@RequestMapping("/warehouse/movementHistory/*")
public class MovemenetHistoryController {
	
	private static final Logger logger = LoggerFactory.getLogger(MovemenetHistoryController.class);
	
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
	private Init_Input_WareHouseService init_input_WareHouseService;
	
	@GetMapping(value="/list")
	public void list(Model model) {	
		
		model.addAttribute("warehouse", warehouseservice.list());
		model.addAttribute("area", areaservice.list());
		model.addAttribute("rack", rackservice.list());
		model.addAttribute("cell", cellservice.list());
		
	}
	
	@GetMapping(value="get/{warehouse}/{area}/{rack}/{cell}")
	public void get(Model model, @PathVariable(value="warehouse") String warehouse, @PathVariable(value="area") String area, @PathVariable(value="rack") String rack, @PathVariable(value="cell") String cell) {
		
		
	}
	
}