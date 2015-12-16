
welcome to http://www.xfyun.cn

升级维护记录

核心代码修改详见 diff/diff.log

***************************************************
		nginx1.9.2升级版本
***************************************************
2015/07/06
	1、合并代码到nginx1.9.2版本

	
	

***************************************************
		nginx1.4.1升级版本
***************************************************

2014/08/11u->peer.connection
	1、修复了官方版本中在处理websocket响应关闭的情况下，两次调用ngx_http_upstream_process_upgraded，而在第一次调用中将u->peer.connection置为空了

2014/03/15
	1、简化协议中，修复了返回CL后继续返回2个content_length的bug

2013/12/19
	1、在请求中支持了X-Req-Date和响应中添加了X-Res-Date，由于msp模块转发的缘故，
	需要注意X-Req-Date被更新，修改该处需配合业务层。
	
	2、支持了X-Sub，规范Sub头部，依旧兼容老的Sub头。

2013/10/16
版本：
	nginx1.4.1升级版本
修改点：
	1、根据老版本修改升级，通过修改核心解析部分，使得支持简化的http协议。
	例如CL替代content_length
	支持新协议Sub：头部。
	
	2、通过添加msp模块，定制更多代理转发策略，模块由老版本基于fastcgi修改变为基于proxy模块。所以
	msp 的location中不兼容继承自fastcgi的各种参数，例如msp_index等，完全兼容proxy模块的各种配置参数，
	只需要将proxy该给msp即可。
	
	3、msp模块中为了支持将后端响应重新转发到后端，做了复杂的http body的缓存，使得代码结构变得复杂。
	修改该部分逻辑必须要对nginx的处理流程非常清楚，否则很多状态位可能不如预期。

	
	4、修改upsream模块，使其支持在uspstream节下配置默认port，还支持servers配置，servers后面直接配置一个
	已经配置的upstream，通过与port配合，来合成新的upstream，server集。该功能起到了机器列表集变量的功效。
	方便管理业务机器。
	
	upstream ips {
	server 192.168.10.1;
	server 192.168.10.2;
	server 192.168.10.3;
	server 192.168.10.4;
	server 192.168.10.5;
	server 192.168.10.6;
	server 192.168.10.7;
	}
	
	upstream s_iat {
	iphash;
	port 9101;
	servers ips; 
	}
	
	upstream s_tts {
	iphash;
	port 9102;
	servers ips; 
	}
	
	5、新版本利用对websocket的支持，在msp模块可以直接和后端建立长连接。
	

***************************************************
		0.8.5
***************************************************
2011/12
具体修改已无维护记录
