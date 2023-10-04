package kr.co.mappers;

import java.util.ArrayList;

import kr.co.vo.SojuVo;

public interface SojuMapper {
	ArrayList<SojuVo> selectByWriter(String writer);
	ArrayList<SojuVo> selectDistinctSojuList();
}
