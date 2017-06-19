<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- 自动投标 -->
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
    .total {
        -webkit-user-select: text;
        text-align: right;
        float: right;
        padding: 0 1em;
        border: 0px;
        border-radius: 0;
        font-size: 16px;
        line-height: 42px;
        width: 50%;
        outline: none;
    }
</style>
<link href="${pageContext.request.contextPath }/Content/mui.picker.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/Content/mui.poppicker.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath }/Scripts/mui.picker.min.js"></script>
<script type="text/javascript">
    function submitOrder() {
        var total = $("#total").val();
        if (total == "") { mui.alert("请输入单笔投资金额", '提示', function () { }); return false; }
        if (isNaN(total)) { mui.alert("单笔投资金额必须为有效数字", '提示', function () { }); return false; }
        if (total % 100 != 0) { mui.alert("单笔投资金额必须为有效数字且为100的整数倍", '提示', function () { }); return false; }
        if (parseFloat(total) > 200000 || parseFloat(total) < 100) { mui.alert("单笔最大充值金额最小100，最高20万", '提示', function () { }); return false; }

        var c = $("#tbKYAmount").val();
        if (c == "") { mui.alert("请填写账户保留可用余额", '提示', function () { }); return false; }
        if (isNaN(c)) { mui.alert("账户保留可用余额必须为有效数字", '提示', function () { }); return false; }

        var d = "0";
        mui('.set-money .mui-switch').each(function () {
            d = this.classList.contains('mui-active') ? '0' : '1';
        });

        var ee = $("#hidRate").val();
        if (ee == "") { mui.alert("请选择年化收益", '提示', function () { }); return false; }

        var f = $("#hidTerm").val();
        if (f == "") { mui.alert("请选择借款期限", '提示', function () { }); return false; }

        var g1 = $("#hidType1").val();
        var g2 = $("#hidType2").val();
        var g = g1 + "," + g2;
        if (g1 == "" && g2 == "") { mui.alert("请选择项目类型", '提示', function () { }); return false; }

        var h1 = $("#hidRepay1").val();
        var h2 = $("#hidRepay2").val();
        var h3 = $("#hidRepay3").val();
        var h4 = $("#hidRepay4").val();
        var h5 = $("#hidRepay5").val();
        var h6 = $("#hidRepay6").val();
        var h7 = $("#hidRepay7").val();
        var h = h1 + "," + h2 + "," + h3 + "," + h4 + "," + h5 + "," + h6 + "," + h7;
        if (h1 == "" && h2 == "" && h3 == "" && h4 == "" && h5 == "" && h6 == "" && h7 == "") { mui.alert("请选择还款方式", '提示', function () { }); return false; }

        var btnArray = ['取消', '确定'];
        mui.confirm('确定要开启自动投标吗？', '提示', btnArray, function (e) {
            if (e.index == 1) {
               /*  $.post('/User/AutomaticBidSetSubmit', { Amount: total, KYAmount: c, IsContinue: d, LoanRate: ee, LoanTerm: f, LoanType: g, RepayMent: h },
                  function (data) {
                      if (data.success) {
                          mui.alert("已开启自动投标", '提示', function () { });
                          window.location.href = '/User/AutomaticBid'
                      }
                      else {
                          mui.alert(data.result, '提示', function () { });
                      }
                  }, "json"); */
                  
                  var yuebuzu=$("#yuebuzu").attr("class");
                  var notmoneyisinvest="";
                  var projectType="";  // 项目类型
                  var repayment="";    // 还款方式
                  if(yuebuzu=="mui-switch"){  // 余额不足按钮状态 OFF
                  	notmoneyisinvest=0;
                  }else{  // 余额不足按钮状态 ON
                  	notmoneyisinvest=1;
                  }
                  var income=$("#rateR").text();  //年化收益
                  var borrowperiod=$("#termR").text();  //借款期限
                  if ($("#AXZ").attr('checked')) {
				    projectType+=" "+$("#AXZ").val();
				  }
				  if ($("#JKD").attr('checked')) {
				    projectType+=" "+$("#JKD").val();
				  }
				  
				  if($("#first").attr('checked')){
				  	repayment+=" "+$("#first").val();
				  }
				  if($("#second").attr('checked')){
				  	repayment+=" "+$("#second").val();
				  }
				  if($("#third").attr('checked')){
				  	repayment+=" "+$("#third").val();
				  }
				  if($("#fourth").attr('checked')){
				  	repayment+=" "+$("#fourth").val();
				  }
				  if($("#fifth").attr('checked')){
				  	repayment+=" "+$("#fifth").val();
				  }
				  if($("#sixth").attr('checked')){
				  	repayment+=" "+$("#sixth").val();
				  }
				  if($("#seventh").attr('checked')){
				  	repayment+=" "+$("#seventh").val();
				  }
                  $.ajax({
                  	type:'post',
                  	url:'${pageContext.request.contextPath}/AutoBiddingSet.action',
                  	data:{singlemoney:total,reservedmoney:c,notmoneyisinvest:notmoneyisinvest,income:income,borrowperiod:borrowperiod,projecttype:projectType,repayment:repayment},
                  	dataType:'json',
                  	success:function(data){
                  		//mui.alert(data,"提示",function(){});
                  		window.location.href='${pageContext.request.contextPath}/AutomaticBid.action';
                  	},
                  	error:function(){
                  		mui.alert('you request is error!','提示',function(){ })
                  	}
                  });
            } else {
            	mui.alert('取消');
                //window.location.href = '/User/AutomaticBid'
            }
        })
    }
</script>

<input id="hidPage" name="hidPage" type="hidden" value="User" />
<input id="hidRate" name="hidRate" type="hidden" value="" />
<input id="hidTerm" name="hidTerm" type="hidden" value="" />
<input id="hidType1" name="hidType1" type="hidden" value="" />
<input id="hidType2" name="hidType2" type="hidden" value="" />
<input id="hidRepay1" name="hidRepay1" type="hidden" value="" />
<input id="hidRepay2" name="hidRepay2" type="hidden" value="" />
<input id="hidRepay3" name="hidRepay3" type="hidden" value="" />
<input id="hidRepay4" name="hidRepay4" type="hidden" value="" />
<input id="hidRepay5" name="hidRepay5" type="hidden" value="" />
<input id="hidRepay6" name="hidRepay6" type="hidden" value="" />
<input id="hidRepay7" name="hidRepay7" type="hidden" value="" />

<header class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
    <h1 class="mui-title">自动投标设置</h1>
</header>
<div class="set-money" style="margin-top:64px;">
    <ul>
        <li>
            <label>单笔投资金额</label>
            <input id="total" placeholder="最小100，最高20万" style="text-align:right;padding: 0;" class="total" />
        </li>
        <li>
            <label>账户保留金额</label>
            <input id="tbKYAmount" placeholder="请输入保留金额" style="text-align:right;padding: 0;" class="total" />
        </li>

        <li class="mui-table-view-cell" style="line-height: 44px;padding: 0; margin: 0 auto;">
            余额不足，是否投资
            <div id="yuebuzu" class="mui-switch mui-active" style=" line-height: 20px;right: 0;">
                <div class="mui-switch-handle"></div>
            </div>
        </li>
    </ul>
</div>
<div class="money_sr">
    <ul>
        <li id="rate" class="mui-table-view-cell ">
            <div class="mui-navigate-right" open-type="common" href="#">
                年化收益
                <span id="rateR" class="mui-pull-right" style="padding-right: 30px;color: #007AFF;">
                    选择
                </span>

            </div>
        </li>
        <li id="term" class="mui-table-view-cell">
            <div class="mui-navigate-right" open-type="common" href="#">
                借款期限<span id="termR" class="mui-pull-right update" style="padding-right: 30px;color: #007AFF;">
                    选择
                </span>
            </div>
        </li>
    </ul>
</div>
<div class="money_sr">
    <ul>
        <li id="type" class="mui-table-view-cell mui-collapse">
            <a class="mui-navigate-right" href="#">项目类型</a>
            <div class="mui-collapse-content">
                <div class="mui-card">
                    <form id="typeForm" class="mui-input-group">
                        <div class="mui-input-row mui-checkbox">
                            <label>健康贷</label>
                            <input id="JKD" name="checkbox" value="健康贷" type="checkbox">
                        </div>
                        <div class="mui-input-row mui-checkbox   ">
                            <label>安心债</label>
                            <input id="AXZ" name="checkbox" value="安心债" type="checkbox">
                        </div>
                    </form>
                </div>
            </div>
        </li>
    </ul>
</div>
<div class="money_sr">
    <ul>
        <li id="repay" class="mui-table-view-cell mui-collapse">

            <a class="mui-navigate-right" href="#">还款方式</a>
            <div class="mui-collapse-content">
                <div class="mui-card">
                    <form id="repayForm" class="mui-input-group">
                        <div class="mui-input-row mui-checkbox ">
                            <label>等额本息</label>
                            <input id="first" name="checkbox" value="等额本息" type="checkbox">
                        </div>
                        <div class="mui-input-row mui-checkbox ">
                            <label>按月付息到期还本</label>
                            <input id="second" name="checkbox" value="按月付息到期还本" type="checkbox">
                        </div>
                        <div class="mui-input-row mui-checkbox ">
                            <label>平息</label>
                            <input id="third" name="checkbox" value="平息" type="checkbox">
                        </div>
                        <div class="mui-input-row mui-checkbox ">
                            <label>等额本息气球贷</label>
                            <input id="fourth" name="checkbox" value="等额本息气球贷" type="checkbox">
                        </div>
                        <div class="mui-input-row mui-checkbox ">
                            <label>等额本金</label>
                            <input id="fifth" name="checkbox" value="等额本金" type="checkbox">
                        </div>
                        <div class="mui-input-row mui-checkbox ">
                            <label>平息气球贷</label>
                            <input id="sixth" name="checkbox" value="平息气球贷" type="checkbox">
                        </div>
                        <div class="mui-input-row mui-checkbox ">
                            <label>自定义还款计划</label>
                            <input id="seventh" name="checkbox" value="自定义还款计划" type="checkbox">
                        </div>
                    </form>
                </div>
            </div>
        </li>
    </ul>
</div>
<div id="aSub" class="Recharge-ann">
    <ul>
        <li class="Recharge" style="width: 100%; cursor:pointer;"><a href="#">保存设置</a></li>
    </ul>
</div>
<div class="set-ts">
    <h5 style="color: #007AFF;">温馨提示</h5>
    <p>1. 开启自动投标功能后，不影响手动购买理财产品。</p>
    <p>
        2. 当有新产品上线时，五分钟后进入可自动投标状态，产品紧俏时，
        建议您手动购买。
    </p>
</div>



<script>
    (function ($, doc) {
        $.init();
        $.ready(function () {
            var ss = doc.getElementById('aSub');
            ss.addEventListener('tap', function (event) {
                submitOrder();
            }, false);
            //普通示例
            var userPicker = new $.PopPicker();
            userPicker.setData([{
                value: '-1',
                text: '不限'
            }, {
                value: '7.2',
                text: '7.2%'
            }, {
                value: '7.8',
                text: '7.8%'
            }]);
            var showUserPickerButton = doc.getElementById('rate');
            var userResult = doc.getElementById('rateR');
            showUserPickerButton.addEventListener('tap', function (event) {
                userPicker.show(function (items) {
                    userResult.innerText = items[0].text;
                    doc.getElementById('hidRate').value = items[0].value;
                });
            }, false);

            var termPicker = new $.PopPicker();
            termPicker.setData([{
                value: '-1',
                text: '不限'
            }, {
                value: '1',
                text: '1-3个月'
            }, {
                value: '2',
                text: '4-6个月'
            }, {
                value: '3',
                text: '7-12个月'
            }, {
                value: '4',
                text: '12个月以上'
            }]);
            var showtermPickerButton = doc.getElementById('term');
            var termResult = doc.getElementById('termR');
            showtermPickerButton.addEventListener('tap', function (event) {
                termPicker.show(function (items) {
                    termResult.innerText = items[0].text;
                    doc.getElementById('hidTerm').value = items[0].value;
                    //返回 false 可以阻止选择框的关闭
                    //return false;
                });
            }, false);

        });

        mui('#typeForm').on('change', 'input', function () {
            var v = this.value;
            var s1 = doc.getElementById('hidType1').value
            var s2 = doc.getElementById('hidType2').value

            if (this.checked) {
                if (v == "健康贷") { s1 = "健康贷"; }
                if (v == "安心债") { s2 = "安心债"; }
            } else {
                if (v == "健康贷") { s1 = ""; }
                if (v == "安心债") { s2 = ""; }
            }
            doc.getElementById('hidType1').value = s1;
            doc.getElementById('hidType2').value = s2;
        });

        mui('#repayForm').on('change', 'input', function () {
            var v = this.value;
            var s1 = doc.getElementById('hidRepay1').value
            var s2 = doc.getElementById('hidRepay2').value
            var s3 = doc.getElementById('hidRepay3').value
            var s4 = doc.getElementById('hidRepay4').value
            var s5 = doc.getElementById('hidRepay5').value
            var s6 = doc.getElementById('hidRepay6').value
            var s7 = doc.getElementById('hidRepay7').value

           /*  if (this.checked) {
                if (v == "2,6") { s1 = "2,6"; }
                if (v == "1,3") { s2 = "1,3"; }
                if (v == "5,4") { s3 = "5,4"; }
                if (v == "7,8") { s4 = "7,8"; }
                if (v == "9,10") { s5 = "9,10"; }
                if (v == "11,12") { s6 = "11,12"; }
                if (v == "99") { s7 = "99"; }
            } else {
                if (v == "2,6") { s1 = ""; }
                if (v == "1,3") { s2 = ""; }
                if (v == "5,4") { s3 = ""; }
                if (v == "7,8") { s4 = ""; }
                if (v == "9,10") { s5 = ""; }
                if (v == "11,12") { s6 = ""; }
                if (v == "99") { s7 = ""; }
            } */
             if (this.checked) {
                if (v == "等额本息") { s1 = "等额本息"; }
                if (v == "按月付息到期还本") { s2 = "按月付息到期还本"; }
                if (v == "平息") { s3 = "平息"; }
                if (v == "等额本息气球贷") { s4 = "等额本息气球贷"; }
                if (v == "等额本金") { s5 = "等额本金"; }
                if (v == "平息气球贷") { s6 = "平息气球贷"; }
                if (v == "自定义还款计划") { s7 = "自定义还款计划"; }
            } else {
                if (v == "等额本息") { s1 = ""; }
                if (v == "按月付息到期还本") { s2 = ""; }
                if (v == "平息") { s3 = ""; }
                if (v == "等额本息气球贷") { s4 = ""; }
                if (v == "等额本金") { s5 = ""; }
                if (v == "平息气球贷") { s6 = ""; }
                if (v == "自定义还款计划") { s7 = ""; }
            }
            doc.getElementById('hidRepay1').value = s1;
            doc.getElementById('hidRepay2').value = s2;
            doc.getElementById('hidRepay3').value = s3;
            doc.getElementById('hidRepay4').value = s4;
            doc.getElementById('hidRepay5').value = s5;
            doc.getElementById('hidRepay6').value = s6;
            doc.getElementById('hidRepay7').value = s7;
        });


    })(mui, document);

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
