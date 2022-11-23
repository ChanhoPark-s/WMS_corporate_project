package com.input_warehouse.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.spring.domain.Input_WareHouseVO;
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;
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
	public void list(SearchVO searchvo, HttpServletRequest request, Model model) {
		
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if (flashMap != null) {
			searchvo = (SearchVO) flashMap.get("searchvo"); //searchVO 를 덮어씌움
		}
		
		int totalCount = service.getTotalCount(searchvo); 
		Client_Paging pageInfo = 
				new Client_Paging
				(searchvo.getPageNumber(),"10",totalCount,"/input_warehouse/list",
						searchvo.getWhatColumn(),searchvo.getKeyword(),0);
		
		// 원래 있던거
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("lists", service.getListByPaging(pageInfo));
		model.addAttribute("searchvo",searchvo);
		
		model.addAttribute("warehouseLists",warehouseservice.list());
		model.addAttribute("areaLists",areaservice.list());
		model.addAttribute("rackLists",rackservice.list());
		model.addAttribute("cellLists",cellservice.list());
	}
	
	@PostMapping(value="/add")
	public String add(Input_WareHouseVO vo) {
		service.insert(vo);
		
		return "redirect:/input_warehouse/list";
	}
	
	@PostMapping(value="/delete/one")
	public String deleteMainOneAndAllSub(SearchVO searchvo, @RequestParam int no, RedirectAttributes rttr) {
		
		service.deleteInputWarehouse(no);
		rttr.addFlashAttribute("searchvo",searchvo);
		
		return "redirect:/input_warehouse/list";
	}
	

}