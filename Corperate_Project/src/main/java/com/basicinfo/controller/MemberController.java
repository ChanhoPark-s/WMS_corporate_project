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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.google.gson.Gson;
import com.spring.domain.DepartmentVO;
import com.spring.domain.MemberVO;
import com.spring.domain.RankVO;
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;
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
   
   /**
    * 모든 사원의 리스트를 가져옵니다.
    *
    * @param model 데이터 이동을 위한 메서드
    * @return void list.jsp로 이동
    * @exception
    */
   @GetMapping(value="/list")
   public void list(SearchVO searchvo, HttpServletRequest request, Model model) {   
      
		// redirect로 객체받기
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap!=null)
			searchvo =(SearchVO)flashMap.get("searchvo");
		int totalCount = service.getTotalCount(searchvo);
		Client_Paging pageInfo = new Client_Paging(searchvo.getPageNumber(),"10",totalCount,"/basicinfo/member/list",searchvo.getWhatColumn(),searchvo.getKeyword(),0);
	   
      // dept
      List<DepartmentVO> deptList = deptService.list();
      model.addAttribute("deptList", deptList);
      
      // rank
      List<RankVO> rankList = rankService.list();
      model.addAttribute("rankList", rankList);
      
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("list",service.list(pageInfo));
		model.addAttribute("searchvo",searchvo);
   }
   
   @PostMapping(value="/insert")
   public String insert(Model model, MemberVO member, HttpServletRequest request) throws Exception {
      
      service.insert(member, request);
      return "redirect:list";
   }
   
   @PostMapping(value="/update/{no}")
   public String update(Model model, MemberVO member, @PathVariable(value="no") int no, HttpServletRequest request, SearchVO searchvo, RedirectAttributes rttr) throws Exception {
      
      member.setNo(no);
      service.update(member, request);
      rttr.addFlashAttribute("searchvo",searchvo);
      
      return "redirect:/basicinfo/member/list";
   }
   
   @GetMapping(value="/delete/{no}")
   public String delete(Model model, @PathVariable(value="no") int no, HttpServletRequest request, SearchVO searchvo, RedirectAttributes rttr) throws Exception {
      
	  System.out.println(searchvo.getWhatColumn());
	  System.out.println(searchvo.getPageNumber());
	   
      service.delete(no);
      rttr.addFlashAttribute("searchvo",searchvo);
      return "redirect:/basicinfo/member/list";
   }
   
   @ResponseBody
   @GetMapping(value="/get/{no}", produces = "application/json; charset=utf8")
   public String get(Model model, @PathVariable(value="no") int no) {
      
      MemberVO member = service.get(no);
      String json = new Gson().toJson(member);
      return json;
   }
   
   @ResponseBody
   @GetMapping(value="/idcheck/{id}", produces = "application/json; charset=utf8")
   public String idcheck(Model model, @PathVariable(value="id") String id) throws Exception {
      int yn = service.idcheck(id);
      return "{ \"result\" : "+ yn +"}";
   }
}