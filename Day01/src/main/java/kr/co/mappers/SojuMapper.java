package kr.co.mappers;

import java.util.ArrayList;

import kr.co.vo.SojuVo;

public interface SojuMapper {
	ArrayList<SojuVo> selectDistinctSojuList();
	ArrayList<SojuVo> selectByWriter(String writer);
}
