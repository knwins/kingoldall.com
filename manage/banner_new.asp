<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
<html>
<head>
<title>��̨���ݹ�������</title>
<meta http-equiv="content-type" content="text/html; charset=gb2312">
<link rel=stylesheet type="text/css" href="js/media.css">
<link rel=stylesheet type="text/css" href="js/form_media.css">
</head>
<body bgcolor="#ffffff" leftmargin=0 topmargin=0 >
<br>
<table border="1" width="90%" align="center" bordercolorlight="#c0c0c0" cellspacing="1" cellpadding="3" bordercolordark="#ffffff" >
  <form name="myform" action=banner_add.asp method=post>
    <tr>
      <td width="20%" align="center">���⣺</td>
      <td width="80%"><input name=title id="title" size="60"></td>
    </tr>
    <tr align="center">
      <td>ͼƬ��Ϣ��</td>
      <td align="left" bordercolorlight="#C0C0C0" bordercolordark="#FFFFFF"><input name=p_image id="p_image" size=35 maxlength=50>
          <input name="Submit" type="button" onClick="window.open('../upload_flash.asp?formname=myform&editname=p_image&uppath=pro_img/banner&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="�ϴ�">
          <br>
          <br>
          <font color=red>��ע����֧����������С��200KB ͼƬ��С��1002*320 ��</font> </td>
    </tr>
    <tr align="center">
      <td>ͼƬ���ӣ�</td>
      <td width="80%" align="left" bordercolorlight="#C0C0C0" bordercolordark="#FFFFFF"><input name=url id="url" size="60"></td>
    </tr>
    <tr>
      <td class="font" height="28" width="80%" colspan="2" ><p align="center">
          <input type="submit" name="add" value=" ��� " >
          <input type="reset" name="reset" value=" ��д ">
      </td>
    </tr>
  </form>
</table>
</body>
</html>