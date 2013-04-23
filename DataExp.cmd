del E:\backup\database\%date:~7,2%FULL.DMP
expdp system/Cossuite_123 DUMPFILE=%date:~7,2%FULL.DMP DIRECTORY=Dmpdir FULL=Y
set path=%path%;C:\Program Files\HaoZip
HaoZipC a -tzip  \\192.168.100.3\e$\backup\database\%date:~7,2%FULL.DMP.zip E:\backup\database\%date:~7,2%FULL.DMP
del  E:\backup\database\%date:~7,2%FULL.DMP