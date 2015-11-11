select 毛重司磅员,Count(流水号) As 车次,Sum(毛重) as 毛重,Sum(皮重) as 皮重,Sum(净重) as 净重,Sum(扣重) as 扣重,Sum(实重) as 实重,Sum(金额) as 金额 from 称重信息 where %s group by 毛重司磅员 order by 毛重司磅员
