::::: place drive letter here of external harddrive used for backup and change to "backup" folder
D:
cd \backup

::::: delete old batchfiles
del makedir.bat
del changedir.bat

::::: create variable named "folder" with date in desired and proper format
::::: yy_mm_dd(day)
set folder=%date:~-2%/%date:~4,5%(%date:~0,3%)
set folder=%folder:/=_%

::::: create two new batchfiles to create proper folder and change to it
echo md %folder% > makedir.bat
echo cd %folder% > changedir.bat



