##生成素材播放地址
---

如何获取用户IP	

	HttpUtils.getIpAddr(HttpServletRequest request);	

如何获取素材所在盘符:	

1. 获取素材路径
2. 比对file.prefix列表，移出前缀
3. 获取路径
4. 2.0中取strFileHint
5. 3.0中待定...	

	DirUtils.removePrefix(String target);

读取mms服务器地址:	

	MMSConfigReader.getMMSURIString userIP, String driverName);		


