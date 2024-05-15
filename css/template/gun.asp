<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<!--#include file="fconn.asp"-->
<%set rs=server.createobject("adodb.recordset")
sql="select * from site where id=1"
rs.open sql,conn,1,1
title=rs("title")
description=rs("description")
key=rs("key")
rs.close
set rs=nothing%>
<head>
<title><%=title%></title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta content="ie=7.0000" http-equiv="x-ua-compatible">
<meta name="description" content="<%=description%>">
<meta name="keywords" content="<%=key%>">

<link href="css/style.css" type="text/css" rel="stylesheet">

<SCRIPT language="javascript">
<!--
function winopen(url)
{
window.open(url,"search","toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=yes,width=640,height=450,top=200,left=100");
}
function MM_openBrWindow(theURL,winName,features) { //v2.0
window.open(theURL,winName,features);
}
//-->
</SCRIPT>
 
<SCRIPT>
function eshop(id) { window.open("Eshop.asp?cpbm="+id,"","height=400,width=640,left=200,top=0,resizable=yes,scrollbars=yes,status=no,toolbar=no,menubar=no,location=no");}
</SCRIPT>
 
<STYLE type="text/css">
<!--
body,td,th {
	font-size: 12px;
	color: #999999;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</STYLE>
 

</HEAD>
<BODY>
<TABLE width="278" border="0" cellspacing="0" cellpadding="0">   
  <TBODY>
  <TR>
    <TD width="50">
      <TABLE width="275" height="267" align="left" border="0" cellspacing="0" 
      cellpadding="0">
        <TBODY>
        <TR>
          <TD width="200" height="280" valign="top">
            <DIV id="demo_lxy" style="width: 544px; height: 280px; overflow: hidden;">
            <DIV id="demo_lxy1"><!-- 定义图片 -->                   
            <DIV align="center">
            
                          	<%

set rs=server.createobject("adodb.recordset")
sqlnew="select top 99 * from product where ver='cn'"
rs.open sqlnew,conn,1,1	
%>
            <TABLE width="87%" border="0" cellspacing="0" cellpadding="0">
              <TBODY>
              <TR></TR></TBODY></TABLE>
            <TABLE width="112%" height="240" border="0" cellspacing="0" 
            cellpadding="0">
              <TBODY>
              <TR>
                <TD width="1%">&nbsp;</TD>
                <TD width="71%"></TD>
                <TD width="28%">&nbsp;</TD></TR>
              <TR>
                <TD>&nbsp;</TD>
                <TD>
                  <TABLE width="100%" height="0" align="left" border="0" 
                  cellspacing="4" cellpadding="0">
                    <TBODY>
                    <TR>
                      <TD></TD></TR>
                    <TR align="center">
                     <%
				Dim lineAmt, idx
				lineAmt = 3
				idx = 0
				while not rs.eof 
%>
                      <TD height="133" valign="top">
                        <TABLE width="100%" bgcolor="#e1e1e1" border="0" 
                        cellspacing="1" cellpadding="0">
                          <TBODY>
                          <TR>
                            <TD bgcolor="#ffffff">
                              <DIV align="center"><a href="pro_<%=rs("product_id")%>.html" target="_blank"><img src="<%=rs("s_image") %>" width="170" height="142" border="0" /></a></DIV></TD></TR>
                          <TR>
                            <TD height="30" align="center" background=""><a href="pro_<%=rs("product_id")%>.html" target="_blank"><%=left(rs("product_name"),20)%></a></TD></TR></TBODY></TABLE></TD>
                    
                                   <%                          
					idx = idx + 1
					if idx mod lineAmt = 0 then
            response.write "</tr><tr>"
          end if
					rs.MoveNext
				wend 
%>
                     </TR>
                                     <%

			rs.close
			set rs=nothing
%>
                    <TR>
                      <TD 
            height="2"></TD></TR></TBODY></TABLE>
            
            
            </TD></TR></TBODY></TABLE></DIV></DIV>
            <DIV id="demo_lxy2"></DIV></DIV>
<SCRIPT>
var speed=40
demo_lxy2.innerHTML=demo_lxy1.innerHTML
function Marquee(){
if(demo_lxy2.offsetTop-demo_lxy.scrollTop<=0)
demo_lxy.scrollTop-=demo_lxy1.offsetHeight
else{
demo_lxy.scrollTop++
}
}
var MyMar=setInterval(Marquee,speed)
demo_lxy.onmouseover=function() {clearInterval(MyMar)}
demo_lxy.onmouseout=function() {MyMar=setInterval(Marquee,speed)}
</SCRIPT>
          </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></BODY></HTML>
