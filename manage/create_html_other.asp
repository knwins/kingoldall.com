<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%
Response.ExpiresAbsolute=Now()-1 
rooturl="http://qxw2060490100.my3w.com/"

if SaveFile("../index.html",rooturl&"template/index.asp") then 
response.write "��ҳ���ɳɹ�"
response.write "<br>"
else 
Response.write "��ҳû������" 
end if 

if SaveFile("../contactus.html",rooturl&"template/contactus.asp") then 
response.write "��ϵ�������ɳɹ�"
response.write "<br>"
else 
Response.write "��ϵ����û������" 
end if 

if SaveFile("../aboutus.html",rooturl&"template/aboutus.asp") then 
response.write "�����������ɳɹ�"
response.write "<br>"
else 
Response.write "��������û������" 
end if 

if SaveFile("../zizhi.html",rooturl&"template/zizhi.asp") then 
response.write "��ҵ�������ɳɹ�"
response.write "<br>"
else 
Response.write "��ҵ����û������" 
end if 

if SaveFile("../sales.html",rooturl&"template/sales.asp") then 
response.write "�����������ɳɹ�"
response.write "<br>"
else 
Response.write "��������û������" 
end if 
 


'===========��Ϣ�����б�ҳ======'
Set rs_news_cate= Server.CreateObject("ADODB.Recordset")
sql_news_cate="select * from news_cate where ver='cn'"
rs_news_cate.open sql_news_cate,conn,1,1
do while not rs_news_cate.eof
news_id=rs_news_cate("id")
newsname=rs_news_cate("filename")  

  
	Set rs_news= Server.CreateObject("ADODB.Recordset")
	
	sql_news="select * from news where type="&news_id&" and ver='cn'"
	
	rs_news.open sql_news,conn,1,1

	do while not rs_news.eof
	   PageSize=12
	   PageCount = Int(rs_news.RecordCount / PageSize*-1)*-1
	   
		for k=1 to PageCount
		if SaveFile("../"&newsname&"_"&k&".html",rooturl&"template/news.asp?type="&news_id&"&page="&k&"") then
		end if 
		next
		k=k+1
			
	
	if SaveFile("../"&newsname&".html",rooturl&"template/news.asp?type="&news_id&"") then   
	end if 
	
	rs_news.movenext
	loop
	rs_news.close
	set rs_news=nothing
	
rs_news_cate.movenext
loop
rs_news_cate.close
set rs_news_cate=nothing

'===========��Ϣ�����б�ҳ======'



'===��Ϣ����ҳ===='
		Set rs_news= Server.CreateObject("ADODB.Recordset")
		sql_news="select * from news where ver='cn'"
		rs_news.open sql_news,conn,1,1
		do while not rs_news.eof
		PageSize=12
		PageCount = Int(rs_news.RecordCount / PageSize*-1)*-1
		for k=1 to PageCount
		if SaveFile("../news_"&k&".html",rooturl&"template/news.asp?page="&k&"") then
		end if 
		next
		k=k+1
		if SaveFile("../news.html",rooturl&"template/news.asp") then   
		end if 
		rs_news.movenext
		loop
		rs_news.close
		set rs_news=nothing
	
	
'========================================================================='
'===========��Ϣ����ҳ======'
dim rspro,sqlpro,id,nb
sqlpro="select * from news where ver='cn'"
Set rspro= Server.CreateObject("ADODB.Recordset")
rspro.open sqlpro,conn,3,2
do while not rspro.eof
product_id=rspro("product_id")
types=rspro("type")
			if SaveFile("../news_"&product_id&".html",rooturl&"template/newsinfo.asp?id="&product_id&"&types="&types&"") then 
			response.write "����ҳ������"
			response.write "<br>"
			else 
			Response.write "����ҳû������" 
			end if 
rspro.movenext
loop
rspro.close
set rspro=nothing

'===========��Ϣ����ҳ======'	

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