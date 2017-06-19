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
    
    <script src="/bundles/jqueryval?v="></script>


    <script type="text/javascript">
        function Detail(obj) {
           window.location.href = '${pageContext.request.contextPath}/Detail.action?inversid='+obj;
        }
    </script>


    
<input id="hidPage" name="hidPage" type="hidden" value="Home" />

 


<div class="banner"><img src="Images/banner_m_2017_Spring.jpg" /></div>
<c:if test="${accountSession == null }">
    <div class="Login-Register">
        <a class="login" href="${pageContext.request.contextPath }/Login.action?Length=4">登录</a>
        <a class="register" href="${pageContext.request.contextPath }/RegistMobile.action">注册</a>
    </div>
</c:if>
        <div class="announcement">
            <span><img src="Images/gongg_04.png"></span>
            <div class="gongg">公告：<a id="news" href="" style="color:#404040;"></a>  </div>
        </div>

<div class="index-lb">
    <h5>投资列表</h5>
    	<c:forEach var="inves" items="${invests }" varStatus="vs">
        <div class="invest_lb" onclick="Detail('${inves.inversid}')">

            <div class="lb_message">
                <div class="lb_message_name">
                        <div class="lb_name">${inves.atype.typename }- ${inves.inversid }</div>
                    <div class="lb_jinlv">
                            <div class="lb_lv">
                                <dl>
                                    <dt> <fmt:formatNumber type="number" value="${inves.interestrate*100 } " maxFractionDigits="2"/> %</dt>
                                    <dd>年化收益率</dd>
                                </dl>
                            </div>

                        <div class="invest_deadline">
                            <ul>
                                <li>
                                    <span>期限: </span> ${inves.deadline } 个月
                                </li>
                                <li>
                                    <span>金额: </span> 
                                    <fmt:formatNumber type="number" value="${inves.money/10000 } " maxFractionDigits="2"/>  万
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="invest_plan">
                    <div class="chart">
                        <div class="percentage-light" data-percent="100">
                            >
                            <span style="font-size:14px; font-weight:600;color:#3399FF;">
                                100.00%
                            </span>
                        </div>
                    </div>
                </div>
            </div>


            <div class="lb_remaining">
                        <div class="time_remaining">
                            <span>剩余时间：</span>
                            已结束
                        </div>
                        <a>
                        <div class="ann_rg" style="color: #007AFF;">
                        	<c:if test="${inves.istranfer == 0 }">
	                           	即将开始
	                        </c:if>
	                        <c:if test="${inves.istranfer == 1 }">
	                                                          已结束
	                        </c:if>
	                        <c:if test="${inves.istranfer == 2 }">
	                            	还款中
	                       	</c:if>
                        </div>
                        </a>

            </div>
        </div>
     </c:forEach>
</div>
<script type="text/javascript" charset="utf-8">
    mui.init({
        swipeBack: true //启用右滑关闭功能
    });

    var slider = mui("#slider");
    slider.slider({
        interval: 5000
    });

</script>

    <div style="margin-bottom:60px;"></div>
    
    <!-- 底部按钮 -->
    <%@include file="/Common/communder.jsp" %>
    
    <script>
        $(document).ready(function () {
            mui('body').on('tap', 'a', function () { document.location.href = this.href; });
            get1notices(); 
        });
        
        function get1notices(){
        	$.ajax({
        		type:'post',
        		url:'${pageContext.request.contextPath}/show1notices.action',
        		dataType:'json',
        		success:function(data){
        			if(data.noticestitle.length>1){
        				$("#news").html(data.noticestitle.substring(0,14)+"....");
        			}else{
        				$("#news").html(data.noticestitle);
        			}
        			$("#news").attr('href','${pageContext.request.contextPath}/noticesDetail.action?NoticesID='+data.id+'&noticesTitle='+data.newstitle);
        		},
        		error:function(){
        			alert("数据获取错误");
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
    </script>
</body>
</html>

