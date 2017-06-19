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
    <h1 class="mui-title">资金保障</h1>
</header>
<div class="mui-content">
    <div class="mui-card">
        <ul>
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">1、资金安全是否有保障？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>
                            （1）本息担保。<br />
                            海吉星金融网与国内优秀的具有相应资质的担保、小贷等第三方公司合作，由第三方公司对借款会员进行风险审查、评估，并为借款会员提供本息担保。通过担保，有效降低借款会员的借款难度，同时保证投资会员本息安全。
                            <br /><br />（2）资金托管<br />
                            海吉星金融网已和银行、第三方支付公司签署合作协议，会员资金的充值、转账、提现和托管均由合作银行、第三方支付公司处理，会员仅能提现至会员本人的银行账户，保障会员资金安全。
                            <br /><br />（3）对大额提现及异常提现，海吉星金融网将根据情况与会员进行电话确认。
                        </p>
                     </form>
                </div>
            </li>
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">2、账户资金是否由正规公司支付和转结？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>海吉星金融网携手商业银行、已经获得由央行颁发《支付业务许可证》的第三方支付公司，会员资金的充值、转账、提现和托管均由合作银行、第三方支付公司处理，保障资金的安全。</p>
                    </form>
                </div>
            </li>
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">3、怎么做到本金和利息担保？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>
                            为保障借贷双方权益，目前，海吉星金融网的各类产品均由第三方公司进行担保，担保范围包括：利息和本金。
                            举例来说，如遇借款人未能按时还款，第三方公司会立即启动对投资人进行代偿或回购，代偿或回购金额包括：<br />
                            <br />（1）借款人尚未偿还的全部剩余本金；<br />
                            <br />（2）借款人尚未支付的至代偿日或回购日止的应付未付利息；
                            <br /><br />注：派息日一般会在结息日后的4个工作日之内。<br />
                            海吉星金融网以此种方式确保每一位投资人的真实利益，达到真正的担保。
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
