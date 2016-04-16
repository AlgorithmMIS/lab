<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.io.*,lab.bean.*,java.util.*,lab.db.*,lab.format.*,java.sql.*,lab.sort.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="pubhead.jsp"%>
</head>
<body>
	<div class="header">
		<a href="dashboard.html"><img src="img/logo.png" alt="Logo" /></a>
		<div class="styler">
			<ul class="styler-show">
				<li><div id="colorSelector-top-bar"></div></li>
				<li><div id="colorSelector-box-head"></div></li>
			</ul>
		</div>
	</div>

	<div class="top-bar">
		<ul id="nav">
			<!--li id="user-panel"><img src="img/nav/usr-avatar.jpg"
				id="usr-avatar" alt="" />
				<div id="usr-info" text-align:center>
					<p id="usr-name">&nbsp &nbsp &nbsp 基于SCI和ESI</p>

					<p id="usr-name">&nbsp &nbsp &nbsp 学科院系贡献分析系统</p>

				</div></li-->
			<li>
				<ul id="top-nav">
					<li class="nav-item"><a href="index.jsp"><img
							src="img/nav/grid.png" alt="" />
							<p>我是导游</p></a></li>
					<li class="nav-item"><a href="gaoxiaogaikuang.jsp"><img
							src="img/nav/widgets.png" alt="" />
							<p>高校概況</p> </a></li>
					<li class="nav-item"><a href="xuekefenxi.jsp"><img
							src="img/nav/anlt.png" alt="" />
							<p>学科分析</p></a></li>
					<li class="nav-item"><a href="qikangaoxiao.jsp"><img
							src="img/nav/tb.png" alt="" />
							<p>期刊高校</p></a></li>
					<li class="nav-item"><a href="lunwenchaxun.jsp"><img
							src="img/nav/typ-active.png" alt="" />
							<p>论文查询</p></a></li>
					<li class="nav-item"><a href="login.jsp"><img
							src="img/nav/dash.png" alt="" />
							<p>后台管理</p></a></li>
				</ul>
			</li>
		</ul>
	</div>

	<form>
		<table>
			<tr>
				<TH width="10%"
					style="white-space: nowrap; text-align: center; color: green"><SPAN>${message}</SPAN></TH>
			</tr>
		</table>
	</form>
	<div class="content container_12">
		<div class="ad-notif-success grid_12" style="text-align: center;">
			<p>北京航空航天大学专区</p>
		</div>
		<div class="box grid_12">
			<div class="box-head">
				<h2>论文查询</h2>
			</div>
			<div class="box-content">
				<form action="/PaperNew/findPaper" method="post">

					<div class="form-row">
						<label class="form-label">选择学院</label>
						<div class="form-item">
							<select name="academy_name">
								<%
									String SchoolName = "BeiHang";
									ArrayList<String> Academs = Util.findDistin("academy_name", "abbreviation_tbl", "where university_name="+"'"+SchoolName+"'");
									//							out.println(Util.optionForm("all"));
									for (String i : Academs) {
										out.println(Util.optionForm(i));
									}
								%>
							</select>
						</div>
					</div>

					<div class="form-row">
						<label class="form-label">选择学科</label>
						<div class="form-item">
							<select name="category">
								<%
									ArrayList<String> cate = Util.findDistin("category", "issn_category","");
									//		out.println(Util.optionForm("all"));	
									for (String i : cate) {
										out.println(Util.optionForm(i));
										System.out.println(Util.optionForm(i));
									}
								%>
							</select>
						</div>
					</div>

					<div class="form-row" style="text-align: center;">
						<input type="submit" class="button small green" value="查询">
					</div>
					<div style="text-align: center;">
						院系：<%=(String) request.getAttribute("name")%>
						|学科：<%=(String) request.getAttribute("category")%>
					</div>
				</form>
				<table class="display">
					<thead>
						<tr>
							<th>论文题目</th>
							<th>issn</th>
							<th>引用数目</th>
							<th>出版日期</th>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<PaperInfor> lunwen = (ArrayList<PaperInfor>) request.getAttribute("result");

							if (lunwen != null) {
								Collections.sort(lunwen, new SortByCounts());
								for (PaperInfor i : lunwen) {

									out.println(i.toString());
									//			System.out.println(i.toString());
								}
							}
						%>
					</tbody>
				</table>

			</div>
		</div>
	</div>
	<div class="footer">
		<p>北航计算机学院</p>
	</div>

	<script>
		/* SCRIPTS */
		$(function() {
			$('#dt1').dataTable({
				"bJQueryUI" : true
			});
			$('#dt2').dataTable({
				"bJQueryUI" : true
			});
			$('#dt3').dataTable({
				"bJQueryUI" : true,
				"sPaginationType" : "full_numbers"
			}); /* For the data tables */
		});
	</script>
</body>
</html>