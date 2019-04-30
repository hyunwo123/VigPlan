<%@page import="com.vigplan.vo.PlaceVo"%>
<%@page import="java.util.List"%>
<%@page import="com.vigplan.vo.MVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
MVo moim = (MVo)request.getAttribute("moim");	//	NULL
	%>
		<br> <br>
		<h3>
			<strong>장소</strong>
		</h3>
		<br> <br>
		<table class="table">
			<thead>
				<tr>
				
					<th>제목</th>
					<th>링크</th>
					<th>설명</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>도로명 주소</th>
					<th>x좌표</th>
					<th>y좌표</th>
					
				</tr>
			</thead>
			<tbody>
				<%
					List<PlaceVo> list = (List<PlaceVo>) request.getAttribute("list");
					for (PlaceVo pvo : list) {
				%>
				<tr>
					<td><a
						href="<%=request.getContextPath()%>/place?a=content&pk=<%=pvo.getPk()%>&mNo=<%=moim.getmNo() %>"><%=pvo.getTitle()%></a></td>
					
					<td><%=pvo.getLink()%></td>
					<td><%=pvo.getDescription()%></td>
					<td><%=pvo.getTelephone() %></td>
					<td><%=pvo.getAddress() %></td>
					<td><%=pvo.getRoadAddress() %></td>
					<td><%=pvo.getMapx() %></td>
					<td><%=pvo.getMapy() %></td>
					<td><button>삭제</button></td>
				</tr>

				<%
					}
				%>
			</tbody>
		</table>

		
	<a href="<%= request.getContextPath() %>/place?a=form&mNo=<%=moim.getmNo() %>" class="btn btn-primary">장소 등록</a>
