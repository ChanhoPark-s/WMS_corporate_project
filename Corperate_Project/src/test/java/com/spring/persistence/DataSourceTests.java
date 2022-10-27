package com.spring.persistence;

import static org.junit.Assert.*;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class) // 테스트시 필요한 클래스를 지정해줌. ApplicationContext를 만들고 관리하는 작업을 위해 해당 클래스를 이용하겠다는 의미
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") // 스프링이 실행되면서 어떤 설정정보를 읽어 들여야 하는지를 명시
@Log4j	// log 객체 생성
public class DataSourceTests {

	@Setter(onMethod_ = {@Autowired})
	private DataSource dataSource;
	
	@Setter(onMethod_ = {@Autowired})
	private SqlSessionFactory sqlSessionFactory;
		
	@Test /* com.zaxxer.hikari.HikariDataSource에 대한 객체 생성 테스트 */
	public void testConnection() {
		try(Connection con = dataSource.getConnection()){
			log.info(con);
		} catch(Exception e) {
			fail(e.getMessage());
		}
	}
	
	@Test /* org.mybatis.spring.SqlSessionFactoryBean에 대한 객체 생성 테스트 */
	public void testMyBatis() {
		try(SqlSession session = sqlSessionFactory.openSession();
				Connection con = session.getConnection(); // 위에서와 다르게 SqlSession 객체를 통해 컨넥션을 얻음 
						){
			log.info(session);
			log.info(con);
		} catch(Exception e) {
			fail(e.getMessage());
		}
	}
}
/*
 위 테스트에서는 Hikari가 시작되고 종료되는 로그를 확인할 수 있다. 
 */