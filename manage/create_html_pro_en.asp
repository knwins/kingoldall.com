<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->

<%
Response.ExpiresAbsolute=Now()-1 
Server.ScriptTimeOut=50009
'===========产品内容页======'
rooturl="http://www.haisinda.com/en/"

sqlpro="select * from product where ver='en'"
Set rspro= Server.CreateObject("ADODB.Recordset")
rspro.open sqlpro,conn,3,2
do while not rspro.eof
product_id=rspro("product_id")
			if SaveFile("/en/pro_"&product_id&".html",rooturl&"template/productshow.asp?productid="&product_id&"") then 
			response.write "产品内容页已生成"
			response.write "<br>"
			else 
			Response.write "产品内容页没有生成" 
			end if 
rspro.movenext
loop
rspro.close
set rspro=nothing

'===========产品内容页======'

'===========产品小类列表页======'

Set rs_parent= Server.CreateObject("ADODB.Recordset")
sql_parent="select * from product_cate where root_id<>0 and ver='en'"
rs_parent.open sql_parent,conn,1,1
do while not rs_parent.eof
parent_id=rs_parent("PRO_CATE_ID")

	Set rs_small= Server.CreateObject("ADODB.Recordset")
	sql_small="select * from product where TYPE="&parent_id
	rs_small.open sql_small,conn,1,1
			do while not rs_small.eof
				bigtypes=rs_small("BIGTYPE")
				smalltypes=rs_small("TYPE")
			   PageSize=15
			   PageCount = Int(rs_small.RecordCount / PageSize*-1)*-1
				for k=1 to PageCount
					if SaveFile("/en/product_"&bigtypes&"_"&smalltypes&"_page"&k&".html",rooturl&"template/product.asp?smalltype="&smalltypes&"&bigtype="&bigtypes&"&page="&k&"") then
							response.Write "小类分页生成成功<br>" 
							else
							response.Write "小类分页生成失败<br>" 
							end if 
					next
					k=k+1 
			rs_small.movenext
			loop
			rs_small.close
			set rs_small=nothing


'生成所有的小类页面
if SaveFile("/en/product_"&rs_parent("root_id")&"_"&rs_parent("PRO_CATE_ID")&".html",rooturl&"template/product.asp?smalltype="&rs_parent("PRO_CATE_ID")&"&bigtype="&rs_parent("root_id")&"") then 
response.Write "小类生成成功<br>" 
else
response.Write "小类生成失败<br>"  
end if

'生成所有的小类页面结束


rs_parent.movenext
loop
rs_parent.close
set rs_parent=nothing
'===========产品小类列表页======'


'===========产品大类列表页======'

Set rs_root= Server.CreateObject("ADODB.Recordset")
sql_root="select * from product_cate where root_id=0 and ver='en'"
rs_root.open sql_root,conn,1,1
do while not rs_root.eof
root_id=rs_root("PRO_CATE_ID")

			Set rs_big= Server.CreateObject("ADODB.Recordset")
			sql_big="select * from product where ver='en' and BIGTYPE="&root_id&""
			rs_big.open sql_big,conn,1,1
		
			do while not rs_big.eof
			   PageSize=15
			   PageCount = Int(rs_big.RecordCount / PageSize*-1)*-1
			   
					for k=1 to PageCount
						if SaveFile("/en/product_"&root_id&"_page"&k&".html",rooturl&"template/product.asp?bigtype="&root_id&"&page="&k&"") then
						response.Write "大类分页生成成功<br>" 
						else 
						response.Write "大类分页生成失败<br>" 
						end if 
					next
					k=k+1
					

			rs_big.movenext
			loop
			rs_big.close
			set rs_big=nothing

	''生成所有大类的页面		
	if SaveFile("/en/product_"&root_id&".html",rooturl&"template/product.asp?bigtype="&root_id&"") then   
	response.Write "大类生成成功<br>" 
	else 
	response.Write "大类生成失败<br>" 
	end if 

rs_root.movenext
loop
rs_root.close
set rs_root=nothing
'===========产品大类列表页======'




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
