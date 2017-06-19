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
    
    <script src="/bundles/jqueryval?v="></script>

    <script type="text/javascript">
        var timer = 120;

        function getmsgcode() {
            var mobile = $("#mobile").val();
            if (mobile.length == 11) {
                timer = 120;
                setSmsButton();
                $.ajax({
                    type: "POST",
                    url: "/Common/Ajax/AjaxGet.ashx?Action=SmsProxy&ActionType=R1&Mobile=" + mobile,
                    cache: false,
                    dataType: 'json',
                    success: function (msg) {
                        if (msg.cfsTop.toString() == "") {
                            mui.alert("验证码已发送", '提示', function () { });
                            $("#VCode").focus();
                        }
                        else {
                            mui.alert(msg.cfsTop.toString(), '提示', function () { });
                            $("#VCode").focus();
                        }
                    }
                });
            }
            else {
                mui.alert("手机号码填写错误", '提示', function () { });
                $("#VCode").focus();
            }
            return false;
        }

        function setSmsButton() {
            $("#msgCode").val(timer + "秒后重新获取");
            timer--;
            if (timer < 0) {
                $("#msgCode").val("获取短信验证码");
                $("#msgCode").focus();
            }
            else {
                $("#msgCode").attr("disabled", true);
                setTimeout("setSmsButton()", 1000);
            }
        }

        /* function reloadcode() {
            document.getElementById("yzm").src = "/Common/validatecode/show.aspx?ft=0&it=2&fz=26&w=100&h=40&s=" + Math.random();
        }  */
    </script>

    

<input id="hidPage" name="hidPage" type="hidden" value="User" />
<header class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
    <h1 class="mui-title">注册</h1>
</header>
 
    <div class="mui-content" >
        <div class="mui-input-row" style="margin-top: 20px;">
            <input id='account' type="text" class="mui-input-clear mui-input" placeholder="请输入用户名">
        </div>
        <div class="mui-input-row">
            <input id='password' type="password" class="mui-input-clear mui-input" placeholder="请输入登录密码">
        </div>
        <div class="mui-input-row">
            <input id='password_confirm' type="password" class="mui-input-clear mui-input" placeholder="请再次输入密码">
        </div>
 
            <div class="mui-input-row">

                <input id='ReferenceUser' type="password" class="mui-input-clear mui-input" placeholder="推荐人">
            </div>
	<div class="mui-input-row">
            <input id='VCode' type="text" class="mui-input-clear mui-input" placeholder="请输入验证码" style="width: 150px;float: left;">
           <span id="image"><img alt="验证码" id="yzm" src="${pageContext.request.contextPath}/yzm.action" onclick="reloadcode()" title="点击更换验证码"  style="cursor: pointer; padding-left:10px;" /> </span>
        </div>
        <div class="mui-content-padded" style="padding:0 10px;">
            <label class="checkbox">
                <input checked="checked" class="checkbox" data-val="true" data-val-required="The isChecked field is required." id="isChecked" name="isChecked" type="checkbox" value="true" /><input name="isChecked" type="hidden" value="false" />
                <a href="${pageContext.request.contextPath }/RegistContent.action?Length=4" style="color:#666;">我已阅读并同意《用户注册协议》</a>
            </label>
        </div>
        <div class="mui-content-padded">
            <button id='reg' class="mui-btn mui-btn-block mui-btn-primary" onclick="regsubmit()">注册</button>
        </div>
    </div>
 

<script type="text/javascript">

    (function ($, doc) {
        $.init();
        $.ready(function () {

        });
    }(mui, document));

    function regsubmit() {
        var accountBox = document.getElementById('account');  //用户名
        var passwordBox = document.getElementById('password');  //密码
        var passwordConfirmBox = document.getElementById('password_confirm'); //确认密码
        var ReferenceUserBox = document.getElementById('ReferenceUser'); // 推荐人
        //var mobileBox = document.getElementById('mobile');
        var VCodeBox = document.getElementById('VCode');  // 用户输入的验证码

        var UserInfo = {
            UserID: accountBox.value,
            Password: passwordBox.value,
            SecPassword: passwordConfirmBox.value,
            ReferenceUser: ReferenceUserBox.value,
            //Mobile: mobileBox.value,
            VCode: VCodeBox.value
        };
        if (UserInfo.UserID == "") { mui.alert("请输入用户名", '提示', function () { }); return false; }
        else
        {
            if (UserInfo.UserID.length >= 6 && (UserInfo.UserID.length) <= 20) {
                var patt1 = new RegExp("^[a-zA-Z][a-zA-Z0-9_]{2,19}$");
                if (patt1.test(UserInfo.UserID)) { }
                else {
                    mui.alert("会员账号由6-20个英文字母、数字或下划线组成", '提示', function () { }); return false;
                }
            }
            else {
                mui.alert("会员账号由6-20个英文字母、数字或下划线组成", '提示', function () { }); return false;
            }
        }
        if (UserInfo.Password == "") { mui.alert("请输入登录密码", '提示', function () { }); return false; }
        if (UserInfo.SecPassword == "") { mui.alert("请再次输入密码", '提示', function () { }); return false; }
        if (UserInfo.Password != UserInfo.SecPassword) { mui.alert("密码两次输入不一致", '提示', function () { }); return false; }
        //if (UserInfo.Mobile == "") { mui.alert("请输入手机号码", '提示', function () { }); return false; }
        if (UserInfo.VCode == "") { mui.alert("请输入验证码", '提示', function () { }); return false; } else { if (UserInfo.VCode.length != 4) { mui.alert("请输入正确的验证码", '提示', function () { }); return false; } }

       /*  $.post('/User/RegistMobileSubmit', { UserID: UserInfo.UserID, Password: UserInfo.Password, VCode: UserInfo.VCode },
          function (data) {
              if (data.success) {
                  window.location.href = '/Promotion/MSG/1'
              }
              else {
                  mui.alert(data.result, '提示', function () { window.location.href = '/User/RegistMobile' });
              }
          }, "json"); */
          
          // 修改 异步请求
          $.ajax({
          	type:'post',
          	url:'${pageContext.request.contextPath}/RegistMobileSubmit.action',
          	data:{username:accountBox.value,password:passwordBox.value,yzm:VCodeBox.value},
          	dataType:'json',
          	success:function(data){
          		if(data=='yzmError'){
          			mui.alert('验证码错误','提示',function(){ });
          			window.location.href='${pageContext.request.contextPath}/RegistMobile.action?Length=0';
          		}else if(data=='regError'){
          			mui.alert('该用户已经存在','提示',function(){ });
          			window.location.href='${pageContext.request.contextPath}/RegistMobile.action?Length=0';
          		}else if(data=='regSuccess'){  // 注册成功
          			window.location.href='${pageContext.request.contextPath}/regResut.action';
          		}
          	},
          	error:function(){
          		alert('you request is error');
          	}
          });
    }
</script>


    <script>
        $(document).ready(function () {
            mui('body').on('tap', 'a', function () { document.location.href = this.href; });
            //validateCode();
            //createValidateCodeImage();
        });
        
        // 异步请求创建验证码图片
        function createValidateCodeImage(){
        	$("#yzm").remove();
        	$.ajax({
        		type:'get',
        		url:'${pageContext.request.contextPath}/yzm.action',
        		dataType:'json',
        		success:function(data){
        			alert(data);
        			document.getElementById("yzm").src = "${pageContext.request.contextPath}/yzm.action?s=" + Math.random();
        			//$("#image").html('<img alt="验证码" src="${pageContext.request.contextPath}/Common/validatecode/yzm.png" id="yzm" onclick="reloadcode()" title="点击更换验证码"  style="cursor: pointer; padding-left:10px;" />');
        			//$("#yzm").attr('src','Common/validatecode/yzm.png');
        			$("#yzm").click(function(){
			        	reloadcode();
			        	//alert('xxxxxxxxxxxxxx');
		        	});
        		},
        		error:function(){
        			alert('you request is error!');
        		}
        	});
        }
        
        
        // 看不清 换一张验证码
        function reloadcode(){
        	document.getElementById("yzm").src = "${pageContext.request.contextPath}/yzm.action?s=" + Math.random();
        }
        
        function validateCode(){
        	var codeChar=[1,2,3,4,5,6,7,8,9,0,'q','w','e','r','t','y','u','i','o','a','s','d','f','g','h','j','k','l','z','x','c','v','b','n','m','p',
                                                'Q','W','E','R','T','Y','U','I','O','P','A','S','D','F','G','H','J','K','L','Z','X','C','V','B','N','M'];
        	var code="";
        	for(var i=0;i<4;i++){
        		var codeCharIn=Math.floor(0+Math.random()*62);
        		code+=codeChar[codeCharIn];
        	}
        	$("#yzm").html(code);
        }

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
