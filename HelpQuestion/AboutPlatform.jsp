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
    .mui-card {   background: none;  }
    .mui-card ul {  background: none;  margin-top: 10px;}
    .mui-card ul li {  margin-bottom: 10px;  background: #fff; border-top: 1px solid #E5E5E5;  border-bottom: none;  font-size: 16px; }
</style>
<input id="hidPage" name="hidPage" type="hidden" value="More" />

<header class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
    <h1 class="mui-title">关于平台</h1>
</header>
<div class="mui-content">
    <div class="mui-card">
        <ul >
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">1、海吉星金融网是什么平台？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>海吉星金融网（www.apcgc.com）是深圳市国资委直管上市公司——深圳市农产品股份有限公司旗下P2P网站，为企业、个人提供专业的信贷咨询和理财服务，通过海吉星金融网实现借贷双方直接撮合。为投资人提供低起点、低风险、高收益的投资产品，增加财产性收入；为借款人获得业务经营所需资金，实现普惠金融，促进三农和小微企业发展。</p>
                    </form>
                </div>
            </li>
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">2、海吉星金融网提供什么服务？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>海吉星金融网为符合条件、有资金需求的借款人以及具备贷款资质的小贷公司、保理公司、租赁公司等提供资金，也为有富余资金的投资者提供起点低、低风险、高收益的理财产品。海吉星金融网为交易双方提供信息发布、产品咨询、撮合服务以及法律协议签署等服务。 海吉星金融网自2011年3月上线以来，年化收益率一直稳定在8%左右，没有任何违约情况发生。 </p>
                    </form>
                </div>
            </li>
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">3、海吉星金融网提供什么产品？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>
                            海吉星金融网的产品包括“健康贷”、“安心债”和“便利转”。为保障投资人权益，目前上架发布的“健康贷”、“安心债”、“便利转”产品均由第三方公司提供本息担保。<br />
                            <br />(1) 什么是健康贷？<br />
                            “健康贷”是海吉星金融网全新打造的P2P贷款撮合产品，“健康贷”产品对接借贷双方，既满足借款人的资金需求，也满足了投资人的投资理财需求。借款人在海吉星金融网发布借款金额、借款期限、借款用途、担保机构等借款信息，投资人根据借款信息和自身资金情况，自主选择将确定金额的自有资金出借给借款人，获得预期收益。海吉星金融网为借贷双方提供信息发布、咨询、撮合服务以及法律协议签署等服务。
                            <br /><br />(2) 什么是安心债？<br />
                            “安心债”是海吉星金融网全新打造的债权转让产品，是海吉星金融网与具备贷款资质的小贷公司、保理公司、租赁公司等（简称“合作机构”，下同）合作，从其以自有的合法资金向债务人提供贷款后持有的相关债权中，挑选出的优质债权通过海吉星金融网进行转让，并承诺特定条件下予以回购。投资人通过认购“安心债”，获得受让债权和预期利息收益。
                            <br /><br />(3) 什么是便利转？<br />
                            “便利转”是海吉星金融网会员间的债权转让的交易场所。通过债权转让，使债权转让方获得资金，使产品受让方增加投资品种，获得投资收益。会员认购的“健康贷”、“安心债”和“便利转”等均可便利转让，轻松获得流动性。海吉星金融网为债权转让人和受让人提供转让所需的中介服务。
                        </p>
                    </form>
                </div>
            </li>
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">4、谁是海吉星金融网的主要借款人？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>目前，海吉星金融网上的借款人主要来自于农产品股份公司旗下农批市场有长租商铺的商户，这些借款产品均要标记“农商宝”。所有借款人在上海吉星金融网借款之前，都经过严格的信贷调查，采取必要的担保措施，以保证资金的安全。 </p>
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
