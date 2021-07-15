package egovframework.example.sample.service;

import java.util.List;

public interface CodeService {
	
	public String insertCodes(CodeVO vo) throws Exception;
	public List<?> selectCodesList(CodeVO vo) throws Exception;
	// List에 <?>를 붙여주지 않아도 되지만, 가능한 붙여 주는게 좋다(데이터 타입을 뜻함)
	// 갈호안에 select할때 필요한 매개변수가 없기 때문에 비워준다. 필요 시 나중에 넣어줄 것. (일반적으로는 vo를 설정 많이 한다.)
	public int selectCodesCount(CodeVO vo) throws Exception;
	public int deleteCodes(int code) throws Exception;
	public CodeVO selectCodesDetail(int code) throws Exception; //왜 CodeVO에 태우는지
	public int updateCodes(CodeVO vo) throws Exception;
}
