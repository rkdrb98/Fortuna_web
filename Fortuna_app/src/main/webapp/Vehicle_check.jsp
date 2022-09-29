<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="javaPro.inquiryDAO"%>
<%@ page import="javaPro.inquiry"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���� ��ȸ</title>
<head>
<%@ include file="header.jsp"%>

</head>

<style>
table {
	margin: 0 auto;
	text-align: center;
	border-collapse: collapse;
	border: 1px solid #d4d4d4;
}

tr:nth-child(even) {
	background: #d4d4d4;
}

th, td {
	padding: 10px 30px;
}

th {
	border-bottom: 1px solid #d4d4d4;
}
</style>


</head>
<body>
	<%
	int pageNumber = 1; // �⺻ ������
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	%>



	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">��ȣ</th>
						<th style="background-color: #eeeeee; text-align: center;">�ð�</th>
						<th style="background-color: #eeeeee; text-align: center;">���ݳ���</th>
						<th style="background-color: #eeeeee; text-align: center;">�������</th>
						<th style="background-color: #eeeeee; text-align: center;">�����ӵ�</th>
						<th style="background-color: #eeeeee; text-align: center;">���Ѽӵ�</th>
						<th
							style="background-color: #eeeeee; text-align: center; width: 200px;">��
							��</th>
					</tr>
				</thead>
				<tbody>
					<%
					inquiryDAO InquiryDAO = new inquiryDAO();
					ArrayList<inquiry> list = InquiryDAO.getlist(pageNumber);

					for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getinquiryID()%></td>
						<td><%=list.get(i).getDate()%></td>
						<td><%=list.get(i).getVehicle_type()%></td>
						<td><%=list.get(i).getregion_name()%></td>
						<td><%=list.get(i).getvehicle_speed()%></td>
						<td><%=list.get(i).getspeed_limit()%></td>
						<td><a
							href="DeleteAction.jsp?ID=<%=list.get(i).getinquiryID()%>"
							class="btn btn-primary">����</a>
							<button type="botton02" onclick="">���� ����</button></td>
					</tr>
					<%
					}
					%>
				</tbody>

			</table>








			<%
			if (pageNumber != 1) {
			%>
			<a href="Vehicle_check.jsp?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-success btn-arraw-left">����</a>
			<%
			}
			if (InquiryDAO.nextPage(pageNumber + 1)) {
			%>
			<a href="Vehicle_check.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arraw-left">����</a>
			<%
			}
			%>

		</div>
	</div>

</body>
</html>