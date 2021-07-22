package main.service;

import java.util.List;

public interface MemberService {

	//회원가입 저장처리
	public String insertMember(MemberVO vo) throws Exception;
	
	//아이디 중복체크
	public int selectMemberIdcheck(String userid) throws Exception;
	
	//우편번호 검색
	public List<?> selectPostList(String dong) throws Exception;
}
