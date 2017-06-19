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
    <h1 class="mui-title">账户注册</h1>
</header>
<div class="mui-content">
    <div class="mui-card">
        <ul >
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">1、如何注册海吉星金融账户？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>
                            步骤1：登录www.apcgc.com，进入海吉星金融网首页，点击【马上注册】。<br />
                            步骤2：进入注册页面，填写会员基本信息，然后请认真阅读《用户注册协议》和《隐私及免责条例》并点选【同意以下协议并注册】，提交注册信息。<br />
                            步骤3：注册成功，请牢记您的用户名与登录密码。<br />
                            步骤4：点击【登录】，输入用户名与密码，登录。
                        </p>
                    </form>
                </div>
            </li>
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">2、注册成功后哪些资料是必须完善的？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>注册成功并登录，进入会员中心，点选【安全设置】完善个人真实信息，如果资料信息发生变动，请及时修改。如果提供的信息为非真实信息，可能会对业务办理造成不必要的麻烦。</p>
                    </form>
                </div>
            </li>
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">3、为什么要填写真实信息？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>借贷行为是民事行为，实名注册有利于保障会员权益；在会员进行提现操作时，要求会员与银行卡的开户人为同一人，才能进行正常提现，否则提现资金无法到账。在会员进行充值、认购、提现等操作时会有验证码发送到绑定的手机中，正确输入系统发送的验证码，才能进行下一步的操作。验证码的校验是为了确保会员的隐私及资金安全。</p>
                    </form>
                </div>
            </li>
            <li class="mui-table-view-cell mui-collapse">
                <a class="mui-navigate-right" href="#">4、为什么要绑定本人银行卡？</a>
                <div class="mui-collapse-content">
                    <form class="mui-input-group" style="padding: 15px">
                        <p>会员对账户资金进行提现操作时，资金仅能转入会员本人名下的银行账户。当注册人的真实姓名同银行卡的账户户名不同时，银行无法入账，会员将无法进行提现操作。</p>
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
