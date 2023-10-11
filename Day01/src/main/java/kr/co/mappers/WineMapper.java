package kr.co.mappers;

import java.util.ArrayList;

import kr.co.vo.WineVo;

public interface WineMapper {
	ArrayList<WineVo> selectDistinctWineList();
	ArrayList<WineVo> selectByWriter(String writer);
}
