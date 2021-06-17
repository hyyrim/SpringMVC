/*=======================================
	MemberInsertController.java
	- 사용자 정의 컨트롤러 클래스
	- 회원 데이터 추가 액션 처리 클래스
	- DAO 객체에 대한 의존성 주입 준비
	  → 인터페이스 형태의 속성 구성
	  → setter 메소드 추가
========================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.filters.SetCharacterEncodingFilter;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//	  사용자 정의 컨트롤러 클래스를 구현한다.	  
public class MemberInsertController implements Controller
{
	
	// 인터페이스 자료형을 취하는 속성 구성
	private IMemberDAO dao;
	
	public void setDao(IMemberDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		request.setCharacterEncoding("UTF-8");
		
		// 이전 페이지로부터 넘어온 데이터 수신
		String name = request.getParameter("name");
		String tel = request.getParameter("telephone");
		
		try
		{
			MemberDTO member = new MemberDTO();
			member.setName(name);
			member.setTelephone(tel);
			
			dao.add(member);
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		//mav.setViewName("memberlist.action 페이지를 redirect");
		// 해당 페이지를 다시 요청할 수 있도록 안내
		
		// 내가 직접 요청한건 A 페이지이지만 B 페이지를 요청해
		// 클라이언트 입장에서 다시 요청하게될 것
		// → memberListController 가 일 하게 됨
		// 이 요청에 의해 memberListController 가 일하게 만들어놨음
		
		mav.setViewName("redirect:memberlist.action");
		
		//mav.setViewName("/WEB-INF/views/MemberList.jsp"); -- (Ⅹ)
		// 로직적으로 처리된 내용을 가지고 jsp 에게 전달하는 형식이기때문에
		// 이렇게 뷰 페이지를 지정하면 카운트값 / 리스트 값을 얻어낼 수 없다.
		
		return mav;
		
	}
	
}
