/*=======================
 	MemberMain.java
 	- 컨트롤러
=======================*/

package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberMain
{
	// mybatis 객체 의존성 (자동) 주입~!!!
	@Autowired	// 스프링컨테이너 → dispatcher-servlet → 자동으로 연결
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/memberlist.action", method=RequestMethod.GET)
	public String memberList(ModelMap model)
	{
		// IMemberDAO dao = MemberDAO 객체 생성
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		model.addAttribute("count", dao.count());
		model.addAttribute("list", dao.list());
		
		return "WEB-INF/views/MemberList.jsp";
	}
}
