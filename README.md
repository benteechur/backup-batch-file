# backupBatchFile
Create Regular Backups of a Particular Folder, e.g., of a Particular Windows User's Data. This script allows large amounts of data to be backed-up by deleting the oldest backup.

Instructions:

1.	Make sure you are logged into the user's account (will be required later for Task Scheduler).
2.	Plug in the external hard drive you will use. Create a folder on root of external hard drive called “backup”.  
3.	Place the .bat files (2 total) on the local computer, e.g. onto the root of C: and in a folder named “backup”.
4.	Open the newly renamed “backup” folder on C: and open “large_Backup.bat” by right clicking on it and selecting “Edit”.
5.	Under step 1 in large_Backup.bat, change the drive letter from D: to whatever the letter of the external hard drive is.
6.	Under step 3 in large_Backup.bat, change “C:\Users\Administrator\” to the name of the folder/user account you would like to backup; NOTE:  after the path of the directory you will be backing up, you must type ”\*.*” (these are wildcards to ensure that all files and directories contained will be copied; use BACK slashes).
For example: C:\Work\PSpice\*.*
7.	Under step 3 in large_Backup.bat, change the drive letter D: to whatever the letter of the external hard drive is.
8.	Save large_Backup.bat and close it.
9.	Under the newly renamed “backup” folder on C:, open “getdate.bat” by right clicking on it and selecting “Edit”.
10.	On the first line of “getdate.bat”, change the drive letter E: to whatever the letter of the external hard drive is.
11.	Save getdate.bat and close it.
12.	Cut “getdate.bat” and paste it into a folder, named, e.g., “backup,” on root of the external hard drive you plugged in in step 2.
13.	Open Task Scheduler (search for it in the Windows search box); do NOT run as administrator (i.e., by right-clicking on shortcut).
14.	Under the “Action” menu, click “Create Basic Task”.
15.	Name the task and click “Next”.
16.	Select how often you would like the backup to take place, e.g., Weekly on Thursday at 8:00:00 PM. Click “Next”. NOTE: to test if your completion of the steps was successful, try setting the time to run the backup to be 1 minute from the current time; if it works, just set it back to the original desired time (e.g., 8:00:00 PM).
17.	Select “Start a Program” from the Action list.
18.	Click Browse and select “large_Backup.bat” from the “backup” folder on C: and click “Next”.
19.	Click Finish.  If done correctly, the cmd window should open and the files should begin copying. If you are only copying a small amount of data, the cmd window will remain open despite the script finishing so you can check where any errors might have occurred. If the process finished, you may check the success by opening the “backup” folder on the external hard drive and looking at the .txt file that was created:
Success = _success.txt
Failure = _fail.txt

Final Notes:
1.	The computer must be turned on and the user must be logged in for the backup script to run.
2.	DO NOT create additional folders within this “backup” folder on the external drive as this will potentially disrupt proper operation of this script.
3.	The batch file “getdate.bat” will create two additional batch files, “makedir.bat” and “changedir.bat”. This is normal functioning of the script, and both of these batch files are needed for the backup to complete successfully.
4.	Uncomment the following line in step 6 by removing the “:” in front of it:
shutdown -s -t 5
This line will now shut the computer down after the backup is finished.
5.	There is one final step to be completed. This script does not intelligently maintain a certain number of backups, but simply deletes the most recent one. Therefore, after the desired number of backups have been achieved, uncomment the code under step 4. There are the 5 lines of code that have been commented out. The first one begins: “dir | findstr”. The last one is: “rd /s /q %folder%”. Uncomment lines by removing the leading colon.



