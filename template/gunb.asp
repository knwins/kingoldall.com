
<html>
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
<meta http-equiv=content-type content="text/html; charset=gb2312">
<meta content="ie=7.0000" http-equiv="x-ua-compatible">
<meta name="description" content="<%=description%>">
<meta name="keywords" content="<%=key%>">

<link href="css/style.css" type="text/css" rel="stylesheet">

<script language="javascript">
<!--
function winopen(url)
{
window.open(url,"search","toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=yes,width=640,height=450,top=200,left=100");
}
function MM_openBrWindow(theURL,winName,features) { //v2.0
window.open(theURL,winName,features);
}
//-->
</script>
<script>
function eshop(id) { window.open("Eshop.asp?cpbm="+id,"","height=400,width=640,left=200,top=0,resizable=yes,scrollbars=yes,status=no,toolbar=no,menubar=no,location=no");}
</script> 


<style type="text/css">
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
</style>
</head><body marginwidth="0" marginheight="0"><table width="544" border="0" cellpadding="0" cellspacing="0">
  <tbody><tr>
                                      
                                      <td width="50"><table width="275" height="267" border="0" align="left" cellpadding="0" cellspacing="0">
        <tbody>
              <tr>
                
            <td width="544" height="280" valign="top"> 
              <div id="demo_lxy" style="overflow:hidden;height:280;width:544;background:;color:"> 
                <div id="demo_lxy1">
                    <!-- 定义图片 -->
                  <div align="center">
                  
                  
                     	<%

set rs=server.createobject("adodb.recordset")
sqlnew="select top 99 * from product where ver='cn'"
rs.open sqlnew,conn,1,1	
%>
                            <table cellspacing="0" cellpadding="0" width="100%" border="0" >
                              <tr>
                                <%
				Dim lineAmt, idx
				lineAmt = 3
				idx = 0
				while not rs.eof 
%>
                                <td align="center" valign="bottom"><table border="0" cellspacing="1" cellpadding="5" style="margin-top:5px">
                                    <tr>
                                      <td align="center" class="img"><a href="pro_<%=rs("product_id")%>.html" target="_blank"><img src="<%=rs("s_image") %>" width="165" height="150" border="0" /></a></td>
                                    </tr>
                                    <tr>
                                      <td height="30" align="center"  bgcolor="#E1E1E1"><a href="pro_<%=rs("product_id")%>.html"><%=left(rs("product_name"),20)%></a> </td>
                                    </tr>
                                </table></td>
                                <%                          
					idx = idx + 1
					if idx mod lineAmt = 0 then
            response.write "</tr><tr>"
          end if
					rs.MoveNext
				wend 
%>
                              </tr>
                              <%

			rs.close
			set rs=nothing
%>
                          </table>
                    </div>
                </div>
                  <div id="demo_lxy2">
                    <!-- 定义图片 -->
                
                </div>
                </div>
                
              <script>
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
</script></td></tr></tbody></table></td>
                                    </tr>
</tbody></table></body></html>