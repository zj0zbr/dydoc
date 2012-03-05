##biandan3的安全认证

###使用技术:

Apache Shiro v1.2.0: <http://shiro.apache.org/>

###项目新增内容 	

####新增jar包
* __shiro-all-1.2.0.jar__: Shiro包
* __slf4j-api-1.6.1.jar__: Shiro-core需要的日志包
* jstl-api-1.2.jar
* jstl-impl-1.2.jar

###新增spring配置 	

* ${classpath}/spring/shiro.xml: 提供shiro和spring集成的配置

###web.xml新增内容  

	<filter>
	    <filter-name>shiroFilter</filter-name>
	    <filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
	    <init-param>
	        <param-name>targetFilterLifecycle</param-name>
	        <param-value>true</param-value>
	    </init-param>
	</filter>
	
	<filter-mapping>
	    <filter-name>shiroFilter</filter-name>
	    <url-pattern>/*</url-pattern>
	</filter-mapping>


[shiro]: http://shiro.apache.org/ "Apache Shiro"