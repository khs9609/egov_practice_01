package egovframework.example.sample.service;

public class DeptVO {
	
	// 추가설명
	// private는 다이렉트도  이 변수에 접근하지 못하도록 해주는 역할
	private String deptno;
	private String dname;
	private String loc;
	
	public String getDeptno() {
		return deptno;
	}
	public void setDeptno(String deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	
}
