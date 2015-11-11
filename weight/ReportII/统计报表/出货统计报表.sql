select 收货单位,货名,规格,Count(流水号) As 车次,Sum(净重) as 净重,Sum(扣重) as 扣重,Sum(备用6) as 二次扣重,Sum(备用7) as 实际重量,Avg(单价) as 单价,Sum(金额) as 金额 from 称重信息 where %s group by 收货单位,货名,规格 order by 收货单位,货名,规格
