<%@ page import="com.vigplan.vo.GroupVo" %>
<%@ page import="com.vigplan.vo.MemberVo" %>
<%@ page import="com.vigplan.vo.MVo" %>
<%@ page import="com.vigplan.dao.group.GroupDao" %>
<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<%
GroupVo group = (GroupVo) request.getAttribute("group");
%>
		<br> <br>
		<h3><strong><%=group.getgName() %> 그룹</strong></h3>
		<br> <br>
<table class="table">
<form action="<%= request.getContextPath() %>/group/update" method="get">
<input type="hidden" name="gNo" value="<%=group.getgNo() %>">
	
	<tr><th> 그룹명 </th><td><%=group.getgName() %> </td></tr>
	<tr><th> 생성일 </th><td><%=group.getgRegdate() %></td></tr>
	<tr><th> 멤버 목록</th><td>
	<%
List<MemberVo> list = (List<MemberVo>)request.getAttribute("list");
for(MemberVo vo: list){	
%>
	<%=vo.getId()%> &nbsp;
	<%
	}
	%>
	</td>
	</tr>
	<tr><td> <button type="submit">그룹명 수정</button></td>
	<td><a href="<%= request.getContextPath() %>/group/delete?gNo=<%=group.getgNo()%>"">그룹 삭제</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%= request.getContextPath() %>/group/search?gNo=<%=group.getgNo()%>"">맴버 초대하기</a></td></tr>
</form> 
</table>

<table class="table">
	<h3>모임 리스트</h3>
	<thead>
		<tr>
			<th>모임 번호</th>
			<th>모임명</th>
			<th>모임날짜</th>
		</tr>
	</thead>
	<tbody>
		<%
			List<MVo> mlist = (List<MVo>) request.getAttribute("mlist");
			for (MVo mvo : mlist) {
		%>
		<tr>
			<td><%=mvo.getmNo()%></td>
			<td>
			<a href="<%=request.getContextPath()%>/moim/select?mNo=<%=mvo.getmNo()%>"><%=mvo.getmTitle()%></a></td>
			<td><%=mvo.getmDate()%></td>
		</tr>
		<%
			}
		%>
	</tbody>
	<form action="<%=request.getContextPath()%>/moim/write">
		<input type="hidden" name="gNo" value=<%=group.getgNo()%>>
		<button type="submit" class="btn btn-primary">모임 만들기</button>
	</form>
</table>
<%@include file="../includes/footer.jsp"%>