<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
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
    <h1 id="title" class="mui-title">更多</h1>
</header>

<div class="vip-more">
    <ul>
        <li class="mui-table-view-cell"  >
            <a class="mui-navigate-right" open-type="common" href="${pageContext.request.contextPath }/showAllnotices.action">
                <img src="${pageContext.request.contextPath }/Images/news.png" style="width: 20px;float: left; margin-right: 12px;">
                <span>平台公告</span>
            </a>
        </li>
        <li class="mui-table-view-cell"  >
            <a class="mui-navigate-right" open-type="common" href="${pageContext.request.contextPath }/newsComm.action">
                <img src="${pageContext.request.contextPath }/Images/news_02.png" style="width: 20px;float: left; margin-right: 12px;">
                <span>公司新闻</span>
            </a>
        </li>
        <li class="mui-table-view-cell"  >
            <a class="mui-navigate-right" open-type="common" href="${pageContext.request.contextPath }/showAllinnews.action">
                <img src="${pageContext.request.contextPath }/Images/news_03.png" style="width: 20px;float: left; margin-right: 12px;">
                <span>行业资讯</span>
            </a>
        </li>
    </ul>
    <ul>
        <li class="mui-table-view-cell"  >
            <a class="mui-navigate-right" open-type="common" href="${pageContext.request.contextPath }/help.action">
                <img src="${pageContext.request.contextPath }/Images/news_04.png" style="width: 20px;float: left; margin-right: 12px;">
                <span>帮助中心</span>
            </a>
        </li>
        <li class="mui-table-view-cell"  >
            <a class="mui-navigate-right" open-type="common" href="${pageContext.request.contextPath }/LinkUs.action">
                <img src="${pageContext.request.contextPath }/Images/news_05.png" style="width: 20px;float: left; margin-right: 12px;">
                <span>联系我们</span>
            </a>
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
