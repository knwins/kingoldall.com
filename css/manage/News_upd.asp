<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
<% 
	dim product_id,product_name,content,intro,orders,sql,content1
	product_id    = request.form("product_id")
	product_name  = request.form("product_name")
	content       = request.form("content")
	orders        = request.form("orders")
	if request.form("s_image")<>"" then
	s_image        = request.form("s_image")
	else
	s_image=""
	end if
	types         = request.form("types")
%>

<%
	sql = "update news set product_name = '"&product_name&"',content = '"&content&"',s_image = '"&s_image&"',createdate = '"&date()&"',"
	sql = sql & "orders = '"&orders&"',"
	sql = sql & "type = '"&types&"'"
	sql = sql & " where product_id = "&product_id
	response.write sql
	conn.execute (sql)
	response.write "更新成功！"
	response.write "<script>window.opener.location.reload();</script>"
	response.redirect "news_list.asp?currentpage="&session("page")&""
%>

