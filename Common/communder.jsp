<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    	
	<%-- <link href="${pageContext.request.contextPath }/Content/mui.min.css" rel="stylesheet" /> --%>
    <%-- <link href="${pageContext.request.contextPath }/Content/Site.css" rel="stylesheet" /> --%>
    <%-- <script src="${pageContext.request.contextPath }/Scripts/jquery-1.8.2.min.js"></script>
    <script src="${pageContext.request.contextPath }/Scripts/mui.min.js"></script> --%>
    <%-- <script src="${pageContext.request.contextPath }/Scripts/apcgc_piechart.js" type="text/javascript"></script> --%>
    <%-- <link href="${pageContext.request.contextPath }/Content/jquery.easy-pie-chart.css" rel="stylesheet" /> --%>
    <%-- <script src="${pageContext.request.contextPath }/Scripts/apcgc_common.js"></script> --%>
  </head>
  
  <body>
  
  <nav id="nav1" class="mui-bar1 mui-bar-tab" style="background-color: rgb(247, 247, 247); z-index: 99;">
    <a href="${pageContext.request.contextPath }/home.action"   id="defaultTab" class="mui-tab-item">
        <span class="mui-icon mui-icon-home"></span>
        <span class="mui-tab-label">首页</span>
    </a>

    <a href="${pageContext.request.contextPath }/index.action"  id="listTab" class="mui-tab-item">
        <span class="mui-icon mui-icon-list"></span>
        <span class="mui-tab-label">投资列表</span>
    </a>

    <a href="${pageContext.request.contextPath }/user.action" id="userTab" class="mui-tab-item">
        <span class="mui-icon mui-icon-contact"></span>
        <span class="mui-tab-label">会员中心</span>
    </a>

    <a href="${pageContext.request.contextPath }/more.action"   id="moreTab" class="mui-tab-item">
        <span class="mui-icon mui-icon-more-filled"></span>
        <span class="mui-tab-label">更多</span>
    </a>

</nav>
  
  
  </body>
</html>
