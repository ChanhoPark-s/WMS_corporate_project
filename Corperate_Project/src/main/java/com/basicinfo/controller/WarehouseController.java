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
	
	
	//창고구역삭제
	@GetMapping(value="/delete")
	public String delete(Model model,@RequestParam(value="ware_no",required = false) String ware_no,
			@RequestParam(value="area_no",required = false) String area_no,
			@RequestParam(value="rack_no",required = false) String rack_no,
			@RequestParam(value="cell_no",required = false) String cell_no) {
		if(ware_no != null) {
			System.out.println("창고일련번호:"+ware_no);
			warehouseservice.deleteWareHouseByNo(ware_no);
		}
		if(area_no != null) {
			System.out.println("ㄱㅇ일련번호:"+area_no);
			areaservice.deleteAreaByNo(area_no);
		}
		if(rack_no != null) {
			System.out.println("ㄹ일련번호:"+rack_no);
			rackservice.deleteRackByNo(rack_no);
		}
		if(cell_no != null) {
			System.out.println("ㅅ일련번호:"+cell_no);
			cellservice.deleteCellByNo(cell_no);
		}

		return "redirect:/basicinfo/warehouse/list";
	}
	
	
	//창고구역삽입
	@GetMapping(value="/insert")
	public String insert(WareHouseAllAreaVO vo) {
		
		//창고삽입위치
		if(vo.getWarehouselocation() == "") {
			System.out.println("입력한창고이름:"+vo.getWarehousename());
			warehouseservice.insert(vo);
			
		//구역삽입위치
		}else if(vo.getArealocation() == "") {
			System.out.println("입력한구역이름:"+vo.getAreaname());
			areaservice.insert(vo);
			
		//랙삽입위치
		}else if(vo.getRacklocation() == "") {
			System.out.println("입력한랙이름:"+vo.getRackname());
			rackservice.insert(vo);
			
		//셀삽입위치
		}else {
			System.out.println("입력한셀이름:"+vo.getCellname());
			cellservice.insert(vo);
		}
		
		return "redirect:/basicinfo/warehouse/list";
	}
	
	//수정하기위해 데이터 불러오기
	@ResponseBody
	@PostMapping(value="/selectByNo", produces = "application/text; charset=utf8")
	public String selectByNo(WareHouseAllAreaVO vo,@RequestParam(value="id",required = false) String id,
			@RequestParam(value="no",required = false) String no) {
		
		System.out.println("수정하기위해id가져옴:"+id);
		System.out.println("수정하기위해no가져옴:"+no);
		int checkno = Integer.parseInt(no);
		if(id.contains("warehouse")) {
			System.out.println("warehouse가 있다");
		} else if(id.contains("area")) {
			System.out.println("area가있다");
		} else if(id.contains("rack")) {
			System.out.println("rack가있다");
		} else {
			System.out.println("default가있ㅏ");
		}
		
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
	public String update(Model model,@RequestParam(value="id",required = false) String id,
			@RequestParam(value="no",required = false) String no) {	
		
		//내가가진 상위구역의 코드에 따라 수정 셀렉트박스 처리하고 하자
//		int checkno = Integer.parseInt(no);
//		if(id.contains("warehouse")) {
//			areaservice.updateByNo(checkno);
//		}
//		else if(id.contains("area")) {
//			rackservice.updateByNo(checkno);
//		} else if(id.contains("rack")) {
//			cellservice.updateByNo(checkno);
//		} else {
//			warehouseservice.updateByNo(checkno);		
//		}
		
		return "redirect:/basicinfo/warehouse/list";
	}
	
	//구역이 가진 창고일련번호에따른 구역가져오기
	@ResponseBody
	@PostMapping(value="/OptionsByLocationNo", produces = "application/text; charset=utf8")
	public String selectAreaByWareHouseLocation(@RequestParam(value="warehouselocation",required = false) String warehouselocation,
			@RequestParam(value="no",required = false) String no) {
		System.out.println("구역데이터1");
		
		int checkno = Integer.parseInt(no);
		List<AreaVO> lists = areaservice.getListByWareNo(checkno);
		System.out.println("구역데이터2");
		return new Gson().toJson(lists);
	}
}