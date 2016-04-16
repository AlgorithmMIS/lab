<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,lab.db.*,lab.format.*,java.sql.*"%>
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
					<p id="usr-name">&nbsp &nbsp &nbsp 基于WOS和ESI</p>

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
							src="img/nav/typ.png" alt="" />
							<p>论文查询</p></a></li>
					<li class="nav-item"><a href="#"><img
							src="img/nav/dash-active.png" alt="" />
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
			<p>北京航空航天大学论文检索后台系统</p>
		</div>

		<div class="box grid_6">
			<div class="box-head">
				<h2>添加缩写规则</h2>
			</div>
			<div class="box-content no-pad">
				<ul class="table-toolbar">
					<li><a href="AbbreDownload.jsp"><img
							src="img/icons/basic/print.png" alt="" /> 缩写规则下载</a></li>
				</ul>
			</div>
			<div class="box-content">
				<form action="/PaperNew/updateAttr" method="post">
					<div class="form-row">
						<label class="form-label">选择学院</label>
						<div class="form-item">
							<select name="academy_name">
								<%
									Set<String> Academs = new HashSet<String>();
									DbCon conn = new DbCon();
									String findAcaN = "select distinct academy_name from abbreviation_tbl;";
									ResultSet resAcaN = conn.doQuery(findAcaN, new Object[]{});
									while (resAcaN.next()) {
										Academs.add(resAcaN.getString("academy_name"));
									}
									for (String i : Academs) {
										out.println(Util.optionForm(i));
									}
								%>
							</select>
						</div>
					</div>
					<div class="form-row">
						<p class="form-label">学院缩写</p>
						<div class="form-item">
							<input type="text" name="abbreviation">
						</div>
					</div>
					<div class="form-row" style="text-align: right;">
						<input type="submit" class="button big green" value="提交">
					</div>
					<div class="clear"></div>
				</form>
			</div>
		</div>
		<div class="box grid_6">
			<div class="box-head">
				<h2>按出版时间查询</h2>
			</div>
			<div class="box-content">
				<form action="download.jsp" , method="get">
					<div class="form-row">
						<label class="form-label">更新时间</label>
						<div class="form-item">
							<select name="updatetime">
								<%
									ArrayList<String> alltime = Util.findDistin("update_time", "count_tbl","");

									for (String a : alltime) {
										out.println(Util.optionForm(a));
									}
								%>
							</select>
						</div>
					</div>
					<div class="form-row">
						<label class="form-label">起始年份</label>
						<div class="form-item">
							<select name="startyear">
								<%
									for (Integer i = 2000; i <= 2016; i++) {
										out.println(Util.optionForm(i.toString()));
									}
								%>
							</select>
						</div>
					</div>

					<div class="form-row">
						<label class="form-label">起始月份</label>
						<div class="form-item">
							<select name="startmonth">
								<%
									for (Integer i = 1; i <= 12; i++) {
										out.println(Util.optionForm(i.toString()));
									}
								%>
							</select>
						</div>
					</div>
					<div class="form-row">
						<label class="form-label">终止年份</label>
						<div class="form-item">
							<select name="endyear">
								<%
									for (Integer i = 2016; i > 1999; i--) {
										out.println(Util.optionForm(i.toString()));
									}
								%>
							</select>
						</div>
					</div>
					<div class="form-row">
						<label class="form-label">终止月份</label>
						<div class="form-item">
							<select name="endmonth">
								<%
									for (Integer i = 1; i < 13; i++) {
										out.println(Util.optionForm(i.toString()));
									}
								%>
							</select>
						</div>
					</div>
					<div class="form-row" style="text-align: right;">
						<input type="submit" class="button big green" value="下载">
					</div>
					<div class="clear"></div>
				</form>
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