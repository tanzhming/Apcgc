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
    <h1 class="mui-title">产品认购</h1>
</header>
<div class="mui-content">
    <div class="mui-card">
        <ul >
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">1、认购产品有什么门槛？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>
                            海吉星金融网认购门槛低,在一般情况下，最低认购额度为100元。
                        </p>
                    </form>
                </div>
            </li>
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">2、怎么查看可投资的产品？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>会员可登录海吉星金融网，点击【我要投资】查看投资产品。交易页面可以查阅借款人、借款金额、期限、借款利率、担保方式、借款用途等相关信息。</p>
                    </form>
                </div>
            </li>
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">3、到期还本和平息这两种还款方式有什么区别？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>
                            按月付息到期还本 每个月产生的利息在当期结算返还，借款本金在最后一期还款时一次性全额返还。 每次（不包含最后一次）还款金额为：出借总额×月利率； 最后一次还款金额为：出借总额×月利率 + 出借总额。 平息 每个月归还本金和利息，每月计息额按借款的总额来算。本还款方式适合那些每个月需要回还一部分本金用于它途（例如每月固定支出等）或者继续投资的会员。 每次还款金额为：出借总额×月利率 + 出借总额/还款期数。
                        </p>
                    </form>
                </div>
            </li>
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">4、什么是固定日？什么是推算日？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>固定日还款：固定日还款是指该产品无论在当月哪一天起息，第一次的还款周期都固定为下一个月的20号，第二次的还款周期为再下一个月的20号。即以每月的20号为固定的结息日（固定日还款第一期利息以实际天数计算，以后每期按月息计算）。 推算日还款：推算日还款是指该借款会以月为单位来计算还款期。如：某产品2月13日起息，则第一期结息还款日为3月13日，第二期结息还款日为4月13日，以此类推（推算日还款每期均按月息计算）。</p>
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
