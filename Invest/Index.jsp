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


    

<input id="hidPage" name="hidPage" type="hidden" value="Invest" />
<input id="hidIndex" name="hidIndex" type="hidden" value="2" />
<header class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" ></a>
    <h1 id="title" class="mui-title">投资列表</h1>
</header>


<div class="mui-content">
    <div style="padding:0 0 6px 0;">
        <div id="sliderSegmentedControl" class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
	       <c:if test="${empty type }">
		            <a id="item1" class="mui-control-item" href=""></a>
		            <a id="item2" class="mui-control-item" href=""></a>
		            <a id="item3" class="mui-control-item" href=""></a>
		    </c:if>
		    <c:if test="${type == 'JKD' }">
		            <a id="item1" class="mui-control-item mui-active" href=""></a>
		            <a id="item2" class="mui-control-item" href=""></a>
		            <a id="item3" class="mui-control-item" href=""></a>
		    </c:if>
		    <c:if test="${type == 'AXZ' }">
		            <a id="item1" class="mui-control-item" href=""></a>
		            <a id="item2" class="mui-control-item mui-active" href="#item2mobile"></a>
		            <a id="item3" class="mui-control-item" href=""></a>
		    </c:if>
		    <c:if test="${type == 'BLZ' }">
		            <a id="item1" class="mui-control-item" href=""></a>
		            <a id="item2" class="mui-control-item" href=""></a>
		            <a id="item3" class="mui-control-item mui-active" href=""></a>
		    </c:if>
		</div>
        <div id="group" class="mui-slider-group">
        
        <c:forEach items="${InvesList }" var="inves" varStatus="vs">
            <div id="item2mobile" class="mui-slider-item mui-control-content  mui-active">
                    <div class="invest_lb" onclick="Detail('${inves.inversid}')">

                        <div class="lb_message">
                            <div class="lb_message_name">
                                    <div class="lb_name">${inves.atype.typename}- ${inves.inversid }</div>
                                <div class="lb_jinlv">
                                        <div class="lb_lv">
                                            <dl>
                                                <dt><fmt:formatNumber type="number" value="${inves.interestrate*100 } " maxFractionDigits="2"/>  %</dt>
                                                <dd>年化收益率</dd>
                                            </dl>
                                        </div>
                                    <div class="invest_deadline">
                                        <ul>
                                            <li>
                                                <span>期限: </span>${inves.deadline } 个月
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
                                    <a >
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
            </div>
          </c:forEach>
        </div>
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
    
    <script type="text/javascript">
        $(document).ready(function () {
            window.location.href = "#come here";  //注意有个#
            getAllItems();  // 获取所有的投资类型
            //getAllInves();  // 获取所有的投资项目
            $("#come here").visible = false;
        });
        
       function getAllInves(){
       		$.ajax({
       			type:'post',
       			url:'${pageContext.request.contextPath}/index.action',
       			dataType:'json',
       			success:function(data){
       				alert(data);
       			},
       			error:function(){
       				alert('You request is error');
       			}
       		});
       }
        
        function getAllItems(){
        	$.ajax({
        		type:'get',
        		url:'${pageContext.request.contextPath}/showTypes.action',
        		dataType:'json',
        		success:function(data){
        			$("#item1").html(data[0].typename);
        			$("#item1").attr('href','${pageContext.request.contextPath}/index.action?type='+data[0].typenickname);  
        			
        			$("#item2").html(data[1].typename);
        			$("#item2").attr('href','${pageContext.request.contextPath}/index.action?type='+data[1].typenickname);  
        			$("#item3").html(data[2].typename);
        			$("#item3").attr('href','${pageContext.request.contextPath}/index.action?type='+data[2].typenickname); 
        		},
        		error:function(){
				 alert("获取数据失败!");
				}
        	});
        }
        
        
        
        function jkdClick() {
            Query("JKD");
        }

        function axzClick() {
            Query("AXZ");
        }

        function blzClick() {
            Query("BLZ");
        }

        function sjshClick() {
            Query("SJSH");
        }

        function Detail(obj) {
            window.location.href = '${pageContext.request.contextPath}/Detail.action?inversid='+obj;
        }

        function Query(obj) {
            window.location.href = '/Invest?Type=' + obj;
        }
    </script>
</body>
</html>
