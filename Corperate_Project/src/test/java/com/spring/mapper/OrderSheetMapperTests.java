package com.spring.mapper;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.SearchVO;


import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class) // 테스트시 필요한 클래스를 지정해줌. ApplicationContext를 만들고 관리하는 작업을 위해 해당 클래스를 이용하겠다는 의미
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") // 스프링이 실행되면서 어떤 설정정보를 읽어 들여야 하는지를 명시
public class OrderSheetMapperTests {

	@Setter(onMethod_ = @Autowired)
	private OrderSheetMapper mapper; // 정의해둔 인터페이스로 자동 생성된 적절한 객체 -> 이 객체를 이용해 xml에 존재하는 SQL문을 실행 혹은 @Select 같은 어노테이션 SQL문 실행

	@Test
	public void testGetListWithPaging1() {
		
	}
}
