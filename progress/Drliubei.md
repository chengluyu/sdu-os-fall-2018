# Progress of Drliubei
---
---
## 第一阶段
* 主要任务：分析源代码
* 计划用时：5周

---

### 第一周
#### Overview
* 了解该书的主要内容。
* 了解一下Linus成功的原因。希望自己能有所启发。
#### Content
##### 该书的主要内容
* 硬件知识
* 内核引导启动和32位运动方式的准备阶段，应该全部阅读
* 内核的主要内容
* 上一部分源码的参考信息
* 如何对linux系统进行各种实验活动

---
### 第二周
#### Overview
了解微型计算机的基本组成。
#### Content
##### 所有系统的基本模型
输入部分->处理部分->输出部分 
##### 传统计算机组成
* 存储数据
	* 主存储器
	* BIOS存储器：计算机开机的时候各个系统的自检，并且建立一些各种配置表，中断向量表，键盘参数表。同时把处理器和系统其他部分初始化到一个已知状态，还给一些操作系统提供操作硬件的接口。
	* CMOS存储器：计算机时钟信息和硬件配置信息。
	* 软盘和硬件控制器
* 处理数据
	* 定时计数器：计算计算机中的精确时间延迟。
	* 中断控制器：BIOS会对其进行初始化。
* 传输数据
	* I/O接口
		* 编址方式
			*  统一编址
			* 独立编址
		* 分类：数据端口，控制器状态端口，输出命令端口。
		* 接口访问控制
			* 轮询：不需要硬件，但效率低。
			* 中断：需要初始化中断向量表，以及编制好处理程序。
			* DMA：不需要软件和CPU，效率很高。
	* 串行控制卡
* 输入数据
	* 键盘控制器:主机键盘控制器对接通扫描码和断开扫描码进行解码，将解码后的数据传输到键盘数据队列。
* 输出数据
	* MDA显示标准
	* CGA显示标准: 一位将显示的字闪烁，一位将字的亮度调亮，其他位控制背景色和前景色（绘制图片的颜色）。
	* EGA/VGA显示标准

---
### 第三周
#### Overview
了解内核编程环境和语言。
#### Content
##### 两种汇编器
* as86：特殊程序
* GNU as：一般程序
	* 一些指令：一条指令一般包含4部分
	* 区：一个地址范围
		* 目标代码的格式
			* text、data区：保存程序
			* bss区：变量
			* absulote区：绝对地址的变量
			* undefined区：不在上述范围内的对象
	* 重定位：as产生的目标文件的地址范围默认从0开始，ld调整它们的位置到运行时的位置上。
##### c语言程序
* 扩展
	* 嵌入汇编：编译器优化不到位，可以直接使用汇编代码来提高运行速度。
	* 圆括号中的组合语句：在表达式里用循环和判断语句，一般用来定义宏。
	* 寄存器变量：将变量存储在寄存器里，cup就不同访问内存了。
	* 内联函数：让gcc将函数的代码集成到带调用该函数的代码中，减少调用和退出函数的时间。
##### c语言和汇编的相互调用
* c函数调用机制：栈帧结构和控制权转移方式。
* 汇编程序调用c函数：重点仍然是函数参数在栈上位置的确定。
##### 目标文件
* 格式
	* 执行头部分：包含一些和程序整体结构有关的参数。
	* 重定位信息部分
		* 代码被定位到一个不同的地方的时候，指出代码需要修改的地方。
		* 存在为定义变量的引用，之后连接程序可以对该符号的值进行修改。
	* 符号表和相关字符串部分：定义的全局符号和从其他模块引入的符号，或者由连接器定义的符号。
* 链接目标文件
##### make工具
* 决定一个含有多个源程序的大型程序中有哪些需要重新编译。
* makefile是它的配置文件。
* 过程
	* 读取所有makefile和包含makefile的文件，记录所有变量及其值，以及隐式和显式的规则，勾勒出所有目标代码和它先决条件的一张全景图。
	* 找出需要重建的目标代码，然后执行相应的操作。

---
### 第四周
#### Overview
了解了 一下80X86保护模式以及编程。
#### Content
##### 系统寄存器以及指令
* 作用：用于内存管理，中断等行为
* 实现方法：对寄存器设定不同的标志位，使得cpu访问过后有不同的行为
##### 保护模式内存管理
* 内存寻址
	* 段寻址技术：将内存分段。
	* 指令寻址方式：计算偏移量。
* 地址变换
	* 分段
	* 分页
* 保护
	* 目的：各个任务之间免受相互之间的干扰。
	* 分类：段级保护，页级保护。
* 中断
* 任务管理

---
### 第五周
#### Overview
了解一下linux内核体系结构。
#### Content
##### 操作系统组成
* 用户应用程序：浏览器程序
* 操作系统服务：shell命令解释系统以及那些内核编程接口
* 操作系统内核：对硬件资源的抽象和访问调度
* 硬件系统
##### linux内核模式
* 主程序
* 系统服务
* 支持函数
##### 体系结构
* 进程调度模块
* 内存管理模块
* 文件系统模块
* 进程间通信模块
* 网络接口模块

---
## 第二阶段
* 主要任务：提出设计方案，说明感兴趣的系统运行过程。
* 计划用时：2周

---

### 第六周
#### Overview
确定感兴趣的操作系统的模块。
#### Content
经过讨论，进程模块和其他模块之间都有联系。再加上上一级的学长好像没啥人做这个，所以我们决定把目标设定为进程模块。

---

### 第七周
#### Overview
确定需要自己仔细看的源代码，并且确定需要可视化的和进程有关系的东西。
#### Content
##### 源代码
* main.c
* sched.h
* sched.c
* fork.c
* exit.c
* sytem_call.s
##### 可视化
* 进程的生命周期
* 进程的调度算法

---
## 第三阶段
* 主要任务：讨论，评估设计方案
* 计划用时：5周

---
### 第八周
#### Overview
主要看了main.c
#### Content
##### main函数（感兴趣的部分）
```c
void main (void)		/* This really IS void, no error here. */
{			
//....
  // 下面过程通过在堆栈中设置的参数，利用中断返回指令切换到任务0。
  move_to_user_mode ();		// 移到用户模式。 （include/asm/system.h，第1 行）
  if (!fork ())
    {				/* we count on this going ok */
      init ();
    }
  /*
   * NOTE!! For any other task 'pause()' would mean we have to get a
   * signal to awaken, but task0 is the sole exception (see 'schedule()')
   * as task 0 gets activated at every idle moment (when no other tasks
   * can run). For task0 'pause()' just means we go check if some other
   * task can run, and if not we return here.
   */
  /* 注意!! 对于任何其它的任务，'pause()'将意味着我们必须等待收到一个信号才会返
   * 回就绪运行态，但任务0（task0）是唯一的意外情况（参见'schedule()'），因为任务0 在
   * 任何空闲时间里都会被激活（当没有其它任务在运行时），因此对于任务0'pause()'仅意味着
   * 我们返回来查看是否有其它任务可以运行，如果没有的话我们就回到这里，一直循环执行'pause()'。
   */
  for (;;)
    pause ();
}
```
##### void函数（感兴趣的部分）
```c
void init (void)
{
  int pid, i;
	//....
  if (!(pid = fork ()))
    {
      close (0);
      if (open ("/etc/rc", O_RDONLY, 0))
	_exit (1);		// 如果打开文件失败，则退出(/lib/_exit.c,10)。
      execve ("/bin/sh", argv_rc, envp_rc);	// 装入/bin/sh 程序并执行。
      _exit (2);		// 若execve()执行失败则退出(出错码2,“文件或目录不存在”)。
    }
  // 下面是父进程执行的语句。wait()是等待子进程停止或终止，其返回值应是子进程的进程号(pid)。
  // 这三句的作用是父进程等待子进程的结束。&i 是存放返回状态信息的位置。如果wait()返回值不
  // 等于子进程号，则继续等待。
  if (pid > 0)
    while (pid != wait (&i))
  //...
  _exit (0);			/* NOTE! _exit, not exit() */
}
```
---
### 第九周
#### Overview
主要看了sched.h。
#### Content
##### 进程所有的状态
```c
#define TASK_RUNNING 0		// 进程正在运行或已准备就绪。
#define TASK_INTERRUPTIBLE 1	// 进程处于可中断等待状态。
#define TASK_UNINTERRUPTIBLE 2	// 进程处于不可中断等待状态，主要用于I/O 操作等待。
#define TASK_ZOMBIE 3		// 进程处于僵死状态，已经停止运行，但父进程还没发信号。
#define TASK_STOPPED 4		// 进程已停止。
```
##### 进程的结构（感兴趣的内容）
```c
struct task_struct
{
/* these are hardcoded - don't touch */
  long state;	//任务的运行状态（-1 不可运行，0 可运行(就绪)，>0 已停止）。		
  long counter; //任务运行时间计数(递减)（滴答数），运行时间片。
  long priority; //运行优先数。任务开始运行时counter = priority，越大运行越长。
  //....
/* various fields */
  //...
  unsigned long start_code, //代码段地址
	  end_code, //代码长度（字节数）
	  end_data, //代码长度 + 数据长度（字节数）
	  brk, //总长度（字节数）
	  start_stack;//堆栈段地址
  long pid, //进程标识号(进程号)。
	   father; //父进程号。
  //...
};
```
##### 存储进程的数据结构
```c
#define FIRST_TASK task[0]	// 任务0 比较特殊，所以特意给它单独定义一个符号。
#define LAST_TASK task[NR_TASKS-1]	// 任务数组中的最后一项任务。
```
##### 调度函数声明
```c
extern void sched_init (void);
// 进程调度函数。( kernel/sched.c, 104 )
extern void schedule (void);
// 异常(陷阱)中断处理初始化函数，设置中断调用门并允许中断请求信号。( kernel/traps.c, 181 )
```
---
### 第十周
#### Overview
主要看了fork.c和sytem_call.s。
#### Content
###### fork函数的汇编代码
```s
//sys_fork()调用，用于创建子进程，是system_call 功能2。原形在include/linux/sys.h 中。
//首先调用C 函数find_empty_process()，取得一个进程号pid。若返回负数则说明目前任务数组
//已满。然后调用copy_process()复制进程。
.align 2
_sys_fork:
call _find_empty_process # 调用find_empty_process()(kernel/fork.c,135)。
testl %eax,%eax
js 1f
push %gs
pushl %esi
pushl %edi
pushl %ebp
pushl %eax
call _copy_process # 调用C 函数copy_process()(kernel/fork.c,68)。
addl $20,%esp # 丢弃这里所有压栈内容。
1: ret
```
##### 复制内存（感兴趣部分）
```c
int copy_mem (int nr, struct task_struct *p)
{
  //...
  p->start_code = new_code_base;
  //...
  return 0;
}
```
##### 复制进程（感兴趣的部分）
```c
long last_pid = 0;
int copy_process (int nr, long ebp, long edi, long esi, long gs, long none,
	      long ebx, long ecx, long edx,
	      long fs, long es, long ds,
	      long eip, long cs, long eflags, long esp, long ss ){
  struct task_struct *p;
  int i;
  struct file *f;

  p = (struct task_struct *) get_free_page ();	// 为新任务数据结构分配内存。
  if (!p)			// 如果内存分配出错，则返回出错码并退出。
    return -EAGAIN;
  task[nr] = p;			// 将新任务结构指针放入任务数组中。
// 其中nr 为任务号，由前面find_empty_process()返回。
  *p = *current;		/* NOTE! this doesn't copy the supervisor stack */
/* 注意！这样做不会复制超级用户的堆栈 */ （只复制当前进程内容）。
  p->state = TASK_UNINTERRUPTIBLE;	// 将新进程的状态先置为不可中断等待状态。
  p->pid = last_pid;		// 新进程号。由前面调用find_empty_process()得到。
  p->father = current->pid;	// 设置父进程号。
  p->counter = p->priority;
 //....
  p->state = TASK_RUNNING;	/* do this last, just in case */
/* 最后再将新任务设置成可运行状态，以防万一 */
  return last_pid;		// 返回新进程号（与任务号是不同的）。
}
```
##### 获取进程号(感兴趣部分)
```c
int find_empty_process (void){
  int i;
repeat:
  if ((++last_pid) < 0)
    last_pid = 1;
  for (i = 0; i < NR_TASKS; i++)
    if (task[i] && task[i]->pid == last_pid)
      goto repeat;
  for (i = 1; i < NR_TASKS; i++)	// 任务0 排除在外。
    if (!task[i])
      return i;
  return -EAGAIN;
}
```

---

### 第十一周
#### Overview
主要看了sched.c。
#### Content
##### 调度函数（感兴趣部分）
```c
void schedule (void)
{
  int i, next, c;
  struct task_struct **p;	// 任务结构指针的指针。
//...
  /* 这里是调度程序的主要部分 */

  while (1){
      c = -1;
      next = 0;
      i = NR_TASKS;
      p = &task[NR_TASKS];
      // 这段代码也是从任务数组的最后一个任务开始循环处理，并跳过不含任务的数组槽。比较每个就绪
      // 状态任务的counter（任务运行时间的递减滴答计数）值，哪一个值大，运行时间还不长，next 就
      // 指向哪个的任务号。
      while (--i) {
	  if (!*--p)
	    continue;
	  if ((*p)->state == TASK_RUNNING && (*p)->counter > c)
	    c = (*p)->counter, next = i;
	}
      // 如果比较得出有counter 值大于0 的结果，则退出124 行开始的循环，执行任务切换（141 行）。
      if (c)
	break;
      // 否则就根据每个任务的优先权值，更新每一个任务的counter 值，然后回到125 行重新比较。
      // counter 值的计算方式为counter = counter /2 + priority。[右边counter=0??]
      for (p = &LAST_TASK; p > &FIRST_TASK; --p)
	if (*p)
	  (*p)->counter = ((*p)->counter >> 1) + (*p)->priority;
    }
  switch_to (next);		// 切换到任务号为next 的任务，并运行之。
}
```

### 第十二周
#### Overview
主要看了exit.c。
#### Content
##### 释放指定进程（感兴趣的部分）
```c
void release (struct task_struct *p){
  int i;
  if (!p)
    return;
  for (i = 1; i < NR_TASKS; i++)	// 扫描任务数组，寻找指定任务。
    if (task[i] == p){
	task[i] = NULL;		// 置空该任务项并释放相关内存页。
	free_page ((long) p);
	schedule ();		// 重新调度。
	return;
      }
  panic ("trying to release non-existent task");	// 指定任务若不存在则死机。
}
```

---
## 第四阶段
* 主要任务：提取关键数据，生成日志。
* 计划用时 ：1周

---
### 第十三周
#### Overview
定义了数据格式，并且提取关键数据，生成日志。
#### Content
##### 操作系统对应的数据格式
```json
[
//这里面是一个个的进程数据结构
]
```
##### 每一个进程的数据格式
```json
{
	"pid":,
	"father":,
	"priority":,
	"counter":,
	"state":,
}
```

---
## 第五阶段
* 主要任务：可视化关键数据，生成日志。
* 计划用时：3周

---
### 第十四周
#### Overview
使用processing进行可视化，确定相应的接口和类。
#### Content
##### main.pde
```processing
	//main.pde
	Os os;
	void setup(){
	  fullScreen();
	  background(255);
	}

	void draw(){
	  os.display();
	  os.update();
	}
```
##### Os.pde
```processing
//class os
class Os{
  //pass
  Os(){
    //init the os, including a array of process
  }
  void display(){
    //draw the os on the screen
  }
  
  void update(){
    //update the state of the os each frame
  }
  
  void loadData(){
    //load the log file each frame
  }
  
  void parseData(){
    //parse the data from the log file each frame
  }
}
```
##### Process.pde
```processing
//class process
class Process{
  //pass
  Process(JSONObject data){
    //init by the jsonobject
  }
  
   void display(){
    //draw the process on the screen
   }
}
```

---
### 第十五周
#### Overview
实现接口。
#### Content
具体内容见代码或者实验报告。

---
### 第十六周
#### Overview
调试。
#### Content
主题内容见展示的PPT。

---
