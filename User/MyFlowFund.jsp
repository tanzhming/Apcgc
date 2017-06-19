<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- 资金记录界面 -->
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
<input id="hidType" name="hidType" type="hidden" value="All" />
<input id="hidIndex" name="hidIndex" type="hidden" value="2" />
<input id="hidOutIndex" name="hidOutIndex" type="hidden" value="2" />
<input id="hidInIndex" name="hidInIndex" type="hidden" value="2" />
<style>
    .mui-pull-top-tips {
        position: absolute;
        top: -20px;
        left: 50%;
        margin-left: -25px;
        width: 40px;
        height: 40px;
        border-radius: 100%;
        z-index: 1;
    }


    .mui-pull-top-wrapper {
        width: 42px;
        height: 42px;
        display: block;
        text-align: center;
        background-color: #efeff4;
        border: 1px solid #ddd;
        border-radius: 25px;
        background-clip: padding-box;
        box-shadow: 0 4px 10px #bbb;
        overflow: hidden;
    }

    .mui-pull-top-tips.mui-transitioning {
        -webkit-transition-duration: 200ms;
        transition-duration: 200ms;
    }

    .mui-pull-top-tips .mui-pull-loading {
        /*-webkit-backface-visibility: hidden;
                -webkit-transition-duration: 400ms;
                transition-duration: 400ms;*/
        margin: 0;
    }

    .mui-pull-top-wrapper .mui-icon,
    .mui-pull-top-wrapper .mui-spinner {
        margin-top: 7px;
    }

        .mui-pull-top-wrapper .mui-icon.mui-reverse {
            /*-webkit-transform: rotate(180deg) translateZ(0);*/
        }

    .mui-pull-bottom-tips {
        text-align: center;
        background-color: #efeff4;
        font-size: 15px;
        line-height: 40px;
        color: #777;
    }

    .mui-pull-top-canvas {
        overflow: hidden;
        background-color: #fafafa;
        border-radius: 40px;
        box-shadow: 0 4px 10px #bbb;
        width: 40px;
        height: 40px;
        margin: 0 auto;
    }

        .mui-pull-top-canvas canvas {
            width: 40px;
        }

    .mui-slider-indicator.mui-segmented-control {
        background-color: #efeff4;
    }
</style>
<header class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
    <h1 id="title" class="mui-title">资金记录</h1>
</header>

<div class="mui-content" style="padding-bottom:30px;">
    <div id="slider" class="mui-slider">
        <div id="sliderSegmentedControl" class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
            <a class="mui-control-item mui-active" href="#item1mobile">
                全部交易
            </a>
            <a id="a2" class="mui-control-item" href="#item2mobile">
                全部出账
            </a>
            <a id="a3" class="mui-control-item" href="#item3mobile">
                全部入账
            </a>
        </div>

    </div>
    <div class="mui-slider-group">
        <div id="item1mobile" class="mui-slider-item mui-control-content mui-active">
            <div id="cap1" class="capital-lb">
                <ul class="uul">
                </ul>
            </div>
        </div>
        <div id="item2mobile" class="mui-slider-item mui-control-content">
            <div id="cap2" class="capital-lb">
                <ul class="uul">
                </ul>
            </div>

        </div>
        <div id="item3mobile" class="mui-slider-item mui-control-content">
            <div id="cap3" class="capital-lb">
                <ul class="uul">
                </ul>
            </div>
        </div>

    </div>
</div>
<script src="${pageContext.request.contextPath }/Scripts/mui.pullToRefresh.js"></script>
<script src="${pageContext.request.contextPath }/Scripts/mui.pullToRefresh.material.js"></script>
<script>
    mui.init();
    (function ($) {

        $.ready(function () {
            //循环初始化所有下拉刷新，上拉加载。
            $.each(document.querySelectorAll('#cap1'), function (index, pullRefreshEl) {
                $(pullRefreshEl).pullToRefresh({
                    up: {
                        callback: function () {
                            var self = this;
                            setTimeout(function () {
                                var ul = self.element.querySelector('.uul');
                                var fragment = document.createDocumentFragment();
                                var ind = document.getElementById('hidIndex').value;
                                $.post('/User/MyFlowFundSub', { pagindex: ind },
                                 function (data) {
                                     if (data.success) {
                                         if (data.result.length > 0) {
                                             var response = eval(data.result);
                                             for (var i = 0; i < data.count; i++) {
                                                 li = document.createElement('li');
                                                 if (response[i]._bpsigns) {
                                                     li.innerHTML = '<a href="#"  ><div class="money" style="  color: #00AA22; ">-' + response[i]._expenses.toFixed(2) + '</div><div class="capital-ly"> ' + response[i]._remark + '<p class="mui-ellipsis">' + response[i]._time + '</p></div>   </a>';
                                                 }
                                                 else {
                                                     li.innerHTML = '<a href="#"  ><div class="money" style="  color: #fe7701; ">+' + response[i]._income.toFixed(2) + '</div><div class="capital-ly"> ' + response[i]._remark + '<p class="mui-ellipsis">' + response[i]._time + '</p></div>     </a>';
                                                 }
                                                 fragment.appendChild(li);
                                             }
                                             document.getElementById('hidIndex').value = parseInt(ind) + 1;
                                             ul.appendChild(fragment);
                                         }
                                     }
                                     else {
                                         mui.alert("已经没有了");
                                     }
                                 }, "json");
                                self.endPullUpToRefresh();
                            }, 1000);
                        }
                    }
                });
            });

            $.each(document.querySelectorAll('#cap2'), function (index, pullRefreshEl) {
                $(pullRefreshEl).pullToRefresh({       
                    up: {
                        callback: function () {
                            var self = this;
                            setTimeout(function () {
                                var ul = self.element.querySelector('.uul');
                                var fragment = document.createDocumentFragment();
                                var ind = document.getElementById('hidOutIndex').value;
                                $.post('/User/MyFlowFundOutSub', { pagindex: ind },
                                 function (data) {
                                     if (data.success) {
                                         if (data.result.length > 0) {
                                             var response = eval(data.result);
                                             for (var i = 0; i < data.count; i++) {
                                                 li = document.createElement('li');
                                                 if (response[i]._bpsigns) {
                                                     li.innerHTML = '<a href="#"  ><div class="money" style="  color: #00AA22; ">-' + response[i]._expenses.toFixed(2) + '</div><div class="capital-ly"> ' + response[i]._remark + '<p class="mui-ellipsis">' + response[i]._time + '</p></div>   </a>';
                                                 }
                                                 else {
                                                     li.innerHTML = '<a href="#" ><div class="money" style="  color: #fe7701; ">+' + response[i]._income.toFixed(2) + '</div><div class="capital-ly"> ' + response[i]._remark + '<p class="mui-ellipsis">' + response[i]._time + '</p></div>     </a>';
                                                 }
                                                 fragment.appendChild(li);
                                             }
                                             document.getElementById('hidOutIndex').value = parseInt(ind) + 1;
                                             ul.appendChild(fragment);
                                         }
                                     }
                                     else {
                                         mui.alert("已经没有了");
                                     }
                                 }, "json");
                                self.endPullUpToRefresh();
                            }, 1000);
                        }
                    }
                });
            });

            $.each(document.querySelectorAll('#cap3'), function (index, pullRefreshEl) {
                $(pullRefreshEl).pullToRefresh({

                    up: {
                        callback: function () {
                            var self = this;
                            setTimeout(function () {
                                var ul = self.element.querySelector('.uul');
                                var fragment = document.createDocumentFragment();
                                var ind = document.getElementById('hidInIndex').value;
                                $.post('/User/MyFlowFundInSub', { pagindex: ind },
                                 function (data) {
                                     if (data.success) {
                                         if (data.result.length > 0) {
                                             var response = eval(data.result);
                                             for (var i = 0; i < data.count; i++) {
                                                 li = document.createElement('li');
                                                 if (response[i]._bpsigns) {
                                                     li.innerHTML = '<a href="#" ><div class="money" style="  color: #00AA22; ">-' + response[i]._expenses + '</div><div class="capital-ly"> ' + response[i]._remark + '<p class="mui-ellipsis">' + response[i]._time + '</p></div>   </a>';
                                                 }
                                                 else {
                                                     li.innerHTML = '<a href="#"  ><div class="money" style="  color: #fe7701; ">+' + response[i]._income + '</div><div class="capital-ly"> ' + response[i]._remark + '<p class="mui-ellipsis">' + response[i]._time + '</p></div>     </a>';
                                                 }
                                                 fragment.appendChild(li);
                                             }
                                             document.getElementById('hidInIndex').value = parseInt(ind) + 1;
                                             ul.appendChild(fragment);
                                         }
                                     }
                                     else {
                                         mui.alert("已经没有了");
                                     }
                                 }, "json");
                                self.endPullUpToRefresh();
                            }, 1000);
                        }
                    }
                });
            });
        });
    })(mui);
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
