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
			<li>
				<ul id="top-nav">
					<li class="nav-item"><a href=#><img src="img/nav/grid-active.png"
							alt="" />
							<p>我是导游</p></a></li>
					<li class="nav-item"><a href="gaoxiaogaikuang.jsp"><img
							src="img/nav/widgets.png" alt="" />
							<p>高校概況</p> </a></li>
					<li class="nav-item"><a href="xuekefenxi.jsp"><img src="img/nav/anlt.png"
							alt="" />
							<p>学科分析</p></a></li>
					<li class="nav-item"><a href="qikangaoxiao.jsp"><img src="img/nav/tb.png"
							alt="" />
							<p>期刊高校</p></a></li>
					<li class="nav-item"><a href="lunwenchaxun.jsp"><img src="img/nav/typ.png"
							alt="" />
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
			<p>基于WOS/ESI的学科影响力分析系统，本系统数据已经覆盖如下范围</p>
		</div>
			<div class="box-content">
				<div id="main" style="width: 100%; height: 700px;"></div>
				<script type="text/javascript">
					// 基于准备好的dom，初始化echarts实例
					var myChart = echarts.init(document.getElementById('main'));
					function randomData() {
						return 0;
					}

					option = {
						tooltip : {
							trigger : 'item'
						},
						legend : {
							orient : 'vertical',
							left : 'left',
						},
						toolbox : {
							show : true,
							orient : 'vertical',
							left : 'right',
							top : 'center'
						},
						series : [ {
							name : '地区覆盖数量',
							type : 'map',
							mapType : 'china',
							roam : false,
							label : {},
							data : [ {
								name : '北京',
								value : 1
							} ]
						} ]
					};
					myChart.setOption(option);
				</script>
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