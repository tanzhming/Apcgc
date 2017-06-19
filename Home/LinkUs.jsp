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
    
    
<input id="hidPage" name="hidPage" type="hidden" value="More" />
<header class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
    <h1 id="title" class="mui-title">联系我们</h1>
</header>


<div class="more">
    <div class="logo_01" style="text-align: center;margin-bottom: 20px;">
        <img src="${pageContext.request.contextPath }/Images/logo_01.png" style="width: 30%;">
    </div>
    <ul>
        <li>

            官方微信<span style="float: right;color: #666666;">微信号：xxxxxx</span>
        </li>
        <li>

            官方网站<span style="float: right;color: #666666;">www.xxxxx.com</span>
        </li>
        <li>

            在线客服<span style="float: right;color: #666666;">企业QQ：xxxxxxxxx</span>
        </li>
        <li>

            工作时间<span style="float: right;color: #666;">工作日 09:00-18:00</span>
        </li>
        <li>

            客服电话<span style="float: right;color: #fe7701;">xxx-xxx-xxxx</span>
        </li>
    </ul>

</div>


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
