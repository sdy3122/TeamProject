package kr.co.mappers;

import java.util.ArrayList;

import kr.co.vo.WhiskeyVo;

public interface WhiskeyMapper {
	ArrayList<WhiskeyVo> selectDistinctWhiskeyList();
	ArrayList<WhiskeyVo> selectByWriter(String writer);
}
