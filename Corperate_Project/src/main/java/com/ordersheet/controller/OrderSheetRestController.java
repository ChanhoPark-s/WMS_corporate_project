package com.ordersheet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.domain.ClientVO;
import com.spring.domain.MemberVO;
import com.spring.domain.OrderSheetDetailVO;
import com.spring.domain.OrderSheetVO;
import com.spring.domain.PageDTO;
import com.spring.paging.Criteria;
import com.spring.service.ClientService;
import com.spring.service.MemberService;
import com.spring.service.OrderSheetService;


@RestController
@RequestMapping("/ordersheet/*")
public class OrderSheetRestController {
	
	@Autowired
	private OrderSheetService service;
	
	@Autowired
	private ClientService cs;
	
	@Autowired 
	private MemberService ms;
	
			
	//testURL : http://localhost:8080/ordersheet/orderdetail/11
	@GetMapping(value={"/orderdetail/{mainNo}"}, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<OrderSheetDetailVO>> detailList(@PathVariable("mainNo") int mainNo) {				
		return new ResponseEntity<>(service.getSubList(mainNo), HttpStatus.OK);		
	}
	
	@GetMapping(value={"/{mainNo}"}, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<OrderSheetVO> mainList(@PathVariable("mainNo") int mainNo) {				
		return new ResponseEntity<>(service.selectOneByMainNo(mainNo), HttpStatus.OK);		
	}
	
	//testURL : http://localhost:8080/ordersheet/order/pages/1/10
	@GetMapping(
			value={"/order/pages/{pageNum}/{amount}", "/order/pages/{pageNum}/{amount}/{whatColumn}", "/order/pages/{pageNum}/{amount}/{whatColumn}/{keyword}"}, 
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<PageDTO<OrderSheetVO>> orderlist(
			@PathVariable("pageNum") int pageNum,
			@PathVariable("amount") int amount,
			@PathVariable(value="whatColumn", required = false) String whatColumn,
			@PathVariable(value="keyword", required = false) String keyword) {				
		

		//System.out.println(pageNum + " " + amount + " " + whatColumn + " " + keyword);
		
		Criteria cri = new Criteria(pageNum, amount, whatColumn, keyword);
		
		return new ResponseEntity<>(service.getListPage(cri), HttpStatus.OK);		
	}
	
	@GetMapping(value={"/selectOrder/{no}"}, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String, Object>> selectOrder(@PathVariable("no") int no) {	
		//수주번호 한가지 조회
		OrderSheetVO vo = service.selectOneByMainNo(no);
		
		vo.setNo(no);
		vo.setOut_day(vo.getOut_day());
		
		//수주 디테일 조회
		List<OrderSheetDetailVO> list = service.getSubList(no);
		
		for(OrderSheetDetailVO osdv : list) {
			
			osdv.setItem_no(osdv.getItem_no());
			osdv.setItem_name(osdv.getItem_name());
			
			//물품 거래처 조회
			ClientVO osdvCv = cs.selectOne(Integer.toString(osdv.getClient_no()));
			osdv.setClient_name(osdvCv.getName());
			
		}
		
		//거래처조회
		ClientVO cv = cs.selectOne(Integer.toString(vo.getClient_no()));
		
		vo.setClient_no(cv.getNo());
		vo.setClient_code(cv.getCode());
		vo.setClient_name(cv.getName());
		
		//맴버조회
		MemberVO mv = ms.get(vo.getMember_no());
		
		vo.setMember_no(mv.getNo());
		vo.setDep_name(mv.getDep_name());
		vo.setMember_name(mv.getName());
		
		// 두가지 객체 보내기
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("order", vo);
		map.put("detail", list);
		
		return new ResponseEntity<>(map, HttpStatus.OK);		
	}

}