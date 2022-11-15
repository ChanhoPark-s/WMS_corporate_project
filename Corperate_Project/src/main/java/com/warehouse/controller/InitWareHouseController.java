package com.warehouse.controller;

import java.util.ArrayList;
import java.util.List;

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

import com.google.gson.Gson;
import com.spring.domain.AreaVO;
import com.spring.domain.WareHouseVO;
import com.spring.service.AreaService;
import com.spring.service.CellService;
import com.spring.service.RackService;
import com.spring.service.WareHouseService;


@Controller
@RequestMapping("/warehouse/init/*")
public class InitWareHouseController {
	
	private static final Logger logger = LoggerFactory.getLogger(InitWareHouseController.class);
	
	@Autowired
	private WareHouseService warehouseservice;
	
	@Autowired
	private AreaService areaservice;
	
	@Autowired
	private RackService rackservice;
	
	@Autowired
	private CellService cellservice;
	
	@GetMapping(value="/insert")
	public void insert(Model model) {	
		
		System.out.println("Dsfdsfsdf");
	}
	
	@ResponseBody
	@PostMapping(value="/geti", produces = "application/json; charset=utf8")
	public String get(Model model) {
		
		ItemVO vo = new ItemVO(7, 28, "asd", "테스트", 10000, 10000, "스크린샷_20221026_034152.png");
		ArrayList<ItemVO> lists = new ArrayList<>();
		lists.add(vo);
		return new Gson().toJson(lists);
	}
	
	@ResponseBody
	@GetMapping(value="/geti/{no}", produces = "application/json; charset=utf8")
	public String get2(Model model, @PathVariable(value="no") int no) {
		
		ItemVO vo = new ItemVO(7, 28, "asd", "테스트", 10000, 10000, "스크린샷_20221026_034152.png");
		return new Gson().toJson(vo);
	}
	
	@ResponseBody
	@GetMapping(value="/getw", produces = "application/json; charset=utf8")
	public String getw(Model model) {
		
		List<WareHouseVO> wLists = warehouseservice.list();
		
		return new Gson().toJson(wLists);
	}
	
	@ResponseBody
	@GetMapping(value="/geta/{no}", produces = "application/json; charset=utf8")
	public String geta(Model model, @PathVariable(value="no") int no) {
		System.out.println();
		List<AreaVO> aLists = areaservice.list();
		
		return new Gson().toJson(aLists);
	}
	
	@PostMapping(value="/save")
	public String save(Model model, @RequestBody List<ItemVO> vo) {
		
		for(int i = 0; i < vo.size(); i++) {
			System.out.println(vo.get(i).getItem_code());
		}
		
		return null;
	}
}

class ItemVO {
	
	private int no;
	private int client_no;
	private String code;
	private String name;
	private String item_code;
	private int in_price;
	private int out_price;
	private String image;
	
	public ItemVO() {
		
	}
	
	public ItemVO(int no, int client_no, String code, String name, int in_price, int out_price, String image) {
		super();
		this.no = no;
		this.client_no = client_no;
		this.code = code;
		this.name = name;
		this.in_price = in_price;
		this.out_price = out_price;
		this.image = image;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getClient_no() {
		return client_no;
	}
	public void setClient_no(int client_no) {
		this.client_no = client_no;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getItem_code() {
		return item_code;
	}

	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}

	public int getIn_price() {
		return in_price;
	}
	public void setIn_price(int in_price) {
		this.in_price = in_price;
	}
	public int getOut_price() {
		return out_price;
	}
	public void setOut_price(int out_price) {
		this.out_price = out_price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
}