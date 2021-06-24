/*===================================================================================
   #59. PositionDeleteController.java
        (positiondelete.action)  
   - 사용자 정의 컨트롤러 클래스
   - 직위 데이터 삭제 액션 처리 → positionlist.action 다시 요청할 수 있도록 안내
   - DAO 객체에 대한 의존성 주입(DI)을 위한 준비
     → 인터페이스 형태의 자료형을 속성으로 구성
     → setter 메소드 구성
===================================================================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;


public class PositionDeleteController implements Controller
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
				
				
		// 데이터 수신 (→ PositionList.jsp로부터)
		String positionId = request.getParameter("positionId");
		
		try
		{
			dao.remove(positionId);
				
			mav.setViewName("redirect:positionlist.action");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
}
