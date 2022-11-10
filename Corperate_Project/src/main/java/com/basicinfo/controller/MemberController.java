package com.basicinfo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.domain.DepartmentVO;
import com.spring.domain.MemberVO;
import com.spring.domain.RankVO;
import com.spring.service.DepartmentService;
import com.spring.service.MemberService;
import com.spring.service.RankService;


@Controller
@RequestMapping("/basicinfo/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService service;

	@Autowired
	private DepartmentService deptService;
	
	@Autowired
	private RankService rankService;

	@GetMapping(value="/list")
	public void list(Model model) {	
		
		// dept
		List<DepartmentVO> deptList = deptService.getDeptList();
		model.addAttribute("deptList", deptList);
		
		// rank
		List<RankVO> rankList = rankService.list();
		model.addAttribute("rankList", rankList);
		
		List<MemberVO> lists = service.list();
		model.addAttribute("lists", lists);
	}
	
	@PostMapping(value="/insert")
	public String insert(Model model, MemberVO member) throws Exception {
		
		service.insert(member);
		return "redirect:list";
	}
	
	@PostMapping(value="/update")
	public String update(Model model, MemberVO member) throws Exception {
		
		service.update(member);
		return "redirect:list";
	}
	
	@GetMapping(value="/delete/{no}")
	public String delete(Model model, @PathVariable(value="no") int no) throws Exception {
		
		service.delete(no);
		return "redirect:/basicinfo/member/list";
	}
	
	@ResponseBody
	@GetMapping(value="/get/{no}", produces = "application/json; charset=utf8")
	public String get(Model model, @PathVariable(value="no") int no) {
		
		MemberVO member = service.get(no);
		String json = new Gson().toJson(member);
		return json;
	}
}