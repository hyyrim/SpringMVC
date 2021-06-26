/*=========================================================
	#10. DepartmentDAO.java
	- 데이터베이스 액션 처리 클래스
	- 부서 데이터 입력 / 출력 / 수정 / 삭제 액션
	- Connection 객체에 대한 의존성 주입을 위한 준비
	  → setter injection
	     → ·인터페이스 형태의 자료형 구성
	        ·setter 메소드 정의
=========================================================*/


package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

public class DepartmentDAO implements IDepartmentDAO
{
	
	// 인터페이스 형태의 자료형을 속성으로 구성
	private DataSource dataSource;
	
	// setter 구성
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	
	// 인터페이스에서 선언된 메소드 재정의-------------------------------
	
	// 부서 전체 리스트 출력
	@Override
	public ArrayList<Department> list() throws SQLException
	{
		ArrayList<Department> result = new ArrayList<Department>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK FROM DEPARTMENTVIEW";
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		
		Department dpt = null;
		
		while (rs.next())
		{
			dpt = new Department();
			
			dpt.setDepartmentId(rs.getString("DEPARTMENTID"));
			dpt.setDepartmentName(rs.getString("DEPARTMENTNAME"));
			dpt.setDelCheck(rs.getInt("DELCHECK"));
			
			result.add(dpt);
		}
		rs.close();
		stmt.close();
		conn.close();
		
		
		return result;
	}
	
	// 부서 데이터 등록(입력, 추가)
	@Override
	public int add(Department department) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME)"
				+ " VALUES(DEPARTMENTSEQ.NEXTVAL, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, department.getDepartmentName());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// 부서 데이터 제거(삭제)
	@Override
	public int remove(String departmentId) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "DELETE FROM DEPARTMENT WHERE DEPARTMENTID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, Integer.parseInt(departmentId));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// 부서 데이터 수정
	@Override
	public int modify(Department department) throws SQLException
	{
		int result = 0;
			
		Connection conn = dataSource.getConnection();
		
		String sql = "UPDATE DEPARTMENT SET DEPARTMENTNAME=? WHERE DEPARTMENTID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, department.getDepartmentName());
		pstmt.setInt(2, Integer.parseInt(department.getDepartmentId()));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		

		return result;
	}
	
	// 부서 데이터 검색
	@Override
	public Department searchId(String departmentId) throws SQLException
	{
		Department department = new Department();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK"
				+ " FROM DEPARTMENTVIEW WHERE DEPARTMENTID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,departmentId);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			department.setDepartmentId("DEPARTMENTID");
			department.setDepartmentName("DEPARTMENTNAME");
			department.setDelCheck(Integer.parseInt("DELCHECK"));
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return department;
	}
	
	
	
	
}
