<%@ page language="java" contentType="application/msexcel"
	pageEncoding="UTF-8"%>
<%
	String SchoolName = "BeiHang";
%>
<%
	response.setHeader("Content-disposition", "inline; filename="+SchoolName+"_abbreviation.xls");
%>
<%@ page import="java.io.*,java.util.*,lab.db.*,lab.format.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title><%=SchoolName%>各院系缩写规则</title>
</head>
<body>

	<table border="1" width="100%">
		<tr>
			<td>院系名称</td>
			<td>缩写1</td>
			<td>缩写2</td>
			<td>缩写3</td>
			<td>缩写4</td>
			<td>缩写5</td>
			<td>缩写6</td>
			<td>缩写7</td>
			<td>7是一个幸运数字</td>
		</tr>
		<%
			ArrayList<String> Academs = Util.findDistin("academy_name", "abbreviation_tbl",
					"where university_name=\"" + SchoolName + "\"");
			if (Academs == null) {
				System.out.println("NO!!!");
			}
			for (String i : Academs) {
				out.println("<tr>");
				out.println(Util.tdForm(i));
				ArrayList<String> abbrs = Util.findDistin("academy_abbreviation", "abbreviation_tbl",
						"where academy_name=\"" + i + "\" and university_name=\"" + SchoolName + "\"");
				if (abbrs != null)
					for (String res : abbrs) {
						out.println(Util.tdForm(res));
					}
				out.println("</tr>");
			}
		%>
	</table>
</body>
</html>