package kr.co.mappers;

import java.util.ArrayList;
import java.util.List;

import kr.co.vo.Criteria;
import kr.co.vo.SulVo;
import kr.co.vo.UserVo;

public interface SulMapper {
	ArrayList<SulVo> selectUnionAllregdateDesc();
	ArrayList<SulVo> selectUnionAllLikeBtnDesc();
	ArrayList<SulVo> selectBnoRegdate(SulVo sulvo);
	int countSul();
	int selectByWriter(String name);
	List<SulVo> selectLimit(Criteria cri);
	ArrayList<SulVo> selectMyLikeBtnDesc(UserVo vo);
	int countMySul(UserVo vo);
	List<SulVo> selectMyLimit(Criteria cri);
}
