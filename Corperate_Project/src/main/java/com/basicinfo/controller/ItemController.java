package com.basicinfo.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.google.gson.Gson;
import com.spring.domain.ClientVO;
import com.spring.domain.ItemVO;
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;
import com.spring.service.ClientService;
import com.spring.service.ItemService;



@Controller
@RequestMapping("/basicinfo/item/*")
public class ItemController {
	
	@Autowired
	private ItemService service;
	
	@Autowired
	private ClientService clientService;
	
	//조회
	@GetMapping(value="/list", produces = "application/text;charset=utf8")
	public void itemlist(Model model,SearchVO searchvo,HttpServletRequest request) {	
		// redirect로 객체받기
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap!=null)
			searchvo =(SearchVO)flashMap.get("searchvo");
		int totalCount = service.getTotalCount(searchvo);
		Client_Paging pageInfo = new Client_Paging(searchvo.getPageNumber(),"10",totalCount,"/basicinfo/item/list",searchvo.getWhatColumn(),searchvo.getKeyword(),0);
		
		List<ItemVO> lists = service.selectAll(pageInfo);
		model.addAttribute("lists", lists);
		
		List<ClientVO> clientList = clientService.GetAllClient(pageInfo);
		model.addAttribute("clientList", clientList);
		
		
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("searchvo",searchvo);
	}
	
	//등록
	@PostMapping(value="/insert")
	public String insert(Model model, ItemVO vo, HttpServletRequest request) throws Exception {
		service.insert(vo, request);
		System.out.println("코드"+vo.getCode());
		System.out.println("이미지"+vo.getImage());
		System.out.println("입고가"+vo.getIn_price());
		System.out.println("품목"+vo.getName());
		return "redirect:/basicinfo/item/list";
	}
	
	//삭제
	@GetMapping("/delete")
	public String delete(@RequestParam("no") int no,SearchVO searchvo,RedirectAttributes rttr) throws Exception {
		
		service.delete(no);
		rttr.addFlashAttribute("searchvo",searchvo);
		return "redirect:/basicinfo/item/list";
	}
	
	//selectOne
	@ResponseBody
	@PostMapping(value="/get", produces = "application/json; charset=utf8")
	public String get(@RequestParam("no") int no) {
		return  new Gson().toJson(service.selectOne(no));
	} 
	
	//수정
	@PostMapping(value="/update")
	public String update(Model model,ItemVO vo,SearchVO searchvo,RedirectAttributes rttr, @RequestParam("no") int no, HttpServletRequest request) throws Exception {
		
		vo.setNo(no);
		service.update(vo, request);
		rttr.addFlashAttribute("searchvo",searchvo);
		return "redirect:/basicinfo/item/list";
	}
	//중복체크
	@ResponseBody // 값 변환을 위해 꼭 필요함
	@PostMapping("code_check") // 아이디 중복확인을 위한 값으로 따로 매핑
		public String code_check(@RequestParam("code") String code) throws Exception{
			return String.valueOf(service.code_check(code));
		}
	
	// 판매에서 품목 단가 불러오기
	@ResponseBody
	@PostMapping(value="/getPrice", produces = "application/json; charset=utf8")
	public String getPrice(Model model, @RequestParam("itemNo") int no) {
		return  new Gson().toJson(service.getPrice(no));
	
	}
}