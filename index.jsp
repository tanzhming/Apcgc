<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/Scripts/jquery-1.8.2.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
		   $("#but").click(function(){
		  controllerResponseJsonArray();  
		   });  
		 });
		 function controllerResponseJsonArray(){
		   $.ajax({
				type:'POST',
				url:'${pageContext.request.contextPath}/index.action',
				dataType:'json',
				success:function(data){
					 for(i=0;i<data.length;i++){
						var id=data[i].id;
						var inversid=data[i].inversid;
						var deadline=data[i].deadline;
						alert("id:"+id+"\n"+"inversid"+inversid+"\n"+"deadline:"+deadline);
						}
				},
				error:function(){
				 alert("获取数据失败!");
				}
			});  
		  }
		  /* window.onbeforeunload = function (e) {
  e = e || window.event;
  var y = e.clientY;
  if (y<= 0 || y >= Math.max(document.body ? document.body.clientHeight : 0, document.documentElement ? document.documentElement.clientHeight : 0)){
    //IE 和 Firefox 
    e.returnValue = "确定要刷新或关闭浏览器窗口？";
  }
  //谷歌
  return "确定要刷新或关闭浏览器窗口？";
} */
window.onunload=function(){
     var n=window.event.screenX-window.screenLeft;
     var b=n>document.documentElement.scrollWidth-20;
     if(b||window.event.clientY<0||window.event.altKey){
          alert("关闭");  //任务栏关闭
     }else{
          alert("刷新");  //选项卡关闭
     }
}
	</script>
	
  
  <body>
    <button id="but">controller返回JSON数组</button>
  </body>
</html>
