USE [WEIGHT15]
GO
--导入后台记录
TRUNCATE TABLE [WEIGHT20].[DBO].[TBL_BACK_RECORD]
GO
INSERT [WEIGHT20].[dbo].[tbl_back_record] ([weight], [weight_time])
	SELECT
		[weight],
		[weight_time]
	FROM [tbl_back_record]
GO
--导入称重图片
TRUNCATE TABLE [WEIGHT20].[DBO].[TBL_WEIGHT_IMG]
GO
INSERT INTO [WEIGHT20].[dbo].[tbl_weight_img] ([WEIGHT_ID], [GROSS_IMG1], [GROSS_IMG2],
[TARE_IMG1], [TARE_IMG2])
	SELECT
		WEIGHT_ID,
		GROSS_IMG1,
		GROSS_IMG2,
		TARE_IMG1,
		TARE_IMG2
	FROM [tbl_weight_img]
--导入备用项目1-5
TRUNCATE TABLE [WEIGHT20].[DBO].[备用1]
GO
INSERT INTO [WEIGHT20].[dbo].[备用1] ([代码], [备用1])
	SELECT
		MIN([代码]) AS [代码],
		[备用1]
	FROM [备用1]
	GROUP BY [备用1]
TRUNCATE TABLE [WEIGHT20].[DBO].[备用2]
GO
INSERT INTO [WEIGHT20].[dbo].[备用2] ([代码], [备用2])
	SELECT
		MIN([代码]) AS [代码],
		[备用2]
	FROM [备用2]
	GROUP BY [备用2]
TRUNCATE TABLE [WEIGHT20].[DBO].[备用3]
GO
INSERT INTO [WEIGHT20].[dbo].[备用3] ([代码], [备用3])
	SELECT
		MIN([代码]) AS [代码],
		[备用3]
	FROM [备用3]
	GROUP BY [备用3]
TRUNCATE TABLE [WEIGHT20].[DBO].[备用4]
GO
INSERT INTO [WEIGHT20].[dbo].[备用4] ([代码], [备用4])
	SELECT
		MIN([代码]) AS [代码],
		[备用4]
	FROM [备用4]
	GROUP BY [备用4]
TRUNCATE TABLE [WEIGHT20].[DBO].[备用5]
GO
INSERT INTO [WEIGHT20].[dbo].[备用5] ([代码], [备用5])
	SELECT
		MIN([代码]) AS [代码],
		[备用5]
	FROM [备用5]
	GROUP BY [备用5]
--导入车号,发货单位,收货单位,货名,规格
TRUNCATE TABLE [WEIGHT20].[DBO].[车号]
GO
INSERT INTO [WEIGHT20].[dbo].[车号] ([车号], [皮重], [备注])
	SELECT
		[车号],
		[皮重],
		[备注]
	FROM [车号]
TRUNCATE TABLE [WEIGHT20].[DBO].[发货单位]
GO
INSERT INTO [WEIGHT20].[dbo].[发货单位] ([代码], [发货单位])
	SELECT
		MIN([代码]) AS [代码],
		[发货单位]
	FROM [发货单位]
	GROUP BY [发货单位]
TRUNCATE TABLE [WEIGHT20].[DBO].[收货单位]
GO
INSERT INTO [WEIGHT20].[dbo].[收货单位] ([代码], [收货单位])
	SELECT
		MIN([代码]) AS [代码],
		[收货单位]
	FROM [收货单位]
	GROUP BY [收货单位]
TRUNCATE TABLE [WEIGHT20].[DBO].[货名]
GO
INSERT INTO [WEIGHT20].[dbo].[货名] ([代码], [货名])
	SELECT
		MIN([代码]) AS [代码],
		[货名]
	FROM [货名]
	GROUP BY [货名]
TRUNCATE TABLE [WEIGHT20].[DBO].[规格]
GO
INSERT INTO [WEIGHT20].[dbo].[规格] ([代码], [规格])
	SELECT
		MIN([代码]) AS [代码],
		[规格]
	FROM [规格]
	GROUP BY [规格]
--导入套表
TRUNCATE TABLE [WEIGHT20].[DBO].[套表]
GO
INSERT INTO [WEIGHT20].dbo.[套表] ([车号], [发货单位], [收货单位], [货名], [规格],
[备用1], [备用2], [备用3], [备用4], [备用5])
	SELECT
		[车号],
		[发货单位],
		[收货单位],
		[货名],
		[规格],
		[备用1],
		[备用2],
		[备用3],
		[备用4],
		[备用5]
	FROM [套表]
--导入日志
TRUNCATE TABLE [WEIGHT20].[DBO].[日志]
GO
INSERT INTO [WEIGHT20].dbo.[日志] ([修改人], [时间], [日志])
	SELECT
		[修改人],
		[时间],
		[日志]
	FROM [日志]
--导入用户信息
TRUNCATE TABLE [WEIGHT20].[DBO].[用户信息]
GO
INSERT [WEIGHT20].[dbo].[用户信息] ([用户名], [密码],
[预置维护], [卡号管理], [系统日志], [后台记录], [打印磅单],
[修改磅单], [打印报表], [用户管理], [系统设置], [界面配置],
[手工重量], [数据库设置], [数据备份], [数据导入], [数据导出],
[数据清理], [数据初始化], [仪表设置], [视频设置], [读卡器设置],
[IO模块设置], [大屏幕设置], [语音输出], [数据查询], [添加记录],
[删除记录], [修改车号], [修改发货单位], [修改收货单位], [修改货名],
[修改规格], [修改毛重], [修改皮重], [修改扣重], [修改单价],
[修改折方系数], [修改过磅费], [修改备用1], [修改备用2], [修改备用3],
[修改备用4], [修改备用5], [修改备用6], [修改备用7], [修改备用8],
[修改备用9], [修改备用10], [修改备用11], [修改备用12], [修改备用13],
[修改备用14], [修改备用15], [修改备用16], [修改备用17], [修改备用18],
[管理员])
	SELECT
		[用户名],
		[密码],
		[预置维护],
		[数据维护] AS [卡号管理],
		1 AS [系统日志],
		1 AS [后台记录],
		[打印磅单],
		[修改磅单],
		[打印报表],
		[用户管理],
		[系统设置],
		[系统设置] AS [界面配置],
		[手工重量],
		[数库设置] AS [数据库设置],
		[数据备份],
		[数据维护] AS [数据导入],
		[数据导出],
		[数据导出] AS [数据清理],
		[数据维护] AS [数据初始化],
		[仪表设置],
		[系统设置] AS [视频设置],
		[系统设置] AS [读卡器设置],
		[系统设置] AS [IO模块设置],
		[系统设置] AS [大屏幕设置],
		[系统设置] AS [语音输出],
		1 AS [数据查询],
		[数据维护] AS [添加记录],
		[数据维护] AS [删除记录],
		[数据维护] AS [修改车号],
		[数据维护] AS [修改发货单位],
		[数据维护] AS [修改收货单位],
		[数据维护] AS [修改货名],
		[数据维护] AS [修改规格],
		[数据维护] AS [修改毛重],
		[数据维护] AS [修改皮重],
		[数据维护] AS [修改扣重],
		[数据维护] AS [修改单价],
		[数据维护] AS [修改折方系数],
		[数据维护] AS [修改过磅费],
		[数据维护] AS [修改备用1],
		[数据维护] AS [修改备用2],
		[数据维护] AS [修改备用3],
		[数据维护] AS [修改备用4],
		[数据维护] AS [修改备用5],
		[数据维护] AS [修改备用6],
		[数据维护] AS [修改备用7],
		[数据维护] AS [修改备用8],
		[数据维护] AS [修改备用9],
		[数据维护] AS [修改备用10],
		[数据维护] AS [修改备用11],
		[数据维护] AS [修改备用12],
		[数据维护] AS [修改备用13],
		[数据维护] AS [修改备用14],
		[数据维护] AS [修改备用15],
		[数据维护] AS [修改备用16],
		[数据维护] AS [修改备用17],
		[数据维护] AS [修改备用18],
		[管理员]
	FROM 用户信息
--导入称重信息数据
TRUNCATE TABLE [WEIGHT20].[dbo].[称重信息]
GO
INSERT [WEIGHT20].[dbo].[称重信息] ([流水号], [车号], [过磅类型], [发货单位], [收货单位],
[货名], [规格], [毛重], [皮重], [净重],
[扣重], [实重], [单价], [金额], [折方系数],
[方量], [过磅费], [毛重时间], [皮重时间], [备注],
[上传否], [毛重司磅员], [皮重司磅员], [毛重磅号], [皮重磅号],
[更新人], [更新时间], [打印次数], [备用1], [备用2],
[备用3], [备用4], [备用5], [备用6], [备用7],
[备用8], [备用9])
	SELECT
		[流水号],
		[车号],
		'OO' AS [过磅类型],
		[发货单位],
		[收货单位],
		[货名],
		[规格],
		[毛重],
		[空重] AS [皮重],
		[净重],
		[扣重],
		[实重],
		[单价],
		[金额],
		1.0 AS [折方系数],
		[实重] AS [方量],
		[过磅费],
		[毛重时间],
		[空重时间] AS [皮重时间],
		[备注],
		[上传否],
		[操作员] AS [毛重司磅员],
		[操作员] AS [皮重司磅员],
		'A' AS [毛重磅号],
		'A' AS [皮重磅号],
		[操作员] AS [更新人],
		GETDATE() AS [更新时间],
		1 AS [打印次数],
		[备用1],
		[备用2],
		[备用3],
		[备用4],
		[备用5],
		[备用6],
		[备用7],
		[备用8],
		[备用9]
	FROM [称重信息]
GO