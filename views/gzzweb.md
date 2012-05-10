##采集工作站
--

###1.接口描述

####1.1开启全部设备  create方法：  =>api/device - POST  

参数说明:	

	{
        ParameterType: json
		Parameter:{
		    queuecmd: 'start'
		}
		
		return: {
			success: true | false,
            msg: 'error message'
		}
	}  


####1.2接收设备  get方法：  =>api/device - GET  

参数说明:	

	{
		return: json{
			device:{name,ip,}
		}
	}

####1.3read方法：  =>api/device - GET  

参数说明:	

	{
		params: {
			Id: '设备ID'
		}
		
	}	

####1.4update方法：  =>api/device - PUT 

参数说明:	

	{
		params: {
			Id: '设备ID'
		},
		
	}	

####1.5delete方法: =>api/device - DELETE  

参数说明:	

	{
		params: {
			Id: '设备ID'
		},
		
	}	