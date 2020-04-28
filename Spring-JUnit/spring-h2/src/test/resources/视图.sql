
-- ----------------------------
-- Table structure for hw_pos_salposactivi
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_salposactivi`;
CREATE TABLE `hw_pos_salposactivi`  (
  `BillNO` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `SKUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品条码',
  `ActiviceCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动编码',
  `ActiviceName` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '活动名称',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CreateUserID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyUserID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售表-订单商品参与活动表(每个订单中 每个商品 参与的活动)' ROW_FORMAT = Compact;

-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_salposmst`;
CREATE TABLE `hw_pos_salposmst`  (
  `BillNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '小票号',
  `BillDate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '单据日期',
  `StoreID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店ID',
  `PosID` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Pos 编号',
  `OrigBillNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原单号(退货时origbillno是之前正常销售的小票)',
  `EmployID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售员',
  `BillType` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '单据类型,0为销售，1为退货,赠送的物品暂时不保存到数据库',
  `DisRate` decimal(14, 4) NULL COMMENT '店铺扣率',
  `Qry` decimal(10, 2) NULL DEFAULT NULL COMMENT '数量',
  `Amount` decimal(18, 4) NULL COMMENT '应收金额',
  `PayMoney` decimal(18, 4) NULL COMMENT '支付金额',
  `BackMoney` decimal(14, 4) NULL DEFAULT 1.0000 COMMENT '找零金额',
  `LeaveMoney` decimal(18, 4) NULL COMMENT '抹零金额',
  `VipID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员ID',
  `IsBalance` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否结算(日结结算)',
  `MonthFlag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '月份',
  `IsShare` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '共享',
  `Sharedate` datetime(0) NULL DEFAULT '2015-12-31 00:00:00' COMMENT '共享日期',
  `ShareMan` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '共享人',
  `IsAudit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '审核',
  `AuditDate` datetime(0) NULL DEFAULT '2015-12-31 00:00:00' COMMENT '审核日期',
  `AuditMan` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `IsDebt` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否结算',
  `DebtDate` datetime(0) NULL DEFAULT '2015-12-31 00:00:00' COMMENT '结算日期(财务结算)',
  `DebtMan` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结算人',
  `CreateMan` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `IsUp` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否上传',
  `IsDown` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否下载',
  `Remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `GiftMoney` decimal(18, 4) NULL COMMENT '礼品金额',
  `GiftID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '礼品ID',
  `Add1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加1',
  `Add2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加2',
  `Add3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加3',
  `Add4` decimal(18, 4) NULL COMMENT '附加4',
  `Add5` decimal(18, 4) NULL COMMENT '附加5',
  `InChanl` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Self' COMMENT '公司',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  `IsWms` int(11) NULL DEFAULT 0,
  `ToDrpFlag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `mqDate` timestamp(6) NULL DEFAULT NULL COMMENT 'mq入库时间，比真实时间略晚',
  PRIMARY KEY (`BillNo`) USING BTREE,
  INDEX `idx_BillDate`(`BillDate`) USING BTREE,
  INDEX `idx_StoreID`(`StoreID`) USING BTREE,
  INDEX `idx_VipID`(`VipID`) USING BTREE,
  INDEX `idx_ToDrpFlag`(`ToDrpFlag`) USING BTREE,
  INDEX `idx_add3`(`Add3`) USING BTREE,
  INDEX `nd_idx`(`mqDate`) USING BTREE,
  INDEX `idx_emp`(`EmployID`) USING BTREE,
  INDEX `idx_record_state`(`RecordState`) USING BTREE,
  INDEX `idx_OBillNo`(`OrigBillNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售表-主表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_salposdtl
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_salposdtl`;
CREATE TABLE `hw_pos_salposdtl`  (
  `AutoIncID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `BillNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '小票号',
  `BarCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku',
  `StyleID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '款号',
  `StyleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '款名',
  `PUnit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `ColorID` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '色',
  `SizeID` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '码',
  `Qry` decimal(14, 4) NULL COMMENT '数量',
  `PlaceID` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库位',
  `Price` decimal(18, 4) NULL COMMENT '售价',
  `RefPrice` decimal(18, 4) NULL COMMENT '吊牌价',
  `Discount` decimal(14, 4) NULL DEFAULT 1.0000 COMMENT '折扣',
  `Amount` decimal(18, 4) NULL COMMENT '金额',
  `Cost` decimal(18, 4) NULL COMMENT '成本',
  `SalMan` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售员',
  `StorRate` decimal(18, 4) NULL COMMENT '店铺扣率',
  `PromMode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '促销类型',
  `TradeMode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '交易类型',
  `IsSpecial` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否特价',
  `IsDiscount` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否打折',
  `VipID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员ID',
  `OriginBill` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原小票号',
  `PosDateTime` datetime(0) NULL DEFAULT NULL COMMENT '上传日期',
  `Remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `Add1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加1',
  `Add2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加2',
  `Add3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加3',
  `Add4` decimal(18, 4) NULL COMMENT '附加4',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`AutoIncID`, `BillNo`) USING BTREE,
  INDEX `StyleID`(`StyleID`, `ColorID`, `SizeID`) USING BTREE,
  INDEX `OriginBill`(`OriginBill`) USING BTREE,
  INDEX `TradeMode`(`TradeMode`) USING BTREE,
  INDEX `VipID`(`VipID`) USING BTREE,
  INDEX `idx_BillNo`(`BillNo`) USING BTREE,
  INDEX `idx_PosDateTime`(`PosDateTime`) USING BTREE,
  INDEX `idx_BarCode`(`BarCode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 880224 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售表-商品明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- View structure for pos_sal_dtl_activity_view
-- ----------------------------
DROP VIEW IF EXISTS `pos_sal_dtl_activity_view`;
CREATE VIEW `pos_sal_dtl_activity_view` AS
select `spd`.`BarCode` AS `SKU`,`spm`.`BillNo` AS `OrderCode`,
`spm`.`StoreID` AS `StoreId`,`spm`.`PosID` AS `PosId`,`spd`.`StyleName` AS `Name`,
`spd`.`Qry` AS `Count`,`spd`.`RefPrice` AS `RefPrice`,`spd`.`Price` AS `Price`,
`spd`.`Discount` AS `Discount`,`spd`.`Amount` AS `Amount`,`spm`.`VipID` AS `VipID`,
`spm`.`CreateMan` AS `CreaeMan`,`spm`.`BillDate`,
`spm`.`IsBalance` AS `IsBalance`,`spd`.`TradeMode` AS `Type`,
group_concat(`spa`.`ActiviceName` separator ',') AS `ActiviDesc`
from `hw_pos_salposdtl` `spd`
left join `hw_pos_salposmst` `spm` on `spd`.`BillNo` = `spm`.`BillNo`
left join `hw_pos_salposactivi` `spa` on `spa`.`BillNO` = `spd`.`BillNo`  and  `spa`.`SKUID` = `spd`.`BarCode`
where `spm`.`RecordState` = 'Y' and `spd`.`RecordState` = 'Y'
group by `SKU`,`spm`.`BillNo`
order by `spm`.`ModifyDate` desc;
