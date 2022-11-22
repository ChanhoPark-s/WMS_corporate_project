package com.warehouse.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.servlet.support.RequestContextUtils;

import com.google.gson.Gson;
import com.spring.domain.AreaVO;
import com.spring.domain.CellVO;
import com.spring.domain.Init_Input_WareHouseVO;
import com.spring.domain.ItemVO;
import com.spring.domain.RackVO;
import com.spring.domain.SearchVO;
import com.spring.domain.WareHouseDetailVO;
import com.spring.domain.WareHouseVO;
import com.spring.paging.Client_Paging;
import com.spring.service.AreaService;
import com.spring.service.CellService;
import com.spring.service.Init_Input_WareHouseService;
import com.spring.service.ItemService;
import com.spring.service.RackService;
import com.spring.service.WareHouseDetailService;
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
	private WareHouseDetailService warehousedetailservice;
	
	@Autowired
	private AreaService areaservice;
	
	@Autowired
	private RackService rackservice;
	
	@Autowired
	private CellService cellservice;
	
	@Autowired
	private Init_Input_WareHouseService init_input_WareHouseService;
	
	@GetMapping(value="/insert")
	public void insert(Model model) {	
		
		model.addAttribute("warehouse", warehouseservice.list());
		model.addAttribute("area", areaservice.list());
		model.addAttribute("rack", rackservice.list());
		model.addAttribute("cell", cellservice.list());
	}
	
	@ResponseBody
	@PostMapping(value="/item/get", produces = "application/json; charset=utf8")
	public String get(Model model, HttpServletRequest request, SearchVO searchvo) {
		
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap!=null)
			searchvo =(SearchVO)flashMap.get("searchvo");
		int totalCount = itemService.getTotalCount(searchvo);
		Client_Paging pageInfo = new Client_Paging(searchvo.getPageNumber(),"10",totalCount,"/basicinfo/item/list",searchvo.getWhatColumn(),searchvo.getKeyword(),0);
		
		List<ItemVO> lists = itemService.selectAll(pageInfo);
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
	
	// 창고 선택
	@ResponseBody
	@PostMapping(value="/ware/get", produces = "application/json; charset=utf-8")
	public String getWare(Model model, @RequestBody WareHouseDetailVO vo) {
		return new Gson().toJson(warehousedetailservice.getWare(vo));
	}
	
	@ResponseBody
	@PostMapping(value="/save")
	public String save(Model model, @RequestBody Init_Input_WareHouseVO vo) {
		Collections.sort(vo.getDetail());
		init_input_WareHouseService.save(vo);
		return "1";
	}
}