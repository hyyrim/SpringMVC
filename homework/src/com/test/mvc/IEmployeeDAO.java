/*============================
    #05. IEmployeeDAO.java
    - 인터페이스
============================*/

package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IEmployeeDAO
{
	public ArrayList<Employee> list() throws SQLException;
	public ArrayList<Region> regionList() throws SQLException;
	public ArrayList<Department> departmentList() throws SQLException;
	public ArrayList<Position> positionList() throws SQLException;
	
	public int getMinBasicPay(String positionId) throws SQLException; 	//--최소기본급 반환
	public int employeeAdd(Employee employee) throws SQLException;	//--직원 등록
	public int remove(String employeeId) throws SQLException;	//--직원 삭제
	public int modify(Employee employee) throws SQLException;	//--직원 수정
	public Employee searchId(String employeeId) throws SQLException;	//--직원 수정, 삭제를 위한 아이디 검색
	
	public String login(String id, String pw) throws SQLException;	//--일반 회원 로그인
	public String loginAdmin(String id, String pw) throws SQLException;	//--관리자 로그인
}
