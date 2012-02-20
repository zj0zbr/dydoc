##收录素材浏览
---

###1. URL接口描述	

* namespace: /clip/*
* 素材列表: /clip/list.action => _List&lt;ClipTask&gt; list_
* 查看单个素材: ／clip/show.action?taskId=${0}, 输出文件列表: _List&lt;ClipParts&gt; list_


###2 数据结构

####2.1 实体描述

* SQL2005数据库: DYULC30_hw@192.168.1.47:1433
* 数据库表: ULCTaskInfo
* 收录任务: cn.com.dayang.biandan3.domain.TaskInfo
* 素材任务: cn.com.dayang.biandan3.domain.ClipTask
* 数据库表: 
* 素材文件: cn.com.dayang.biandan3.domain.ClipPart 

####2.2 ClipTask与TaskInfo的关系	

ClipTask映射ULCTaskInfo表，只取部分属性,。本质上是执行完成的收录任务列表。	
	
	select * from TaskInfo 
		where enumrunstatus = ${EnumUtils.FINISHED_RUNSTATUS_TASK}	
		
EnumUtils任务状态的枚举描述
	
	package cn.com.dayang.biandan3.common;	
	// ... ...
	public class EnumUtils {
		// ... ...
		public static final int SLEEP_RUNSTATUS_TASK = 0;//休眠
		public static final int WAITING_RUNSTATUS_TASK = 1;//等待执行
		public static final int EXECUTING_RUNSTATUS_TASK = 2;//执行中
		public static final int FINISHED_RUNSTATUS_TASK = 3;//执行完成
		public static final int ERROR_RUNSTATUS_TASK = 4;//执行出错
		public static final int CANCELED_RUNSTATUS_TASK = 5;//取消执行
		public static final int DISTRIBUTED_RUNSTATUS_TASK = 6;//已被总控分配
		
		// ... ...
	}	

####2.3 ClipTask Domain结构
	
	package cn.com.dayang.biandan3.domain;
	// ... ...
	public class ClipTask implements Serializable {
	
		private String taskGuid = null;//guidtaskid
		private String name = null;//strname 素材名称
	
		private long length = 0;//dwduration, 任务时长, fps
		private Date startTime = null;//odttaskstartdate, 开始时间
	
		private String sponserName = null;//strsponser
	
		private String ownerId = null;//strownerid
		private String ownerName = null;//strownername
		// ... ...
	}

####2.4 Clip Task hbm.xml 配置说明

配置中添加了filter,需要在代码中开启。

	<?xml version="1.0" encoding="utf-8"?>
	<hibernate-mapping package="cn.com.dayang.biandan3.domain">
		<class name="ClipTask" table="ULCTASKINFO">
			<!-- ... ... -->
			<filter name="statusFilter" condition="runstatus = 3"></filter>
		</class>
	</hibernate-mapping>	
	
如何开启Filter:	
	
	// ... ...
	Session session = ...;
	session.enableFilter("statusFilter");	


###图片读取

####数据库表结构
	
	USE [dyulc30_hw]
	GO
	/****** 对象:  Table [dbo].[ULCIcon]    脚本日期: 02/17/2012 11:44:47 ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	
	CREATE TABLE [dbo].[ULCIcon] (
		[strIconGuid] [nvarchar](36) NOT NULL,
		[strIconName] [nvarchar](50) NULL,
		[iLinkType] [int] NULL,   // 关联类别  没什么太大用		
		[strLinkGuid] [nvarchar](36) NULL,//关联guid  比如 taskguid  ，其他    注意可以存在多个此关联guid，存一个素材的不同时刻的图标
		[iWidth] [int] NULL,
		[iHeight] [int] NULL,
		[filePath] [nvarchar](250) NULL,
		[imageIconBuf] [image] NULL,
		[iFrameIndex] [int] NULL,  // 第几帧的icon   
		[iBuffSizeByte] [int] NULL,
	 	CONSTRAINT [PK_ULCIcon_1] PRIMARY KEY CLUSTERED 
		(
			[strIconGuid] ASC
		)
		
		WITH (PAD_INDEX  = OFF, 
			STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, 
			ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON
		) ON [PRIMARY]
		
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
