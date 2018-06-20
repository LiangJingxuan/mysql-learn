-- 触发器
-- 监视某种情况并触发某种操作
-- 用触发器可以监视某张表的变化，当发生某种变化时，触发某个操作

-- 触发器可以监视：增删改 三种操作 --> 监视成功后可以触发：增删改 三种操作

-- 创建触发器：

/*
	CREATE TRIGGER 触发器名字 
	AFTER/BEFORE
	FOR EACH ROW --> [固定语法不能修改]
	INSERT/UPDATE/DELETE 
	ON 表名
	BEGIN
	... SQL语句... ... （一句或多句：INSERT/UPDATE/DELETE ）
	END
*/

-- 删除触发器：
-- drop trigger 触发器名字

-- 查看触发器：
-- show trigger 


-- delimiter $ : --> 修改sql结束符号



-- 如何在触发器引用行的值

-- 对于 insert 而言，新增的行用 new 来表示，行中的每一列的值，用 new.列名 来表示
-- 对于 delete 而言，删除的行用 old 来表示，行中的每一列的值，用 old.列名 来表示

-- 对于 update 而言，修改前的行用 old 来表示，行中的每一列的值，用 old.列名 来表示
-- 修改后的行用 new 来表示，行中的每一列的值，用 new.列名 来表示



-- 触发器里面，after与before的区别

-- after：先完成数据的增删改在触发，触发中的语句晚于增删改，无法影响前面的增删改动作；
-- before：先触发在完成数据的增删改，触发中的语句先于监视增删改发生，有机会判断修改即将发生的操作；





# 案例：

-- 创建表

CREATE TABLE `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `num` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gid` int(10) unsigned DEFAULT NULL,
  `much` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 设置默认结束符号
DELIMITER $



# 创建触发器：插入

-- 添加订单，库存减少
CREATE TRIGGER tg1
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
	UPDATE goods SET num=num-NEW.much WHERE id=NEW.gid;
END $



# 创建触发器：删除

-- 删除订单，库存相应增加
CREATE TRIGGER tg2
AFTER DELETE ON orders
FOR EACH ROW
BEGIN
	UPDATE goods SET num=num+OLD.much WHERE id=OLD.gid;
END $



# 创建触发器：修改

-- 修改订单数量时，库存相应改变
CREATE TRIGGER tg3
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
	-- 修改库存数量
	UPDATE goods SET num=num+OLD.much-NEW.much WHERE id=OLD.gid; 
	-- 修改gid商品
	UPDATE goods SET num=num-NEW.much WHERE id=NEW.gid;
END $



# BEFORE应用：对于所下订单，如果订单数量大于5，就认为是恶意订单，强制把所定商品数量改成5

-- 触发事件先于监视事件发生，并判断监视事件发生
CREATE TRIGGER tg4
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
	-- 判断订单数量超出5强制将订单数量写成5
	IF NEW.much > 5 THEN
		SET NEW.much = 5;
	END IF;
	-- 普通插入
	UPDATE goods SET num=num-NEW.much WHERE id=NEW.gid;
END $

	