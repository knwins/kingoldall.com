<!DOCTYPE html PUBLIC "-//W3C//Dtd html 4.01 transitional//EN" "http://www.w3c.org/tr/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="fconn.asp"-->
<%
if request("type")<>""then
typeid=int(request("type"))
set rs1=server.createobject("adodb.recordset")
sql1="select * from news_cate where id="&typeid
rs1.open sql1,conn,1,1
typenames=rs1("typename")
filename=rs1("filename")
rs1.close
set rs1=nothing
else 
typenames="新闻列表"
filename="news"
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
                        <tr>
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
                      <td  height="28">联系人：</td>
                      <td width="75%">黄小姐</td>
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
                                  <td height="25">网 址： </td>
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
                                  <td width="5" height="10">&nbsp;</td>
                                  <td width="678"><img src="images/019.jpg" width="194" height="27"></td>
                                  <td width="262" align="right"><A href="index.html">首页</A>　&gt;　<%=typenames%></td>
                                </tr>
                              </table></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>
                      <td valign="top"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <td valign="top" style="line-height:25px"><table width="760" border="0" align="center" cellpadding="0" cellspacing="0" style=" padding-top:5px; padding-bottom:5px; margin-top:0px">
                              <%  
	page=clng(request("page"))		 
	set rs=server.createobject("adodb.recordset") 
	if request("type")<>"" then
	sql="select * from news where type="&typeid&" and ver='cn' order by product_id desc "
	rs.open sql,conn,1,1
	else
	sql="select * from news where ver='cn' order by product_id desc"
	rs.open sql,conn,1,1
	end if
	
	
    if rs.eof and rs.bof then
     response.write("暂时没有记录")
     else 
	rs.pagesize=12
	if page=0 then page=1 
	pages=rs.pagecount
	if page > pages then page=pages
	rs.absolutepage=page  
	for j=1 to rs.pagesize 
%>
                              <tr>
                                <td width="3%" height="24" align="center" style="border-bottom: #999999 1px dotted"><img src="images/icon_arr4.gif" width="4" height="7" /></td>
                                <td width="97%" height="35" align="left" style="border-bottom: #999999 1px dotted"><a href="news_<%= rs("product_id")%>.html"><%= rs("product_name") %></a>　<font color="#999999">[<%= rs("createdate") %>] 浏览
                                  <script src="counts.asp?id=<%=rs("product_id")%>" language="javascript"></script>
                                  次</font></td>
                              </tr>
                              <%
rs.movenext
if rs.eof then exit for
next
end if
%>
                              <tr valign="bottom">
                                <td height="50" colspan="2" align="center" ><div class="order">
                                  <%
			
				if page>=2 then
				
				response.Write"<a href="&filename&"_"&page-1&".html><<</a>"
				else 
				response.Write "<a><<</a>"
				end if
				
				for n=1 to rs.pagecount
				response.Write "<a href="&filename&"_"&n&".html>"&n&"</a>"
				next
				
				
				if rs.pagecount-page<0 then
				response.Write"<a href="&filename&"_"&page+1&".html>>></a>"
				else 
				response.Write "<a>>></a>"
				end if
			
			rs.close
set rs=nothing
			%>
                                </div></td>
                              </tr>
                            </table></td>
                          </tr>
                          <tr>
                            <td valign="top" >&nbsp;</td>
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