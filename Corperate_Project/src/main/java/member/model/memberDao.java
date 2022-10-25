package member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("memberDao") //객체 생성
public class memberDao {

	private final String namespace = "member.MemberBean";

	@Autowired // 객체 주입 root-context 객체를 집어넣어라.
	SqlSessionTemplate sqlSessionTemplate; //오라클 접속해라 정보도 있음.


	}//memberDao
