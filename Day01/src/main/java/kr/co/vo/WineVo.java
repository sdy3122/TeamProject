package kr.co.vo;

import lombok.Data;

@Data
public class WineVo {
	long bno;
	String sul;
	String writer;
	String menu;
	String title;
	String content;
	long clickCnt;
	long likeBtn;
	long likeBtnCheck;
	String regdate;
}