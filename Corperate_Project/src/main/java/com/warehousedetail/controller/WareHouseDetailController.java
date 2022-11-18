package com.warehousedetail.controller;

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
import com.spring.domain.PageDTO;
import com.spring.domain.WareHouseDetailVO;
import com.spring.paging.Criteria;
import com.spring.service.AreaService;
import com.spring.service.CellService;
import com.spring.service.RackService;
import com.spring.service.WareHouseDetailService;
import com.spring.service.WareHouseService;

@Controller
@RequestMapping("/warehouse-detail/*")
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
		
		//등록수정삭제 이후페이지에서 데이타불러오고 기존 사이드바 보기위해 보낸다
//		model.addAttribute("showid",showid);
//		model.addAttribute("id",id);
//		model.addAttribute("no",no);
//		System.out.println("showid는"+showid);
//		System.out.println("id는"+id);
//		System.out.println("no는"+no);
//		
//		WareHouseDetailVO vo = new WareHouseDetailVO();
//		vo.setWare_no(0);
//		vo.setArea_no(0);
//		vo.setRack_no(0);
//		vo.setCell_no(0);
		
//		if(showid==null || showid=="" || showid.equals("undefined")) {
			
//		} else {
//			int delete_no = id.indexOf("collapse");
//			String showid_no = showid.substring(delete_no+8);
//			int checkno = Integer.parseInt(showid_no);
//			model.addAttribute("lists",warehousedetailservice.selectStockByWareNo(checkno));
//		}
		
		//첫화면에서 showid가 설정되어있지 않기에 undefined도 if케이스 중 하나로 설정한다
//		if(showid==null || showid=="" || showid.equals("undefined")) {//최초에 창고리스트 보여준다
//			model.addAttribute("lists",warehousedetailservice.selectStockByWareNo(checkno));
//		}else {//등록/수정/삭제후 보고있던(선택했던) 데이터를 불러온다
//			int delete_no = showid.indexOf("collapse");
//			
//			String showid_no = showid.substring(delete_no+8);
//			int checkno = Integer.parseInt(showid_no);
//			
//			if(showid.contains("rack")) {//rack-collapse1왔을시 셀이가진 rack_no넘버이기에 셀에서찾는다
//				model.addAttribute("lists",cellservice.getListByRackNo(checkno));
//			} else if(showid.contains("area")) {
//				model.addAttribute("lists",rackservice.getListByAreaNo(checkno));
//			} else if(showid.contains("ware")) {
//				model.addAttribute("lists",areaservice.getListByWareNo(checkno));
//			}  else if(showid.contains("default")) {
//				model.addAttribute("lists",warehouseservice.list());
//			}
//		}
		
		logger.info("/warehouse-detail-list.jsp 반환");
		
//		return "list"; //요청 url과 반환해줄 jsp 파일의 이름이 일치하면 해당 함수는 void 타입이어도 된다. views/basicinfo/department/list.jsp 가 반환됨
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
		
		System.out.println("id는"+id);
		System.out.println("no는"+no);
		System.out.println("ware_no는"+ware_no);
		System.out.println("area_no는"+area_no);
		System.out.println("rack_no는"+rack_no);
		System.out.println("cell_no는"+cell_no);
		
		WareHouseDetailVO vo = new WareHouseDetailVO();
		vo.setWare_no(ware_no);
		vo.setArea_no(area_no);
		vo.setRack_no(rack_no);
		vo.setCell_no(cell_no);
		
		System.out.println("vo서다시가져온창고넘버:"+vo.getWare_no());
		System.out.println("ajax통한컨트롤러진입");
		
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
	
	//testURL : http://localhost:8080/basicinfo/client/pages/1/10/owner/이재용
		@ResponseBody
		@GetMapping(
				value={"/pages/{pageNum}/{amount}", "/pages/{pageNum}/{amount}/{whatColumn}", "/pages/{pageNum}/{amount}/{whatColumn}/{keyword}"}, 
				produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		public ResponseEntity<PageDTO<WareHouseDetailVO>> WareHouseDetaillist(
				@PathVariable("pageNum") int pageNum,
				@PathVariable("amount") int amount,
				@PathVariable(value="whatColumn", required = false) String whatColumn,
				@PathVariable(value="keyword", required = false) String keyword) {				
			

			System.out.println(pageNum + " " + amount + " " + whatColumn + " " + keyword);
			System.out.println("페이징처리위한컨트롤러진입");
			
//			Criteria cri = new Criteria(pageNum, amount, whatColumn, keyword);
			Criteria cri = new Criteria(pageNum, amount, "0", "0");
			
			return new ResponseEntity<>(warehousedetailservice.getListPage(cri), HttpStatus.OK);		
		}
}