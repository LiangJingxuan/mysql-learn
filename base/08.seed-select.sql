-- where 子查询：将查询结果作为where条件
SELECT * FROM users WHERE id=
	(SELECT id FROM users ORDER BY id DESC LIMIT 0,1);

SELECT * FROM users WHERE age in(
	(SELECT MAX(age) FROM users GROUP BY cid)
);



-- from 子查询：将查询结果当做表提供再次查询
SELECT * FROM (
	SELECT * FROM users ORDER BY cid,age DESC
) AS tpm GROUP BY cid;



# 练习：查出不及格两门以上不及格同学的平均分
SELECT name,AVG(num) AS pjf FROM stu WHERE name in (
	(
		SELECT name FROM 
			( SELECT name,COUNT(name) AS s FROM stu WHERE num<60 GROUP BY name HAVING s>=2) AS u
	)
) GROUP BY name;





-- exists 子查询：把外层的查询结果拿到内层，看内层的查询是否成立
SELECT * FROM class WHERE EXISTS (
	SELECT * FROM users WHERE users.cid=class.id
);