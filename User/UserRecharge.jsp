<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- 充值  完善账户资料 -->
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

    <script>
        function submitOrder() {
            var Amount = $("#tbAmount").val();
            if (Amount == "") {   mui.alert("请输入充值金额", '提示', function () { }); return false; }
            if (isNaN(Amount)) {   mui.alert("充值金额必须为有效数字", '提示', function () { }); return false; }
            if (parseFloat(Amount) > 50000) {   mui.alert("单笔最大充值金额50000元", '提示', function () { }); return false; }
            window.location.href = '/User/UserRechargeConfirm?Amount=' + encodeURI(Amount);
        }
    </script>

    
<input id="hidPage" name="hidPage" type="hidden" value="User" />


<header class="mui-bar mui-bar-nav">
    <h1 id="title" class="mui-title">充值</h1>
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

<!--<script>
    (function ($, doc) {
        $.init();
        $.ready(function () {
            var showUserPickerButton = doc.getElementById('aSubmit');
            showUserPickerButton.addEventListener('tap', function (event) {
                submitOrder();
            }, false);
        });
    })(mui, document);
</script>-->


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
