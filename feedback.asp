<!DOCTYPE html PUBLIC "-//W3C//Dtd html 4.01 transitional//EN" "http://www.w3c.org/tr/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
                          <td><a href="contactus.html"><img src="images/inLinkImg.JPG" alt="联系我们" width="210" height="68" border="0"></a></td>
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
                                  <td width="5" height="10">&nbsp;</td>
                                  <td width="678"><img src="images/024.jpg" width="194" height="27"></td>
                                  <td width="262" align="right"><A href="index.html">首页</A>　&gt;　<A href="aboutus.html">关于我们</A> &gt;　<A href="sales.html">营销网络</A></td>
                                </tr>
                              </table></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>
                      <td valign="top"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <td valign="top" style="line-height:25px"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                              <tr>
                                <td align="left" valign="top" style="padding-left:1px;"><table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#EDEDED" bgcolor="#FFFFFF">
                             
            <form action="messagesave.asp" method="post" name="myform" id="myform" onSubmit="return add()">
         <input name="mymail" type="hidden" value="1293698738@qq.com" />
                                    <tr bgcolor="#DDDDDD">
                                      <td height="30" colspan="2" bgcolor="#FFFFFF" class="BS"><label>&nbsp;尊敬的客户，请您于此处填下您的<span class="INPUT">详细信息</span>，谢谢！</label></td>
                                    </tr>
                                    <tr>
                                      <td height="10" colspan="2" align="left"></td>
                                    </tr>
                                    <tr>
                                      <td height="25" align="left">&nbsp;&nbsp;您的姓名：</td>
                                      <td height="30">&nbsp;
                                        <input class="nb7" name="user" type="text" id="user" size="20" maxlength="10" />
                                        &nbsp;</td>
                                    </tr>
                                    <tr>
                                      <td height="25" align="left">&nbsp;&nbsp;联系电话：</td>
                                      <td height="30">&nbsp;
                                        <input class="nb7" name="phone" type="text" id="phone" size="30" maxlength="15" />
                                        &nbsp;</td>
                                    </tr>
                                    <tr>
                                      <td height="25" align="left">&nbsp;&nbsp;所在单位：</td>
                                      <td height="30">&nbsp;
                                        <input class="nb7" name="company" type="text" id="company" size="40" />
                                        &nbsp;&nbsp;</td>
                                    </tr>
                                    <tr bgcolor="#DDDDDD">
                                      <td height="30" colspan="2" bgcolor="#FFFFFF" class="BS"><label>&nbsp;尊敬的客户，请您于此处填下您的<span class="INPUT">详细订单</span>，谢谢！</label></td>
                                    </tr>
                                    <tr>
                                      <td height="10" colspan="2" align="left"></td>
                                    </tr>
                                    <tr>
                                      <td height="25" align="left">&nbsp;&nbsp;产品名称：</td>
                                      <td height="30">&nbsp;
                                        <input class="nb7" name="title" type="text" id="title" size="40" /></td>
                                    </tr>
                                    <tr>
                                      <td height="25" align="left">&nbsp;&nbsp;<span class="SS">订单</span>数量：</td>
                                      <td height="30">&nbsp;
                                        <input class="nb7" name="suliang" type="text" id="suliang" size="10" maxlength="10" onKeyUp="value=value.replace(/[^\d]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" /></td>
                                    </tr>
                                    <tr>
                                      <td height="25" align="left"><span class="SS">&nbsp;&nbsp;订单地址：</span></td>
                                      <td height="30">&nbsp;
                                        <input class="nb7" name="address" type="text" id="address" size="50" /></td>
                                    </tr>
                                    <tr>
                                      <td align="left" valign="top">&nbsp;&nbsp;详细备注：</td>
                                      <td>&nbsp;
                                        <textarea name="content" cols="65" rows="5" id="content"></textarea></td>
                                    </tr>
                                    <tr bgcolor="#EDEDED">
                                      <td height="30" colspan="2" align="center" bgcolor="#FFFFFF"><input name="submit" type="submit" class="INPUT" id="Submit" value="我要订购" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input name="submit" type="reset" class="INPUT" id="Submit" value="取消订单" /></td>
                                    </tr>
                                  </form>
                                </table></td>
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
<SCRIPT language=JavaScript>
<!--
function checkform(){

	if (thisForm.tel.value.length < 4 || thisForm.tel.value.length>20)
        {
        alert("请在输入有效的联系电话！");
		document.thisForm.tel.focus();
        return false;
        }
	if (thisForm.namee.value.length < 2 || thisForm.namee.value.length>4)
        {
        alert("请填写您的姓名，必须为２－４个字符！");
		document.thisForm.namee.focus();
        return false;
        }	
	if (thisForm.address.value.length < 6 || thisForm.address.value.length>50)
        {
        alert("请输入联系地址，必须为６－5０个字符！");
		document.thisForm.address.focus();
        return false;
        }		
	if (document.thisForm.msg.value == "")
        {
        alert("请填写订单详细内容！");
		document.thisForm.msg.focus();
        return false;
        }
}
//-->
</SCRIPT>

</body>
</html>