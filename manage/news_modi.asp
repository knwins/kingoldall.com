<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
<% 
	dim rs, product_id, product_name, content, intro, commend, orders
	product_id  = replace(request("id"),"'","")
	page=clng(request("topage"))
	typeids=request("typeids")

	set rs=server.createobject("adodb.recordset")
	rs.open "select * from news where product_id = "& product_id &" order by orders,createdate desc",conn,1
	product_name = rs("product_name")
	content      = rs("content")
	orders       = rs("orders")
	types        = rs("type")
	intro        = rs("intro")
	s_image        = rs("url")
	createdate   = rs("createdate")
	rs.close
	set rs = nothing
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel=stylesheet type="text/css" href="js/media.css">
<link rel=stylesheet type="text/css" href="js/form_media.css">
<!--kindeditor starts-->
<link rel="stylesheet" href="kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="kindeditor/plugins/code/prettify.js"></script>
<script>
var editor;
		
	KindEditor.ready(function(K) {
	
	//editor start
	var editor = K.create('textarea[name="content"]', {
	cssPath: 'kindeditor/plugins/code/prettify.css',
	uploadJson: 'kindeditor/upload_json.asp',
	fileManagerJson: 'kindeditor/file_manager_json.asp',
	allowFileManager: true,
	afterBlur: function(){this.sync();}
	});
    //editor end
	
	//prettyPrint()
	});

	</script>
<!--kindeditor end-->
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
</head>
<body>
<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="35"><font color="#FF0000">��ǰλ�ã�<%=request("nbmc")%> --����ҵ��Ϣ������</font>������<font color="#FF0000">*</font>��Ϊ����� </td>
  </tr>
</table>
<table border="1" width="90%" align="center" bordercolorlight="#c0c0c0" cellspacing="1" cellpadding="3" bordercolordark="#ffffff" >
  <form name="myform" action="news_modi_ok.asp" method=post>
    <input type=hidden name="product_id" value="<%=product_id%>">
	<input type=hidden name="typeids" value="<%=typeids%>">
	<input type=hidden name="page" value="<%=page%>">
    <tr>
      <td>��ţ�</td>
      <td><input name=orders size="40" value="<%=orders%>">
          <font color=red>������Ϊ���֣�����ԽСԽ��ǰ��</font></td>
    </tr>
    <tr>
      <td width="12%">���ű��⣺</td>
      <td width="88%"><input name=product_name size="60" value="<%=product_name%>"></td>
    </tr>
    <tr>
      <td align="left">����ͼƬ��</td>
      <td bordercolorlight="#C0C0C0" bordercolordark="#FFFFFF"> <input name="s_image" size=35 maxlength=50 value="<%=s_image%>">
              <input name="Submit" type="button" onClick="window.open('../upload_flash.asp?formname=myform&editname=s_image&uppath=pro_img/news&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="Сͼ">
          <font color=red>��ע����֧����������С��200KB��</font> </td>
    </tr>
    <tr>
      <td width="12%">���</td>
      <td width="88%"><select name="types">
        <%call getchiled(cint(types),1)%>
      </select>      </td>
    </tr>
    <tr align="center">
      <td align="left">����˵����</td>
      <td align=left valign="top" class="unnamed2" bgcolor="#ffffff"><textarea name="intro" cols="50" rows="4" id="intro"><%=intro%></textarea></td>
    </tr>
    <tr align="center">
      <td>���ݣ�</td>
      <td align=left valign="top" class="unnamed2" bgcolor="#ffffff"><textarea name="content" style="width:700px;height:450px;visibility:hidden;"><%=CONTENT%></textarea>   </td>
    </tr>
    <tr>
      <td class="font" height="28" colspan="2" >
	  <p align="center">
        <input type="submit" name="add" value=" �޸� " >
        <input type="button" name="back" value=" ���� " onClick="history.back();">
      </td>
    </tr>
  </form>
</table>
</body>
</html>

<%
sub	getchiled(cateid,level)
		set rschiled=server.createobject("adodb.recordset")
		rschiled.open "select * from news_cate where ver='"&session("ver")&"' order by listorder desc",conn,1
		while not rschiled.eof
			if rschiled("id") = cateid then
				str1="<option value="""& rschiled("id") &  """selected>" 
			else
				str1="<option value="""& rschiled("id") &  """>" 
			end if
			call list(rschiled("typename"), str1,level)
			rschiled.movenext
		wend
		rschiled.close
		set rschiled=nothing
end sub

sub	list(catename, str,level)
		dim space
		for i=1 to level
			space=space+""
		next
		str2=catename & "</option>"
		str=str & space & str2
		response.write str
end sub
%>
