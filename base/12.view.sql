-- 视图
-- 由查询结果形成的一张虚拟表

-- 创建视图
CREATE VIEW olduser AS SELECT * FROM users WHERE age>25;

-- 删除视图
DROP VIEW olduser;

-- 修改视图
-- ALTER VIEW .. AS SELECT....


-- 视图与表的关系
-- 视图是表的查询结果，表的数据变了影响视图的结果；

-- 视图的增删改也可以影响到表，
-- 但是视图并不能总是能增删改；

-- 视图的数据与表的数据一一对应时 可以修改；
-- 对于视图 insert 必须包含所有表中没有默认值的列；


-- 视图的algorithm
-- algorithm=[merge/temptable/undefined]

/*
	merge：意味着视图只是一个语句规则，当查询视图时，把查询视图的语句（比如where那些）
		   与创建时的where子句等合并，分析成一条select语句。
*/

/*
	temptable：是根据创建语句瞬间创建一张临时表，然后查询视图的语句从该临时表查询数据。

*/

/*
	undefined：默认系统自动选择

*/

-- temptable:
CREATE ALGORITHM=TEMPTABLE VIEW olduser AS SELECT * FROM users WHERE age>25;
