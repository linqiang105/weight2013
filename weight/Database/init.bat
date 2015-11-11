echo off 
title 建立数据库 
cls 
color 0f
echo 如果系统上存在名为WEIGHT20的数据库 
echo 将完全清除其数据 
echo 请谨慎选择
set choice= 
set /p choice=重新建立请按y,否则请按n:
if /i "%choice%"=="y" goto createdb 
if /i "%choice%"=="n" goto end 
:createdb 
osql -E -n -i weight20.sql
pause
:end
exit