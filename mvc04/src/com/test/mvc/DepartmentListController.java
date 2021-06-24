/*==================================
	DepartmentListController.java
	- 사용자 정의 컨트롤러 클래스
==================================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//	  사용자 정의 컨트롤러 클래스를 구현한다.	  
public class DepartmentListController implements Controller
{

	private IDepartmentDAO dao;

	public void setDao(IDepartmentDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{

		ModelAndView mav = new ModelAndView();
		/*
		 * // 세션 처리 과정 HttpSession session = request.getSession();
		 * 
		 * if (session.getAttribute("name")==null) //-- 로그인이 되어있지 않은 상황 {
		 * mav.setViewName("redirect:loginform.action"); return mav; } else
		 * if(session.getAttribute("admin")==null) //-- 관리자 아님. 일반사원 로그인 상황 {
		 * mav.setViewName("redirect:logout.action"); return mav; }
		 * 
		 */
		ArrayList<Department> departmentList = new ArrayList<Department>();

		try
		{
			departmentList = dao.list();

			mav.addObject("departmentList", departmentList);

			mav.setViewName("/WEB-INF/views/DepartmentList.jsp");

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		return mav;

	}

}