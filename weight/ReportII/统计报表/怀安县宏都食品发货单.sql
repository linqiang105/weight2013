SELECT T1.流水号,T1.收货单位 AS 交货单位, T2.货名 AS 名称, ISNULL(T1.c, 0) AS 头数, ISNULL(t1.gross, 0) AS 毛重数量, ISNULL(t1.tare, 0) AS 皮重数量, ISNULL(t1.net, 0) AS 净重, ISNULL(t1.price, 0) AS 单价, ISNULL(t1.sum1, 0) AS 金额 FROM (SELECT 收货单位, 货名,MIN(流水号) AS 流水号, SUM(毛重) AS gross, SUM(皮重) AS tare, SUM(净重) AS net, AVG(单价) AS price, SUM(金额) AS sum1, SUM(备用6) AS c FROM 称重信息 WHERE %s 
GROUP BY 收货单位, 货名) AS t1 RIGHT JOIN (SELECT 代码, 货名
FROM 货名) AS t2 ON t1.货名 = t2.货名 ORDER BY t2.代码
