<%
  ' on Error Resume Next
  '*****************禁止单独访问本页面*********************
    If InStr(Lcase(Request.ServerVariables("SCRIPT_NAME")),"conn.asp") Then
	   Response.Write "禁止单独访问本页面"
	   Response.End
    End If
  '*****************禁止单独访问本页面*********************

  '打开数据库
   Dim Conn
   Dim ConnStr
   Dim DBPath
       DBPath  = Server.MapPath("/kingoldall/qianwei/haixindadq_2013com$#%.mdb")
   Set Conn    = Server.CreateObject("ADODB.Connection")
       ConnStr = "Provider=Microsoft.Jet.Oledb.4.0; Data Source = "& DBPath &""
	  
	   Conn.Open ConnStr
	 
	   If Err Then
          Err.Clear
          Set Conn = Nothing
          Response.Write "数据库连接出错，请检查连接字串。"
          Response.End
       End If
	   
			Function RemoveHTML(strHTML)   
			if strHTMl="" or isnull(strHTML) then    
			exit Function  
			end if   
			StrHtml = Replace(StrHtml,vbCrLf,"")   
			StrHtml = Replace(StrHtml,Chr(13)&Chr(10),"")   
			StrHtml = Replace(StrHtml,Chr(13),"")   
			StrHtml = Replace(StrHtml,Chr(10),"")   
			StrHtml = Replace(StrHtml," ","")   
			StrHtml = Replace(StrHtml,"    ","")   
			Dim objRegExp, Match, Matches    
			Set objRegExp = New Regexp   
			objRegExp.IgnoreCase = True  
			objRegExp.Global = True   
			objRegExp.Pattern = "<style(.+?)/style>"  
			Set Matches = objRegExp.Execute(strHTML)    
			For Each Match in Matches    
			strHtml=Replace(strHTML,Match.Value,"")   
			Next  
			objRegExp.Pattern = "<script(.+?)/script>"   
			Set Matches = objRegExp.Execute(strHTML)   
			For Each Match in Matches    
			strHtml=Replace(strHTML,Match.Value,"")   
			Next    
			objRegExp.Pattern = "<.+?>"  
			Set Matches = objRegExp.Execute(strHTML)     
			For Each Match in Matches    
			strHtml=Replace(strHTML,Match.Value,"")   
			Next  
			RemoveHTML=strHTML   
			Set objRegExp = Nothing  
			End Function
%>