##Biandan部署说明  

1，	修改数据库连接   
进入webapps\biandan\WEB-INF\classes\config\mssqlDriver.properties文件

第13,16,17行修改dyuserverify20库地址帐号密码
第20,23,24行修改dynetmanage20
第28,29,30行修改dyulc30_hw

2，	修改C/S的 DYULC30Webserivce连接   
进入同文件夹的param.properties文件
第14行修改用于生成正式任务单的webservice

3，	连接大洋资源管理器  
需要修改hosts,dayang.resource.com

4，	流媒体服务器部署地址  
webapps\biandan\WEB-INF\classes\config\mms.properties
