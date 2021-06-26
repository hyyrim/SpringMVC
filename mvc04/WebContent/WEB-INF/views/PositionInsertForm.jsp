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
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#submitBtn").click(function()
		{
			if ($("#positionName").val()==""|| $("#minBasicPay").val()=="")
			{
				$("#err").html("필수 입력 항목이 누락되었습니다.");
				$("#err").css("display", "inline");
				return;
			}
			
			$("#positionForm").submit();
		});	
	});

</script>

</head>
<body>



<div>

	<!-- 메뉴 영역 -->
	<div>
		<c:import url="EmployeeMenu.jsp"></c:import>
	</div>
	
	<!-- 콘텐츠 영역 -->
	<div id="content">
	
		<h1>[ 직위 추가 ]</h1>
		<hr>
		
		<form action="positioninsert.action" method="post" id="positionForm">
			<table>

				<tr>
					<th>직위이름</th>
					<td>
						<input type="text" id="positionName" name="positionName">
					</td>
				</tr>
				<tr>
					<th>최소기본급</th>
					<td>
						<input type="text" id="minBasicPay" name="minBasicPay">
					</td>
				</tr>

				<tr>
					<td colspan="2" align="center">
						<br><br>
						
						<button type="button" class="btn" id="submitBtn"
						style="width: 40%;">직위 추가</button>
						<button type="button" class="btn" id="listBtn"
						style="width: 40%;"
						onclick="location.href='positionlist.action'">직위 리스트</button>
						<br><br>
						
						<span id="err"
						style="color: red; font-weight: bold; display: none;"></span>
						
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<!-- 회사 소개 및 어플리케이션 소개 영역 -->
	<div id="footer">
	</div>
	
	
</div>


</body>
</html>