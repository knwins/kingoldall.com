<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
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
</head>
<body>
<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="28"><font color="#FF0000">��ǰλ�� --��������ҵ��Ϣ</font>��������������<font color="#FF0000">*</font>��Ϊ����� </td>
  </tr>
  <tr>
    <td height="1" bgcolor="#4E6A82"></td>
  </tr>
</table>
<table border="1" width="90%" align="center" bordercolorlight="#c0c0c0" cellspacing="1" cellpadding="3" bordercolordark="#ffffff" >
  <form name="myform" action=add_news_ok.asp method=post>
    <tr>
      <td width="20%">��ţ�</td>
      <td width="80%"><input name=orders size="40" value="0">
        <font color=red>������Ϊ���֣�����ԽСԽ��ǰ��</font></td>
    </tr>
    <tr>
      <td width="20%" align="left">���ű��⣺</td>
      <td width="80%"><input name=product_name id="product_name" size="60"></td>
    </tr>
    <tr>
      <td align="left">����ͼƬ��</td>
      <td width="562" bordercolorlight="#C0C0C0" bordercolordark="#FFFFFF"><input name=s_image size=35 maxlength=50 value="">
          <input name="Submit" type="button" onClick="window.open('../upload_flash.asp?formname=myform&editname=s_image&uppath=pro_img/s&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="Сͼ">
          <font color=red>��ע����֧����������С��200KB��</font> </td>
    </tr>
    <tr>
      <td width="20%" align="left">���</td>
      <td width="80%"><select name="types">
          <%call showtype()%>
        </select>      </td>
    </tr>
    <tr align="center">
      <td align="left">����˵����</td>
      <td align=left valign="top" class="unnamed2" bgcolor="#ffffff"><textarea name="intro" cols="50" rows="4" id="intro"></textarea></td>
    </tr>
    <tr align="center">
      <td>���ݣ�</td>
       <td align=left valign="top" class="unnamed2" bgcolor="#ffffff"><textarea name="content" style="width:700px;height:450px;visibility:hidden;"><%=CONTENT%></textarea></td>
    </tr>
    <tr>
      <td class="font" height="28" width="20%" colspan="2" ><p align="center">
          <input type="submit" name="add" value=" ��� " >
          <input type="reset" name="reset" value=" ��д ">
      </td>
    </tr>
  </form>
</table>
</body>
</html>
<%
sub showtype()
	set rscate=server.createobject("adodb.recordset")
	rscate.open "select * from news_cate where ver='"&session("ver")&"' order by listorder asc",conn,1
	while not rscate.eof
		str1="<option value="""& rscate("id") & """>" & rscate("typename") & "</option>"
		response.write str1
		rscate.movenext
	wend 
	rscate.close
	set rscate=nothing
end sub
%>
