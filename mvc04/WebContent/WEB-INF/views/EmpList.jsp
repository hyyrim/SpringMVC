<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); 	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmpList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">


</head>
<body>

<!--------------------------------------------------
	#31. EmpList.jsp
	- 직원 리스트 출력 페이지
	- 일반직원이 접근하는 직원 데이터 출력 페이지
	- 입력 / 수정 / 삭제 기능 없음.	  
--------------------------------------------------->

<div>
	<!-- 메뉴 영역 -->
	<div>
		<c:import url="EmpMenu.jsp"></c:import>
	</div>

	<!-- 콘텐츠 영역 -->
	<div id="content">
		
		<h1>[ 직원 관리(일반직원 전용) ]</h1>
		<hr>
		
		<br><br>
		
		<table id="customers" class="table">
			<tr>
				<!-- 항목 15EA -->
				<th>번호</th>
				<th>이름</th>
				<th>지역</th>
				<th>부서</th>
				<th>직위</th>
				<th>등급</th>
			</tr>
			
			<!-- 실무에서는 이렇게 만들면 안된다. -->
			<!-- 모든 정보가 한군데에 담겨오기 때문에 악용 가능성 -->
			<!-- 여기서 items=employeList 로 만들었기문에
				 EmpListController 에서도 employeeList로 이름 구성 -->
			<c:forEach var="employee" items="${employeeList }"> 
			<tr>
				<td>${employee.employeeId}</td>
				<td>${employee.name}</td>
				<td>${employee.regionName}</td>
				<td>${employee.departmentName}</td>
				<td>${employee.positionName}</td>
				<td>${employee.grade==0 ? "관리자" : "일반직원"}</td>
				
			</tr>		
			</c:forEach>
			
			<!-- 		
			<tr>
				<td>1</td>
				<td>박나현</td>
				<td>631212</td>
				<td>1963-12-12</td>
				<td>양력</td>
				<td>010-1111-1111</td>
				<td>서울</td>
				<td>개발부</td>
				<td>사원</td>
				<td>1,500,000</td>
				<td>1,000,000</td>
				<td>2,500,000</td>
				<td>관리자</td>
				<td><button type="button" class="btn">수정</button></td>
				<td><button type="button" class="btn">삭제</button></td>
			</tr>
			 -->
		</table>
	</div>
	
	<!-- 회사 소개 및 어플리케이션 소개 영역 -->
	<div id="footer">
	
	</div>
	
</div>


</body>
</html>