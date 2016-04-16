<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="pubhead.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登陆</title>
<link rel="shortcut icon" href="favicon.gif">
<!---CSS Files-->
<link rel="stylesheet" href="css/master.css">
<link rel="stylesheet" href="css/login.css">
<!---jQuery Files-->
<script src="js/jquery-1.7.1.min.js"></script>
<script src="js/jquery.spinner.js"></script>
<script type="text/javascript" src="js/forms/jquery.validate.min.js"></script>
<!---Fonts-->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600'
	rel='stylesheet' type='text/css'>
<!--[if lt IE 9]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<!---FadeIn Effect, Validation and Spinner-->
<script>
	$(document).ready(function() {
		$('div.wrapper').hide();
		$('div.wrapper').fadeIn(1200);
		$('#lg-form').validate();
		$('.submit').click(function() {
			var $this = $(this);
			$this.spinner();
			setTimeout(function() {
				$this.spinner('remove');
			}, 1000);
		});
	});
</script>
</head>
<body>
	<form>
		<table>
			<tr>
				<TH width="10%"
					style="white-space: nowrap; text-align: center; color: green"><SPAN>${message}</SPAN></TH>
			</tr>
		</table>
	</form>
	<div class="wrapper">
		<div class="logo">
			<h1>LOGIN PAGE</h1>
		</div>
		<div class="lg-body">
			<div class="inner">
				<div id="lg-head">
					<p>
						<span class="font-bold">管理员登陆</span>
					</p>
					<div class="separator"></div>
				</div>
				<div class="login">
					<form action="/PaperNew/forLogin" method="post">
						<fieldset>
							<ul>
								<li id="usr-field"><input class="input required"
									name="name" type="text" size="26" minlength="1"
									placeholder="输入用户名..." /></li>
								<li id="psw-field"><input class="input required"
									name="pass" type="password" size="26" minlength="1"
									placeholder="输入密码..." /></li>
								<li class="checkbox"><input class="checkbox"
									type="checkbox" id="remember-me" value="remember" /> <label
									for="remember-me" class="checkbox-text">记住密码</label></li>
								<li>
									<div class="form-row" style="text-align: right;">
										<input type="submit" class="button small grey" value="登陆">
									</div>
								</li>
							</ul>
						</fieldset>
					</form>
					<!--  span id="lost-psw"> <a href="#">I forgot my password</a>
					</span-->
				</div>
			</div>
		</div>
	</div>
</body>
</html>