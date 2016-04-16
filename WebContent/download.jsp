<%@ page language="java" contentType="application/msexcel"
	pageEncoding="UTF-8"%>
<%
	response.setHeader("Content-disposition", "inline; filename=SCIEandSSCI.xls");
%>
<%@ page import="java.io.*,java.util.*,lab.db.*,lab.format.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>SCIE and SSCI</title>
</head>
<body>
	<%
		String update_time = request.getParameter("updatetime");
		int startyear = 1971, endyear = 2017, startmonth = 1, endmonth = 12;
		if (request.getParameter("startyear") != null)
			startyear = Integer.parseInt(request.getParameter("startyear"));
		if (request.getParameter("endyear") != null)
			endyear = Integer.parseInt(request.getParameter("endyear"));
		if (request.getParameter("startmonth") != null)
			startmonth = Integer.parseInt(request.getParameter("startmonth"));
		if (request.getParameter("endmonth") != null)
			endmonth = Integer.parseInt(request.getParameter("endmonth"));
		String start = Util.timeForm(startyear, startmonth, 1);
		System.out.println(endyear);
		String end = Util.timeForm(endyear, endmonth, 0);
		System.out.println(start);
		System.out.println(end);
	%>
	<table border="1" width="100%">
		<tr>
			<td>issn</td>
			<td>title</td>
			<td>origin author</td>
			<td>address</td>
			<td>accession</td>
			<td>count</td>
			<td>category</td>
			<td>issn_name</td>
			<td>published date</td>
			<td>univ</td>
			<td>author1</td>
			<td>academy1</db>
			<td>author2</td>
			<td>academy2</db>
			<td>author3</td>
			<td>academy3</db>
			<td>author4</td>
			<td>academy4</db>
		</tr>
		<%
			String SchoolName = "BeiHang";
			DbCon conn = new DbCon();
			String sql = "select * from paperinfor,academy_paper_tbl,abbreviation_tbl where published >= ? and published <=? and accession=accs and abbreviation_id=abbr_id and university_name=?;";
			ResultSet res = conn.doQuery(sql, new Object[] { start, end,SchoolName});
			while (res.next()) {
				String issn = res.getString("issn");
				String category = res.getString("category");
				String issn_name = res.getString("issn_name");
				String accession = res.getString("accession");
				String findIssn = "select category,issn_name from issn_category where issn=?;";
				ResultSet resIssn = conn.doQuery(findIssn, new Object[] { issn });
				while (resIssn.next()) {
					category = resIssn.getString("category");
					issn_name = resIssn.getString("issn_name");
				}
				String findCount = "select count from count_tbl,paperinfor where count_tbl.accession=paperinfor.accession and update_time=?";
				ResultSet counts = conn.doQuery(findCount, new Object[] { update_time });
				System.out.println(update_time);
				int count = 0;
				while (counts.next()) {
					count = counts.getInt("count");
				}
				System.out.println(count);
				out.println("<tr>");
				out.println(Util.tdForm(issn));
				out.println(Util.tdForm(res.getString("title")));
				out.println(Util.tdForm(res.getString("authors")));
				out.println(Util.tdForm(res.getString("address")));
				out.println(Util.tdForm(accession));
				out.println(Util.tdForm(String.valueOf(count)));
				out.println(Util.tdForm(category));
				out.println(Util.tdForm(issn_name));
				out.println(Util.tdForm(res.getDate("published").toString()));
				out.println(Util.tdForm(res.getString("univ")));
				String findAdem = "select author,academy_name from abbreviation_tbl,academy_paper_tbl where academy_paper_tbl.accs=?"
						+ "and academy_paper_tbl.abbr_id=abbreviation_tbl.abbreviation_id;";
				ResultSet resAdem = conn.doQuery(findAdem, new Object[] { accession });
				if (resAdem != null)
					while (resAdem.next()) {
						out.println(Util.tdForm(resAdem.getString("author")));
						out.println(Util.tdForm(resAdem.getString("academy_name")));
					}
				out.println("</tr>");
			}
		%></table>
</body>
</html>