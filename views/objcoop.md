##Objective-C OOP
---	

###概述  	

通过Java来理解Objective-C中的OOP, 为此制作了一个表格便于理解:

<table>
	<caption>Objective-C & Java 面向对象中的关键字</caption>
	<thead>
		<th></th>
		<th>Objective C</th>
		<th>Java</th>
	</thead>
	<tbody>
		<tr>
			<td>继承</td>
			<td>@interface NewObject : NSObject</td>
			<td>class NewObject extends Object</td>
		</tr>
		<tr>
			<td>当前对象的引用</td>
			<td>self 指针</td>
			<td>this 关键字</td>
		</tr>
		<tr>
			<td>父类的引用</td>
			<td>super 关键字</td>
			<td>super 关键字</td>
		</tr>
	</tbody>
</table>	

__Important:__  
	
* 不支持_多重集成_
* Objective-C提供categories和protocals特性来解决多重继承的问题.	

其他语言如何解决多重集成问题:	

* Java: 使用interface解决多重继承问题
* Ruby: 使用Module, mixin来解决








