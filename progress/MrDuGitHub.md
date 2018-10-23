# Work Progress of Mr.d

## 5th Week

<font face="" size="4" color="">

In this week, we read the chapter on the file system carefully in the book *A Heavily Commented Linux Kernal Source Code--Linux Version 0.11*.  
We figure out how a file was created and closed in the Linux 0.11, and tracked the function call in this process. The same things were done with the write and save operation. We are basically clear about the data structures required for visualization in the source code.  
Next week we will read the source code at a deeper level, detailing the events we will visualize and the various elements in them, and present them in the form of drawings.  
The source files involved are as follows:  

* open.c
* namei.c
* read_write.c
* block_dev.c
* hd.c

## 6th Week

### Conclusion
* Initially determined design plan.
* Read the source code mentioned last week, determine the data structure to be visualized 
* Based on the work of the seniors last year, a temporary experimental environment was set up to confirm the authenticity of our design
* Part of the data was collected for drawing and display
* Draw pictures of our basic module,including the overall presentation of the file system and create, write and close files

### Next step
* Rebuild an experimental platform for better data collection 
* Extend the base module
	* Such as the buffer and inode sections 
	* Exploring how the file system works when accessing other types of files because we currently only consider ordinary files
* Maybe we should start to consider the tool for the final presentation 