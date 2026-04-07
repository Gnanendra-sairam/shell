what is shell?

==============



A shell is a program that acts as an interface between you (the user) and the operating system (OS kernel).

🧑‍💻 You type a command → 🐚 Shell interprets it → ⚙️ Kernel executes it → 📜 Shell shows the output.

(interpret means to read and execute instructions line by line, instead of translating the whole program at once.)

The shell is your command-line environment — where you can run commands, scripts, and automate tasks.



You can check which shell you’re using: \[echo $SHELL]





what is bash?

=============



There are many types of shells — each with its own syntax and features like bash, bourne shell, c shell but bash is most popular among them. 

Bash stands for “Bourne Again Shell.”

It’s a command-line interpreter (shell) used in Linux and macOS to run commands and automation scripts.

Bash is a program that lets you talk to the operating system.

When you open a terminal in Linux or macOS, you’re usually working inside Bash by default.

You can:

Run commands like ls, cd, mkdir

Write automation scripts

Control servers and DevOps tools





why do we need shell scripting?

===============================



1\. Automation of Repetitive Tasks

You don’t want to manually run 10 or 20 Linux commands every time.

Instead, write those commands in a script and execute it in one go.



2.System Administration

System admins and DevOps engineers use shell scripts to:

Monitor CPU, RAM, and disk usage

Backup files or logs automatically

Start/stop/restart services

Add or delete user accounts



3.DevOps \& Cloud Automation

In DevOps, shell scripting plays a huge role:

Automating deployments (using Jenkins, Docker, Kubernetes)

Running startup scripts on AWS EC2

Managing infrastructure as code

Integrating CI/CD pipelines



4.Scheduling Tasks (Cron Jobs)

You can use shell scripts to run tasks automatically at specific times using cron jobs. 



5.Log Management \& Monitoring

Shell scripts can monitor logs and alert when something unusual happens:



Real world example

================== 



Connecting to Linux EC2 Instance



Connect to your Linux EC2 instance using MobaXterm (or any SSH client).

Switch to the root user:

sudo su

Move to the root directory:

cd /

Update system packages:

yum update -y



Creating and Managing Log Files



Create a new directory named logsystem:

mkdir logsystem

cd logsystem

Create a file named system.log and add some content:

echo "file content" > system.log

cat system.log

Create another file named application.log and add content:

echo "file content" > application.log

cat application.log

List all files:

ls



Searching for Log Errors Using grep



Run the following commands to search for specific patterns in your log files:

grep -c "ERROR" system.log

grep -c "FATAL" system.log

grep "ERROR" system.log

grep -c "CRITICAL" system.log

Repeat the same commands for application.log:

grep -c "ERROR" application.log

grep -c "FATAL" application.log

grep "ERROR" application.log

grep -c "CRITICAL" application.log



Finding Recently Modified Log Files

To find all .log files modified in the last 24 hours:

find . -name "\*.log" -mtime -1



Creating a Shell Script to Automate Log Analysis

------------------------------------------------

What is a Shell Script?

A shell script is a text file that contains a sequence of Linux commands.

It helps automate repetitive tasks such as log analysis, system updates, and backups.



Steps to Create and Run the Script:



Create a new shell script file:

touch analyse-log.sh

vim analyse-log.sh



Press i to enter insert mode and paste the following commands:

find . -name "\*.log" -mtime -1

grep -c "ERROR" system.log

grep -c "FATAL" system.log

grep "ERROR" system.log

grep -c "CRITICAL" system.log

grep -c "ERROR" application.log

grep -c "FATAL" application.log

grep "ERROR" application.log

grep -c "CRITICAL" application.log

Press Esc, then type:

:wq



Make the script executable:

chmod +x analyse-log.sh



Run the script:

./analyse-log.sh

File extension and shebang statement
====================================
1. File Extension
The file extension is the part of a filename that comes after the dot (.) — it helps identify the file type.
In shell scripting, the common extension is:
.sh
.sh tells users (and editors) that the file contains shell script commands, though Linux actually runs it based on permissions and the shebang, not the extension.
2. Shebang Statement (#!)
The shebang (#!) is the first line of a shell script.
It tells the system which interpreter should execute the script.
Example:
#!/bin/bash
#! → called shebang
/bin/bash → path to the Bash shell interpreter

Formatting and Readability improvements
=======================================
For the above example the log analysis the output is not good and it is hard to understand without reading script, no seperation between the commands and their output. The output must be human-formatting,eaach command and its output clearly separated.

[echo coomand is a built-in command used to print text or variables to terminal(standrd output)]

[echo "\n"]-->prints "\n"
[echo -e "\n"]--> adds new line

lets adjust our file
--------------------
echo "amnalysing log files"
echo "====================="

echo -e "\n List of log files updated in last 24 hours"
find . -name "\*.log" -mtime -1
 
echo -e "\n Numer of ERROR logs found in system.log file"
grep -c "ERROR" system.log

echo -e "\n Numer of FATAL logs found in system.log file"
grep -c "FATAL" system.log

echo -e "\n searching ERROR logs in system.log file"
grep "ERROR" system.log

echo -e "\n Numer of CRITICAL logs found in system.log file"
grep -c "CRITICAL" system.log

echo -e "\n Numer of ERROR logs found in application.log file"
grep -c "ERROR" application.log
 
echo -e "\n Numer of FATAL logs found in application.log file"
grep -c "FATAL" application.log

echo -e "\n searching ERROR logs in application.log file"
grep "ERROR" application.log

echo  -e "\n Numer of CRITICAL logs fouind in application.log file"
grep -c "CRITICAL" application.log

Script improvement: Use absolute path
=====================================
in the script insted of the file name  if you give the give the path then you can exicute this file from any folder 
e.g., /home/ec2-user/logsystem/system.log


Using Variables in Shell Scripts:
=================================
They store repeated values like directory location,file names, error pattern 

LOG_DIR="/system.logs"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"

PATTERN_ERROR="ERROR"
PATTERN_FATAL="FATAL"
PATTERN_CRITICAL="CRITICAL"
# -------------------------------------------

echo "Analyzing log files"
echo "====================="

# Step 1: Find recently updated log files
echo -e "\nList of log files updated in the last 24 hours:"
find "$LOG_DIR" -name "*.log" -mtime -1


# Step 2: Analyze system.log
echo -e "\n===== SYSTEM.LOG ANALYSIS ====="

echo -e "\nNumber of $PATTERN_ERROR logs found in $SYS_LOG_FILE:"
grep -c "$PATTERN_ERROR" "$LOG_DIR/$SYS_LOG_FILE"

echo -e "\nNumber of $PATTERN_FATAL logs found in $SYS_LOG_FILE:"
grep -c "$PATTERN_FATAL" "$LOG_DIR/$SYS_LOG_FILE"

echo -e "\nSearching for $PATTERN_ERROR log lines in $SYS_LOG_FILE:"
grep "$PATTERN_ERROR" "$LOG_DIR/$SYS_LOG_FILE"

echo -e "\nNumber of $PATTERN_CRITICAL logs found in $SYS_LOG_FILE:"
grep -c "$PATTERN_CRITICAL" "$LOG_DIR/$SYS_LOG_FILE"


# Step 3: Analyze application.log
echo -e "\n===== APPLICATION.LOG ANALYSIS ====="

echo -e "\nNumber of $PATTERN_ERROR logs found in $APP_LOG_FILE:"
grep -c "$PATTERN_ERROR" "$LOG_DIR/$APP_LOG_FILE"

echo -e "\nNumber of $PATTERN_FATAL logs found in $APP_LOG_FILE:"
grep -c "$PATTERN_FATAL" "$LOG_DIR/$APP_LOG_FILE"

echo -e "\nSearching for $PATTERN_ERROR log lines in $APP_LOG_FILE:"
grep "$PATTERN_ERROR" "$LOG_DIR/$APP_LOG_FILE"

echo -e "\nNumber of $PATTERN_CRITICAL logs found in $APP_LOG_FILE:"
grep -c "$PATTERN_CRITICAL" "$LOG_DIR/$APP_LOG_FILE"


# Step 4: Completion message
echo -e "\n✅ Log analysis completed successfully!"

note:
variable_name="data" (it is correct syntax)
variable_name = "data" (it is not correct we must not live the space)

Using Arrays in Shell Scripts:
==============================
An array in shell scripting is a variable that can hold multiple values at the same time.
Each value in the array is identified by an index number, starting from 0.

syntax:
------
Declaring an Array 
array_name=(value1 value2 value3 ...)
exmaple: fruits=("apple" "banana" "cherry")

accessing Array Elements:
${array_name[index]}
example:echo ${fruits[0]}   
        echo ${fruits[1]}   


#!/bin/bash


# Directory and file paths
LOG_DIR="/home/ec2-user/logsystem"
SYS_LOG_FILE="$LOG_DIR/system.log"
APP_LOG_FILE="$LOG_DIR/application.log"

# Array of error patterns
error_patterns=("ERROR" "FATAL" "CRITICAL")

echo "Analyzing log files..."
echo "======================="

# Step 1: List log files updated in the last 24 hours
echo -e "\nList of log files updated in the last 24 hours:"
find "$LOG_DIR" -name "*.log" -mtime -1

# ----------------------------------------
# System Log Analysis
# ----------------------------------------
echo -e "\n======================================="
echo "Analyzing System Log File: system.log"
echo "======================================="

echo -e "\nNumber of ${error_patterns[0]} logs found in system.log:"
grep -c "${error_patterns[0]}" "$SYS_LOG_FILE"

echo -e "\nNumber of ${error_patterns[1]} logs found in system.log:"
grep -c "${error_patterns[1]}" "$SYS_LOG_FILE"

echo -e "\nNumber of ${error_patterns[2]} logs found in system.log:"
grep -c "${error_patterns[2]}" "$SYS_LOG_FILE"

echo -e "\nSearching for ${error_patterns[0]} logs in system.log:"
grep "${error_patterns[0]}" "$SYS_LOG_FILE"

# ----------------------------------------
# Application Log Analysis
# ----------------------------------------
echo -e "\n=========================================="
echo "Analyzing Application Log File: application.log"
echo "=========================================="

echo -e "\nNumber of ${error_patterns[0]} logs found in application.log:"
grep -c "${error_patterns[0]}" "$APP_LOG_FILE"

echo -e "\nNumber of ${error_patterns[1]} logs found in application.log:"
grep -c "${error_patterns[1]}" "$APP_LOG_FILE"

echo -e "\nNumber of ${error_patterns[2]} logs found in application.log:"
grep -c "${error_patterns[2]}" "$APP_LOG_FILE"

echo -e "\nSearching for ${error_patterns[0]} logs in application.log:"
grep "${error_patterns[0]}" "$APP_LOG_FILE"

echo -e "\nLog analysis completed successfully ✅"




note:
we can also save the result of command execution in a variable 

 in general this command will give the output files that modified in last 24 hours

 find "$LOG_DIR" -name "*.log" -mtime -1

we can store this output in variable and we can print it

example:
modified_data=$(find "$LOG_DIR" -name "*.log" -mtime -1)
echo "$modified_data"

Loops in Shell Scripts:
=======================
Loops are used to repeat a set of commands multiple times -either for a fixed number of times, or for every item in a list(like a file,array and command output)
 
syntax:

for variable in list
do
    commands
done

example 1:

#!/bin/bash


# Directory and file paths
LOG_DIR="/home/ec2-user/logsystem"
SYS_LOG_FILE="$LOG_DIR/system.log"
APP_LOG_FILE="$LOG_DIR/application.log"

# Array of error patterns
error_patterns=("ERROR" "FATAL" "CRITICAL")

echo "Analyzing log files..."
echo "======================="

# Step 1: Find and store log files updated in the last 24 hours
modified_data=$(find "$LOG_DIR" -name "*.log" -mtime -1)

if [ -z "$modified_data" ]; then
    echo "No log files modified in the last 24 hours."
    exit 0
fi

echo -e "\nList of log files modified in the last 24 hours:"
echo "$modified_data"

# Step 2: Analyze each log file
for log_file in $modified_data
do 
    echo -e "\n========================================"
    echo "Analyzing File: $log_file"
    echo "========================================"

    echo -e "\nNumber of ${error_patterns[0]} logs found in $log_file:"
    grep -c "${error_patterns[0]}" "$log_file"

    echo -e "\nNumber of ${error_patterns[1]} logs found in $log_file:"
    grep -c "${error_patterns[1]}" "$log_file"

    echo -e "\nNumber of ${error_patterns[2]} logs found in $log_file:"
    grep -c "${error_patterns[2]}" "$log_file"

    echo -e "\nSearching for ${error_patterns[0]} logs in $log_file:"
    grep "${error_patterns[0]}" "$log_file"
done

echo -e "\nLog analysis completed successfully ✅"

===============================================
 
 "[@]" --> Array subscript that means "each element remains a separate entity"
 and if want use array you must enclose the frount and back with {}
 ex:for pattern in "${error_patterns[@]}"

 ${arr[*]}-->All elements as one string
 ${arr[@]}-->All elements as individual items

exaple 2: 


#!/bin/bash

LOG_DIR="/home/ec2-user/logsystem"
error_patterns=("ERROR" "FATAL" "CRITICAL")

modified_data=$(find "$LOG_DIR" -name "*.log" -mtime -1)

for log_file in $modified_data
do 
    echo -e "\nAnalyzing File: $log_file"
    for pattern in "${error_patterns[@]}"
    do
        echo -e "\nNumber of $pattern logs found in $log_file:"
        grep -c "$pattern" "$log_file"

        echo -e "\nSearching for $pattern logs in $log_file:"
        grep "$pattern" "$log_file"
    done
done

Writing to files:
=================

save the output to the report file. to make it shareable and reusable

note:
">" and ">>" are redirection operators used to send output to a file insted of displaying

">" -->Overwrites the previous contents every time the command is executed
">>" --> appends  every new output to the existing content

example:

echo "System log analysis started" > report.txt
grep -c "ERROR" system.log >> report.txt
grep -c "FATAL" system.log >> report.txt
echo "Analysis completed" >> report.txt

Conditionals (if staements):
=========================

Conditionals are used to **make decisions** in shell scripts — they allow the script to execute commands **only if certain conditions are true**.


## Syntax

if [ condition ]
then
    commands
fi


* `if` starts the condition.
* `[ condition ]` — this is the test (must have spaces inside the brackets).
* `then` — begins the block of commands to execute if the condition is true.
* `fi` — marks the end of the `if` block (`fi` = “if” reversed).


## Example 1: Checking if a file exists


if [ -f "/home/ec2-user/logsystem/system.log" ]
then
    echo "System log file exists."
fi


###  Example 2: Using `else`


if [ -f "/home/ec2-user/logsystem/system.log" ]
then
    echo "System log file exists."
else
    echo "System log file not found."
fi


# Example 3: Using `elif`


if [ -f "system.log" ]
then
    echo "System log found."
elif [ -f "application.log" ]
then
    echo "Application log found."
else
    echo "No log files found."
fi


###  Common File Test Options
-f	True if file exists and is a regular file
-d	True if directory exists
-e	True if file or directory exists
-s	True if file exists and is not empty
-r	True if file is readable
-w	True if file is writable

-eq	Equal to	
-ne	Not equal to	
-gt	Greater than	
-lt	Less than	
-ge	Greater than or equal to	
-le	Less than or equal to


