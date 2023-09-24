package kr.co.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.co.member.MemberDTO;

@Mapper
public interface MemberDAO {
	public abstract void registMember(MemberDTO dto);
	public abstract MemberDTO findMember(String registNumber) throws Exception;
	public abstract MemberDTO correctMember(String mid, String mpw) throws Exception;
}
