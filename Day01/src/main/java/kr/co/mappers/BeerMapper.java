package kr.co.mappers;

import java.util.ArrayList;

import kr.co.vo.BeerVo;

public interface BeerMapper {
	ArrayList<BeerVo> selectDistinctBeerList();
	ArrayList<BeerVo> selectByWriter(String writer);
}
