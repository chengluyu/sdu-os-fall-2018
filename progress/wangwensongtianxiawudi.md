# Work Progress of Synthetic Dream

## 5th Week

### See Section 5.10.3
####文件系统目录fs
* 采用多线程处理方式，处理多线程带来的竞争条件、思索问题。
为了避免竞争条件的发生，Linux系统对资源分配进行了严格地检查，并且在内核模式下运行时，如果任务没有主动睡眠（调用sleep（）），就不让内核切换任务。

####了解文件系统中各个函数的功能，有一个整体性概念
* ioctl.c 实现字符设备的io控制功能
* fcntl.c io控制的系统调用函数
* read_write.c 文件读写和定位
* stat.c 获取文件状态
* open.c 修改文件属性和创建与关闭文件
* namei.c 文件系统中目录名和文件名的操作
* inode.c i节点的操作

### See Section 12.1
### See Section 12.15

#### open.c
* 读open.c源代码，思考要抓取的数据结构、思考可视化内容，将要呈现的形式