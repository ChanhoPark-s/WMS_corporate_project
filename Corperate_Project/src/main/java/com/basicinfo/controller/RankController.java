package com.basicinfo.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.spring.domain.RankVO;
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;
import com.spring.service.RankService;


@Controller
@RequestMapping("/basicinfo/rank/*")
public class RankController {
	
	private static final Logger logger = LoggerFactory.getLogger(RankController.class);

	@Autowired
	private RankService service;

	@GetMapping(value="/list")
	public void list(Model model, SearchVO vo, HttpServletRequest request) {				
		
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap!=null)
			vo =(SearchVO)flashMap.get("searchvo");
		int totalCount = service.getTotalCount(vo);
		Client_Paging pageInfo = new Client_Paging(vo.getPageNumber(),"10",totalCount,"/basicinfo/rank/list",vo.getWhatColumn(),vo.getKeyword(),0);
		
		model.addAttribute("ranks", service.list(pageInfo));
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("searchvo",vo);
	}
	
	@PostMapping(value="insert")
	public String insert(Model model, RankVO rank) {
		
		service.insert(rank);
		return "redirect:list";
	}
	
	@PostMapping(value="update")
	public String update(Model model, RankVO rank, HttpServletRequest request, SearchVO searchvo, RedirectAttributes rttr) {
		
		service.update(rank);
		rttr.addFlashAttribute("searchvo",searchvo);
		return "redirect:list";
	}
	
	@GetMapping(value="delete/{no}")
	public String delete(Model model, RankVO rank, @PathVariable(value="no") int no) {
		
		service.delete(no);
		return "redirect:/basicinfo/rank/list";
	}
	
	public List<RankVO> noSearchList(Model model) {				
		return service.noSearchList();
	}
	
	@PostMapping("/selectDelete")
	public String selectDelete(HttpServletRequest request){
		
		service.selectDelete(request.getParameterValues("rowcheck"));
		return "redirect:/basicinfo/rank/list";
	}
}