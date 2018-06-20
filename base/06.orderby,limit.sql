-- ORDER BY

-- 单个条件排序
SELECT * FROM users ORDER BY age DESC;

-- 多个条件排序
SELECT * FROM users ORDER BY age DESC, cid DESC;



-- LIMIT[偏移量],n(条目数)

-- 查询年龄最大的三个人
SELECT * FROM users ORDER BY age DESC LIMIT 0,3;