package com.basicinfo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.service.AreaService;
import com.spring.service.CellService;
import com.spring.service.RackService;
import com.spring.service.WareHouseService;

@Controller
@RequestMapping("/basicinfo/warehouse/*")
public class WarehouseStatusController {
	
	private static final Logger logger = LoggerFactory.getLogger(WarehouseStatusController.class);

	@Autowired
	private WareHouseService warehouseservice;
	@Autowired
	private AreaService areaservice;
	@Autowired
	private RackService rackservice;
	@Autowired
	private CellService cellservice;

	@GetMapping(value="/list")
	public void home(Model model,@RequestParam(value="id",required = false) String id,
			@RequestParam(value="showid",required = false) String showid,
			@RequestParam(value="no",required = false) String no) {				
		model.addAttribute("warehouseLists",warehouseservice.list());
		model.addAttribute("areaLists",areaservice.list());
		model.addAttribute("rackLists",rackservice.list());
		model.addAttribute("cellLists",cellservice.list());
		if(no != null) {
			int checkno = Integer.parseInt(no);
			if(id.contains("warehouse")) {
				model.addAttribute("lists",areaservice.getListByWareNo(checkno));
			} else if(id.contains("area")) {
				model.addAttribute("lists",rackservice.getListByAreaNo(checkno));
			} else if(id.contains("rack")) {
				model.addAttribute("lists",cellservice.getListByRackNo(checkno));
			}
		} else {
			model.addAttribute("lists",warehouseservice.list());
		}
		
		logger.info("/basicinfo/warehouse/list.jsp 반환");
		
//		return "list"; //요청 url과 반환해줄 jsp 파일의 이름이 일치하면 해당 함수는 void 타입이어도 된다. views/basicinfo/department/list.jsp 가 반환됨
	}
}