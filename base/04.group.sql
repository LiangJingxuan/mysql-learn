-- 分组查询每个组工资最高的
SELECT class,MAX(salary) FROM users GROUP BY class;

-- 分组查询每个组工资最低的
SELECT class,MIN(salary) FROM users GROUP BY class;

-- 分组查询每个组平均工资
SELECT class,AVG(salary) FROM users GROUP BY class;

-- 分组查询每个组工资的总合
SELECT class,SUM(salary) FROM users GROUP BY class;

-- 分组查询每个组共有多少条数据
SELECT class,COUNT(salary) FROM users GROUP BY class;

