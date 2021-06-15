/*==================================
	HelloController.java
	- 사용자 정의 컨트롤러 클래스
==================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//	  사용자 정의 컨트롤러 클래스를 구현한다.	  
public class HelloController implements Controller
{
		
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// GET 방식 POST 방식 두개를 다 받는다.
		// 사용자 정의로 만들었던 DO GET POST 방식인 것.
		
		// 액션 코드 
			
		// ModelAndView 객체 생성
		ModelAndView mav = new ModelAndView();
		
		// message 에 내용 담기
		String message = "Hello, SpringMVC world";
		
		// ModelAndView 객체에 message 추가
		mav.addObject("message", message);
		
		// View 경로 지정
		// 지정된 message 넘겨줌.
		mav.setViewName("/WEB-INF/views/Hello.jsp");
		
		// ④ 객체를 지정된 view 경로로 보낸다.
		return mav;
		
	}
	
}
