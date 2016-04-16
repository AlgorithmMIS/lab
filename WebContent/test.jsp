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
			<li id="user-panel"><img src="img/nav/usr-avatar.jpg"
				id="usr-avatar" alt="" />
				<div id="usr-info" text-align:center>
					<p id="usr-name">&nbsp &nbsp &nbsp 基于SCI和ESI</p>

					<p id="usr-name">&nbsp &nbsp &nbsp 学科院系贡献分析系统</p>

				</div></li>
			<li>
				<ul id="top-nav">
					<li class="nav-item"><a href="index.jsp"><img
							src="img/nav/grid.png" alt="" />
							<p>我是导游</p></a></li>
					<li class="nav-item"><a href=#><img
							src="img/nav/widgets-active.png" alt="" />
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
				<h2>学科概况</h2>
			</div>
			<div class="box-content">
				<div id="main" style="width: 1200px; height: 500px;"></div>
				<%
					ArrayList<String> categories = Util.findDistin("category", "paperinfor", "");
					Map<String, Integer> statcatecounts = Util.statSCategoryCounts(categories);
					//	Map<String,Integer> statCountOfCate=Util.statSCategoryCounts(categories);
					/*			Map<String, Map<String, Integer>> alldata = Util.stateACategory(categories, academies);
								for (String cate : statcatecounts.keySet()) {
									System.out.println(cate + ":" + statcatecounts.get(cate));
								}
								for (String aa : alldata.keySet()) {
									for (String bb : academies) {
										System.out.println(aa + bb + alldata.get(aa).get(bb));
									}
								}*/
				%>
				<script>
					// 基于准备好的dom，初始化echarts实例
					var myChart = echarts.init(document.getElementById('main'));
					option = {
						title : {
							text : '各学科论文数',
							subtext : '北航',
							x : 'center'
						},
						tooltip : {
							trigger : 'item',
							formatter : "{a} <br/>{b} : {c} ({d}%)"
						},
						legend : {
							orient : 'vertical',
							x : 'left',
							data :  <%=MyJsons.jStrSet2Json(statcatecounts.keySet())%>
					},
						toolbox : {
							show : true,
							feature : {
								mark : {
									show : true
								},
								dataView : {
									show : true,
									readOnly : false
								},
								magicType : {
									show : true,
									type : [ 'pie', 'funnel' ],
									option : {
										funnel : {
											x : '25%',
											width : '50%',
											funnelAlign : 'left',
											max : 1548
										}
									}
								},
								restore : {
									show : true
								},
								saveAsImage : {
									show : true
								}
							}
						},
						calculable : true,
						series : [ {
							name : '学科',
							type : 'pie',
							radius : '55%',
							center : [ '50%', '60%' ],
							data : <%=MyJsons.jMap2Json(statcatecounts)%>
						} ]
					};

					// 使用刚指定的配置项和数据显示图表。
					myChart.setOption(option);
				</script>
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