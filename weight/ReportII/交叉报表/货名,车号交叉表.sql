select 货名,车号,Count(流水号) As 车次,Sum(净重) as 净重,Sum(金额) as 金额 from 称重信息 where %s group by 货名,车号 order by 货名,车号

