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
    <h1 class="mui-title">债权转出</h1>
</header>
<div class="mui-content">
    <div class="mui-card">
        <ul >
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">1、如果我急需资金，能否把债权转让出去？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>
                            若您需要转让手中的债权，可通过海吉星金融网的“便利转”进行债权转让，您只要登录会员中心，选择左边菜单栏的 “我的债权”，在 “我的债权”列表中选择需要转让的债权，点击申请转让，系统会引导您完成申请流程。
                        </p>
                    </form>
                </div>
            </li>
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">2、是不是所有债权都可以转让？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>目前，通过认购 “健康贷”、“安心债”、“便利转”等所形成的债权在满足一定条件下，都是可以进行债权转让的，债权转让的转让方需要支付转让服务手续费，受让方不需要支付手续费。</p>
                    </form>
                </div>
            </li>
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">3、债权转让有什么注意事项？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>
                             1) 在债权每月结息日至还款完成期间，债权不可进行转让操作。 
                            <br />2) 接收到会员债权转让申请并不意味着同意其申请，海吉星金融网有权对债权转让申请进行审核，以确保该申请符合法律法规及海吉星金融网交易规则。
                            <br />3) 海吉星金融网不承诺所有通过审批的债权转让均能转让成功，若债权在转让期间没有成功转让，则债权出让人同意海吉星金融网自动撤销该转让申请。
                            <br />4) 债权出让人在提交转让申请后，有权在未转让前提出书面申请撤销转让申请。 
                            <br />5) 若债权在转让期间成功转让，则该交易不可撤销。
                        </p>
                    </form>
                </div>
            </li>
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">4、转让债权需要什么手续和费用？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>您只要登录会员中心，选择左边菜单栏的 “我的债权”，在 “我的债权”列表中选择需要转让的债权，点击申请转让，系统会引导您完成申请流程，债权转让成功时将向债权转让的转让人收取债权转入价格总额0.4%的手续费，受让方不需要支付手续费。</p>
                    </form>
                </div>
            </li>
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">5、债权上架后是不是一定可以转让成功？如果不成功会收取费用吗？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>债权上架之后，由会员自由交易，在期限内没有成功交易的债权将会下架即为交易失败。会员债权转让不成功不会收取任何费用。</p>
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
