<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>海吉星金融网</title>
    <link href="${pageContext.request.contextPath }/Content/mui.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/Content/Site.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath }/Scripts/jquery-1.8.2.min.js"></script>
    <script src="${pageContext.request.contextPath }/Scripts/mui.min.js"></script>
    <script src="${pageContext.request.contextPath }/Scripts/apcgc_piechart.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath }/Content/jquery.easy-pie-chart.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath }/Scripts/apcgc_common.js"></script>


</head>
<body onload="initPieChart();">

	<script>
		$(document).ready(function() {

			$("#login").bind("click", function() {
				var UserName = $("#UserName").val();
				var Password = $("#Password").val();
				if (UserName == "" || Password == "") {
					mui.alert("请输入用户名和密码", '提示', function() {
					});
					return false;
				} else {
					/* $.post('${pageContext.request.contextPath}/login.action', {
						username : UserName,
						password : Password
					}, function(data) {
						if (data.success) {
							window.location.href = '/User'
						} else {
							mui.alert(data.result, '提示', function() {
							});
						}
					}, "json");  */
					//修改
					$.ajax({
						type:'post',
						url:'${pageContext.request.contextPath}/login.action',
						data:{username:UserName,password:Password},  // 数据自动封装
						dataType:'json',
						success:function(data){
							if(data=='nologin'){
								//mui.alert('登录成功','提示',function(){ });
								window.location.href='${pageContext.request.contextPath }/user.action';
							}else if(data=='islogin'){
								mui.alert('该账号已经登录','提示',function(){ });
							}else{
								mui.alert('用户名或密码错误','提示',function(){ });
							}
						},
						error:function(){
							mui.alert('登录失败','提示',function(){
							});
						}
					});
					
				}
			});
		});
	</script>


	<input id="hidPage" name="hidPage" type="hidden" value="User" />
<header class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
    <h1 class="mui-title">登录</h1>
</header>

<div class="mui-content">
    
    <div class="logo_01" style="text-align: center; margin: 20px; padding-top: 36px;">
        <img src="${pageContext.request.contextPath }/Images/logo_01.png" style="width:40%;">
    </div>
    <div class="Login">
        <ul>
            <li>
                <label>用户名：</label>
                <input id='UserName' type="text" placeholder="请输入用户名">
            </li>
            <li>
                <label>密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
                <input id='Password' type="password" placeholder="请输入密码">
            </li>
        </ul>
    </div>

    <div class="mui-content-padded">
        <button id='login' class="mui-btn mui-btn-block mui-btn-primary" type="submit"> 登录</button>
        <div class="link-area">
            <a href="${pageContext.request.contextPath }/RegistMobile.action?Length=0" style="color: #fe7701;">立即注册</a><span class="spliter">|</span> 
            <a href="${pageContext.request.contextPath }/ForgetPassword.action" style="color:#666;">忘记密码</a>
        </div>
    </div>
    <div class="mui-content-padded oauth-area">
    </div>

</div>


    <script>
        $(document).ready(function () {
            mui('body').on('tap', 'a', function () { document.location.href = this.href; });
        });

        var initPieChart = function () {
            $('.percentage-light').easyPieChart({
                size: 65,
                lineWidth: 3
            });
        };


        function simulateLoading(container, progress) {
            if (typeof container === 'number') {
                progress = container;
                container = 'body';
            }
            setTimeout(function () {
                progress += Math.random() * 20;
                mui(container).progressbar().setProgress(progress);
                if (progress < 100) {
                    simulateLoading(container, progress);
                } else {
                    mui(container).progressbar().hide();
                }
            }, Math.random() * 200 + 200);
        }
    </script>
</body>
</html>
