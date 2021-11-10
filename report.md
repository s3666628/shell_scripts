# Report for Unix Admin: Assignment 02 - Requirement 07

## Report - Graphical Output of CPU & Physical Memory Analysis

In this report I will analyze several GNU PLOT graphs that were generated based on data captured from a Raspberry Pi 4 during the compilation of a new kernel. I will also attempt to provide some analysis on the relationship between the different graphs.

Note - this version has graph data taken from running the script during compilation of kernel on 10/11/2021. Kernel compile starts at 700 Seconds and ends at 4457 Seconds.



### Graph 1 - CPU & GPU Temp During Kernel Compile Time

This graph shows the CPU and GPU temperature during the compile of the kernel. Prior to starting compilation the temp is around 48 C, which is the temp that the CPU is at during normal use of the Pi. Then the temperature climbs over the next 4 Min's to peak temperature of 64 C, once the compile process is complete the CPU cools down to 50 C. We can also see that the GPU tracks the CPU, tracking a couple of degrees higher - this tells us that the GPU is also used as part of the kernel compile process. The more work the processors undertake the higher the heat that is generated from them.

![cpu gpu temp graph](/cpu_temp_graph_report.png "CPU & GPU Temp")


### Graph 2 - CPU Frequency During Kernel Compile Time

This graph show the CPU Frequency in Mega Hertz - firstly, it is noteable that the frequency graph closely tracks the trajectory of the CPU Temp Graph above, this is because the CPU Frequency is measuring the clock speed of the processor, i.e. the number of instructions that are being executed increases during compile time as the computer is working harder. Once the compile is complete the frequency is reduced, and we can see the temperature decreasing at the same time - there is a direct connection between the frequency of the CPU cores and the heat that is generated.

![cpu frequency graph](/cpu_frequency_graph_report.png "CPU Frequency")



### Graph 3 - CPU Usage During Kernel Compile Time

This graph show the CPU Usage during the compile time - this has been calculated from the %idle minus 100 to give the percentage of time the CPU was being utilized. As can be seen from the graph the CPU usage is constant during the compile process and does not track the other CPU related graphs above.

![cpu usage graph](/cpu_useage_graph_report.png "CPU Usage")


### Graph 4 - Physical Memory Usage During Kernel Compile Time

This graphs shows an inverse relationship to the CPU / GPU Temp / Freq. At the start of the kernel compilation there is only 4 Megabytes of RAM available but this increases as we near the end of the compile type. As more items are compiled the memory is released, at the end of the compilation process the RAM reaches a steady state of approx 4.8 Megabytes.

![memory free graph](/mem_free_graph_report.png "Memory Free")

References


