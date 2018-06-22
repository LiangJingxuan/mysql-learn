-- 常用表的引擎：
-- Myisam：批量插入速度快，不支持事物，锁表；
-- InnoDB：批量插入相对较慢，支持事物，锁行；

-- 全文搜索，全部支持；




-- 事物：

-- 指一组操作，要么都成功执行，要么都不执行 ---> 原子性；

-- 在所有的操作没有执行完毕之前，其他回话不能够看到中间改变的过程 ---> 隔离性；

-- 事物发生前与事物发生后，数据的总额依然匹配 ---> 一致性；

-- 事物产生的影响不能够撤销 ---> 持久性；

-- 如果出了错误，事物也不允许撤销，只能通过 '补偿性事物'；




-- 开启事物
start transaction;

-- sql .....
-- sql .....

-- 提交
commit;


-- 回滚
rollback;



-- 当一个事物commit或rollback之后，就结束了，再次使用需要重新开启。

-- 有些语句会造成事物的隐式的提交，比如 开启事物没有提交前 又start transaction。
