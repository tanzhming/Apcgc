<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- 修改绑定手机界面 -->
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
    <script>

        function index() {
            window.location.href = '/'
        }

        function list() {
            window.location.href = '/Invest'
        }

        function user() {
            window.location.href = '/User'
        }

        function more() {
            window.location.href = '/Home/More'
        }
    </script>

</head>
<body onload="initPieChart();">
    
    <script src="/bundles/jqueryval?v="></script>

    <script type="text/javascript">
        var timer = 120;

        function getmsgcode() {
            var mobile = $("#account").val();
            if (mobile.length == 11) {
                timer = 120;
                setSmsButton();
                $.ajax({
                    type: "POST",
                    url: "/Common/Ajax/AjaxGet.ashx?Action=SmsProxy&ActionType=SM&Mobile=" + mobile,
                    success: function (msg) {
                        if (msg == "1") {
                            mui.alert("验证码已发送至手机" + mobile, '提示信息', function () { });
                            $("#vcode").focus();
                        }
                        else {
                            mui.alert(msg, '提示信息', function () { });
                            $("#vcode").focus();
                        }
                    }
                });
            }
            else { 
                mui.alert('手机号码填写错误', '提示信息', function () { });
                $("#account").focus();
            }
            return false;
        }

        function setSmsButton() {
            $("#msgCode").val(timer + "秒后重新获取");
            timer--;
            if (timer < 0) {
                $("#msgCode").val("获取动态密码");
                $("#msgCode").focus();
            }
            else {
                $("#msgCode").attr("disabled", true);
                setTimeout("setSmsButton()", 1000);
            }
        }
    </script>

    

<input id="hidPage" name="hidPage" type="hidden" value="User" />

<header class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
    <h1 class="mui-title">修改绑定手机</h1>
</header>
<div class="mui-content" style="margin-top:10px;">
    <form class="mui-input-group">

        <div class="mui-input-row">
            <label style="font-size:16px;padding-left:15px;">手机号码：</label>
            <input id='account' type="text" class="mui-input-clear mui-input" placeholder="请输入手机号码">
        </div>

        <div class="mui-input-row">
            <input id='vcode' type="text" class="mui-input-clear mui-input" placeholder="请输入验证码" style="width: 70%;float: left;">
            <span id="msgCode" style="width: 30%; float: right; text-align: center; line-height: 44px; color: #007AFF; cursor: pointer; border-left: 1px solid #e5e5e5;" onclick="getmsgcode()">获取验证码</span>
        </div>
    </form>

    <div class="mui-content-padded">
        <button id='sendMail' class="mui-btn mui-btn-block mui-btn-primary" onclick="regsubmit()">提交</button>
    </div>
</div>
<script type="text/javascript">

    (function ($, doc) {
        $.init();
    }(mui, document));

    function regsubmit() {
        var account = document.getElementById('account').value;
        var vcode = document.getElementById('vcode').value;
        if (account == "") {
            mui.alert("请输入新手机号码", '提示', function () { });
            return false;
        }
        else {
            if (account.length != 11) {
                mui.alert("请输入新手机号码", '提示', function () { });
                return false;
            }
        }
        if (vcode == "") {
            mui.alert("请输入验证码", '提示', function () { });
            return false;
        }
        else {
            if (vcode.length != 6) {
                mui.alert("请输入正确的手机验证码", '提示', function () { });
                return false;
            }
        }
        $.post('/User/SetMobileSecondSubmit', { mobile: account, vcode: vcode },
          function (data) {
              if (data.success) {
                  window.location.href = '/User/SetMobileSuccess/0'
              }
              else {
                  mui.alert(data.result, '提示', function () { });
                  window.location.href = '/User/SetMobileSuccess/1'
              }
          }, "json");
    }
</script>


    <div style="margin-bottom:60px;"></div>
    
    <!-- 底部按钮 -->
    <%@include file="/Common/communder.jsp" %>
    
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

        var a = $("#hidPage").val();
        if (a == "Home") { $("#defaultTab").addClass("mui-active"); }
        if (a == "Invest") { $("#listTab").addClass("mui-active"); }
        if (a == "User") { $("#userTab").addClass("mui-active"); }
        if (a == "More") { $("#moreTab").addClass("mui-active"); }


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
