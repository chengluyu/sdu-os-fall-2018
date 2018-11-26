# Visualization of Linux-0.11
## Week Five
In this week, I have nearly finished the book 'Linux-0.11 Full Comment' and many parts of the book interests me so much, especiall *Processing Schedule and System Calls*. Therefore, I decide to do some visualization about Processings.  
To learn more deeply and thoroughly about processing creation and destruction, I need to read the related source code which are listed as follow:
- system-call.s
- sys.c
- fork.c
- exit.c     

In next week, I will have finished the intensive reading of the related source code. And then, I will decide how to visualize the process of processing creation and destruction, including the variables needed to be shown and the visualization tools.  

## Week Six
After reading the source code, I have chosen several 'keyframes' and several key variables to show.
- processing creation
  - The time that system calls \_find_empty_process
  - The time that system calls \_copy_process
- processing destruction
  - The time that system calls free page table to release the data segment and data segment
  - The time that system calls do_exit()
  - The time that system calls syswait_pid()

I will use Qt to make a animation of processing creation and destruction. Tree strcture will show the relationship between [rocessings. Once one processing destroyed, the tree structure will rebuild.   
In next week, I will try to extract some data by the *log* tool designed by senior.

## Week Seven
I have try my best to extract the data that I need, however, there are still some data cannot be output by using the *log* tool. Thus I need to record them in GDB. Fortunately, there are not too many variables need to be recorded by hand.  
The next week, I will learn how to use GDB to debug the Linux-0.11 and get all the data that I need. And it seems that I need to begin the design the program of Qt.

## Week Eight
Collect all wanted data from "fork.c" and "exit.c". But there is too much data I have collected and the data is disordered. So, I will improve the ways to extract data.

## Week Nine
Chenyuxiang put forward a new tool to extact data. After having finished trying the new way. I decided to persist on the "log" function. And I will have to prepare for the environment of Qt.

## Week Ten
I simplified the data that I have extracted. And I clear up my data so that it will be used in a simple way.
