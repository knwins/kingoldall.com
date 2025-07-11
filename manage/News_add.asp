<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
<% 
	dim product_name,orders,content,sql
	product_name = request.form("product_name")
	orders       = request.form("orders")
	content      = request.form("content")
	types        = request.form("types")
	if request.form("s_image")<>"" then
	s_image        = request.form("s_image")
	else
	s_image=""
	end if
  sql = "insert into news(product_name,ver,content,orders,type,createdate,s_image,hit)values('"
  sql = sql & product_name&"','"&session("ver")&"','"&content&"', '"&orders&"', '"
  sql = sql &types&"', '"&now()&"','"&s_image&"',0)"
  response.write sql
  conn.execute (sql)
  response.redirect "news_list.asp"
%>
