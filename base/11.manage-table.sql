-- 增加列
ALTER TABLE 表名 ADD 声明列[列名称 列类型 列属性 默认值];

-- 增加的列默认是在表的最后一列
-- 可以用 AFTER 来声明新增的列在哪一列后面
ALTER TABLE 表名 ADD 声明列[列名称 列类型 列属性 默认值] AFTER 列名;

-- 增加的列在最前面用 FIRST
ALTER TABLE 表名 ADD 声明列[列名称 列类型 列属性 默认值] FIRST;




-- 修改列
ALTER TABLE 表名 CHANGE 被改变的列名 声明列[列名称 列类型 列属性 默认值];




-- 删除列
ALTER TABLE 表名 DROP 列名;