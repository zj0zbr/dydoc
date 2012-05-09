##采集工作站
--

###1.接口描述

####1.1开启全部设备：  =>api/device - POST  

参数说明:	

	{
		sender.queue(TargetDest, toxml),  //循环发送XML至MQ服务器
		return: {
			forward: {
				success: 'index.html'
			}
		}
	}  


####1.2接收设备：  =>api/device - GET  

参数说明:	

	{
		orderBy: '设备',
		return: {
			list: [XmlMessage], //返回List<ClipTask>数据
			forward: {
				success: 'index.html'
			}
		}
	}