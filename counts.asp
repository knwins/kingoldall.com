<!--#include file="fconn.asp"-->
<%
id=request("id")
Set rs= Server.CreateObject("ADODB.Recordset")
sql="select * from [news] where product_id="&id&""  
rs.open sql,conn,1,1
hit=rs("hit")
%>
document.write(<%=hit%>)
