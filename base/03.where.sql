-- 一般条件查询
SELECT * FROM users WHERE age=21;
SELECT * FROM users WHERE age>21;
SELECT * FROM users WHERE age<21;
SELECT * FROM users WHERE age>=21;
SELECT * FROM users WHERE age<=21;
SELECT * FROM users WHERE age!=21;

-- 在范围中条件查询
SELECT * FROM users WHERE age IN (21,24);

-- 在范围内条件查询
SELECT * FROM users WHERE age BETWEEN 21 AND 24;

-- 与或非条件查询
SELECT * FROM users WHERE ( age BETWEEN 21 AND 24 ) AND ( salary IN (10000) );
SELECT * FROM users WHERE ( age BETWEEN 21 AND 24 ) OR ( salary IN (10000) );
SELECT * FROM users WHERE salary NOT IN (10000);

-- 模糊条件查询 '%'通配所有字符 '_'通配一个字符，几个下划线表示通配几个字符
SELECT * FROM users WHERE name LIKE '张%';
SELECT * FROM users WHERE name LIKE '张_';
SELECT * FROM users WHERE name LIKE '王__';

# 例：找出年龄21到25内，工资在一万，并且姓张的人
SELECT * FROM users WHERE (age BETWEEN 21 AND 25) OR (salary IN (10000)) AND (name LIKE '张%');