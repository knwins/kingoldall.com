<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
	<% 
	dim PRODUCT_NAME, ORDERS, CONTENT, INtrO, COMMEND, COMMENDA, S_IMAGE, B_IMAGE, sql
	PRODUCT_NAME = Request.Form("PRODUCT_NAME")
	ORDERS       = Request.Form("ORDERS")
	INtrO        = Request.Form("INtrO")
	CONTENT      = Request.Form("content")
	COMMEND      = Request.Form("COMMEND")
	COMMENDA      = Request.Form("COMMENDA")
	S_IMAGE      = Request.Form("s_image")
	B_IMAGE      = Request.Form("B_IMAGE")' ��ͼƬ
	TYPES        = Request.Form("TYPES")
	
	if INtrO = "" then
	INtrO = 0
	end if
	if COMMEND = "checkbox" then 
	COMMEND = 1
	else 
	COMMEND = 0
	end if
	
	if COMMENDA = "checkbox" then 
	COMMENDA = 1
	else 
	COMMENDA = 0
	end if
	
	set rss=server.createobject("adodb.recordset") 
	sqls="select * from product_cate where pro_cate_id="&TYPES&""
	rss.open sqls,conn,1,3 
	bigtype=rss("root_id")


set rs=server.createobject("adodb.recordset") 
sql="select * from product"
rs.open sql,conn,1,3 
rs.addnew
rs("PRODUCT_NAME")=PRODUCT_NAME
rs("COMMEND")=COMMEND
rs("COMMENDA")=COMMENDA
rs("CONTENT")=CONTENT
rs("ORDERS")=ORDERS
rs("S_IMAGE")=S_IMAGE
rs("INtrO")=INtrO
rs("B_IMAGE")=B_IMAGE
rs("TYPE")=TYPES
rs("BIGTYPE")=bigtype
rs("ver")=session("ver")
rs.update
rs.close
set rs=nothing
	Response.Write sql
	conn.Execute (sql)
	Response.Redirect "Product_List.asp"
	%>

<%CloseDatabase%>


