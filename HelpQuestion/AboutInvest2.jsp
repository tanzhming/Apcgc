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
    <h1 class="mui-title">撮合起息</h1>
</header>
<div class="mui-content">
    <div class="mui-card">
        <ul >
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">1、撮合期限一般是几天？为什么要设定撮合期限？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>
                            撮合期限根据特定产品约定，最多不超过5个工作日。撮合期限的设定是为了不损害已投资会员的利益，提高资金利用率，同时也是为了规范产品的撮合流程。
                        </p>
                    </form>
                </div>
            </li>
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">2、如何确定产品已经起息？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>产品起息的条件是资金汇入借款人银行账户。起息后海吉星金融网将会发出短信通知，并向您绑定的邮箱发送的【海吉星金融网借贷产品认购证明】【海吉星金融网委托放款协议】等相关的电子合同。</p>
                    </form>
                </div>
            </li>
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">3、什么情况下产品会撮合失败？撮合失败后我的资金怎么返回我的在账户？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>
                            在撮合的期限内未撮合成功或借款人在撮合成功前申请取消借款时，投资的款项将在撮合到期日的第二个工作日内返还到海吉星金融网托管账户。
                        </p>
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
