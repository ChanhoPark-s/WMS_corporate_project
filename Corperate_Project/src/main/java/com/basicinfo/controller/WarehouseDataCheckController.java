package com.basicinfo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.spring.domain.AreaVO;
import com.spring.domain.CellVO;
import com.spring.domain.RackVO;
import com.spring.domain.WareHouseVO;
import com.spring.service.AreaService;
import com.spring.service.CellService;
import com.spring.service.RackService;
import com.spring.service.WareHouseService;

@RestController
@RequestMapping("/basicinfo/warehouse/*")
public class WarehouseDataCheckController {
	
	@Autowired
	private WareHouseService warehouseservice;
	@Autowired
	private AreaService areaservice;
	@Autowired
	private RackService rackservice;
	@Autowired
	private CellService cellservice;
	
	@ResponseBody
	@GetMapping(value="/get-data", produces = "application/text; charset=utf8")
	public String check(Model model, @RequestParam(value="id",required = false) String id,
			@RequestParam(value="no",required = false) String no) {

		System.out.println("id:"+id);
		System.out.println("no:"+no);
			int checkno = Integer.parseInt(no);
			if(id.contains("warehouse")) {
				List<AreaVO> lists = areaservice.getListByWareNo(checkno);
				return new Gson().toJson(lists);
			} else if(id.contains("area")) {
				List<RackVO> lists = rackservice.getListByAreaNo(checkno);
				return new Gson().toJson(lists);
			} else if(id.contains("rack")) {
				List<CellVO> lists = cellservice.getListByRackNo(checkno);
				return new Gson().toJson(lists);
			} else {
				List<WareHouseVO> lists = warehouseservice.list();				
				return new Gson().toJson(lists);
			}
	}
}
