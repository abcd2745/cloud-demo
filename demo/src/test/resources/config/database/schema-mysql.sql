create schema if not exists hotwind;

drop table if exists hw_master_sku;
CREATE TABLE `hw_master_sku` (
`skuId` varchar(30) NOT NULL,
`StyleID` varchar(20) DEFAULT NULL,
`ColorID` varchar(4) DEFAULT NULL,
`SizeID` varchar(4) DEFAULT NULL,
`ModifyDate` timestamp(6) NULL ,
`IsDelete` int(1) NOT NULL DEFAULT '0',
`Price` decimal(10,2) DEFAULT NULL COMMENT '吊牌价',
`SalePrice` decimal(10,2) DEFAULT NULL COMMENT '销售价格',
PRIMARY KEY (`skuId`)
) ;

drop table if exists hw_master_style;
CREATE TABLE `hw_master_style` (
  `StyleID` varchar(20) NOT NULL,
  `StyleName` varchar(80) DEFAULT NULL,
  `PUnitID` varchar(20) DEFAULT NULL,
  `Remark` varchar(200) DEFAULT NULL,
  `CustomerID` varchar(20) DEFAULT NULL,
  `CreateBy` varchar(20) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `ModifyBy` varchar(20) DEFAULT NULL,
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `IsDelete` int(11) NOT NULL DEFAULT '0',
  `Image` longtext,
  `AttDId` int(11) DEFAULT NULL,
  `HaveShoebox` int(1) DEFAULT NULL COMMENT '是否有鞋盒',
  `BigTypeCode` varchar(20) DEFAULT '0' COMMENT '大类Code',
  `MiddleTypeCode` varchar(20) DEFAULT '0' COMMENT '中分类Code',
  `SmallTypeCode` varchar(20) DEFAULT '0' COMMENT '小类Code',
  `BrandCode` varchar(20) DEFAULT NULL COMMENT '品牌Code',
  `SexCode` varchar(20) DEFAULT NULL COMMENT '性别Code',
  `YearCode` varchar(20) DEFAULT NULL COMMENT '年份Code',
  `SeasonCode` varchar(20) DEFAULT NULL COMMENT '季节Code',
  PRIMARY KEY (`StyleID`)
);