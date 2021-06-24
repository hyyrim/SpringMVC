/*==========================================================
	EmployeeUpdatetController.java
	- 사용자 정의 컨트롤러 클래스
	- 직원 데이터 수정 액션 처리 
	  → employeelist.action 다시 요청할 수 있도록 안내
	- DAO 객체의 대한 의존성 주입(DI)을 위한 준비
	  → 인터페이스 형태의 자료형을 속성으로 구성
	  → setter 메소드 구성
==========================================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//	  사용자 정의 컨트롤러 클래스를 구현한다.	  
public class EmployeeUpdateController implements Controller
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
		
		// 세션 처리 과정
		HttpSession session = request.getSession();
		
		if (session.getAttribute("name")==null)			//-- 로그인이 되어있지 않은 상황
		{
			mav.setViewName("redirect:loginform.action");
			return mav;
		}
		else if(session.getAttribute("admin")==null)	//-- 관리자 아님. 일반사원 로그인 상황 
		{
			mav.setViewName("redirect:logout.action");
			return mav;
		}
		
		
		// 데이터 수신
		String employeeId = request.getParameter("employeeId");
		String name = request.getParameter("name");
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");
		String birthday = request.getParameter("birthday");
		int lunar = Integer.parseInt(request.getParameter("lunar"));
		String telephone = request.getParameter("telephone");
		String regionId = request.getParameter("regionId");
		String departmentId = request.getParameter("departmentId");
		String positionId = request.getParameter("positionId");
		int basicPay = Integer.parseInt(request.getParameter("basicPay"));
		int extraPay = Integer.parseInt(request.getParameter("extraPay"));
		
		try
		{
			Employee employee = new Employee();
			
			employee.setEmployeeId(employeeId);
			employee.setName(name);
			employee.setSsn1(ssn1);
			employee.setSsn2(ssn2);
			employee.setBirthday(birthday);
			employee.setLunar(lunar);
			employee.setTelephone(telephone);
			employee.setRegionId(regionId);
			employee.setDepartmentId(departmentId);
			employee.setPositionId(positionId);
			employee.setBasicPay(basicPay);
			employee.setExtraPay(extraPay);
			
			employeeDAO.modify(employee);
			
			mav.setViewName("redirect:employeelist.action");
			// 나는 DB 쪽에서 수정할테니 너는 다시 employeelist.action 을 보여줘라
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
	
		
		return mav;
		
	}
	
}
