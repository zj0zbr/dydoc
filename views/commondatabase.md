##大洋资源管理器访问 
---

大洋资源管理器的访问直接在__biandan3__中直接添加.	


###3.0大洋资源管理器数据库配置

__${classpath}__/config/mssqlDriver.properties新增数据库配置:	

	#DyCommonDatabase
	jdbc.oracle.commondatabase.url=jdbc:sqlserver://192.168.1.18:1433;DatabaseName=dycommondatabase30
	jdbc.oracle.commondatabase.name=sa
	jdbc.oracle.commondatabase.password=


###根据ClipIp获取wmv素材信息		

####接口描述:	

	package cn.com.dayang.biandan3.service;
	import cn.com.dayang.biandan3.service.to.ClipElement;

	public interface DyResourceClient {

		public ClipElement findWmvElement(String clipId);
		// ... ...
	}


####Sql语句:	
	
	use dycommondatabase30;
	select guidClip, strname, strMainFilePath from ClipElement 
		where strname like '%.wmv' and guidClip = '4D89B33B-02A7-E0CA-4459-4DFC584F1129';

####domain:	

	package cn.com.dayang.resource.domain;

	public class ClipElement implements java.io.Serializable {

		private String clipId = null;
		private String name = null;
		private String folderPath = null;
		// ... ...
	}

####Action中引用接口:	

<div class="notice">
<strong>注意</strong>: autowired, DyResourceClient的Spring Bean的id应该为__resourceClient__
</div>

	package cn.com.dayang.biandan3.web.json;
	import cn.com.dayang.biandan3.service.DyResourceClient;
	// ... ...
	public class ClipsJsonAction extends AppAction {
		
		private String clipId = null;

		@Autowired
		private DyResourceClient resourceClient = null;
		// ... ...
	}	



