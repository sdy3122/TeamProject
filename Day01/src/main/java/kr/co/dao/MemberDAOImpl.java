package kr.co.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import kr.co.member.MemberDTO;

public class MemberDAOImpl implements MemberDAO {

	// root-context에서 이미 만듬
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "MemberMapper";
	
	@Override
	public void registMember(MemberDTO dto) {
		sqlSession.insert(NAMESPACE + ".insertMember", dto);
	}

	@Override
	public MemberDTO findMember(String registNumber) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".readMember", registNumber);
	}

	@Override
	public MemberDTO correctMember(String mid, String mpw) {
		Map<String, Object> hs = new HashMap<String, Object>();
		hs.put("mid", mid);
		hs.put("mpw", mpw);
		
		return sqlSession.selectOne(NAMESPACE + "correctMember", hs);
	}

}
