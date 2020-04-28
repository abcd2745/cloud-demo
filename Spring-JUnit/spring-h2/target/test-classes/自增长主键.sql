-- ----------------------------
-- Table structure for hw_store_weather
-- ----------------------------
DROP TABLE IF EXISTS `hw_store_weather`;
CREATE TABLE `hw_store_weather`  (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Weather` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '天气',
  `Wind` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '风力',
  `Temperture` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '温度区间',
  `CreateDate` date NOT NULL COMMENT '记录的时间',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '手动修改的时间',
  `ModifyBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改天气用户者',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店所在城市天气' ROW_FORMAT = Compact;
