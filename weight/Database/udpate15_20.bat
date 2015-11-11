echo off 
title 升级数据库 
cls 
color 0f 
echo 此文件用于将WEIGHT15升级至WEIGHT20版本
echo 此操作将清除现有WEIGHT20中数据,是否继续?  
set choice= 
set /p choice=继续请按y,否则请按n:
if /i "%choice%"=="y" goto updatedb 
if /i "%choice%"=="n" goto end 
:updatedb 
osql -E -n -i update15_20.sql
pause
:end
exit