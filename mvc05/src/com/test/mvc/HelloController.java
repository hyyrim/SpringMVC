/*==========================================
	HelloController.java
	- 사용자 정의 컨트롤러 클래스
	- 『@Controller』 어노테이션 등록
	- 『@RequestMapping』 어노테이션 등록
==========================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;		//-- check~!!!
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

//import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.mvc.Controller;

// ※ Annotation 표기법으로 만든 컨트롤러 객체 지정
@Controller
public class HelloController //implements Controller
{
	/*
	@Override
	public ModelAndView handleRequest(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception
	{
		// TODO Auto-generated method stub
		return null;
	}
	*/
	
	// ※ 컨트롤러 요청에 대한 액션 처리를 위한 메소드는 사용자 지정.
	// 기본적으로 갖게되는 틀
	/*
	@RequestMapping("URL매핑주소")
	public String 메소드이름(매개변수)
	{
		// ※ 비즈니스 로직 처리(모델 활용)
		//	 ....
		
		return "뷰 이름.jsp";
	}
	*/
	
	@RequestMapping("/hello.action")
	public String hello(Model model)
	{
		// ※ 비즈니스 로직 처리(모델 활용) → 모델을 이용해도 되고 ModelAndView 이용해도 되고 .. 
		//		 ....
		
		// 데이터 전달 명령
		model.addAttribute("hello", "Hello, SpringMVCAnnotation World");
		
		return "/WEB-INF/views/Hello.jsp";
	}
	
}
