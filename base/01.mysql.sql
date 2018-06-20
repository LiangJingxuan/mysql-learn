-- 连接mysql数据库
mysql -h localhost -u root -p ;

-- 查看数据库
show databases;

-- 创建数据库
create database test;

-- 使用数据库
use test;

-- 查看数据表 
show tables;

-- 删除数据库
drop database test;

-- 删除数据表
drop table test;

-- 创建表
create table user (
	name varchar(20),
	age int
);

-- 修改表名
rename table oldname to newname;

-- 查看表结构
desc test;