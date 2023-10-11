package kr.co.mappers;

import java.util.ArrayList;

import kr.co.vo.VodkaVo;

public interface VodkaMapper {
	ArrayList<VodkaVo> selectDistinctVodkaList();
	ArrayList<VodkaVo> selectByWriter(String writer);
}
