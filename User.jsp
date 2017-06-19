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
    
    <script>
    function InvestStatic() {
        window.location.href = '/User/InvestStatistics'
    }

    function MyFlowFund() {
        window.location.href = '/User/MyFlowFund';
    }

    function AutomaticBid() {
        window.location.href = '/User/AutomaticBid';
    }

    function myAllGiftVoucher() {
        window.location.href = '/User/myAllGiftVoucher';
    }

    function MyInvest1() {
        window.location.href = '${pageContext.request.contextPath}/MyInvest.action?id=1';
    }

    function MyInvest2() {
        window.location.href = '${pageContext.request.contextPath}/MyInvest.action?id=2';
    }

    function MyInvest3() {
        window.location.href = '${pageContext.request.contextPath}/MyInvest.action?id=3';
    }

    function SecurySet() {
        window.location.href = '/User/SecurySet';
    }
</script>

    

<input id="hidPage" name="hidPage" type="hidden" value="User" />

<header class="mui-bar mui-bar-nav" style="background-color: #fe7701;">
    <div class="top-x" style="float: left;line-height: 44px;">
        <a open-type="common" href="${pageContext.request.contextPath }/SecurySet.action" style="color: #fff;">
            <img src="${pageContext.request.contextPath }/Images/tx.png" style="width: 30px;float: left; margin-top: 7px; margin-right: 12px;">
            ${accountSession.username }  （编号：${accountSession.id }）

        </a>
    </div>
</header>

<div class="data">
    <div class="total_assets">
        <dl>
            <dt>账户总资产</dt>
            <dd>0.00</dd>
        </dl>
    </div>
    <ul>
        <li>
            <dl>
                <dt>待收本金(元)</dt>
                <dd>0.00</dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>冻结金额(元)</dt>
                <dd>0.00</dd>
            </dl>
        </li>
    </ul>
</div>
<div class="balance">
    <ul>
        <li class="mui-table-view-cell">
            可用余额(元)<span style="float: right;color: #333;">0.00</span>
        </li>
    </ul>
</div>
<div class="Recharge-ann">
    <ul>
        <a href="${pageContext.request.contextPath }/UserRecharge.action"><li class="Recharge"> 充值 </li></a>
        <a href="${pageContext.request.contextPath }/Withdrawal.action"><li class="Withdraw" style="color:#ff5400;"> 提现 </li></a>
</ul>
</div>
<div class="item-lb" style="cursor:pointer;">
    <h4>
        我的债权项目
    </h4>
    <dl  onclick="MyInvest1();">
        <dt>0</dt>
        <dd>持有中</dd>
    </dl>
    <dl onclick="MyInvest2();">
        <dt>0</dt>
        <dd>认购中</dd>
    </dl>
    <dl onclick="MyInvest3();">
        <dt>0</dt>
        <dd>已结清</dd>
    </dl>
</div>
<div class="vip-more" style="margin-top: 12px;">
    <ul>
        <li class="mui-table-view-cell">
            <a class="mui-navigate-right" open-type="common" href="${pageContext.request.contextPath }/InvestStatistics.action">
                <img src="Images/ic01.png" style="width: 20px;float: left;  margin-right: 12px;" />
                <span>投资统计</span>
            </a>
        </li>

        <li class="mui-table-view-cell">
            <a class="mui-navigate-right" open-type="common" href="${pageContext.request.contextPath }/MyFlowFund.action">
                <img src="Images/ic02.png" style="width: 20px;float: left;  margin-right: 12px;" />
                <span>资金记录</span>
            </a>
        </li>
    </ul>
</div>
<div class="vip-more" style="margin-top: 12px;">
    <ul>
        <li id="automatic"  class="mui-table-view-cell">
            <%-- <a class="mui-navigate-right" open-type="common" href="${pageContext.request.contextPath }/AutomaticBidSet.action">
                <img src="Images/news_06.png" style="width: 20px; float: left; margin-right: 12px; ">
                自动投标<span class="mui-pull-right update" style="padding-right: 30px;color: #999999;margin-right: -12px;"><span id="automaticBid"></span></span>
            </a> --%>
            <span class="mui-navigate-right" open-type="common">
                <img src="Images/news_06.png" style="width: 20px; float: left; margin-right: 12px; ">
                自动投标<span class="mui-pull-right update" style="padding-right: 30px;color: #999999;margin-right: -12px;"><span id="automaticBid"></span></span>
            </span>
        </li>
    </ul>
</div>
<div class="vip-more" style="margin-top:12px;">
    <ul>
        <li class="mui-table-view-cell">
            <a class="mui-navigate-right" open-type="common" href="${pageContext.request.contextPath }/myAllGiftVoucher.action">
                <img src="Images/ic04.png" style="width: 20px; float: left; margin-right: 12px; ">
                我的礼金券<span class="mui-pull-right update" style="padding-right: 30px;color: #999999;margin-right: -12px;"><b>0</b>张</span>
            </a>
        </li>
    </ul>
</div>
<div class="vip-more" style="margin-top: 12px;">
    <ul>
        <li class="mui-table-view-cell">
            <a class="mui-navigate-right" open-type="common" href="${pageContext.request.contextPath }/SecurySet.action" >
                <img src="Images/news_02.png" style="width: 20px;float: left;   margin-right: 12px;">
                账户管理
            </a>
        </li>
    </ul>
</div>
<div class="vip-more" style="margin-top: 12px;">
    <ul class="copyreader">
        <li class="mui-table-view-cell" style="text-align: center;color: #fe7701;">
            <!--<a href="/Home/Logout">退出登录</a>-->
            <!-- 静态跳转 -->
            <!-- <a href="Invest/Index.html">退出登录</a> -->
            <span onclick="exitLogin()">退出登录</span>
        </li>
    </ul>
</div>


    <div style="margin-bottom:60px;"></div>
    
    <!-- 底部按钮 -->
    <%@include file="/Common/communder.jsp" %>
    
    <script>
        $(document).ready(function () {
            mui('body').on('tap', 'a', function () { document.location.href = this.href; });
            isAutoInvestSet();
        });
        
        function isAutoInvestSet(){
        	$.ajax({
        		type:'get',
        		url:'${pageContext.request.contextPath}/zidongtoubiao.action',
        		dataType:'',
        		success:function(data){
        			if(data == ""){
        				$("#automaticBid").text('未启用');
        				$("#automatic").click(function(){  
        					window.location.href='${pageContext.request.contextPath }/AutomaticBidSet.action';
        				});
        			}else{
						if(data.isopen==0){
							$("#automaticBid").text('已关闭');
							$("#automatic").click(function(){  
	        					window.location.href='${pageContext.request.contextPath }/AutomaticBid.action';
	        				});
						}else if(data.isopen==1){
							$("#automaticBid").text('已开启');
							$("#automatic").click(function(){  
	        					window.location.href='${pageContext.request.contextPath }/AutomaticBid.action';
	        				});
						}			
        			}
        		},
        		error:function(){
        			mui.alert('you request is error!','提示',function(){ });
        		}
        	});
        }

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
        
        function exitLogin(){
        	$.ajax({
        		type:'get',
        		url:'${pageContext.request.contextPath}/exitLogin.action',
        		dataType:'json',
        		success:function(data){
        			window.location.href='${pageContext.request.contextPath}/index.action';
        		},
        		error:function(){
        			mui.alert('you request is error','提示',function(){ });
        		}
        	});
        }
    </script>
</body>
</html>
