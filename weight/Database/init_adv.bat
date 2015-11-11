echo off 
title 建立数据库 
cls 
color 0f
echo 如果系统上存在名为WEIGHT20的数据库 
echo 将完全清除其数据 
echo 请谨慎选择
echo ==================================
echo 1、使用NT验证方式重建数据库；
echo 2、使用SQL账户sa重建数据库；(默认密码:123)
echo 3、取消重建；
echo ==================================
set /p choice=请选择操作方式：
if /i "%choice%"=="1" goto createdb1 
if /i "%choice%"=="2" goto createdb2 
if /i "%choice%"=="3" goto end 
:createdb1 
osql -E -n -i weight20.sql
pause
exit
:createdb2
osql -U sa -n -i weight20.sql
pause
exit
:end
exit