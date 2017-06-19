<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- 提现  完善账户资料 -->
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
            var mobile = $("#hidMobile").val();
            if (timer < 0 || timer == 120) {
                timer = 120;
                setSmsButton();
                $.ajax({
                    type: "POST",
                    url: "/Common/Ajax/AjaxGet.ashx?Action=SmsProxy&ActionType=R2&Mobile=" + mobile,
                    cache: false,
                    dataType: 'json',
                    success: function (msg) {
                        if (msg == "" || msg == null) {
                            mui.alert("验证码已发送至手机" + mobile, '提示信息', function () { });
                            $("#tbYzm").focus();
                        }
                        else {
                            mui.alert(msg.cfsTop.toString(), '提示信息', function () { });
                            $("#tbYzm").focus();
                        }
                    }
                });
            }
        }


        function setSmsButton() {
            $("#msgCode").html(timer + "秒后重新获取");
            timer--;
            if (timer < 0) {
                $("#msgCode").html("获取动态密码");
                $("#msgCode").enabled = true;//attr("onclick", "getmsgcode()");
                $("#msgCode").focus();
            }
            else {
                $("#msgCode").enabled = false;//.remove("onclick");
                setTimeout("setSmsButton()", 1000);
            }
        }

        function submit() {

            var val = $("#tbAmount").val();
            var Balance = $("#hidMount").val();
            var mobilecode = $("#tbYzm").val();
            var mobile = $("#hidMobile").val();

            if (val == "") { mui.alert("请输入提现金额", '提示信息', function () { }); return false; }

            var reg = new RegExp("^-?\d+\.?\d{0,2}$", 'g'); //匹配正浮点数
            var result = val.match(reg);
            if (reg.test(val)) {
                mui.alert("现金额必须为大于0的有效数字", '提示信息', function () { }); return false;
            }
            if (parseFloat(val) <= 0) { mui.alert("提现金额必须为大于0的有效数字", '提示信息', function () { }); return false; }
           
            if (parseFloat(val) > parseFloat(Balance)) {
                mui.alert("提现金额不能超过账户余额", '提示信息', function () { }); return false;
            }
            else {
                if (parseFloat(Balance) < 100) {
                    if (parseFloat(val) == parseFloat(Balance)) {
                    }
                    else {
                        mui.alert("提现金额错误，最低100，账户金额小于100时必须全部提取", '提示信息', function () { }); return false;
                    }
                }
                else {
                    if (parseFloat(val) < 100)
                    {
                        mui.alert("提现金额错误，最低100，账户金额小于100时必须全部提取", '提示信息', function () { }); return false;
                    }
                }
            }
            window.location.href = '/User/WithdrawalSubmit?Amount=' + encodeURI(parseFloat(val))
        }

        function MyWithdrawal() {
            window.location.href = '${pageContext.request.contextPath}/Withdrawal.action';
        }

        function clearNoNum(obj) {
            obj.value = obj.value.replace(/[^\d.]/g, ""); //清除"数字"和"."以外的字符
            obj.value = obj.value.replace(/^\./g, ""); //验证第一个字符是数字而不是
            obj.value = obj.value.replace(/\.{2,}/g, "."); //只保留第一个. 清除多余的
            obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");
            obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3'); //只能输入两个小数

        }
    </script>

    

<input id="hidPage" name="hidPage" type="hidden" value="User" />
<input id="hidMount" name="hidMount" type="hidden" value="" />
<input id="hidMobile" name="hidMobile" type="hidden" value="" />

<header class="mui-bar mui-bar-nav">
    <h1 id="title" class="mui-title">提现</h1>
    <button class="mui-btn mui-btn-blue mui-btn-link mui-pull-right" onclick="MyWithdrawal()" style=" color:#fff;">查看提现进度</button>
</header>

    <div class="mui-content">
        <div id="slider" class="mui-slider">
            <div class="Recharge_cg">
                <dl style="margin:30px; text-align: center;font-size: 20px;">
                    <dt>您的账户资料未完善，请先完善账户资料。</dt>
                    <dd> </dd>
                </dl>
            </div>
            <div class=" bank_ann"><a href="${pageContext.request.contextPath }/user.action">返回用户中心</a></div>
        </div>
    </div>


<!-- <script>
    (function ($, doc) {
        $.init();
        $.ready(function () {
            var showUserPickerButton = doc.getElementById('aSubmit');
            showUserPickerButton.addEventListener('tap', function (event) {
                submit();
            }, false);
        });
    })(mui, document);
</script> -->


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
