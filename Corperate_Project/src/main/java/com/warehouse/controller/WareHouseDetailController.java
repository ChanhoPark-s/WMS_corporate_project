package com.warehouse.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.domain.PageForWareHouseDTO;
import com.spring.domain.WareHouseDetailVO;
import com.spring.paging.CriteriaForWareHouse;
import com.spring.service.AreaService;
import com.spring.service.CellService;
import com.spring.service.RackService;
import com.spring.service.WareHouseDetailService;
import com.spring.service.WareHouseService;

@Controller
@RequestMapping("/warehouse/warehouse-detail/*")
public class WareHouseDetailController {
	
	private static final Logger logger = LoggerFactory.getLogger(WareHouseDetailController.class);

	@Autowired
	private WareHouseService warehouseservice;
	@Autowired
	private AreaService areaservice;
	@Autowired
	private RackService rackservice;
	@Autowired
	private CellService cellservice;
	@Autowired
	private WareHouseDetailService warehousedetailservice;

	@GetMapping(value="/list")
	public void home(Model model,@RequestParam(value="id",required = false) String id,
			@RequestParam(value="showid",required = false) String showid,
			@RequestParam(value="no",required = false) String no) {				
		model.addAttribute("warehouseLists",warehouseservice.list());
		model.addAttribute("areaLists",areaservice.list());
		model.addAttribute("rackLists",rackservice.list());
		model.addAttribute("cellLists",cellservice.list());
		
		
	}
	
	
	//ajax로 테이블 만들기 위해 데이터를 보내준다
	@ResponseBody
	@GetMapping(value="/get-data-stock", produces = "application/text; charset=utf8")
	public String check(Model model, @RequestParam(value="id",required = false) String id,
			@RequestParam(value="no",required = false) String no,
			@RequestParam(value="ware_no",required = false) int ware_no,
			@RequestParam(value="area_no",required = false) int area_no,
			@RequestParam(value="rack_no",required = false) int rack_no,
			@RequestParam(value="cell_no",required = false) int cell_no) {

		
		WareHouseDetailVO vo = new WareHouseDetailVO();
		vo.setWare_no(ware_no);
		vo.setArea_no(area_no);
		vo.setRack_no(rack_no);
		vo.setCell_no(cell_no);

		if(id.contains("warehouse")) {
			List<WareHouseDetailVO> lists = warehousedetailservice.selectStockByWareNo(vo);
			return new Gson().toJson(lists);
		} else if(id.contains("area")) {
			List<WareHouseDetailVO> lists = warehousedetailservice.selectStockByAreaNo(vo);
			return new Gson().toJson(lists);
		} else if(id.contains("rack")) {
			List<WareHouseDetailVO> lists = warehousedetailservice.selectStockByRackNo(vo);
			return new Gson().toJson(lists);
		} else {
			List<WareHouseDetailVO> lists = warehousedetailservice.selectStockByCellNo(vo);		
			return new Gson().toJson(lists);
		}
	}

		@ResponseBody
		@GetMapping(
				value={"/pages/{pageNum}/{amount}/{ware_no}/{area_no}/{rack_no}/{cell_no}",
						"/pages/{pageNum}/{amount}/{ware_no}/{area_no}/{rack_no}/{cell_no}/{whatColumn}",
						"/pages/{pageNum}/{amount}/{ware_no}/{area_no}/{rack_no}/{cell_no}/{whatColumn}/{keyword}"}, 
				produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		public ResponseEntity<PageForWareHouseDTO<WareHouseDetailVO>> WareHouseDetaillist(
				@PathVariable("pageNum") int pageNum,
				@PathVariable("amount") int amount,
				@PathVariable(value="ware_no", required = false) int ware_no,
				@PathVariable(value="area_no", required = false) int area_no,
				@PathVariable(value="rack_no", required = false) int rack_no,
				@PathVariable(value="cell_no", required = false) int cell_no,
				@PathVariable(value="whatColumn", required = false) String whatColumn,
				@PathVariable(value="keyword", required = false) String keyword) {				
			
			
			CriteriaForWareHouse cri = new CriteriaForWareHouse(pageNum, amount, whatColumn, keyword,ware_no,area_no,rack_no,cell_no);
			return new ResponseEntity<>(warehousedetailservice.getListPage(cri), HttpStatus.OK);		
		}
}