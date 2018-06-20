-- 插入数据
insert into test
	(id,title,name,content)
	values
	(1,'test','amy','测试123...');

-- 修改数据
update test set
	id=2,
	content='test 1234....'
	where 
	name='amy';

-- 删除数据
delete from test where id=2;

-- 查询数据
select * from test where id=2;
select id,name test where id=2;