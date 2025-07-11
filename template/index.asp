<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
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
<noscript>
&lt;iframe src=*.html&gt;&lt;/iframe&gt;
</noscript>
<script src="js/q.js" type="text/javascript" charset="utf-8"></script>
<SCRIPT src="js/jquery-1.8.3.min.js"></SCRIPT>
<script type="text/javascript" src="js/flash.js"></script>
<style type="text/css">
<!--
.h {
	font-size: 16px;
	font-weight: bold;
	color: #333333;
}
.STYLE3 {
	font-size: 14px;
	font-weight: bold;
}
-->
.news_sy_left {
	height: 22px;
	overflow: hidden;
	float: left;
}
.news_sy_left img {
	margin: 3px 10px 0px 4px;
	float: left;
	display: inline;
}
.news_sy_left ul {
	float: left;
	display: block;
	list-style-type: none;
}
.news_sy_left li {
	height: 22px;
	display: block;
}
.news_sy_left a {
	color: rgb(51, 51, 51);
	text-decoration: none;
}
.news_sy_left a:hover {
	color: rgb(50, 173, 233);
	text-decoration: underline;
}
.new_m_r {
	margin-right: 12px;
}
</style>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/jquery.index.js"></script>
<script language="javascript" src="js/flash.js" type="text/javascript"></script>
<script src="js/logger.js"></script>
<link href="js/bdsstyle.css" rel="stylesheet" type="text/css">
</head>

<body>
<!--#include file="top.asp"-->
<table width="1003" border="0" align="center" cellpadding="0" cellspacing="0">
  <tbody>
    <tr>
      <td valign="top" background="images/XXS.GIF" style=" background-position:right; background-repeat:repeat-y;"><div align="left">
          <table width="220" border="0" align="center" cellpadding="0" cellspacing="0">
            <tbody>
              <tr>
                <td width="210" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tbody>
                      <tr valign="middle">
                        <td height="32" background="images/left-bg1.jpg" class="font1">��Ʒ����<span class="en">��PRODUCT LIST </span></td>
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
  { alert ("�ؼ��ֲ���Ϊ��!!");
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
                        <td height="32" background="images/left-bg1.jpg" class="font1">��Ʒ����<span class="en">��SEARCH </span></td>
                      </tr>
                      <tr>
                        <form action="">
                        <td align="center" background="images/yewu_bg.jpg"><table width="90" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px; margin-bottom:10px">
                        <tr>
                          <td width="74%" align="left"><INPUT class=nb7
      onblur="this.value = this.value =='' ? '����ؼ���...' : this.value" 
      onclick="this.value='';" value=����ؼ���... id=keys> </td>
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
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tbody>
                            <tr valign="middle">
                              <td height="32" background="images/left-bg1.jpg" class="font1">������Ѷ<span class="en">��NEWS </span></td>
                            </tr>
                            <tr valign="middle">
                              <td height="8"></td>
                            </tr>
                            <tr>
                              <td><img src="images/left-top.jpg" width="210" height="11"></td>
                            </tr>
                            <tr>
                              <td align="center" background="images/left-bg.jpg"><table width="170" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                                <tbody>
                                  <tr>
                                               <%
set rs=server.createobject("adodb.recordset")
sql="select top 9 * from news where ver='cn' and type<>33 order by product_id desc"
rs.open sql,conn,1,1				 	
%>
                                <%i=0
do while not rs.eof%>
     
                                    <td width="191" height="1"></td>
                                  </tr>
                                  <tr>
                                    <td height="27" align="left"><img src="images/2.gif" width="5" height="9">&nbsp;<a href="news_<%= rs("product_id")%>.html"> <%=left(rs("product_name"),12)%>...</a> </a></td>
                                  </tr>
                                  <tr>
                                    <td height="1" align="left" background="images/n_1.jpg"></td>
                                  </tr>
                                                  <%rs.movenext
i=i+1
if i=9 then exit do
loop
rs.close
set rs=nothing %>
                           </tbody>
                              </table></td>
                            </tr>
                            <tr>
                              <td height="11"><img src="images/left-end.jpg" width="210" height="11"></td>
                            </tr>
                          </tbody>
                        </table></td>
                      </tr>
                    </tbody>
                </table></td>
                <td width="10" background="images/XXS.GIF" style=" background-position:right; background-repeat:repeat-y;"></td>
              </tr>
            </tbody>
          </table>
          <br>
        </div>
        
        </td>
      <td valign="top" style="padding-left:10px; padding-right:10px;"><table width="548" border="0" align="right" cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td width="548"></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tbody>
                    <tr>
                      <td><img src="images/t-1.jpg" width="250" height="38"></td>
                      <td align="right" valign="middle"><a href="aboutus.html"><img src="images/more.jpg" width="29" height="13" border="0"></a></td>
                    </tr>
                    <tr>
                      <td height="2" colspan="2" background="images/line.gif"></td>
                    </tr>
                  </tbody>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="1" cellspacing="0" cellpadding="0">
                  <tbody>
                    <tr>
                      <td style="padding-left:5px; padding-top:5px; padding-right:5px; padding-bottom:5px;"><table cellspacing="0" cellpadding="0" width="100%" border="0">
                          <tbody>
                            <tr>
                         
                              <td valign="top" class="table_shang">
                                      
                                      
                                      <div style="width:520px; margin-right:5px; padding-left:5px; padding-right:8px;"><img src="images/index_68.jpg" width="151" height="128" style="float:left; padding-right:10px; padding-left:0px"/> <span  style="line-height:23px; font-size:12px;"><P> <%
cname="��˾���"
set rs=server.createobject("adodb.recordset")
sql="select * from company where cname='"&cname&"'"
rs.open sql,conn,1,1
content=RemoveHTML(rs("content"))
rs.close
set rs=nothing%>
                                      <%=left((content),285)%>��</P>
</span></div></td>
                            </tr>
                          </tbody>
                        </table></td>
                    </tr>
                  </tbody>
              </table></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tbody>
                    <tr>
                      <td><img src="images/t-2.jpg" width="250" height="38"></td>
                      <td align="right" valign="middle"><a href="/products.asp"><img src="images/more.jpg" width="29" height="13" border="0"></a></td>
                    </tr>
                    <tr>
                      <td height="2" colspan="2" background="images/line.gif"></td>
                    </tr>
                  </tbody>
              </table></td>
            </tr>
            <tr>
              <td  valign="top"><iframe src="gun.asp" name="mq" width="544" marginwidth="0" height="280" marginheight="0" scrolling="No" frameborder="no" id="mq"></iframe></td>
            </tr>
          </tbody>
      </table></td>
     
      <td width="220" align="center" valign="top">
      
      <table width="210"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tbody>
            <tr >
              <td>
                <div id=imgADPlayer style=" margin-bottom:10px; BORDER-RIGHT: #d8e3e9 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #d8e3e9 1px solid; PADDING-LEFT: 2px; BACKGROUND: #ffffff; PADDING-BOTTOM: 2px; BORDER-LEFT: #d8e3e9 1px solid; PADDING-TOP: 2px; BORDER-BOTTOM: #d8e3e9 1px solid"></div>
                  <script>                <%

set rs=server.createobject("adodb.recordset")
sqlnew="select top 4 * from product where ver='cn' and commend=1 order by orders asc"
rs.open sqlnew,conn,1,1	
i=0
do while not rs.eof%>
				PImgPlayer.addItem( "<%=left(rs("product_name"),20)%>", "pro_<%=rs("product_id")%>.html", "<%=rs("s_image") %>"); 
	                     <%rs.movenext
i=i+1
if i=4 then exit do
loop
rs.close
set rs=nothing %>
		PImgPlayer.init( "imgADPlayer", 200, 180 );   
	</script></td>
            </tr>
            <tr>
              <td ><a href="contactus.html"><img src="images/inLinkImg.jpg" alt="��ϵ����" width="210" height="68" border="0"></a></td>
            </tr>
            <tr>
              <td height="7"></td>
            </tr>
            <tr>
              <td height="100%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="text-align:left">
                  <tbody>
                    <tr>
                      <td colspan="2" height="25"><span class="STYLE3"> �����н��Ȫ�Ƽ����޹�˾ </span></td>
                    </tr>
					
                    <tr>
                      <td height="25">�� ַ��</td>
                      <td>����������������������·3��</td>
                    </tr>
					<tr>
                      <td width="25%" height="25">��ϵ�ˣ�</td>
                      <td width="75%">��С��</td>
                    </tr>
                    <tr>
                      <td height="25">�� ����</td>
                      <td>0755-89328010</td>
                    </tr>
                     <tr>
                      <td height="25">�� �棺</td>
                      <td>0755-89328010</td>
                    </tr>
                     <tr>
                      <td height="25">�� ����</td>
                      <td>13724362190</td>
                    </tr>
                    <tr>
                      <td height="25">�� ַ�� </td>
                     <td><a href="http://www.kingoldall.com/">www.kingoldall.com</a></td>
                    </tr>
                    <tr>
                      <td height="10"></td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tbody>
                    <tr>
                      <td height="32" background="images/left-bg1.jpg" class="font1">��������</td>
                    </tr>
                    <tr>
                      <td height="5"></td>
                    </tr>
                    <tr>
                      <td align="center"><img src="images/image1.png" width="203" height="122"></td>
                    </tr>
                  </tbody>
              </table></td>
            </tr>
          </tbody>
      </table></td>
    </tr>
  </tbody>
</table>

<!--#include file="bottom.html"-->
</body>
</html>