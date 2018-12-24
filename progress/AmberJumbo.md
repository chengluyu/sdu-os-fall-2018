# 5th week progress
* 尝试bochs、qemu环境，最终决定使用qemu环境的Linux 0.11 Lab

* 阅读bootsect.S, head.s, setup.S源码


# 6th week progress
* 阅读代码sched.c, sched.h, signal.h，分析进程调度算法

* 小组讨论把任务分为进程初始化，进程创建，进程切换，进程终止，进程间通信以及可视化六部分

* 确定用log导出json格式的数据，用PyQt处理数据实现可视化


# 7th week progress
* 在数据输出方面，用log函数输出了进程切换时进程块的信息，但是还没有决定最终可视化时显示信息的哪一部分。

* 配置PyQt环境，设计在进程有事件发生时的总的进程状态图。 

# 8th week progress
* 比较以时间片为单位输出数据与进程切换事件发生时输出进程信息的优缺点

* 继续学习PyQt
                                                          
# 9th week progress
* 下载配置陈宇翔推荐的环境

* 继续用log函数来调试数据输出的位置

# 10th week progress
* 比较两种数据输出方式， 决定继续用log函数输出

* 继续尝试输出数据

# 11th week progress
* 调整数据格式，输出进程信息

* 做数据提取部分展示

# 12th week progress
* 配置PyQt环境

* 学习PyQt，发现提取的数据是不能与系统交互的，PyQt的信号槽机制没有优势，反而复杂的绘制方式有很大的弊端，不易形成视频，于是决定用processing进行可视化  

# 13th week progress
* 学习processing，能进行基本的绘制

# 14h week progress
* 学习processing

* 搭建可视化基本框架，将界面分成进程树、命令行、语句说明和栈或内存四部分，进行进程创建时fork函数、销毁时do_exit、release等函数在进程树中的数据可视化

# 15h week progress
* 学习processing

* 进行schedule函数进程切换与压栈退栈数据的可视化

# 16 week progress
* 与小组一起整合数据，发现系统不同有的数据不太一样，统一数据重构进程树

* 按照进程出现、切换、结束的先后顺序整合成视频