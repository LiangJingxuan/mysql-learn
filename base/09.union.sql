-- union：联合 把两次或多次查询结果合并起来

-- 要求：两次查询的列数一致
-- 推荐：查询的每一列 相对应的列类型也一样
-- 可以来自于多张表
-- 多次sql语句取出的列名可以不一致，此时以第一个sql的列名为准

-- 如果不同的语句取出的行有完全相同（每个列的值都相同）
-- 那么相同的行将会合并去重复

-- 如果不想去重复可以加 all 来指定

-- 如果子句中有orderby,limit 需要加小括号(), 需要放到最后, 对最终合并后的结果排序
-- 在子句中, orderby 配合 limit 使用才有意义, 如果 orderby 不配合 limit 使用会被语法分析器优化分析时去除


SELECT * FROM ta UNION SELECT * FROM tb;

SELECT * FROM ta UNION ALL SELECT * FROM tb;

(SELECT tid,tnam FROM ta WHERE tid=3) 
	UNION
		(SELECT tid,tname FROM ta WHERE tid=4) ORDER BY tid DESC;