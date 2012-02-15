##生成正式任务 - biandan3
---

###1. 响应反馈	

####1.1 反馈xml定义

	<ingestTasksReport ReportType="1" >	 
		<errorItemInfo ContentID="66666688888888" 
			ProgramID="3333377777" 
			ItemID="5555556666" 
			TaskID="A51684FF-DE9D-4002-A900-105E46B768F9" 
			ErrorType="1001" 
			ErrorInfo="冲突检测失败，无足够客户端采集"/> 
		<!-- others -->
		<errorItemInfo />
	</ingestTasksReport>
	
####1.2 参数说明

* TaskID: 生成的正式任务的ID
* ErrorType: 错误类型
* ErrorInfo: 反馈信息

####1.3 ErrorType 和 ErrorInfo 对应关系

0  
执行成功	

1001  
添加任务冲突检测失败，开始时间晚于结束时间	

1002  
添加任务冲突检测失败，无可用采集设备（在此任务时间段内设备都被占用，即任务数已达到最大，每个采集设备支持同时10个任务采集）  	

1003  
此任务已经执行，不能修改和删除	

1004  
必填字段有非法值（具体反馈的时候会带上那个字段)	

1005  
其他错误描述（可扩展)	


 
 
 
 