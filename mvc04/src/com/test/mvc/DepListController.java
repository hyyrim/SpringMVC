/*==================================
	SampleController.java
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
public class DepListController implements Controller
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
		
		// 세션 처리에 따른 추가 구성 → 로그인 여부 확인 → 관리자 필요 없음
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("name")==null)		//-- 로그인을 하지 못한 상황
		{
			mav.setViewName("redirect:loginform.action");
			return mav;
		}
		
		ArrayList<Department> departmentList = new ArrayList<Department>();
		
		departmentList = dao.list();
		
		mav.addObject("departmentList", departmentList);
		mav.setViewName("WEB-INF/views/DepList.jsp");
		
		return mav;
		
	}
	
}
