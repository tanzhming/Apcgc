<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- 我的债权项目界面 -->
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
    
    
<style>
    .creditor_02 {
        width: 75%;
        float: left;
    }
</style>
<input id="hidPage" name="hidPage" type="hidden" value="User" />

<header class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
    <h1 id="title" class="mui-title" style="right: 120px;left: 120px;">
        我的债权
    </h1>
</header>
<div class="mui-content">
    <div style="padding:0 0 6px 0;">
        <div id="sliderSegmentedControl" class="mui-segmented-control mui-segmented-control-inverted" style="background-color: #FFFFFF;">
            <a id="a1" class="mui-control-item mui-active" href="#item1mobile">持有中</a>
            <a id="a2" class="mui-control-item" href="#item2mobile">认购中</a>
            <a id="a3" class="mui-control-item" href="#item3mobile">已结清</a>
        </div>
        <div class="mui-slider-group">
            <div id="item1mobile" class="mui-slider-item mui-control-content mui-active">
            </div>
            <div id="item2mobile" class="mui-slider-item mui-control-content">


            </div>
            <div id="item3mobile" class="mui-slider-item mui-control-content">
            </div>
        </div>
    </div>
</div>
<nav class="mui-bar mui-bar-tab" style=" border: none; height: 44px;background-color: #F7F7F7;">
    <a class="mui-tab-item mui-active" href="#" style="color: #333;font-size: 18px;">
        交易记录
    </a>
</nav>

<script>
    var id = '${id}';
    if (id == "2")
    {
        $("#a1").removeClass("mui-active");
        $("#a3").removeClass("mui-active");
        $("#a2").addClass("mui-active");
        $("#item1mobile").removeClass("mui-active");
        $("#item3mobile").removeClass("mui-active");
        $("#item2mobile").addClass("mui-active");
    }
    if (id == "3") {
        $("#a1").removeClass("mui-active");
        $("#a2").removeClass("mui-active");
        $("#a3").addClass("mui-active");
        $("#item2mobile").removeClass("mui-active");
        $("#item1mobile").removeClass("mui-active");
        $("#item3mobile").addClass("mui-active");
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
