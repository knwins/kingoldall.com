<!DOCTYPE html PUBLIC "-//W3C//Dtd html 4.01 transitional//EN" "http://www.w3c.org/tr/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="fconn.asp"-->
<%
session("field")=request("field")'搜索类型, 产品名称或者产品内容
smallclass=request("smallclass")
bigclass=request("bigclass")
session("ver")="cn"
if request("key")<>"" then
keywords=request("key")
end if
set rs=server.createobject("adodb.recordset")
sql="select * from site where id=1"
rs.open sql,conn,1,1
title=rs("title")
description=rs("description")
key=rs("key")
rs.close
set rs=nothing%>
<head>
<title><%=title%></title>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<META content="IE=7.0000" http-equiv="X-UA-Compatible">
<meta name="description" content="<%=description%>">
<meta name="keywords" content="<%=key%>">
<LINK href="css/style.css" type=text/css rel=stylesheet>
<style type="text/css">
.STYLE31 {
	font-size: 14px;
	font-weight: bold;
}
</style>
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
<link href="css/link.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE5 {
	color: #000000;
	font-weight: bold;
}
-->
</style>
</head>
<body>
<!--#include file="top.asp"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="middle"><table width="1003" border="0" cellpadding="0" cellspacing="0" background="Images/bg.jpg">
        <tr>
          <td width="197" align="center" valign="top"><style type="text/css">
<!--
.STYLE9 {
	color: #000000;
	font-size: 14px;
	font-weight: bold;
}
.STYLE10 {color: #000000}
.STYLE3 {	color: #FF0000;
	font-weight: bold;
}
-->
</style>
            <div align="left">
              <table width="220" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="210" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr valign="middle">
                          <td height="32" background="images/left-bg1.jpg" class="font1">产品分类<span class="en">｜PRODUCT LIST </span></td>
                        </tr>
                        <tr valign="middle">
                          <td height="8"></td>
                        </tr>
                        <tr>
                          <td><img src="images/left-top.jpg" width="210" height="11"></td>
                        </tr>
                        <tr>
                          <td align="center" background="images/left-bg.jpg"><table width="170" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                              <%
	set rs=server.createobject("adodb.recordset")
	rs.open "select * from product_cate where root_id=0 and ver='cn' order by listorder asc",conn,1
	while not rs.eof
		getsmalltype= rs("pro_cate_id")
		getcatename = rs("pro_cate_name")
%>
                              <tr>
                                <td width="191" height="1" ></td>
                              </tr>
                              <tr>
                                <td height="27" align="left" id="item$pval[catID])" style="CURSOR: hand; font-size:13px; font-weight:700" onMouseUp="opencat(cat101000,img101000);" language="javascript" >&nbsp;<img src="images/1_12.gif" width="13" height="11" />&nbsp;<a href="product_<%=rs("pro_cate_id")%>.html"> <%=rs("pro_cate_name")%></a></td>
                              </tr>
                              <tr>
                                <td height="1" align="left" background="images/n_1.jpg"></td>
                              </tr>
                              <%
								set rsbig=server.createobject("adodb.recordset")
								sql = "select * from product_cate where ver='cn' and root_id = "& getsmalltype &" order by listorder asc"
								rsbig.open sql,conn,1
								if  not rsbig.eof  then
									while not rsbig.eof 
%>
                              <tr>
                                <td id="cat101000" style='DISPLAY: none'>&nbsp;&nbsp;&nbsp;&nbsp;<a href="product_<%=getsmalltype%>_<%=rsbig("pro_cate_id")%>.html"><%=rsbig("pro_cate_name")%></a></td>
                              </tr>
                              <tr>
                                <td id="cat101000" style='DISPLAY: none'><img src="images/wf-2.jpg" width="190" height="2" /></td>
                              </tr>
                              <%                          
										rsbig.movenext
									wend 
								end if
								rsbig.close
								set rsbig=nothing
%>
                              <%
		rs.movenext
	wend 
	rs.close
	set rs=nothing
%>
                            </table></td>
                        </tr>
                        <tr>
                          <td height="11"><img src="images/left-end.jpg" width="210" height="11"></td>
                        </tr>
                      </tbody>
                    </table>
                              			<script type ="text/javascript">
 function search()
 {
  if(document .getElementById ("keys").value=="")
  { alert ("关键字不能为空!!");
    return;
  }
  else
  {
      window.open("search.asp?key=" + escape(document.getElementById("keys").value));
   }
 }
</script>
                    <table width="210" border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr valign="middle">
                          <td height="8"></td>
                        </tr>
                        <tr>
                          <td height="32" background="images/left-bg1.jpg" class="font1">产品搜索<span class="en">｜SEARCH </span></td>
                        </tr>
                          <form action="">
                          <td align="center" background="images/yewu_bg.jpg"><table width="90%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px; margin-bottom:10px">
                        <tr>
                          <td width="74%" align="left"><INPUT class=nb7
      onblur="this.value = this.value =='' ? '输入关键字...' : this.value" 
      onclick="this.value='';" value=输入关键字... id=keys> </td>
                          <td width="20%" align="left"><a href="javascript:search()"><img src="images/search2.gif" width="40" height="20" border="0" /></a></td>
                        </tr>
                      </table></td>
                          </form>
                        </tr>
                        <tr>
                          <td><img src="images/yewu_bot.jpg" width="210" height="7"></td>
                        </tr>
                        <tr>
                          <td height="8"></td>
                        </tr>
                        <tr>
                          <td><a href="contactus.html"><img src="images/inLinkImg.jpg" alt="联系我们" width="210" height="68" border="0"></a></td>
                        </tr>
                        <tr>
                          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tbody>
                                <tr>
                                  <td colspan="2" height="25"><span class="STYLE31"> 深圳市金谷泉科技有限公司 </span></td>
                                </tr>
                                <tr>
                                  <td height="25">地 址：</td>
                                  <td>深圳市龙岗区龙东东升新路3号</td>
                                </tr>
                                <tr>
                                  <td height="25">电 话：</td>
                                  <td>0755-89328010</td>
                                </tr>
                                <tr>
                                  <td height="25">传 真：</td>
                                  <td>0755-89328010</td>
                                </tr>
                                <tr>
                                  <td height="25">手 机：</td>
                                  <td>13724362190</td>
                                </tr>
                                <tr>
                                  <td height="25">网 址 ： </td>
                                    <td><a href="http://www.kingoldall.com/">www.kingoldall.com</a></td>
                                </tr>
                                <tr>
                                  <td height="10"></td>
                                  <td></td>
                                </tr>
                              </tbody>
                            </table></td>
                        </tr>
                      </tbody>
                    </table></td>
                  <td width="10" background="index/XXS.GIF" style=" background-position:right; background-repeat:repeat-y;"></td>
                </tr>
              </table>
              <br />
            </div></td>
          <td width="820" align="left" valign="top"><table width="780" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                    <tr>
                      <td valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="12" valign="top"><table width="770" border="0" cellspacing="0" cellpadding="0">
                                <!--DWLayoutTable-->
                                <tr>
                                  <td width="4" height="10">&nbsp;</td>
                                  <td width="272"><img src="images/017.jpg" width="194" height="27"></td>
                                  <td width="494" align="right"><A href="index.html">首页</A> &gt; 产品展示 &gt; 搜索的关键字:<%=keywords%></td>
                                </tr>
                              </table></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>
                      <td valign="top"><table cellspacing=0 cellpadding=0 width="100%" align=center border=0>
                        <tr>
                          <td align="center"><table width=95% border=0 align="center" cellpadding=2 cellspacing=1>
                            <%

set rs=server.CreateObject("ADODB.RecordSet")

sql="select * from product where "
if bigtype<>"" then
sql=sql&"bigtype = "& bigtype &" and "
end if

if smalltype<>"" then
sql=sql&"type = "&smalltype&" and "
end if

if keywords<>"" then  
sql=sql&"product_name like '%"&keywords&"%' and "
end if

sql=sql&"ver='cn' order by orders asc"
rs.open sql,conn,1

if rs.eof and rs.bof then
response.write("<br>暂时没有产品<br>")
else
dim page
 IF not IsNumeric(Request("page")) Or IsEmpty(Request("page")) Then
	page=1
	Else
	Page=Int(Abs(Request("page")))
 End if
rs.pagesize =18
total  = rs.RecordCount
mypagesize=rs.pagesize
rs.absolutepage = page	
%>
                            <tr>
                              <%
		Dim hang, idx
		hang = 4
		idx = 0
		while not rs.eof and mypagesize>0
		%>
                              <td align="center" style="padding-top:15px; padding-left:10px" valign="top"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td bgcolor="#FFFFFF"><a href="pro_<%=rs("product_id")%>.html" target="_blank"> <img src="<%=rs("S_IMAGE")%>" width="150" border=0  style="border:#E3E3E3 1px solid; padding:2px;"/></a></td>
                                </tr>
                                <tr>
                                  <td height="30" align="center" bgcolor="#FFFFFF" class="font"><a class=h12_20 href="pro_<%=rs("product_id")%>.html" target="_blank"><%=rs("product_name")%></a></td>
                                </tr>
                              </table></td>
                              <%  
	mypagesize=mypagesize-1                        
	idx = idx + 1
		if idx mod hang = 0 then
		response.write "</tr><tr>"
		end if
	rs.MoveNext
	wend 
	%>
                            </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td height="52" align="center">
                            <table border="0" cellspacing="0" cellpadding="0" class="font">
                              <tr>
                                <td align="center" height="22"><div id="pageClass3">
                                  <ul>
                                    <% for k=1 to rs.pagecount%>
                                    <% if k=page then%>
                                    <strong><%=k%></strong>
                                    <%else 
				
				   if smalltype<>"" then %>
                                    <a href="search.asp?page<%=k%>"><%=k%></a>
                                    <% else %>
                                    <a href="search.asp?page<%=k%>"><%=k%></a>
                                    <%
				 end if
				end if%>
                                    <% next %>
                                  </ul>
                                </div></td>
                              </tr>
                              <%
end if
rs.close
set rs=nothing%>
                            </table></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>

<!--#include file="bottom.html"-->

</body>
</html>