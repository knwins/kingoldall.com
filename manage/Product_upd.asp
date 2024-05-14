<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
	<% 
	dim product_id, PRODUCT_NAME, CONTENT, INtrO, ORDERS, S_IMAGE, B_IMAGE, sql, CONTENT1
	TYPENAMES = Request.Form("TYPENAME")
	product_id    = Request.Form("product_id")
	PRODUCT_NAME  = Request.Form("PRODUCT_NAME")
	CONTENT       = Request.Form("content")
	INtrO         = Request.Form("INtrO")
	ORDERS        = Request.Form("ORDERS")
	COMMEND       = Request.Form("COMMEND")
	COMMENDA       = Request.Form("COMMENDA")
	S_IMAGE       = Request.Form("S_IMAGE")
	B_IMAGE       = Request.Form("B_IMAGE")
	TYPES         = Request.Form("TYPES")
	
	set RS_BIG=server.CreateObject("ADODB.RecordSet")
	RS_BIG.open "select * from product_cate WHERE pro_cate_id= "&TYPES &"" ,conn,1
	BIGTYPE=RS_BIG("ROOT_ID")
	RS_BIG.close
	set RS_BIG=nothing
	
	if INtrO = "" then
	INtrO = 0
	end if
	
	if COMMEND = "" then
	COMMEND = 0
	else
	COMMEND = 1
	end if
	
	if COMMENDA = "" then
	COMMENDA = 0
	else
	COMMENDA = 1
	end if

set rs=server.createobject("adodb.recordset") 
sql="select * from product where product_id="&product_id
rs.open sql,conn,1,3 
rs("PRODUCT_NAME")=PRODUCT_NAME
rs("COMMEND")=COMMEND
rs("COMMENDA")=COMMENDA
rs("TYPENAME")=TYPENAMES
rs("BIGTYPE")=BIGTYPE
rs("CONTENT")=CONTENT
rs("ORDERS")=ORDERS
rs("S_IMAGE")=S_IMAGE
rs("INtrO")=INtrO
rs("B_IMAGE")=B_IMAGE
rs("TYPE")=TYPES
rs.update
rs.close
set rs=nothing
	Response.Write sql
	conn.Execute (sql)
	Response.Write "更新成功！"
	response.write "<script>window.opener.location.reload();</script>"
	Response.Redirect "Product_List.asp?currentpage="&session("page")&""
%>
<%CloseDatabase%>