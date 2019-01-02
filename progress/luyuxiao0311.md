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

## Week Eleven
Because there are three crews in our group, it seems that it is diffcult to generate all of the data together. We solved the problem this week.    
In the next week, We will discuss about the details of visualization and get down to write the vis part.

## Week Twelve
The strength of Qt lies in interaction, which means The graphical interface can be changed according to user's input. And we can read data from a file in real-time. However, we cannot extract data from the Linux-0.11 in real-time. So, Why don't we write the data in the program? We have to revisit the appropriateness of using Qt as a visualization tool.    
Fortunately, it seems that processing is a suitable vis tool. It is based on Java, therefore, we are quite familiar with his grammar, and, We will master it very quickly

## Week Thirteen
We believe that only a few processes of initialization are not enough. We found a mirror with conpiled "hello.c". At first, we decide to use is instead. However, We found that in the new image, the process is created in a different order than before, which means the OS has been modified.
Finally, we decide to use the origin mirror.   
To create more process, we find that "cd" and "ls" will make several new processes, So we decide to create more processes in this way.

## Week Fourteen
After a few weeks of learning, I can use it to implement a PPT-like animation. But the fineness of the lines and the richness of the animation are much higher than the PPT because you can control each line and each point by programming.    
In order to show better results, I read it's document this week, and I have a preliminary understanding of all functions, I will begin to program next week.

## Week Fifteen
Because of the fine control of each line, programming is to manually calculate the coordinates of a large number of points, so the programming workload is huge.   
In order to better control what kind of animation should be played at what time, I used a time slice-like approach to control.
In order to make the procedures of the three people in the group organically, we redefine the interface of our function.

## Week Sixteen
We recorded the video and soundtrack of our animation.
