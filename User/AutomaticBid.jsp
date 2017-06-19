<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    
    

<input id="hidPage" name="hidPage" type="hidden" value="User" />
<input id="hidStatus" name="hidStatus" type="hidden" value="1" />

<header class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
    <h1 class="mui-title">自动投标</h1>
</header>
<div class="mui-content">
    <div class="mui-card">
        <ul class="mui-table-view">
            <li class="mui-table-view-cell">
                <span style="float:left;">自动投标状态</span>
                	<c:if test="${auto.isopen==1 }">
                    <div id="auto" class="mui-switch mui-active">
                        <div class="mui-switch-handle"></div>
                    </div>
                    </c:if>
					<c:if test="${auto.isopen==0 }">
                    <div id="auto" class="mui-switch">
                        <div class="mui-switch-handle"></div>
                    </div>
                    </c:if>
            </li>
        </ul>
    </div> 
    <div class="set-money" onclick="set();">
        <ul>
            <li>
                <label>单笔投资金额</label>
                <span>￥${auto.singlemoney }.00</span>
            </li>

            <li>
                <label>账户保留金额</label>
                <span>￥${auto.reservedmoney }.00</span>
            </li>

            <li>
                余额不足，是否投资
                <c:if test="${auto.notmoneyisinvest==1 }">
                <span>是</span>
				</c:if>
				<c:if test="${auto.notmoneyisinvest==0 }">
                <span>否</span>
				</c:if>
            </li>
        </ul>
    </div>
    <div class="set-type" onclick="set();">
        <div class="interest-rate">
            <span>年化收益</span>
            <ul class="right_r">
                <li>${auto.income }</li>
            </ul>


        </div>


        <div class="interest-rate">
            <span>借款期限</span>
            <ul class="right_r">
                <li>${auto.borrowperiod }</li>
            </ul>

        </div>

    </div>
    <div class="set-type" onclick="set();">

        <div class="interest-rate">
            <span>项目类型</span>
            <ul class="right_r">
                <li>${auto.projecttype }</li>
            </ul>


        </div>

    </div>
    <div class="set-type_01" onclick="set();">
        <ul>
            <li class="mui-table-view-cell">
                <div class="mui-bt">还款方式</div>
                <div class="mui-right-l">
                    <ul>
                        <li>${auto.repayment }</li>
                    </ul>
                </div>

            </li>
        </ul>
    </div>
</div>
<div class="set-ts">
    <h5>温馨提示</h5>
    <p>1. 开启自动投标功能后，不影响手动购买理财产品。</p>
    <p>
        2. 当有新产品上线时，五分钟后进入可自动投标状态，产品紧俏时，
        建议您手动购买。
    </p>
</div>

<script>

    mui('.mui-content .mui-switch').each(function () {
        this.parentNode.querySelector('span').innerText = '自动投标状态：' + (this.classList.contains('mui-active') ? '开启' : '关闭');
        this.addEventListener('toggle', function (event) {
            var btnArray = ['取消', '确定'];
            if (event.detail.isActive) {
                mui.confirm('确定要开启自动投标吗？', '提示', btnArray, function (e) {
                    if (e.index == 1) {
                          $.ajax({
                          	type:'post',
                          	url:'${pageContext.request.contextPath}/updateIsopen.action',
                          	data:{isopen:1},
                          	dataType:'json',
                          	success:function(data){
                          		
                          	},
                          	error:function(){
                          		mui.alert('you request is error','提示',function(){ });
                          	}
                          });
                    } else {
                        window.location.href = '${pageContext.request.contextPath }/AutomaticBid.action'
                    }
                })
            }else {
                mui.confirm('确定要关闭自动投标吗？', '提示', btnArray, function (e) {
                    if (e.index == 1) {
                          $.ajax({
                          	type:'post',
                          	url:'${pageContext.request.contextPath}/updateIsopen.action',
                          	data:{isopen:0},
                          	dataType:'json',
                          	success:function(data){
                          		
                          	},
                          	error:function(){
                          		mui.alert('you request is error','提示',function(){ });
                          	}
                          });
                    } else {
                        window.location.href = '${pageContext.request.contextPath }/AutomaticBid.action'
                    }
                })
            }
            this.parentNode.querySelector('span').innerText = '自动投标状态：' + (event.detail.isActive ? '开启' : '关闭');
        });
    });

    function set() {
    	var auto=$("#auto").attr("class");
    	if(auto=="mui-switch"){
    		window.location.href = '${pageContext.request.contextPath }/AutomaticBidSet.action';
    	}else{
    		mui.alert("请关闭自动投标后、再进行修改", '提示', function () { });
    	}
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
