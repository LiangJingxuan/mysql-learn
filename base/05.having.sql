-- 通过结果进行条件查找

-- 查找每个人总的工资并大于30000的数据
SELECT name,age,salary*cid AS s,class FROM users HAVING s>30000;

-- 查找每个组中总工资并大于30000的数据
SELECT class,salary*cid AS s FROM users GROUP BY class HAVING s>30000;


# 练习
CREATE TABLE `stu` (
`name`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`study`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`num`  decimal(4,2) UNSIGNED ZEROFILL NOT NULL 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=COMPACT
;
INSERT INTO stu 
(name,study,num) 
VALUES 
('张三','数学',90),
('张三','语文',50),
('张三','地理',40),
('李四','语文',55),
('李四','政治',45),
('王五','政治',30);

# 列出分数不及格的数据
SELECT name,num<60 FROM stu;

# 按人分组统计每个人不及格的数量
SELECT name,SUM(num<60) AS s FROM stu GROUP BY name;

# 按人分组统计每个人不及格的数量及每个人的平均分
SELECT name,SUM(num<60) AS s,AVG(num) FROM stu GROUP BY name;

# 最终结果：统计超过两科以上不及格的人的平均分
SELECT name,SUM(num<60) AS s,AVG(num) AS a FROM stu GROUP BY name HAVING s>=2;
