# Report for Unix Admin: Assignment 02 - How Run the Profiler Script

### The Main Shell Script

These are the two shell scripts that have been created for Assigment 2. Note that the "as_02_profiler.sh" script will call the "as_02_profiler_led.sh" script, so this script does not need to be run from the command line (it will run in the background using nohup).

	-as_02_profiler.sh  
	-as_02_profiler_led.sh

### How to the run the script as_02_profiler.sh (default)

In order to run the script enter the following command - we need to run the script as sudo as root permissions are needed to access the LED on the Raspberry Pi.

		-sudo ./as_02_profiler.sh
		
### How to the run the script as_02_profiler.sh for specific processes (commented out by default)

There is commented out code, an if statement - if this is uncommented then the script will take a parameter from the command line where "stop_me" is the name of the process you are looking to monitor. If this process is not found then the script will exit. Note - this is commented out as was not required for the A2 but the idea was that this would mean that the script will target specific processes.

		-sudo ./as_02_profiler.sh stop_me


### Script Output Results

during run time the script will echo information to the console and will append the same data in CSV format to the following file:

		-output_results.txt
		
### Killing the Script USR1 and USR2


Both scripts can be killed with the following commands - inputing this command will end the script gracefully, output to the results will cease and GNU PLOT graphs will be generated as final commands of script.

		-main script: kill -USR1 PID
		-led script: kill -USR2 PID

### GNU PLOT Graphs

The code to generate the GNU PLOT graphs is contained in the following scripts

		-cpu_temp_plot.gp
		-cpu_freq_plot.gp
		-cpu_use_plot.gp
		-mem_free_plot.gp

These will be called from the main script (as_02_profiler.sh) once the kill signal has been received - they will generate the following graphs

		-cpu_temp_graph.png 
		-cpu_frequency_graph.png
		-cpu_useage_graph.png
		-mem_free_graph.png


### REPORT.MD

as part of Assignment 2 - a report has been written with some analysis of the graphs as per the requirement. Note - the report is using the following graphs as these were generated as part of a 1.2 hour kernel compile process. There have a different name the auto generated reports so that they are not overwritten, to ensure that the report has graphs from a real life compile run.

		-cpu_temp_graph_report.png 
		-cpu_frequency_graph_report.png
		-cpu_useage_graph_report.png
		-mem_free_graph_report.png


### Git Log

The output from the "git log" command has been redirected to the following file 

		-git_log.txt 


### Other Files

The following files, not included files already mentioned, are generated as part of running the script, or were used for testing purposes.

		-nohup.out (auto generated)        
		-stop_me.sh (used for testing)
		-output_free.txt (script generated)
		-output_mpstat.txt (script generated)
		-readme.md (this file - user guide)



