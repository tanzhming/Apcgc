<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- 账户管理界面 -->
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


</head>
<body onload="initPieChart();">
    
    
<style>
    html, body {
        background-color: #efeff4;
    }

    .mui-views, .mui-view, .mui-pages, .mui-page, .mui-page-content {
        position: absolute;
        left: 0;
        right: 0;
        top: 0;
        bottom: 0;
        width: 100%;
        height: 100%;
        background-color: #efeff4;
    }

    .mui-pages {
        top: 46px;
        height: auto;
    }


    .mui-page.mui-transitioning {
        -webkit-transition: -webkit-transform 300ms ease;
        transition: transform 300ms ease;
    }

    .mui-page-left {
        -webkit-transform: translate3d(0, 0, 0);
        transform: translate3d(0, 0, 0);
    }

    .mui-ios .mui-page-left {
        -webkit-transform: translate3d(-20%, 0, 0);
        transform: translate3d(-20%, 0, 0);
    }

    .mui-navbar {
        position: fixed;
        right: 0;
        left: 0;
        z-index: 10;
        height: 44px;
        background-color: #fe7701;
    }

        .mui-navbar .mui-bar {
            position: absolute;
            background: transparent;
            text-align: center;
        }

    .mui-android .mui-navbar-inner.mui-navbar-left {
        opacity: 0;
    }

    .mui-ios .mui-navbar-left .mui-left, .mui-ios .mui-navbar-left .mui-center, .mui-ios .mui-navbar-left .mui-right {
        opacity: 0;
    }

    .mui-navbar .mui-btn-nav {
        -webkit-transition: none;
        transition: none;
        -webkit-transition-duration: .0s;
        transition-duration: .0s;
    }

    .mui-navbar .mui-bar .mui-title {
        display: inline-block;
        width: auto;
    }

    .mui-page-shadow {
        position: absolute;
        right: 100%;
        top: 0;
        width: 16px;
        height: 100%;
        z-index: -1;
        content: '';
    }

    .mui-page-shadow {
        background: -webkit-linear-gradient(left, rgba(0, 0, 0, 0) 0, rgba(0, 0, 0, 0) 10%, rgba(0, 0, 0, .01) 50%, rgba(0, 0, 0, .2) 100%);
        background: linear-gradient(to right, rgba(0, 0, 0, 0) 0, rgba(0, 0, 0, 0) 10%, rgba(0, 0, 0, .01) 50%, rgba(0, 0, 0, .2) 100%);
    }

    .mui-navbar-inner.mui-transitioning, .mui-navbar-inner .mui-transitioning {
        -webkit-transition: opacity 300ms ease, -webkit-transform 300ms ease;
        transition: opacity 300ms ease, transform 300ms ease;
    }

    .mui-page {
        display: none;
    }

    .mui-pages .mui-page {
        display: block;
    }

    .mui-page .mui-table-view:first-child {
        margin-top: 15px;
    }

    .mui-page .mui-table-view:last-child {
        margin-bottom: 30px;
    }

    .mui-table-view {
        margin-top: 20px;
    }

    .mui-table-view-cell a input {
        border: none;
        margin: 0;
        padding: 0;
        width: 75%;
        text-align: center;
    }

    .mui-table-view span.mui-pull-right {
        color: #999;
    }

    .mui-table-view-divider {
        background-color: #efeff4;
        font-size: 14px;
    }

        .mui-table-view-divider:before,
        .mui-table-view-divider:after {
            height: 0;
        }

    .head {
        height: 40px;
    }

    #head {
        line-height: 40px;
    }

    .head-img {
        width: 40px;
        height: 40px;
    }

    #head-img1 {
        position: absolute;
        bottom: 10px;
        right: 40px;
        width: 40px;
        height: 40px;
    }

    .update {
        font-style: normal;
        color: #999999;
        margin-right: -25px;
        font-size: 15px;
    }

    .mui-fullscreen {
        position: fixed;
        z-index: 20;
        background-color: #000;
    }

    .mui-ios .mui-navbar .mui-bar .mui-title {
        position: static;
    }

    .verification {
        margin-top: 15px;
        border-bottom: 1px solid #E5E5E5;
        height: 44px;
        border-top: 1px solid #E5E5E5;
        line-height: 44px;
        padding: 0 12px;
    }

        .verification input {
            width: 65%;
            float: left;
            text-align: center;
            height: 40px;
            border: none;
        }

        .verification span {
            width: 35%;
            text-align: center;
            float: left;
        }

            .verification span input {
                width: 100%;
                text-align: center;
                height: 40px;
                border: none;
            }
</style>

<script type="text/javascript">
    var timer = 120;

    function getmsgcode() {
        var mobile = $("#hidMobile").val();
        if (mobile.length == 11) {
            timer = 120;
            setSmsButton();
            $.ajax({
                type: "POST",
                url: "/Common/Ajax/AjaxGet.ashx?Action=SmsProxy&ActionType=SM&Mobile=" + mobile,
                success: function (msg) {
                    if (msg == "1") {
                        mui.alert("验证码已发送至手机" + mobile, '提示信息', function () { });
                        $("#tbYzm").focus();
                    }
                    else {
                        mui.alert(msg, '提示信息', function () { });
                        $("#tbYzm").focus();
                    }
                }
            });
        }
        else {
            mui.alert("手机号码填写错误", '提示', function () { });
        }
        return false;
    }

    function setSmsButton() {
        $("#msgCode").val(timer + "秒后重新获取");
        timer--;
        if (timer < 0) {
            $("#msgCode").val("获取动态密码");
            $("#msgCode").focus();
        }
        else {
            $("#msgCode").attr("disabled", true);
            setTimeout("setSmsButton()", 1000);
        }
    }

    function GetArea() {
        $("#ddlArea").empty();
        var opt = "<option>加载...</option>";
        $("#ddlArea").append(opt);
        $.post('/User/GetAreaByProv', { ProvId: $('#ddlProv option:selected').val() },
              function (data) {
                  $("#ddlArea").empty();
                  var str = "";
                  $.each(data, function (i, itemvalue) {
                      str += "<option value='" + itemvalue.Value + "'>" + itemvalue.Text + "</option>";
                  });
                  $("#ddlArea").append(str);
              }, "json");
    }

    function submit() {
        var tag = true;
        var txtuname = $("#txtUserName");
        var txtucard = $("#txtIdentyCard");
        var uname, ucard;
        if (txtuname.length > 0) {
            uname = txtuname.val();
            if (uname == "") {
                mui.alert("请输入真实姓名", '提示', function () { });
                return false;
            }
        }

        if (txtucard.length > 0) {
            ucard = txtucard.val();
            if (ucard == "") {
                mui.alert("请输入身份证号", '提示', function () { });
                return false;
            }
        }

        var bank = $('#ddlBank option:selected').val();
        var prov = $('#ddlProv option:selected').val();
        var area = $('#ddlArea option:selected').val();
        var account = $("#txtAccountNo").val();
        var branch = $("#txtBranchName").val();
        var amt = "0.01";

        if (bank == "") {
            mui.alert("请选择开户银行", '提示', function () { });
            return false;
        }
        else
            $("#tip_ddlBank").html("");

        if (account == "") {
            mui.alert("请输入银行账号", '提示', function () { });
            return false;
        }
        else
            $("#tip_txtAccountNo").html("");

        if (prov == "") {
            mui.alert("请选择开户地", '提示', function () { });
            return false;
        }
        else
            $("#tip_ddlProv").html("");

        if (area == "") {
            mui.alert("请选择开户地", '提示', function () { });
            return false;
        }
        else
            $("#tip_ddlProv").html("");

        if (branch == "") {
            mui.alert("请输入支行名称", '提示', function () { });
            return false;
        }
        else
            $("#tip_txtBranchName").html("");

        window.location.href = '/User/SetIdentifyMiddle?bank=' + encodeURI(bank) + '&prov='
            + encodeURI(prov) + '&area=' + encodeURI(area) + "&account=" + encodeURI(account) + '&branch=' + encodeURI(branch)
            + '&uname=' + encodeURI(uname) + '&ucard=' + encodeURI(ucard) + '&amt=' + encodeURI(amt);
    }
</script>

<input id="hidPage" name="hidPage" type="hidden" value="User" />

<input id="hidMobile" name="hidMobile" type="hidden" value="" />
<body class="mui-fullscreen" style="background:#ccc;">
<div id="mybody">
    <div id="app" class="mui-views">
        <div class="mui-view">
            <div class="mui-navbar">
            </div>
            <div class="mui-pages">
            </div>
        </div>
    </div>
    <div id="setting" class="mui-page">
        <!--页面标题栏开始-->
        <div class="mui-navbar-inner mui-bar mui-bar-nav">
            <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
                <span class="mui-icon mui-icon-left-nav"></span>
            </button>
            <h1 class="mui-center mui-title">账户管理</h1>
        </div>
        <!--页面标题栏结束-->
        <!--页面主内容区开始-->
        <div class="mui-page-content">
            <div class="mui-scroll-wrapper">
                <div class="user">
                    <ul>
                        <li class="mui-table-view-cell ">
                            <a class="mui-navigate-right" href="#">
                                <img class="mui-media-object mui-pull-left head-img" src="${pageContext.request.contextPath }/Images/tx.png">
                                <div class="mui-media-body">
                                    
                                    <p class='mui-ellipsis'> 编号：${accountSession.id }</p>

                                </div>

                            </a>
                        </li>
                    </ul>
                    <ul class="copyreader">
                            <li class="mui-table-view-cell">
                                <a href="${pageContext.request.contextPath }/SetMobileSecond.action" class="mui-navigate-right">手机号码<i class="mui-pull-right update">未设置</i></a>
                            </li>
                    </ul>
                    <ul class="copyreader">
                        <li class="mui-table-view-cell">
                            <a class="mui-navigate-right" href="#notifications">邀请好友<i class="mui-pull-right update"></i></a>
                        </li>
                    </ul>
                    <ul class="copyreader">
                            <li class="mui-table-view-cell">
                                <a href="#SetIdentify" class="mui-navigate-right">实名认证<i class="mui-pull-right update">  </i></a>
                            </li>
                                                    <li class="mui-table-view-cell">
                                <a href="#SetIdentify" class="mui-navigate-right">银行卡号<i class="mui-pull-right update">未绑定银行卡</i></a>
                            </li>
                                                    <li class="mui-table-view-cell">
                                <a href="#setEmail" class="mui-navigate-right">绑定邮箱<i class="mui-pull-right update">未设置</i></a>
                            </li>

                    </ul>
                    <ul class="copyreader">
                        <li class="mui-table-view-cell">
                            <a href="#changePsw" class="mui-navigate-right">重设登陆密码</a>
                        </li>
                    </ul>
                    <ul class="copyreader">
                        <li class="mui-table-view-cell" style="text-align: center;color: #fe7701;">
                            <!--<a href="/Home/Logout">退出登录</a>-->
                            <!-- 静态跳转 -->
                            <!-- <a href="../Invest/Index.html">退出登录</a> -->
                            <span onclick="exitLogin()">退出登录</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--页面主内容区结束-->
    </div>
    
    <div id="account" class="mui-page">
        <div class="mui-navbar-inner mui-bar mui-bar-nav">
            <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
                <span class="mui-icon mui-icon-left-nav"></span>账户管理
            </button>
            <h1 class="mui-center mui-title">修改绑定手机</h1>
        </div>
        <div class="mui-page-content">
            <div class="mui-scroll-wrapper" style="   background-color:#fff;">
                <p style="padding:5px; ">
                    若手机号码已不用/丢失，无法收到验证码，请联系客服 400-880-0061转7
                </p>
                <div class="mui-scroll">
                    <ul class="mui-table-view">

                        <li class="mui-table-view-cell" style="margin-left:5px;">
                            手机号码：
                               
                           
                        </li>

                    </ul>
                    <div class="verification">
                        <input id="tbYzm" placeholder="请输入验证码" />
                        <span>
                            <input id="msgCode" type="button" value="获取验证码" onclick="getmsgcode()" style="color: #007AFF; border-left: 1px solid #e5e5e5; " />
                        </span>
                    </div>
                    <div class="mui-content" style="margin-top: 5px;">
                        <div class="mui-content-padded">
                            <button type="button" class="mui-btn mui-btn-primary mui-btn-block" onclick="setMobile()">下一步</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="notifications" class="mui-page" style="margin-bottom:60px;">
        <div class="mui-navbar-inner mui-bar mui-bar-nav">
            <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
                <span class="mui-icon mui-icon-left-nav"></span>
            </button>
            <h1 class="mui-center mui-title">我的二维码</h1>
        </div>
        <div class="mui-page-content">
            <div class="mui-scroll-wrapper">
                <div class="mui-scroll">
                    <ul style="margin: 20px 12px;">
                        <li>1、请好友直接扫描您的专属二维码。</li>
                        <li style="text-align: center;margin: 20px;"><img src="${pageContext.request.contextPath }/Images/Links/jianruoning.png" width="38%"></li>
                        <li>2、好友注册时填写您的会员编号(<span style="color:red;font-weight:bold;">${accountSession.id }</span>)</li>
                    </ul>
                    
                    <div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="SetIdentify" class="mui-page">
        <div class="mui-navbar-inner mui-bar mui-bar-nav">
            <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
                <span class="mui-icon mui-icon-left-nav"></span>
            </button>
            <h1 class="mui-center mui-title">银行信息实名认证</h1>
        </div>
        <div class="mui-page-content">
            <div class="mui-scroll-wrapper" style="   background-color:#fff;">
                <div class="mui-scroll">

                    <p style="padding:5px;">身份信息绑定后不可修改,请填写您的真实信息</p>


                    <ul class="mui-table-view" style="margin-top:0;">
                        <li class="mui-table-view-cell" style="padding: 0 12px; border-bottom: 1px solid #e5e5e5;">
                            <div class="mui-input-row">
                                <label>真实姓名：</label>
<input id="txtUserName" name="txtUserName" type="text" value="" />                            </div>
                        </li>
                        <li class="mui-table-view-cell" style="padding: 0 12px; border-bottom: 1px solid #e5e5e5;">
                            <div class="mui-input-row">
                                <label>身份证号：</label>
<input id="txtIdentyCard" name="txtIdentyCard" type="text" value="" />                            </div>
                        </li>
                    </ul>

                    <ul class="mui-table-view" style="margin-top:0;">
                        <li class="mui-table-view-cell" style="padding: 0 12px; border-bottom: 1px solid #e5e5e5; ">
                            <div class="mui-input-row">
                                <label>开户银行：</label>
                                <select id="ddlBank" name="ddlBank"><option value="">请选择...</option>
<option value="01020000">工商银行</option>
<option value="01030000">农业银行</option>
<option value="01040000">中国银行</option>
<option value="01050000">建设银行</option>
<option value="03010000">交通银行</option>
<option value="03020000">中信银行</option>
<option value="03030000">光大银行</option>
<option value="03050000">民生银行</option>
<option value="03060000">广发银行</option>
<option value="03080000">招商银行</option>
<option value="03090000">兴业银行</option>
<option value="03134402">平安银行</option>
<option value="04030000">邮政储蓄银行</option>
</select>
                            </div>

                        </li>
                        <li class="mui-table-view-cell" style="padding: 0 12px; border-bottom: 1px solid #e5e5e5; ">
                            <div class="mui-input-row">
                                <label>银行卡号：</label>
                                <input id="txtAccountNo" name="txtAccountNo" type="text" value="" />
                            </div>

                        </li>

                        <li class="mui-table-view-cell" style="padding: 0 12px; border-bottom: 1px solid #e5e5e5; ">
                            <div class="mui-input-row">
                                <label>开户地：</label>
                                <select id="ddlProv" name="ddlProv" onchange="GetArea();" style="width:90px; float:left;"><option value="">请选择...</option>
<option value="0011">北京</option>
<option value="0012">天津</option>
<option value="0013">河北</option>
<option value="0014">山西</option>
<option value="0015">内蒙古</option>
<option value="0021">辽宁</option>
<option value="0022">吉林</option>
<option value="0023">黑龙江</option>
<option value="0031">上海</option>
<option value="0032">江苏</option>
<option value="0033">浙江</option>
<option value="0034">安徽</option>
<option value="0035">福建</option>
<option value="0036">江西</option>
<option value="0037">山东</option>
<option value="0041">河南</option>
<option value="0042">湖北</option>
<option value="0043">湖南</option>
<option value="0044">广东</option>
<option value="0045">广西</option>
<option value="0046">海南</option>
<option value="0050">重庆</option>
<option value="0051">四川</option>
<option value="0052">贵州</option>
<option value="0053">云南</option>
<option value="0054">西藏</option>
<option value="0061">陕西</option>
<option value="0062">甘肃</option>
<option value="0063">青海</option>
<option value="0064">宁夏</option>
<option value="0065">新疆</option>
</select>
                                <select id="ddlArea" name="ddlArea" style="width:90px; float:left; margin-left:10px;"><option value="">请选择...</option>
</select>
                            </div>
                        </li>
                        <li class="mui-table-view-cell" style="padding: 0 12px; border-bottom: 1px solid #e5e5e5; ">
                            <div class="mui-input-row">
                                <label>支行名称：</label>
                                <input id="txtBranchName" name="txtBranchName" type="text" value="" />
                            </div>
                        </li>
                    </ul>

                    <p style="padding:5px;color:red;">注：银行卡绑定后将成为账户提现和还款的唯一用卡，且不可修改</p>

                    <div class="mui-content">
                        <div class="mui-content-padded">
                            <button type="button" class="mui-btn mui-btn-primary mui-btn-block" onclick="submit()">提交</button>
                        </div>
                    </div>
                    <div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="setEmail" class="mui-page">
        <div class="mui-navbar-inner mui-bar mui-bar-nav">
            <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
                <span class="mui-icon mui-icon-left-nav"></span>
            </button>
            <h1 class="mui-center mui-title">绑定邮箱设置</h1>
        </div>
        <div class="mui-page-content">
            <div class="mui-scroll-wrapper" style="   background-color:#fff;">
                <div class="mui-scroll">
                    <ul class="mui-table-view">
                        <li class="mui-table-view-cell" style="padding: 0 12px; border-bottom: 1px solid #e5e5e5;">
                            <div class="mui-input-row">
                                <label>常用邮箱：</label>
                                <input id="txtEmail" placeholder="请输入常用邮箱" type="text" style="vertical-align:central;padding-top:10px;" />
                            </div>

                        </li>
                        <li class="mui-table-view-cell" style="padding: 0 12px;">
                            <div class="mui-input-row">
                                <label>账号密码：</label>
                                <input id="txtPassword" type="password" placeholder="请输入账号密码" style="vertical-align:central;" />
                            </div>

                        </li>
                    </ul>
                    <div class="mui-content">
                        <div class="mui-content-padded">
                            <button type="button" class="mui-btn mui-btn-primary mui-btn-block" onclick="setEmailsubmit()">提交</button>
                        </div>
                    </div>
                    <div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="changePsw" class="mui-page">
        <div class="mui-navbar-inner mui-bar mui-bar-nav">
            <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
                <span class="mui-icon mui-icon-left-nav"></span>
            </button>
            <h1 class="mui-center mui-title">重设登陆密码</h1>
        </div>
        <div class="mui-page-content">
            <div class="mui-scroll-wrapper" style="   background-color:#fff;">
                <div class="mui-scroll">
                    <ul class="mui-table-view">
                        <li class="mui-table-view-cell" style="padding: 0 12px; border-bottom: 1px solid #e5e5e5;">
                            <div class="mui-input-row">
                                <label>旧密码：</label>
                                <input id="tPassword" type="password" placeholder="请输入账号密码" style="vertical-align:central;padding-top:10px;" />
                            </div>

                        </li>
                        <li class="mui-table-view-cell" style="padding: 0 12px; border-bottom: 1px solid #e5e5e5; ">
                            <div class="mui-input-row">
                                <label>新密码：</label>
                                <input id="txtNewPassword" type="password" placeholder="请输入新密码" style="vertical-align:central;" />
                            </div>

                        </li>
                        <li class="mui-table-view-cell" style="padding: 0 12px; ">
                            <div class="mui-input-row">
                                <label>重复新密码：</label>
                                <input id="txtSecPassword" type="password" placeholder="请输入重复新密码" style="vertical-align:central;" />
                            </div>

                        </li>
                    </ul>
                    <div class="mui-content">
                        <div class="mui-content-padded">
                            <button type="button" class="mui-btn mui-btn-primary mui-btn-block" onclick="changePswSubmit()">提交</button>
                        </div>
                    </div>
                    <div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script src="${pageContext.request.contextPath }/Scripts/mui.view.js"></script>
<%-- <script src="${pageContext.request.contextPath }/Scripts/feedback.js"></script> --%>
<script>
    mui.init();
    //初始化单页view
    var viewApi = mui('#app').view({
        defaultPage: '#setting'
    });
    //初始化单页的区域滚动
    mui('.mui-scroll-wrapper').scroll();


    var view = viewApi.view;
    (function ($) {
        //处理view的后退与webview后退
        var oldBack = $.back;
        $.back = function () {
            if (viewApi.canBack()) { //如果view可以后退，则执行view的后退
                viewApi.back();
            } else { //执行webview后退
                oldBack();
            }
        };
        view.addEventListener('pageBeforeShow', function (e) { });
        view.addEventListener('pageShow', function (e) { });
        view.addEventListener('pageBeforeBack', function (e) { });
        view.addEventListener('pageBack', function (e) { });
    })(mui);

    if (mui.os.stream) {
        document.getElementById("check_update").display = "none";
    }

 

    function setMobile() {
        var mobile = '';
        if ($("#hidMobile").val() == '') {
            mobile = $("#txtMobile").val();
        }
        else {
            mobile = $("#hidMobile").val();
        }
        var code = $("#tbYzm").val();
        if (code == "") { mui.alert("请输入验证码", '提示', function () { }); return false; }
        else { if (code.length != 6) { mui.alert("请输入正确的验证码", '提示', function () { }); return false; } }
        $.post('/User/SetMobileSubmit', { vcode: code }, function (data) {
            if (data.success) {
                window.location.href = '/User/SetMobileSecond'
            }
            else {
                mui.alert(data.result, '提示', function () { });
            }
        }, "json");
    }

    function setEmailsubmit() {
        var email = $("#txtEmail").val();
        var psd = $("#txtPassword").val();
        if (email == "") { mui.alert("请输入常用邮箱", '提示', function () { }); return false; }
        if (psd == "") { mui.alert("请输入账号密码", '提示', function () { }); return false; }
        $.post('/User/setEmailsubmit', { email: email, password: psd }, function (data) {
            if (data.success) {
                window.location.href = '/User/RegistSuccess/7'
            }
            else {
                mui.alert(data.result, '提示', function () { });
            }
        }, "json");
    }

    function changePswSubmit() {
        var password = $("#tPassword").val();
        var newpsd = $("#txtNewPassword").val();
        var secpsd = $("#txtSecPassword").val();
        if (password == "") { mui.alert("请输入账号密码", '提示', function () { }); return false; }
        if (newpsd == "") { mui.alert("请输入新密码", '提示', function () { }); return false; }
        if (secpsd == "") { mui.alert("请输入重复新密码", '提示', function () { }); return false; }
        if (newpsd != secpsd) { mui.alert("两次输入的密码不一致", '提示', function () { }); return false; }
        /* $.post('/User/changePswSubmit', { NewPassword: newpsd, password: password }, function (data) {
            if (data.success) {
                window.location.href = '/User/ChangePassSuccess/0'
            }
            else {
                mui.alert(data.result, '提示', function () { });
            }
        }, "json"); */
        $.ajax({
        	type:'post',
        	data:{password:password,newpsd:newpsd},
        	dataType:'json',
        	url:'${pageContext.request.contextPath}/ChangePassSuccess.action',  // 修改密码
        	success:function(data){
        		if(data.result=='success'){
        			$("#mybody").children().remove();
        			$("body").removeAttr("style");
        			$("body").removeAttr("class");
        			/* window.location.href='${pageContext.request.contextPath}/user.action'; */
        			var content='<header class="mui-bar mui-bar-nav">'+
							    '<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>'+
							    '<h1 class="mui-title">密码修改结果</h1>'+
							'</header>'+
							'<div class="mui-content">'+
							        '<div id="slider" class="mui-slider">'+
							            '<dl style="margin: 40px;line-height: 30px; text-align: center;">'+
							                '<dt></dt>'+
							                '<dd>密码修改成功</dd>'+
							            '</dl>'+
							            '<div class=" bank_ann"><a href="${pageContext.request.contextPath}/user.action">返回会员中心</a></div>'+
							        '</div>'+
							        '<nav id="nav1" class="mui-bar1 mui-bar-tab" style="background-color: rgb(247, 247, 247); z-index: 99;">'+
								        '<a href="${pageContext.request.contextPath }/home.action"   id="defaultTab" class="mui-tab-item">'+
								            '<span class="mui-icon mui-icon-home"></span>'+
								            '<span class="mui-tab-label">首页</span>'+
								        '</a>'+
								        '<a href="${pageContext.request.contextPath }/index.action"  id="listTab" class="mui-tab-item">'+
								            '<span class="mui-icon mui-icon-list" onclick="list()"></span>'+
								            '<span class="mui-tab-label" onclick="list()">投资列表</span>'+
								        '</a>'+
								        '<a href="${pageContext.request.contextPath }/user.action" id="userTab" class="mui-tab-item mui-active">'+
								            '<span class="mui-icon mui-icon-contact"></span>'+
								            '<span class="mui-tab-label">会员中心</span>'+
								        '</a>'+
								        '<a href="${pageContext.request.contextPath }/more.action"   id="moreTab" class="mui-tab-item">'+
								            '<span class="mui-icon mui-icon-more-filled"></span>'+
								            '<span class="mui-tab-label">更多</span>'+
								        '</a>'+
								    '</nav>';
					$("#mybody").html(content);
        		}else{
        			mui.alert(data.result,'提示',function(){ });
        		}
        	},
			error:function(){
				alert('you request is error');
			}        	
        });
    }


</script>


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
