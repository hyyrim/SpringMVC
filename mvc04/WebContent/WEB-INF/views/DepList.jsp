<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); 	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DepartmentList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>


</head>
<body>


<div>
	<!-- 메뉴 영역 -->
	<div>
		<c:import url="EmpMenu.jsp"></c:import>
	</div>

	
	<!-- 콘텐츠 영역 -->
	<div id="content">
		<h1> [ 부서 관리(일반직원 전용) ] </h1>
		<hr>
		

		<br><br>
		
		<table id="department" class="table">
			<tr>
				<th>부서 번호</th>
				<th>부서 이름</th>

			</tr>
			<c:forEach var="department" items="${departmentList}">
			<tr>
				
				<td>${department.departmentId}</td> 
				<td>${department.departmentName }</td>
				 
			</tr>
			</c:forEach>
		</table>
	

	</div>
	
	<!-- 회사 소개 및 어플리케이션 소개 영역 -->
	<div id="footer">
	
	</div>
	
</div>

</body>
</html>