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
	
<div class="notice">
	<b>TaskID</b>字段会存到PreTaskInfo.taskId字段
</div>

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


### 输入参数:	

	<ingestTasks Method="AddTask" SignalType="1" TaskType="1" SubTaskType="1" TaskSource="zte">
		<taskContent ContentID="66666688888888" >
	    <programInfo>
	          <programItem ProgramID="33" TaskID="" ProgramName="task01" 
			  	StartDate="20110228123000" StopDate="20110228133000" PriorityType="1" 
				Hint="" ProgramPath="\fdds\"/>     
	    </programInfo>
	    <mediaInfo>
	    	<mediaItem ItemID="5555556666"  SignalURL="10.2.1.166" SignalPort="1234" 
					SignalPID="0">					
	     		<sourceInfo SignalID="128A3E22-4820-4882-AD00-582715B8829F" 
					SignalName="10.2.1.45:1234">
				</sourceInfo>				
	    		<streamingMediaInfo VAFormatID="6C857DD3-D6AC-43b0-AC83-981C538E8A51" 
					VAFormatName="mp4" FileFormatType="1" VideoCodec="mp4" 
					SubVideoCodec="" AudioCodec="">
				</streamingMediaInfo>
				<mediaExtentInfo></mediaExtentInfo>
					
	        	<clipPathInfo OwnerID="" OwnerName="" 
					BizDomainID="" BizDomainName="" ProjectID="" ProjectName="" ResPathID="" 
					Owner20ID="" Owner20Name="" Res20PathID="">
				</clipPathInfo>
				<destDeviceInfo CapDeviceID="" CapDeviceName=""></destDeviceInfo>             
	    	</mediaItem>         
	   	</mediaInfo>	
		</taskContent> 
	</ingestTasks>

 
 
 
 