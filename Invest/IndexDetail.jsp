<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
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
    
    <script>

        $(function () {
            var price = $("#hidPrice").val();
            $("#span1").text(price);
            $("#span3").text(price);
            $("#span2").text(parseInt(price / 100));
            $("#hidValue").val(parseInt(price / 100));

            mui('.mui-input-group').on('change', 'input', function () {
                var str = this.value;
                var arr = str.split(',');

                var amount = $("#hidPrice").val();
                var a = arr[1];
                var id = arr[0];
                //单笔投资只可使用一张礼金券
                if (this.checked) {
                    var hidValue = $("#hidValue").val();
                    var hidSelect = $("#hidSelect").val();

                    if (hidValue == "") {
                        mui.alert("请先填写投资金额", '提示', function () { });
                        this.checked = false;
                        return false;
                    }

                    if (hidSelect == "" || hidSelect == "0") {
                        hidSelect = 0;
                    }
                    else {
                    }
                    if ((parseInt(hidSelect)) >= parseInt(hidValue)) {
                        mui.alert("您所选择的礼金券额度超过抵扣最大额度，请从新选择", '提示', function () { });
                        this.checked = false;
                        return false;
                    }
                    else {
                        $("#hidID").val($("#hidID").val() + "," + id);
                        $("#hidSelect").val((parseInt(a) + parseInt(hidSelect)));
                        if ((parseInt(a) + parseInt(hidSelect)) > parseInt(hidValue)) {
                            $("#hidValue2").val(parseInt(amount) - parseInt(hidValue));
                        }
                        else {
                            $("#hidValue2").val(parseInt(amount) - parseInt(hidSelect) - parseInt(a));
                        }
                    }
                }
                else {
                    $("#hidID").val();
                    $("#hidSelect").val((parseInt(hidSelect) - parseInt(a)));
                    $("#hidValue2").val(parseInt(amount) - parseInt(hidSelect) + parseInt(a));
                }
            });
        });

        function SecurySet() {
            window.location.href = '/User/SecurySet';
        }

        function InvestSubmit() {
            var val = $("#hidPrice").val();
            var CA_ID = $("#hidCA_ID").val();
            var type = $("#hidType").val();
            var rn_id = $("#hidRN_ID").val();
            var giftID = $("#hidID").val();

            $("#hidValue").val(val / 100);
            var hidValue = $("#hidValue").val();
            var hidSelect = $("#hidSelect").val();

            if (hidSelect == "" || hidSelect == "0") {
                hidSelect = 0;
            }
            if (parseInt(hidSelect) >= parseInt(hidValue)) {
                $("#hidValue2").val(parseInt(val) - parseInt(hidValue));
            }
            else {
                $("#hidValue2").val(parseInt(val) - parseInt(hidSelect));
            }

            if (giftID == "")
                giftID = "0";
            var dikou = $("#hidValue2").val();
            var hidSelect = $("#hidSelect").val();

            var btnArray = ['取消', '确定'];
            mui.confirm('此次投资金额：' + val + '元，扣除账户余额：' + (parseInt(dikou)) + '元， 礼金券抵扣余额：' + (parseInt(val) - parseInt(dikou)) + '元？', '提示', btnArray, function (e) {
                if (e.index == 1) {
                    $.post('/Invest/BLZInvest', { ID: CA_ID, Type: type, RN_ID: rn_id, GiftID: giftID },
                        function (data) {
                            if (data.success) {
                                window.location.href = '/Invest/BLZSuccess?Rvalue=' + encodeURI(data.sRvalue)
                            }
                            else {
                                $("#hidID").val("");
                                $("#hidValue2").val("");
                                $("#hidValue").val("");
                                $("#hidSelect").val("");
                                mui.alert(data.result, '提示信息', function () { });
                                if (data.result == "您的信息设置不完整，不能认购！") {
                                    window.location.href = '/User/SecurySet';
                                }
                            }
                        }, "json");
                }
            });
        }
    </script>

    

<input id="hidCA_ID" name="hidCA_ID" type="hidden" value="1817" />
<input id="hidType" name="hidType" type="hidden" value="安心债" />
<input id="hidRN_ID" name="hidRN_ID" type="hidden" value="XD00015436" />
<input id="hidPrice" name="hidPrice" type="hidden" value="6008.81" />

<input id="hidValue" name="hidValue" type="hidden" value="" />
<input id="hidSelect" name="hidSelect" type="hidden" value="" />
<input id="hidValue2" name="hidValue2" type="hidden" value="" />
<input id="hidID" name="hidID" type="hidden" value="" />

<input id="hidPage" name="hidPage" type="hidden" value="Invest" />
<header class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
    <h1 id="title" class="mui-title">${investment.atype.typename }-${investment.inversid }</h1>
</header>
<div class="product" style="height: 85px;">
    <div class="condition">
        <dl style="width: 40%;">
            <dt>${investment.money }</dt>
            <dd>转让价格</dd>
        </dl>
        <dl style="width: 30%;">
            <dt><e>${investment.income }</e></dt>
            <dd>预期收益</dd>
        </dl>
        <dl style="width: 30%;">
            <dt><fmt:formatNumber type="number" value="${investment.interestrate*100 } " maxFractionDigits="2"/> %</dt>
            <dd>预期利率</dd>
        </dl>
    </div>
</div>
<div class="product_message">
    <ul>
        <li>债权到期时间:<span> ${expire } </span></li>
        <li>预定转让:<span><fmt:formatDate value="${investment.transfer }" pattern="yyyy/MM/dd" /></span></li>
        <li>保障措施：<span>农产品小贷  提供本息担保</span></li>
    </ul>
</div>
    <div class="product_message" style="margin-bottom:10px; height:44px; min-height:44px;">
        <ul>

            <li>产品状态：<span style="color:#fe7701;">   交易结束，债权已经转让完成。</span></li>
        </ul>
    </div>



<div class="mui-content" style="padding-top:0;">
    <div class="drop-down">
        <ul class="mui-table-view">
            <li class="mui-table-view-cell mui-collapse">
                <a id="a1" class="mui-navigate-right" href="#a1">认购提示</a>
                <div class="mui-collapse-content">
                    <p>1.债务人还款后，系统会在4个工作日内处理完成还款并将资金转入债权持有人的会员账户；</p><br>
                    <p>2.如债务人在约定还款时间内未能还款，深圳市农产品融资担保有限公司将履行担保协议，为债务人代偿逾期本息；</p><br>
                    <p>3.如债务人提前还款，债权持有人将立即收回债权本金以及实际产生的未收回利息。</p>
                </div>
            </li>
            <li class="mui-table-view-cell mui-collapse">
                <a id="a2" class="mui-navigate-right" href="#a2">便利转介绍</a>
                <div class="mui-collapse-content">
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;“便利转”是海吉星金融网会员间的债权转让的交易场所。通过债权转让，使债权转让方获得资金，使产品受让方增加投资品种，获得投资收益。会员认购的“健康贷”、“安心债”和“便利转”等均可便利转让，轻松获得流动性。海吉星金融网为债权转让人和受让人提供转让所需的中介服务。</p>
                </div>
            </li>
        </ul>
    </div>
    <samp style="height: 60px;display: block;width: 100%;"></samp>
</div>

<!--<script>
    (function ($, doc) {
        $.init();
        $.ready(function () {
            var showUserPickerButton = doc.getElementById('aSubmit');
            showUserPickerButton.addEventListener('tap', function (event) {
                InvestSubmit();
            }, false);
        });
    })(mui, document);
</script>-->


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
    </script>
</body>
</html>
