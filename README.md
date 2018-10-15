# checkouteripv6
检测访问外网IPv6是否是通的

* 下载原代码
<pre> #git clone https://github.com/leapv6/checkouteripv6 </pre>
* 修改检测配置 
<pre> #cd checkouteripv6; vi ip.txt2 </pre>
* 定时检测
> 在系统定时任务中添加一条记录，每10min执行一次检测
<pre>
    #crontab -e
    记录：*/10 * * * * cd /home/checkouteripv6 && ./checkouteripv6.sh
</pre>

* 配置文件ip.txt2说明
<pre>
2400:8900::2
2001:4860:4860::8888
2001:da8:c800:1005::2
</pre>
 > 一行对应一个IPv6地址，只要其中一个地址检测是通的，则表示当前对外访问IPv6是可达的
 
 * 检测结果
 > 现检测结果是发送给open-falcon, 也可以通过修改checkouteripv6.sh 做其他操作
 
 
