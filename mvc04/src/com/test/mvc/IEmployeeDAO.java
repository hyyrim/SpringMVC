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
	
	public int getMinBasicPay(String positionId) throws SQLException;
	public int employeeAdd(Employee employee) throws SQLException;
	public int remove(String employeeId) throws SQLException;
	public int modify(Employee employee) throws SQLException;
	public Employee searchId(String employeeId) throws SQLException;
	// 아이디를 넘겨받았을 땐 한사람만 찾는것이기 때문에 Employee만 반환
	
	public String login(String id, String pw) throws SQLException;
	public String loginAdmin(String id, String pw) throws SQLException;
	
	
}
