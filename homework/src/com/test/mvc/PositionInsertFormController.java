/*===========================================
   #54. PositionInsertFormController.java
   - 사용자 정의 컨트롤러 클래스
===========================================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;


public class PositionInsertFormController implements Controller
{
	private IPositionDAO dao;
	
	public void setDao(IPositionDAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드 
		ModelAndView mav = new ModelAndView();
	      
		// 세션 처리과정 추가 --------------------------------------------
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("name") == null)		//--로그인이 되어있지 않은 상황
		{
			mav.setViewName("redirect:loginform.action");
			return mav;
		}
		else if (session.getAttribute("admin") == null)	//--관리자 아님. 일반사원으로 로그인된 상황
		{
			// 관리자로 재로그인할 수 있도록 강제 로그아웃
			mav.setViewName("redirect:logout.action");
			return mav;
		}
		
		// if문에 걸리지 않았을 경우 관리자로 로그인된 상황
		
		// ---------------------------------------------------------------

		ArrayList<Position> positionList = new ArrayList<Position>();
		
		try
		{
			positionList = dao.List();
			
			mav.addObject("positionList",positionList);
			
			mav.setViewName("WEB-INF/views/PositionInsertForm.jsp");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
}
