<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    
    <script type="text/javascript">

        function AboutPlatform() {
            window.location.href = '/Home/AboutPlatform'
        }

        function FinancialSecurity() {
            window.location.href = '/Home/FinancialSecurity'
        }

        function AccountRegist() {
            window.location.href = '/Home/AccountRegist';
        }

        function UserAccount()
        {
            window.location.href = '/Home/UserAccount';
        }
    </script>

    

<input id="hidPage" name="hidPage" type="hidden" value="More" />
 
        <!--页面标题栏开始-->
        <div class="mui-navbar-inner mui-bar mui-bar-nav">
            <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
                <span class="mui-icon mui-icon-left-nav"></span>
            </button>
            <h1 class="mui-center mui-title">帮助中心</h1>
        </div>
        <!--页面标题栏结束-->
        <!--页面主内容区开始-->

   <div class="mui-content">
       <div class="platform">
           <div class="platform-safeguard">
               <dl>
                   <dt><img src="${pageContext.request.contextPath }/Images/help_01.png" style="width: 24px;float: left; margin-right: 12px;"></dt>
                   <dd>平台保障</dd>
               </dl>
           </div>
           <div class="platform-lb">
               <ul>
                   <li class="mui-table-view-cell">
                       <a href="${pageContext.request.contextPath }/AboutPlatform.action" class="mui-navigate-right" onclick="AboutPlatform()">关于平台</a>
                   </li>
                   <li class="mui-table-view-cell">
                       <a href="${pageContext.request.contextPath }/FinancialSecurity.action" class="mui-navigate-right" onclick="FinancialSecurity()">资金保障</a>
                   </li>
               </ul>
           </div>
       </div>
       <div class="platform">
           <div class="platform-safeguard">
               <dl>
                   <dt><img src="${pageContext.request.contextPath }/Images/help_02.png" style="width: 24px;float: left; margin-right: 12px;"></dt>
                   <dd>账户说明</dd>
               </dl>
           </div>
           <div class="platform-lb">
               <ul>
                   <li class="mui-table-view-cell">
                       <a href="${pageContext.request.contextPath }/AccountRegist.action" class="mui-navigate-right" onclick="AccountRegist()">账户注册</a>
                   </li>
                   <li class="mui-table-view-cell">
                       <a href="${pageContext.request.contextPath }/UserAccount.action" class="mui-navigate-right" onclick="UserAccount()">我的账户</a>
                   </li>
                   <li class="mui-table-view-cell">
                       <a href="${pageContext.request.contextPath }/AccountSafe.action" class="mui-navigate-right"  >账户安全</a>
                   </li>
               </ul>
           </div>
       </div>
       <div class="platform">
           <div class="platform-safeguard">
               <dl>
                   <dt><img src="${pageContext.request.contextPath }/Images/ic02.png" style="width: 24px;float: left; margin-right: 12px;"></dt>
                   <dd>充值提现</dd>
               </dl>
           </div>
           <div class="platform-lb">
               <ul>
                   <li class="mui-table-view-cell">
                       <a href="${pageContext.request.contextPath }/AboutRecharge.action" class="mui-navigate-right">关于充值</a>
                   </li>
                   <li class="mui-table-view-cell">
                       <a href="${pageContext.request.contextPath }/AboutWithdrawal.action" class="mui-navigate-right">关于提现</a>
                   </li> 
               </ul>
           </div>
       </div>
       <div class="platform">
           <div class="platform-safeguard">
               <dl>
                   <dt><img src="${pageContext.request.contextPath }/Images/ic01.png" style="width: 24px;float: left; margin-right: 12px;"></dt>
                   <dd>投资帮助</dd>
               </dl>
           </div>
           <div class="platform-lb">
               <ul>
                   <li class="mui-table-view-cell">
                       <a href="${pageContext.request.contextPath }/AboutInvest.action" class="mui-navigate-right">产品认购</a>
                   </li>
                   <li class="mui-table-view-cell">
                       <a href="${pageContext.request.contextPath }/AboutInvest2.action" class="mui-navigate-right">撮合起息</a>
                   </li>
                   <li class="mui-table-view-cell">
                       <a href="${pageContext.request.contextPath }/AboutInvest3.action" class="mui-navigate-right">回收本息</a>
                   </li>
               </ul>
           </div>
       </div>
       <div class="platform">
           <div class="platform-safeguard">
               <dl>
                   <dt><img src="${pageContext.request.contextPath }/Images/ic01.png" style="width: 24px;float: left; margin-right: 12px;"></dt>
                   <dd>债权转让</dd>
               </dl>
           </div>
           <div class="platform-lb">
               <ul>
                   <li class="mui-table-view-cell">
                       <a href="${pageContext.request.contextPath }/AboutZQ.action" class="mui-navigate-right">债权转出</a>
                   </li>
                   <li class="mui-table-view-cell">
                       <a href="${pageContext.request.contextPath }/AboutZQ2.action" class="mui-navigate-right">债权转入</a>
                   </li>
               </ul>
           </div>
       </div>
                
           

        <!--页面主内容区结束-->
 


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
