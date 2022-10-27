package com.spring.controller;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/*컨트롤러를 테스트 하는 부분으로 MockMvcBuilder를 이용함*/

@RunWith(SpringJUnit4ClassRunner.class) // 테스트시 필요한 클래스를 지정해줌. ApplicationContext를 만들고 관리하는 작업을 위해 해당 클래스를 이용하겠다는 의미
@WebAppConfiguration	// Servlet의 ServletContext를 이용하기 위함
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"}) // 스프링이 실행되면서 어떤 설정정보를 읽어 들여야 하는지를 명시
@Log4j	// log 객체 생성
public class BoardControllerTests {

//	@Setter(onMethod_ = {@Autowired})
//	private WebApplicationContext ctx;
//	
//	private MockMvc mockMvc; // 가짜 mvc로 가짜로 url과 파라미터를 브라우저에서 사용하는 것 처럼 만들어서 컨트롤러를 실행해볼 수 있음
//	
//	@Before
//	public void setup() {
//		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
//	}
//	
//	@Test
//	public void testList() throws Exception {
//		
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list")
//				).andReturn().getModelAndView().getModelMap());
//		
//	}
//	
//	@Test
//	public void testListPaging() throws Exception {
//		
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list")
//				.param("pageNum", "2")
//				.param("amount", "50")
//				).andReturn().getModelAndView().getModelMap());
//		
//	}
//	
//	@Test
//	public void testRegister() throws Exception {
//		
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
//							.param("title","테스트 새글 제목") // <input> 태그와 유사한 역할
//							.param("content","테스트 새글 내용")
//							.param("writer", "user00")
//							).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}
//	
//	@Test
//	public void testGet() throws Exception {
//		
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/get")
//				.param("bno", "2")
//				).andReturn().getModelAndView().getViewName());
//		
//	}
//	
//	@Test
//	public void testModify() throws Exception{
//		
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/modify")
//							.param("bno", "1")
//							.param("title", "수정된 테스트 새글 제목")
//							.param("content", "수정된 테스트 새글 내용")
//							.param("writer", "user00")
//							).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}
//	
//	@Test
//	public void testRemove() throws Exception{
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
//							.param("bno", "14")
//							).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}
}
