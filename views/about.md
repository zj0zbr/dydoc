##About this app
---	

###Why create this web site?	

这个应用主要用来纪录收录组文档。采用markdown语法编写内容，方便排版。	

作者: 吕健  
内容提供者: 吕健, 王毅飞  


###Technology	

* __markdown语法__: <http://qingbo.net/picky/502-markdown-syntax.html>
* __Ruby 1.9.2__: 
* __Sinatrarb__: <http://www.sinatrarb.com/intro-zh.html>
* __Ruby Gems__:
	* _discount_: 提供markdown语法解析功能
	* _json:_ 提供json解析功能
	* _thin_: Ruby的Web服务器，加快Sinatrarb运行速度	
* __CodeMirror2__: 提供在线代码编辑功能,支持ipad
	* <http://codemirror.net/>

###Tools	

* __Git__: 版本控制工具，用于记录文档的版本信息
	* <http://progit.org/book/zh/>
* __Sublime Text 2__: 跨平台的CodeEditor(推荐)
	* <http://www.sublimetext.com/2>
* __TextMate__: Mac OS上的CodeEditor
* __MarkdownPad__: Window平台下的可视化markdown编辑器(下载很慢噢!)
	* <http://markdownpad.com/>


###RoadMap

####0.1.0 

* 支持markdown语法解析
* 支持代码语法高亮
* 支持文章列表显示，需要手动修改views/layout.erb文件
* 使用git对文章进行管理和存储

####0.2.x(current)

* 根据首行2号标题的内容生成, 自动生成文章列表。
* 根据文件名,自动生成文章的url链接
* 解决window下的运行问题(?)
* 文章列表中自动高亮当前正在阅读的文章

####0.3.x

* 支持Tag功能
* 支持Tag过滤, 拼音过滤
* 在服务器保存文章列表(YML)

####0.4.x	

* 在线编辑
* 服务器端自动Git提交
* 支持ipad访问

