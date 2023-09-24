package kr.co.controller;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.dao.MemberDAO;
import kr.co.member.MemberDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class DAOTest {
	@Inject
	private MemberDAO dao;
	@Test
	public void test1() throws Exception {
		MemberDTO dto = new MemberDTO();
		dto.setIrum("서더");
		dto.setMid("korea");
		dto.setMpw("1111");
		dto.setRegistNumber(11111);
	}
	
}
