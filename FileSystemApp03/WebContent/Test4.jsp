<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	// Test4.jsp
	
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// 아래 두개는 같은 코드다.
	/* String root = request.getRealPath("/"); */	// 예전 방식
	String root = pageContext.getServletContext().getRealPath("/");
	
	// 실제 물리적 주소
	System.out.println(root);	// web 에서 실행하고 console 창에서 확인
	//--==> C:\SpringMVC\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FileSystemApp03\
	//	    워크스페이스\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FileSystemApp03\
	
	// 저장되는 위치와 폴더
	String path = root + "pds" + File.separator + "saveData";
	// \pds\saveData
	
	// 확인
	//System.out.println(path);
	//--==> C:\SpringMVC\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FileSystemApp03\pds\saveData
	
	// 저장 대상(디렉터리 경로)이 존재하지 않으면 생성
	File dir = new File(path);
	if(!dir.exists())
		dir.mkdirs();
	
	String encType = "UTF-8";
	int maxFileSize = 5*1024*1024;		// 전송 최대 사이즈 5M
	
	try
	{
		MultipartRequest req = null;
		req = new MultipartRequest(request, path, maxFileSize, encType, new DefaultFileRenamePolicy());
		// request → 요청에 처리할 요청 객체
		// path → 넘긴 파일이 저장될 주소
		// maxFileSize → 최대 사이즈
		// encType → 파일을 저장하려면 패킷단위로 잘라야 함. 그 자르는 방식 -> 인코딩 방식
		// DefaultFileRenamePolicy() → 이름정책. 
		//								같은 이름의 파일이 존재하면 이 정책에 따른다
		//	 							만들어서 써도 상관없다.
		
		//out.println("이름 : " + request.getParameter("name") + "<br>"); -- 그동안 써온 방식
		// 바이너리 형식으로 꺼내게되면 null 이라 쓸 수 없음. → MultipartRequest 사용 (한번 필터를 거친다) 
		
		out.println("이름 : " + req.getParameter("name") + "<br>");
		out.println("서버에 저장된 파일명 : " + req.getFilesystemName("upload") + "<br>");
		out.println("업로드한 파일명 : " + req.getOriginalFileName("upload") + "<br>");
		out.println("파일 타입 : " +  req.getContentType("upload") + "<br>");
		
		File file = req.getFile("upload");
		if(file != null)
			out.println("파일 길이" + file.length() + "<br>");
			
			
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
			
%>
