/*==================================
	EmployeeDeleteController.java
	- 사용자 정의 컨트롤러 클래스
	- DAO 객체의 대한 의존성 주입(DI)을 위한 준비
	  → 인터페이스 형태의 자료형을 속성으로 구성
	  → setter 메소드 구성
==================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//	  사용자 정의 컨트롤러 클래스를 구현한다.	  
public class EmployeeDeleteController implements Controller
{
	private IEmployeeDAO employeeDAO;
		

	public void setEmployeeDAO(IEmployeeDAO employeeDAO)
	{
		this.employeeDAO = employeeDAO;
	}


	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		// 데이터 수신(→ EmployeeList.jsp 로 부터 employeeId 수신)
		String employeeId = request.getParameter("employeeId");
		
		try
		{
			employeeDAO.remove(employeeId);
			// int result = dao.remove(employeeId) 를 통해 
			// if 문으로 분기할 수도 있다.
			// 지금은 편의상 제외함
			
			mav.setViewName("redirect: employeelist.action");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
		
	}
	
}
