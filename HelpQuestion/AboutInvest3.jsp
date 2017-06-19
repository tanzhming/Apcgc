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
    
    
<style>
    .mui-card {
        background: none;
    }

        .mui-card ul {
            background: none;
            margin-top: 10px;
        }

            .mui-card ul li {
                margin-bottom: 10px;
                background: #fff;
                border-top: 1px solid #E5E5E5;
                border-bottom: none;
                font-size: 16px;
            }
</style>
<input id="hidPage" name="hidPage" type="hidden" value="More" />
<header class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
    <h1 class="mui-title">回收本息</h1>
</header>
<div class="mui-content">
    <div class="mui-card">
        <ul >
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">1、借款到期后资金回到哪里？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>
                            当产品到期后，会员出借的资金将会回到会员在海吉星金融网开设的账户中。
                        </p>
                    </form>
                </div>
            </li>
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">2、结息日之后最晚多少天资金能回到账户？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>固定日还款的产品中，借款人的还款日通常为每月的20号，推算日还款的产品还款日视起息时间而定。因结算和财务处理的需要，通常在借款人还款日后最晚4个工作日内，到期的本息将会回到会员的账户中。</p>
                    </form>
                </div>
            </li>
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">3、如果借款人还款能力不足怎么办？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>
                            借款人未能按时还款，第三方公司会立即启动对投资人进行代偿或回购。
                        </p>
                    </form>
                </div>
            </li>
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">4、如果借款人提前还款，对我的收益有影响吗？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>如若遇到借款人提前还款的情况，该借贷关系将会提前终止，投资人将立即收回债权本金以及实际产生的未收回利息。</p>
                    </form>
                </div>
            </li>
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">5、本息回收到账之后，是否可以马上提现或者再次认购其它产品？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>本息到帐之后即为可用资金，会员可以马上进行认购或者提现。</p>
                    </form>
                </div>
            </li>
        </ul>
    </div>
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
