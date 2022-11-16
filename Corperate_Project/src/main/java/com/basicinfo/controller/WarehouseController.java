package com.basicinfo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.domain.AreaVO;
import com.spring.domain.CellVO;
import com.spring.domain.RackVO;
import com.spring.domain.WareHouseAllAreaVO;
import com.spring.domain.WareHouseVO;
import com.spring.service.AreaService;
import com.spring.service.CellService;
import com.spring.service.RackService;
import com.spring.service.WareHouseService;

//초기 창고구역list띄우기
@Controller
@RequestMapping("/basicinfo/warehouse/*")
public class WarehouseController {
	
	private static final Logger logger = LoggerFactory.getLogger(WarehouseController.class);

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
		
		//등록수정삭제 이후페이지에서 데이타불러오고 기존 사이드바 보기위해 보낸다
		model.addAttribute("showid",showid);
		model.addAttribute("id",id);
		model.addAttribute("no",no);
		
		//첫화면에서 showid가 설정되어있지 않기에 undefined도 if케이스 중 하나로 설정한다
		if(showid==null || showid=="" || showid.equals("undefined")) {//최초에 창고리스트 보여준다
			model.addAttribute("lists",warehouseservice.list());
		}else {//등록/수정/삭제후 보고있던(선택했던) 데이터를 불러온다
			int delete_no = showid.indexOf("collapse");
			
			String showid_no = showid.substring(delete_no+8);
			int checkno = Integer.parseInt(showid_no);
			
			if(showid.contains("rack")) {//rack-collapse1왔을시 셀이가진 rack_no넘버이기에 셀에서찾는다
				model.addAttribute("lists",cellservice.getListByRackNo(checkno));
			} else if(showid.contains("area")) {
				model.addAttribute("lists",rackservice.getListByAreaNo(checkno));
			} else if(showid.contains("ware")) {
				model.addAttribute("lists",areaservice.getListByWareNo(checkno));
			}  else if(showid.contains("default")) {
				model.addAttribute("lists",warehouseservice.list());
			}
		}
		
		logger.info("/basicinfo/warehouse/list.jsp 반환");
		
//		return "list"; //요청 url과 반환해줄 jsp 파일의 이름이 일치하면 해당 함수는 void 타입이어도 된다. views/basicinfo/department/list.jsp 가 반환됨
	}
	
	
	//ajax로 테이블 만들기 위해 데이터를 보내준다
	@ResponseBody
	@GetMapping(value="/get-data", produces = "application/text; charset=utf8")
	public String check(Model model, @RequestParam(value="id",required = false) String id,
			@RequestParam(value="no",required = false) String no) {

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
	
	
	//창고구역삭제
	@GetMapping(value="/delete")
	public String delete(Model model,@RequestParam(value="ware_no",required = false) String ware_no,
			@RequestParam(value="area_no",required = false) String area_no,
			@RequestParam(value="rack_no",required = false) String rack_no,
			@RequestParam(value="cell_no",required = false) String cell_no,
			@RequestParam(value="id",required = false) String id,
			@RequestParam(value="no",required = false) String no,
			@RequestParam(value="showid",required = false) String showid) {
		
		//등록수정삭제 이후페이지에서 데이타불러오고 기존 사이드바 보기위해 보낸다
		model.addAttribute("showid",showid);
		model.addAttribute("id",id);
		model.addAttribute("no",no);
		
		if(ware_no != null) {
			warehouseservice.deleteWareHouseByNo(ware_no);
		}
		if(area_no != null) {
			areaservice.deleteAreaByNo(area_no);
		}
		if(rack_no != null) {
			rackservice.deleteRackByNo(rack_no);
		}
		if(cell_no != null) {
			cellservice.deleteCellByNo(cell_no);
		}

		return "redirect:/basicinfo/warehouse/list";
	}
	
	
	//창고구역삽입
	@PostMapping(value="/insert")
	public String insert(Model model,WareHouseAllAreaVO vo,@RequestParam(value="sendid",required = false) String id,
			@RequestParam(value="sendno",required = false) String no,
			@RequestParam(value="showid",required = false) String showid) {
		
		//등록수정삭제 이후페이지에서 데이타불러오고 기존 사이드바 보기위해 보낸다
		model.addAttribute("showid",showid);
		model.addAttribute("id",id);
		model.addAttribute("no",no);
		
		//창고삽입위치
		if(vo.getWarehouselocation() == "") {
			warehouseservice.insert(vo);
			
		//구역삽입위치
		}else if(vo.getArealocation() == "") {
			areaservice.insert(vo);
			
		//랙삽입위치
		}else if(vo.getRacklocation() == "") {
			rackservice.insert(vo);
			
		//셀삽입위치
		}else {
			cellservice.insert(vo);
		}
		
		return "redirect:/basicinfo/warehouse/list";
//		return "redirect:/basicinfo/warehouse/list?showid="+showid;
	}
	
	
	//수정하기위해 데이터 불러오기
	@ResponseBody
	@PostMapping(value="/selectByNo", produces = "application/text; charset=utf8")
	public String selectByNo(WareHouseAllAreaVO vo,@RequestParam(value="id",required = false) String id,
			@RequestParam(value="no",required = false) String no) {
		
		int checkno = Integer.parseInt(no);
		
		if(id.contains("warehouse")) {
			WareHouseAllAreaVO getvo = areaservice.selectOneAreaByNo(checkno);
			return new Gson().toJson(getvo);
		} else if(id.contains("area")) {
			WareHouseAllAreaVO getvo = rackservice.selectOneRackByNo(checkno);
			return new Gson().toJson(getvo);
		} else if(id.contains("rack")) {
			WareHouseAllAreaVO getvo = cellservice.selectOneCellByNo(checkno);
			return new Gson().toJson(getvo);
		} else {
			WareHouseAllAreaVO getvo = warehouseservice.selectOneWareHouseByNo(checkno);
			return new Gson().toJson(getvo);
		}
	}
	
	
	//수정하기
	@PostMapping(value="/update")
	public String update(Model model,WareHouseAllAreaVO vo,@RequestParam(value="sendid",required = false) String id,
			@RequestParam(value="sendno",required = false) String no,
			@RequestParam(value="showid",required = false) String showid) {	
		
		//등록수정삭제 이후페이지에서 데이타불러오고 기존 사이드바 보기위해 보낸다
		model.addAttribute("showid",showid);
		model.addAttribute("id",id);
		model.addAttribute("no",no);
		
		//실제로 수정
		if(id.contains("warehouse")) {
			areaservice.updateAreaByNo(vo);
		} else if(id.contains("area")) {
			rackservice.updateRackByNo(vo);
		} else if(id.contains("rack")) {
			cellservice.updateCellByNo(vo);
		} else {
			warehouseservice.updateWareHouseByNo(vo);		
		}
		
		return "redirect:/basicinfo/warehouse/list";
	}
	
	
	//구역이 가진 창고일련번호에따른 구역가져오기
	@ResponseBody
	@PostMapping(value="/OptionsByLocationNo", produces = "application/text; charset=utf8")
	public String selectAreaByWareHouseLocation(@RequestParam(value="no",required = false) String no) {
		
		int checkno = Integer.parseInt(no);
		List<AreaVO> lists = areaservice.getListByWareNo(checkno);
		return new Gson().toJson(lists);
	}
	
	
	//랙이 가진 구역일련번호에따른 랙가져오기
	@ResponseBody
	@PostMapping(value="/OptionsByAreaLocationNo", produces = "application/text; charset=utf8")
	public String selectRackByAreaLocation(@RequestParam(value="no",required = false) String no) {
		
		int checkno = Integer.parseInt(no);
		List<RackVO> lists = rackservice.getListByAreaNo(checkno);
		return new Gson().toJson(lists);
	}
}