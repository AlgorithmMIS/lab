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
							src="img/nav/anlt-active.png" alt="" />
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
				<div id="main" style="width: 1200px; height: 650px;"></div>
				<%
					ArrayList<String> categories = Util.findDistin("category", "issn_category","");
					Map<String, Integer> statcatecounts = Util.statSCategoryCounts(categories);
					Map<String, Integer> statCountOfCate = Util.statCountsOfEachCate(categories);
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
					var ctg=new Array();
					var num=new Array();
					var count=new Array();
					<%int i = 0;
			for (String a : statcatecounts.keySet()) {%>
					ctg[<%=i%>]="<%=a%>";
					num[
				<%=i%>
					] =
				<%=statcatecounts.get(a)%>
					;
					count[
				<%=i%>
					] =
				<%=statCountOfCate.get(a)%>
					;
				<%i++;
			}%>
					var option = {
						title : {
							text : '学科概况',
							x : 'left',
							y : 'top'
						},
						tooltip : {
							trigger : 'axis'
						},
						legend : {
							show : true,
							x : 'center',
							y : 'top',

							data : [ '论文数', '引用数' ]
						},
						toolbox : {
							show : true,
							feature : {
								mark : {
									show : true
								},
								dataZoom : {
									show : true,
									title : {
										dataZoom : '区域缩放',
										dataZoomReset : '区域缩放后退'
									}
								},
								dataView : {
									show : true,
									readOnly : true
								},
								magicType : {
									show : true,
									type : [ 'line', 'bar' ]
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
						xAxis : [ {
							show : false,
							type : 'category',
							data : ctg
						} ],
						yAxis : [ {
							show : true,
							type : 'value',
							splitArea : {
								show : true
							}
						} ],

						series : [ {
							name : '论文数',
							type : 'bar',
							data : num,
							markPoint : {
								data : [ {
									type : 'max',
									name : '最大值'
								}, {
									type : 'min',
									name : '最小值'
								} ]
							},
							markLine : {
								data : [ {
									type : 'average',
									name : '平均值'
								} ]
							}
						}, {
							name : '引用数',
							type : 'bar',
							data : count,
							markPoint : {
								data : [ {
									type : 'max',
									name : '最大值'
								}, {
									type : 'min',
									name : '最小值'
								} ]
							},
							markLine : {
								data : [ {
									type : 'average',
									name : '平均值'
								} ]
							}
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