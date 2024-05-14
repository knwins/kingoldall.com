<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%
Response.ExpiresAbsolute=Now()-1 
response.buffer=true   
Response.Expires=0   '使缓存的页面立即过期   
Response.Clear   '清空存储在缓存中的页面


rooturl="http://www.haisinda.com/en/"

if SaveFile("/en/index.html",rooturl&"template/index.asp") then 
response.write "首页生成成功"
response.write "<br>"
else 
Response.write "首页没有生成" 
end if 

if SaveFile("/en/contactus.html",rooturl&"template/contactus.asp") then 
response.write "联系我们生成成功"
response.write "<br>"
else 
Response.write "联系我们没有生成" 
end if 

if SaveFile("/en/aboutus.html",rooturl&"template/aboutus.asp") then 
response.write "关于我们生成成功"
response.write "<br>"
else 
Response.write "关于我们没有生成" 
end if 

if SaveFile("/en/zizhi.html",rooturl&"template/zizhi.asp") then 
response.write "企业资质生成成功"
response.write "<br>"
else 
Response.write "企业资质没有生成" 
end if 
 
if SaveFile("/en/question.html",rooturl&"template/question.asp") then 
response.write "常见问题生成成功"
response.write "<br>"
else 
Response.write "常见问题没有生成" 
end if 
 

'===========信息中心列表页======'
Set rs_news_cate= Server.CreateObject("ADODB.Recordset")
sql_news_cate="select * from news_cate where ver='en'"
rs_news_cate.open sql_news_cate,conn,1,1
do while not rs_news_cate.eof
news_id=rs_news_cate("id")
newsname=rs_news_cate("filename")    
	Set rs_news= Server.CreateObject("ADODB.Recordset")
	sql_news="select * from news where type="&news_id&" and ver='en'"
	rs_news.open sql_news,conn,1,1

	do while not rs_news.eof
	   PageSize=12
	   PageCount = Int(rs_news.RecordCount / PageSize*-1)*-1
	   
		for k=1 to PageCount
		if SaveFile("/en/"&newsname&"_"&k&".html",rooturl&"template/news.asp?type="&news_id&"&page="&k&"") then
		end if 
		next
		k=k+1
			
	
	if SaveFile("/en/"&newsname&".html",rooturl&"template/news.asp?type="&news_id&"") then   
	end if 
	
	rs_news.movenext
	loop
	rs_news.close
	set rs_news=nothing
	
rs_news_cate.movenext
loop
rs_news_cate.close
set rs_news_cate=nothing

'===========信息中心列表页======'


'===========信息内容页======'
dim rspro,sqlpro,id,nb
sqlpro="select * from news where ver='en'"
Set rspro= Server.CreateObject("ADODB.Recordset")
rspro.open sqlpro,conn,3,2
do while not rspro.eof
product_id=rspro("product_id")
types=rspro("type")
			if SaveFile("/en/news_"&product_id&".html",rooturl&"template/newsinfo.asp?id="&product_id&"&types="&types&"") then 
			response.write "内容页已生成"
			response.write "<br>"
			else 
			Response.write "内容页没有生成" 
			end if 
rspro.movenext
loop
rspro.close
set rspro=nothing




'===========信息内容页======'	

function SaveFile(LocalFileName,RemoteFileUrl) 
Dim Ads, Retrieval, GetremoteData 
On Error Resume Next 
Set Retrieval = Server.CreateObject("Microso" & "ft.XM" & "LHTTP") 
With Retrieval 
.Open "Get", RemoteFileUrl, False, "", "" 
.Send 
GetremoteData = .Responsebody 
End With 
Set Retrieval = Nothing 
Set Ads = Server.CreateObject("Ado" & "db.Str" & "eam") 
With Ads 
.Type = 1 
.Open 
.Write GetremoteData 
.SaveToFile Server.MapPath(LocalFileName), 2 
.Cancel() 
.Close() 
End With 
Set Ads=nothing
 
	if err <> 0 then 
	SaveFile = false 
	err.clear 
	else 
	SaveFile = true 
	end if 
End function 

%>
