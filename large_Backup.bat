::::: STEP 0a. uncomment line below "cmd /k" to keep cmd window open after batch file is called to double-check functioning
:::::      0b. leave step 4 commented out until you have accumulated the desired number of backups 

::::: STEP 1. name of drive and folder on which to place backed up files (make this folder if it doesn't exist)
D:
cd \backup\

::::: STEP 2. Get date, make dir based on date, change to it/

call getdate.bat
if not exist makedir.bat goto 99abend
call makedir.bat
call changedir.bat

::::: STEP 3. copy files to be backed up
::::: usage: command source destination

xcopy "C:\Users\Administrator\*.*" D: /s /e

::::: STEP 4. If backup successful, remove oldest copy
::::: a. change to correct directory
::::: b. pipe contents of "dir" to "findstr" and output to "directories.txt"; directories.txt now contains only directories in folder
::::: c1. place line numbers on output of "findstr" on "directories.txt" and pipe to second "findstr", excluding all but first line and output to "folder.txt"
::::: c2. "folder.txt" now contains only oldest folder
::::: d. set "temp" variable to contents of "folder.txt", i.e., a line of input specified ("/p")
::::: e. set "folder" variable to last 13 characters of "temp" variable, i.e., length of name of oldest directory, e.g., "19_03_24(Sun)"
::::: f. remove this directory, as well as all its subdirectories and files ("/s") and do not prompt user for permission ("/q")

cd ..
:dir | findstr "<DIR>.*[^.]$" > directories.txt
:findstr /n "<DIR>.*[^.]$" directories.txt | findstr "^[^2-9]" > folder.txt
:set /p temp=<folder.txt
:set folder=%temp:~-13%
:rd /s /q %folder%

::::: STEP 5. Print success or failure messages
::::: a. if copy successful, must change directory back to newest copy

:98saved
call changedir.bat
echo "Backup Created Successfully!" %time% > _success.txt
goto 00end

:99abend
echo "Error creating backup! please check settings and try again!" %time% > _fail.txt

:00end

::::: STEP 6. Pause and Shutdown

::::: uncomment this shutdown line to shutdown computer after copying succeeds/fails
:shutdown -s -t 5

::::: comment this line out to allow the cmd window to close after the script runs
cmd /k

