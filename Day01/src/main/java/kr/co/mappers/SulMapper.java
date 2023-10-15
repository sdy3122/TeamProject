package kr.co.mappers;

import java.util.ArrayList;
import java.util.List;

import kr.co.vo.Criteria;
import kr.co.vo.SulVo;
import kr.co.vo.UserVo;

public interface SulMapper {
	ArrayList<SulVo> selectLikeBtnDesc();
	SulVo selectBno(long bno);
	int countSul();
	int selectByRegistNumber(long reg);
	List<SulVo> selectLimit(Criteria cri);
	ArrayList<SulVo> selectMyLikeBtnDesc(UserVo vo);
	int countMySul(UserVo vo);
	List<SulVo> selectMyLimit(Criteria cri);
	boolean insertBoard(SulVo sul);
	boolean updateBoard(SulVo sul);
	boolean deleteBoard(SulVo sul);
	String findSameBno(long bno);
}
