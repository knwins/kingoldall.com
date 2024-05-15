<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
<%
dim rs_pro,sqlpro
sqlpro="select * from site where id=1"
Set rs_pro= Server.CreateObject("ADODB.Recordset")
rs_pro.open sqlpro,conn,1,1

url=rs_pro("url")
key1=rs_pro("keyword1")
key2=rs_pro("keyword2")
key3=rs_pro("keyword3")
key4=rs_pro("keyword4")


rkey1="<a href="&url&" target=_blank>"&key1&"</a>"
rkey2="<a href="&url&" target=_blank>"&key2&"</a>"
rkey3="<a href="&url&" target=_blank>"&key3&"</a>"
rkey4="<a href="&url&" target=_blank>"&key4&"</a>"


set rs=server.createobject("adodb.recordset")
sql="select * from news where ver='cn'"
rs.open sql,conn,3,2				 	
do while not rs.eof
newsid=rs("product_id")
content=removehtml(rs("content"))
content=replace(content,key1,rkey1)
content=replace(content,key2,rkey2)
content=replace(content,key3,rkey3)
content=replace(content,key4,rkey4)

'response.End()
set rss=server.createobject("adodb.recordset")
sqls="select * from news where product_id="&newsid
rss.open sqls,conn,3,2
rss("content")=content
rss.update
response.Write "¹ýÂË³É¹¦<br>"

rs.movenext
loop
rs.close
set rs=nothing


function removehtml(strhtml) 
	dim objregexp, match, matches 
	set objregexp = new regexp 
	objregexp.ignorecase = true 
	objregexp.global = true 
	objregexp.pattern = "<a[^>]+>(.+?)<\/a>"
	set matches = objregexp.execute(strhtml) 
	for each match in matches 
	strhtml=replace(strhtml,match.value,"") 
	next 
	strhtml=replace(strhtml,"&nbsp;","")
	strhtml=replace(strhtml,"¡¡¡¡","")
	removehtml=strhtml 
	set objregexp = nothing 
	end function

%>