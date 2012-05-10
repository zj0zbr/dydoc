##gzzweb采集工作站 二 JMS Dev 
--- 

B/S和C/S采用JMS方式进行交互, 服务器选用[Apache ActiveMQ 5.4.3][mq]. 本文档值描述JMS在gzzweb中是如何配置的,以及如何使用.     

涉及如下内容:   

1. ActiveMQ服务器管理简述
2. ActiveMQ与Spring集成
3. ActiveMQ接口的封装
    1. 如何发送列队消息
    2. 如何发送主题消息
    3. Destination工具类
    4. gzzweb中主题是如何订阅的
    5. XmlMessageConverter  

###1. ActiveMQ服务器管理简述    

大洋上海研发部的ActiveMQ架设在192.168.1.6机器上. 访问如下地址即可访问到MQ的管理页面:    

http://192.168.1.6:8161/admin/



[mq]: http://activemq.apache.org/activemq-543-release.html ActiveMQ
