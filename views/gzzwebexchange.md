##gzzweb采集工作站 一 B/S 2 C/S交互约定
---

###目录: 

1. 概述
2. 技术方案
3. B/S服务器和C/S采集客户端交互说明 
  1. 主题定义 
    1. 上下线主题
    2. 控制全部设备的主题
  2. 列队定义
  3. Xml消息体说明 
4. messageBody 节点属性 

  
###概述 

基于B/S架构的采集工作站, 主要用于对采集工作站的监看,后期可能会添加简单的控制以及加单功能.   

###技术方案 

* ActiveMQ 5.4.3: 解决C/S -> B/S交互功能
* OCX播放器: 有郭远华封装,提供视频回显功能
* BootStrap: 提供前端CSS解决方案    

###B/S服务器和C/S采集客户端交互说明 

B/S服务器与C/S采集工作站通过消息服务器(ActiveMQ)进行交互, 交互过程遵循JMS协议. 并且采用JMS中的TextMessage进行通讯.  
TextMessage中的消息体采用xml格式进行描述.   

####主题定义    

1. DYULC.INGESTMANAGE.TOPIC，//CS控制,BS控制  
工作站 -> 控制端 : 发送状态信息, 一般发送上下线消息

2. DYULC.PHEDEVICE.TOPIC         //CS采集工作站  
控制端 -> 工作站: 给所有工作站发送消息. 比如: 全部开始, 全部停止    

####列队定义    

控制客户端通过列队向采集工作站发送控制指令. 

DYULC.PHEDEVICE.+采集工作站名称+".FOO"  
控制端 -> 工作站:  单台控制指令.    

<div class="notice">
关于主题和列队的生成已经封装在gzzweb项目中的com.dayang.gzzweb.jms.DestUtils中;
</div>

####消息体约定  

    <?xml version="1.0" encoding="utf-8"?>
    <newsMessage>
        <messageType>dyulc</messageType> //dyulc 收录中心   news  新闻  studio 演播室 
        <subMessageType>1</subMessageType>// taskmanage总控=1、ingestcliet采集工作站=2等
        <subSystemName></subSystemName> // 子系统名称,采集工作站名称
        <sourceDestination><sourceDestination/> //源目的地节点 
        <targetDestination></targetDestination> //目标目的地节点 
        <destType><destType/> //目标类型节点   （主题Topic）  （队列Queue）
        <messageBody> //具体消息内容
            //消息体内容
            <CommandID> start: 7 | stop: 11 | statusMsg: 38  | online: 3| offline:24</CommandID>  //命令值,与以前一样
            <deviceName></deviceName>
            <deviceIP><deviceIP>
        
            <portIndex>设备端口数|设备端口号<portIndex>
            <multicast>设备的主播地址</multicast>
            <portStatus>端口状态</portStatus>


            <guidDevice></guidDevice>
            <guidPort></guidPort>    
            <guidTask></guidTask>

            <nType></nType>
            <nReserve1></nReserve1>
            <strMsg></strMsg>
            <strExtern></strExtern>        
        </messageBody>
     </newsMessage> 

<div class="notice">
    这个消息体已经在gzzweb被封装在XmlMessage对象中.
</div>  

newsMessage Xml之需要修改messageBody中的内容，其他保持不变: 

  <?xml version="1.0" encoding="utf-8"?>
  <newsMessage>
    <messageType>dyulc</messageType> //dyulc 收录中心   news  新闻  studio 演播室 
    <subMessageType>1</subMessageType>// taskmanage总控=1、ingestcliet采集工作站=2等
    <subSystemName></subSystemName> // 子系统名称,采集工作站名称
    <sourceDestination><sourceDestination/> //源目的地节点 
    <targetDestination></targetDestination> //目标目的地节点 
    <destType><destType/> //目标类型节点   （主题Topic）  （队列Queue）
    <messageBody> //具体消息内容
      <!-- ... ... -->
    </messageBody>
  </newsMessage>  

<div class="notice">
  之后我们之说明messageBody中的内容。
</div>

###MessageBody节点属性

<table>
  <thead>
    <tr>
      <th></th>
      <th></th>
    </tr>
  </thead>
</table>




























