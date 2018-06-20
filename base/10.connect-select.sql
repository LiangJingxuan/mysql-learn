-- 连接查询

-- 左右连接
-- 以左表为准，去右表找匹配数据，找不到匹配数据用NULL补齐

SELECT users.id,users.name,age,tel,class.name cname FROM 
	users LEFT JOIN class
	ON cid=class.id;


-- 内连接
-- 查询左右表都有的数据，不要左右连接中NULL的那一部分

SELECT users.id,users.name,age,tel,class.name cname FROM 
	users INNER JOIN class
	ON cid=class.id;



-- 多个左连接 (多个左连接在同个表的情况下需要AS别名)
SELECT goods_id,goods.cat_id,cat_name,goods.brand_id,brand_name,good_name
FROM
	goods LEFT JOIN category ON goods.cat_id=category.cat_id
		LEFT JOIN brand ON goods.brand_id=brand.brand_id;

