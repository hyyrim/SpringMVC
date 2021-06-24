/*==================================
	SampleController.java
	- 사용자 정의 컨트롤러 클래스
==================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//	  사용자 정의 컨트롤러 클래스를 구현한다.	  
public class DepartmentInsertController implements Controller
{
		
	
	private IDepartmentDAO dao;
	
	
	public void setDao(IDepartmentDAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		
		// 액션 코드 		
		ModelAndView mav = new ModelAndView();
		
		Department department = new Department();
		
		try
		{
			request.setCharacterEncoding("UTF-8");
			String departmentName = request.getParameter("departmentName");
			department.setDepartmentName(departmentName);
			
			dao.add(department);
			
			mav.setViewName("redirect:departmentlist.action");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		return mav;
		
	}
	
}
