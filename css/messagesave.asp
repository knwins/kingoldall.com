<%
company=request.form("company")
user=request.form("user")
address=request.form("address")
phone=request.form("phone")
suliang=request.form("suliang")
title=request.form("title")
content=request.form("content")
email=request.form("email")
mymail=request.form("mymail")
mailsubject="客户留言信息"
content = "<span style='font-family:Verdana,; font-size:9pt;'>客户提交信息如下:<br>公司名稱:"&company&"<br>聯繫人:"&user&" <br>電話:"&phone&"<br>产品名称:"&title&"<br>订货数量:"&suliang&"<br>留言內容:"&content&"<br>地址:"&address&"<br><br>系统发送信息，请非回复!</span>"

Set msg = Server.CreateObject("JMail.Message")
msg.silent = true
msg.Logging = true
msg.Charset = "gb2312"
msg.MailServerUserName = "yingjc1983@126.com" '此为您邮箱的登录帐号，使用时请更改为自己的邮箱登录帐号
msg.MailServerPassword = "yidvfhpdw_2012" '此为您邮箱的登录密码，使用时请更改为自己的邮箱登录密码
msg.From = "yingjc1983@126.com" '发件人Email
msg.FromName = "订单提醒" '发件人姓名
msg.AddRecipient mymail '收件人Email
msg.Subject = mailsubject '邮件主题
msg.Body = content '邮件正文
msg.contenttype ="text/html"
msg.Send ("smtp.126.com") 'SMTP服务器地址
msg.close()
set msg = nothing
response.write"<SCRIPT language=JavaScript>alert('提交成功,我司将尽快回复您!');"
response.write"this.location.href='index.html';</SCRIPT>" 
%> 
