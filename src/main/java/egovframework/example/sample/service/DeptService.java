package egovframework.example.sample.service;

import java.util.List;

// 인터페이스는 객체가 아니기 때문에 메모리에 올라가지 않는다.
// 데이터베이스 연동 관계에 있는 것들은 여기에 추가해야 한다.

public interface DeptService {
	public String InsertDept(DeptVO vo) throws Exception;
	public List<?> SelectDeptList(DeptVO vo) throws Exception;
	public DeptVO selectDeptDetail(int deptno) throws Exception;
	/* 데이터 타입이 아니라 결과 값이 1이나 0 같은 식으로 넘어가기 때문에 return값을 int로 설정한다. */
	public int deleteDept(int deptno) throws Exception;
	
}

// 인터페이스는 일반메소드를 만들지 못한다.