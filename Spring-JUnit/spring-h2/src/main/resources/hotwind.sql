/*
 Navicat Premium Data Transfer

 Source Server         : 10.0.17.21
 Source Server Type    : MySQL
 Source Server Version : 50624
 Source Host           : 10.0.17.21:3306
 Source Schema         : hotwind

 Target Server Type    : MySQL
 Target Server Version : 50624
 File Encoding         : 65001

 Date: 23/04/2020 23:19:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for a_new
-- ----------------------------
DROP TABLE IF EXISTS `a_new`;
CREATE TABLE `a_new`  (
  `city_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市',
  `city_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市名称',
  PRIMARY KEY (`city_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for b_old
-- ----------------------------
DROP TABLE IF EXISTS `b_old`;
CREATE TABLE `b_old`  (
  `city_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市',
  `city_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市名称',
  PRIMARY KEY (`city_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for check_unit_result
-- ----------------------------
DROP TABLE IF EXISTS `check_unit_result`;
CREATE TABLE `check_unit_result`  (
  `schema_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `table_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unitid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `checkdate` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for check_unit_table
-- ----------------------------
DROP TABLE IF EXISTS `check_unit_table`;
CREATE TABLE `check_unit_table`  (
  `schema_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `table_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastupdatetime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '检查门店的表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city`  (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ProvinceID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for db_moniter_posmachine
-- ----------------------------
DROP TABLE IF EXISTS `db_moniter_posmachine`;
CREATE TABLE `db_moniter_posmachine`  (
  `currentuser` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'admin',
  `currenttime` bigint(20) NULL DEFAULT 0,
  `operationtype` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `billno` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `add3` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0'
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '监控hw_pos_machine表的更新操作' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fousalespeoples
-- ----------------------------
DROP TABLE IF EXISTS `fousalespeoples`;
CREATE TABLE `fousalespeoples`  (
  `SalPeopID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `SalPeopName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ENGName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `StoreId` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `WorkType` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BirthDate` datetime(0) NULL DEFAULT NULL,
  `SalPeopSex` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IdCard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Tel1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Tel2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `E_Mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Address1` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Address2` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IsActive` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1',
  `Remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `AutoInc` int(11) NULL DEFAULT 0,
  `ADD1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ADD2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FingerNo` int(11) NULL DEFAULT 0,
  `FingerFeature` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `StartWork` date NULL DEFAULT NULL,
  `Salary` decimal(18, 4) NULL,
  `TargetAmt` decimal(18, 4) NULL,
  `CommisionRate` decimal(18, 4) NULL,
  `Commision2` decimal(18, 4) NULL,
  `Commision1` decimal(18, 4) NULL,
  `ChanlID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Self',
  PRIMARY KEY (`SalPeopID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_card_limit_condition
-- ----------------------------
DROP TABLE IF EXISTS `hw_card_limit_condition`;
CREATE TABLE `hw_card_limit_condition`  (
  `cardLimitCondId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡限制ID',
  `cardLimitCond` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡限制条件',
  `cardLimitCondName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡限制条件名称',
  `cardLimitMethod` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡限制方法',
  `recordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  `modifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`cardLimitCondId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = ' 卡限制条件' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_card_publish_totalnum
-- ----------------------------
DROP TABLE IF EXISTS `hw_card_publish_totalnum`;
CREATE TABLE `hw_card_publish_totalnum`  (
  `cardPublishId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡发布ID',
  `cardPublishNum` int(6) NULL DEFAULT NULL COMMENT '卡发布数量',
  `cardPublishBatch` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡发布批次',
  `cardPublishCondition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡发布条件',
  `cardPublishMethod` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡发布方法',
  `recordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  `modifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`cardPublishId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '控制卡的发行数量' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_card_record
-- ----------------------------
DROP TABLE IF EXISTS `hw_card_record`;
CREATE TABLE `hw_card_record`  (
  `cardId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡id',
  `cardNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡编号',
  `queryCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '查询码',
  `redeemCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '兑换码',
  `cardContext` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡内容',
  `cardType` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡类型',
  `HandmadeDate` datetime(0) NULL DEFAULT NULL COMMENT '手工制作时间',
  `cardState` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '卡状态 :0未激活状态，1手工制作状态，2.激活状态，3已使用状态，4卡失效',
  `activationDate` datetime(0) NULL DEFAULT NULL COMMENT '激活日期',
  `usageDate` datetime(0) NULL DEFAULT NULL COMMENT '使用日期',
  `numberOfAmendment` int(11) NULL DEFAULT 0 COMMENT '查询次数',
  `cardUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面跳转url',
  `TwoDimensionCode` mediumblob NULL COMMENT '二维码',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `batch` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '制卡批次',
  PRIMARY KEY (`cardId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卡表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_card_record_log
-- ----------------------------
DROP TABLE IF EXISTS `hw_card_record_log`;
CREATE TABLE `hw_card_record_log`  (
  `cardlogid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡流水id',
  `cardId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡id',
  `cardDate` datetime(0) NULL DEFAULT NULL COMMENT '交易日期',
  `funcID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能ID',
  `recordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  `modifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cardlogid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卡流水表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_card_report
-- ----------------------------
DROP TABLE IF EXISTS `hw_card_report`;
CREATE TABLE `hw_card_report`  (
  `cardReportId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表报ID',
  `cardActivationNum` int(6) NULL DEFAULT NULL COMMENT '卡激活数量',
  `cardType` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡类型',
  `cardTypeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡名称',
  `cardActivationDate` date NULL DEFAULT NULL COMMENT '激活日期',
  `recordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`cardReportId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表报' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_card_report_switch
-- ----------------------------
DROP TABLE IF EXISTS `hw_card_report_switch`;
CREATE TABLE `hw_card_report_switch`  (
  `cardSwitchId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡报表开关ID',
  `isSend` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '是否发送',
  `reportTime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定时时间',
  `reportType` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定时类型 1：日销报表、2：验证报表',
  `sendRole` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送的角色',
  `sendccRole` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送的角色',
  PRIMARY KEY (`cardSwitchId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报表开关表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_card_type
-- ----------------------------
DROP TABLE IF EXISTS `hw_card_type`;
CREATE TABLE `hw_card_type`  (
  `cardTypeId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡类型id',
  `cardTypeNo` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡类型No',
  `cardUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡类URL',
  `cardTypeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡类型名称',
  `recordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  `modifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `wechatUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cardAmt` decimal(16, 2) NOT NULL COMMENT '卡金额',
  PRIMARY KEY (`cardTypeId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卡类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_chau_store_version
-- ----------------------------
DROP TABLE IF EXISTS `hw_chau_store_version`;
CREATE TABLE `hw_chau_store_version`  (
  `ID` int(15) NOT NULL AUTO_INCREMENT,
  `STORE_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店编号',
  `POS_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'pos机编号',
  `SERVICE_VERSION_NO` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SERVICE版本号',
  `POS_VERSION_NO` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'POS版本号',
  `SWMS_SERVICE_VERSION_NO` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SWMS后端版本号',
  `SWMS_VERSION_NO` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SWMS前端版本号',
  `SWMS_ANDROID_VERSION_NO` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SWMS手持版本号',
  `MODIFY_DATE` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_STOREID`(`STORE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3819 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售表-主表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_city_weather
-- ----------------------------
DROP TABLE IF EXISTS `hw_city_weather`;
CREATE TABLE `hw_city_weather`  (
  `city_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `weather_date` date NOT NULL,
  `weather` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wind` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `temperature_max` decimal(10, 0) NULL DEFAULT NULL,
  `temperature_min` decimal(10, 0) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`weather_date`, `city_id`, `city_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_compare_job_param_remove
-- ----------------------------
DROP TABLE IF EXISTS `hw_compare_job_param_remove`;
CREATE TABLE `hw_compare_job_param_remove`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `COMPARE_JOB_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `SOURCE_SYS` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源系统',
  `TARGET_SYS` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标系统',
  `BILL_TYPE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单据类型',
  `COMPARE_TYPE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对类型',
  `START_TIME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对起始时间',
  `END_TIME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对结束时间',
  `MAIN_FIELDS_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对基准字段名，可多个，用英文逗号分隔，例如：stockId,billNo',
  `OTHER_FIELDS_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对其他字段名，可多个，用英文逗号分隔',
  `SOURCE_PROVIDER_BEAN` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源系统的Provider',
  `SOURCE_PROVIDER_GROUP` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源系统的组',
  `SOURCE_PROVIDER_VERSION` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源系统的版本号',
  `TARGET_PROVIDER_BEAN` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标系统的Provider',
  `TARGET_PROVIDER_GROUP` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标系统的组',
  `TARGET_PROVIDER_VERSION` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标系统的版本号',
  `REMARK` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `LAST_MODIFY_TIME` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '最后变更时间',
  `VERSION` int(11) NULL DEFAULT 1 COMMENT '版本号',
  `CREATE_USER_ID` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `MODIFY_USER_ID` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `RECORD_STATE` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单据比对配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_compare_result_detail_remove
-- ----------------------------
DROP TABLE IF EXISTS `hw_compare_result_detail_remove`;
CREATE TABLE `hw_compare_result_detail_remove`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `MID` int(11) NOT NULL COMMENT '日常主表数据比对差异结果表ID',
  `BATCH_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '比对批次号',
  `SOURCE_SYS` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源系统',
  `TARGET_SYS` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标系统',
  `COMPARE_JOB_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对任务ID，跟Job配置表ID对应',
  `BILL_TYPE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单据类型',
  `COMPARE_START_TIME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对起始时间',
  `COMPARE_END_TIME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对结束时间',
  `MAIN_FIELDS_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对基准字段名，来源于配置表，可多个，用英文逗号分隔，例如：stockId,billNo',
  `SRC_MAIN_FIELDS_VALUE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源系统比对基准字段值，跟MAIN_FIELDS_NAME对应，可多个，用英文逗号分隔，例如：10005023,HOTPH000001',
  `TGT_MAIN_FIELDS_VALUE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标系统比对基准字段值，跟MAIN_FIELDS_NAME对应，可多个，用英文逗号分隔',
  `OTHER_FIELDS_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对其他字段名，来源于配置表，可多个，用英文逗号分隔',
  `SRC_OTHER_FIELDS_VALUE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源系统比对其他字段值，跟OTHER_FIELDS_NAME对应，可多个，用英文逗号分隔',
  `TGT_OTHER_FIELDS_VALUE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源系统比对其他字段值，跟OTHER_FIELDS_NAME对应，可多个，用英文逗号分隔',
  `COMPARE_RESULT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对结果：SOURCE_MORE-源系统多；TARGET_MORE-目标系统多；VALUE_DIFF-值不同；RESOLVED-已解决；',
  `COMPARE_RESULT_TIME` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '比对结果更新时间',
  `REMARK` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `LAST_MODIFY_TIME` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '最后变更时间',
  `VERSION` int(11) NULL DEFAULT 1 COMMENT '版本号',
  `CREATE_USER_ID` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `MODIFY_USER_ID` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `RECORD_STATE` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 507658 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日常明细表数据比对差异结果表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_compare_result_history_remove
-- ----------------------------
DROP TABLE IF EXISTS `hw_compare_result_history_remove`;
CREATE TABLE `hw_compare_result_history_remove`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `BATCH_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '比对批次号',
  `SOURCE_SYS` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源系统',
  `TARGET_SYS` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标系统',
  `COMPARE_JOB_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对任务ID，跟Job配置表ID对应',
  `BILL_TYPE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单据类型',
  `COMPARE_START_TIME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对起始时间',
  `COMPARE_END_TIME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对结束时间',
  `MAIN_FIELDS_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对基准字段名，来源于配置表，可多个，用英文逗号分隔，例如：stockId,billNo',
  `SRC_MAIN_FIELDS_VALUE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源系统比对基准字段值，跟MAIN_FIELDS_NAME对应，可多个，用英文逗号分隔，例如：10005023,HOTPH000001',
  `TGT_MAIN_FIELDS_VALUE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标系统比对基准字段值，跟MAIN_FIELDS_NAME对应，可多个，用英文逗号分隔',
  `OTHER_FIELDS_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对其他字段名，来源于配置表，可多个，用英文逗号分隔',
  `SRC_OTHER_FIELDS_VALUE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源系统比对其他字段值，跟OTHER_FIELDS_NAME对应，可多个，用英文逗号分隔',
  `TGT_OTHER_FIELDS_VALUE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源系统比对其他字段值，跟OTHER_FIELDS_NAME对应，可多个，用英文逗号分隔',
  `COMPARE_RESULT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对结果：SOURCE_MORE-源系统多；TARGET_MORE-目标系统多；VALUE_DIFF-值不同；RESOLVED-已解决；',
  `COMPARE_RESULT_TIME` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '比对结果更新时间',
  `REMARK` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `LAST_MODIFY_TIME` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '最后变更时间',
  `VERSION` int(11) NULL DEFAULT 1 COMMENT '版本号',
  `CREATE_USER_ID` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `MODIFY_USER_ID` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `RECORD_STATE` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2019 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '历史主表数据比对差异结果表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_compare_result_master_remove
-- ----------------------------
DROP TABLE IF EXISTS `hw_compare_result_master_remove`;
CREATE TABLE `hw_compare_result_master_remove`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `BATCH_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '比对批次号',
  `SOURCE_SYS` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源系统',
  `TARGET_SYS` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标系统',
  `COMPARE_JOB_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对任务ID，跟Job配置表ID对应',
  `BILL_TYPE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单据类型',
  `COMPARE_START_TIME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对起始时间',
  `COMPARE_END_TIME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对结束时间',
  `MAIN_FIELDS_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对基准字段名，来源于配置表，可多个，用英文逗号分隔，例如：stockId,billNo',
  `SRC_MAIN_FIELDS_VALUE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源系统比对基准字段值，跟MAIN_FIELDS_NAME对应，可多个，用英文逗号分隔，例如：10005023,HOTPH000001',
  `TGT_MAIN_FIELDS_VALUE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标系统比对基准字段值，跟MAIN_FIELDS_NAME对应，可多个，用英文逗号分隔',
  `OTHER_FIELDS_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对其他字段名，来源于配置表，可多个，用英文逗号分隔',
  `SRC_OTHER_FIELDS_VALUE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源系统比对其他字段值，跟OTHER_FIELDS_NAME对应，可多个，用英文逗号分隔',
  `TGT_OTHER_FIELDS_VALUE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源系统比对其他字段值，跟OTHER_FIELDS_NAME对应，可多个，用英文逗号分隔',
  `COMPARE_RESULT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对结果：SOURCE_MORE-源系统多；TARGET_MORE-目标系统多；VALUE_DIFF-值不同；RESOLVED-已解决；',
  `COMPARE_RESULT_TIME` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '比对结果更新时间',
  `COMPARE_DETAIL_STATE` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '明细比对状态：Y-已进行过明细比对；N-否；',
  `COMPARE_DETAIL_TIME` timestamp(0) NULL DEFAULT NULL COMMENT '明细比对状态更新时间',
  `REMARK` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `LAST_MODIFY_TIME` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '最后变更时间',
  `VERSION` int(11) NULL DEFAULT 1 COMMENT '版本号',
  `CREATE_USER_ID` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `MODIFY_USER_ID` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `RECORD_STATE` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25557 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日常主表数据比对差异结果表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_coupon_item_temp
-- ----------------------------
DROP TABLE IF EXISTS `hw_coupon_item_temp`;
CREATE TABLE `hw_coupon_item_temp`  (
  `ITEM_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '礼券ID或营销活动ID',
  `SKU_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'skuID',
  `STYLE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '款号',
  `COLOR` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `SIZE_ID` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺码',
  `BIG_TYPE_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大类',
  `MIDDLE_TYPE_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中类',
  `SMALL_TYPE_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小类',
  `FLG` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '礼券商品类型;Y-礼券商品,N-赠送商品',
  `DATA_TYPE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据类型 1，导入 2，分类',
  `IS_EDIT` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据状态 1.保存状态 2.编辑状态 3.临时状态',
  `TYPE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1-礼券;2-活动发放;3-标签;4-活动消息推送',
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态: Y:可用 N:不可用'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '礼券的商品使用范围导入临时表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_express_account
-- ----------------------------
DROP TABLE IF EXISTS `hw_express_account`;
CREATE TABLE `hw_express_account`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '业务ID',
  `STORE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店编号',
  `ACCOUNT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '月结账号',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `MODIFY_DATE` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `STORE_ID_INX`(`STORE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '顺丰快递商品' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_express_order
-- ----------------------------
DROP TABLE IF EXISTS `hw_express_order`;
CREATE TABLE `hw_express_order`  (
  `ORDER_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户订单号',
  `ORDER_MAIL_NO` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '顺丰客户联运单号',
  `MAIL_NO` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '顺丰回馈运单号',
  `DELIVERY_STORE_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货门店',
  `VIP_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员ID',
  `ACCOUNT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '月结账号',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ORDER_ID`) USING BTREE,
  INDEX `MAIL_NO_KEY`(`MAIL_NO`) USING BTREE,
  INDEX `DELIVERY_STORE_INX`(`DELIVERY_STORE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '顺丰快递订单' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_express_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `hw_express_order_detail`;
CREATE TABLE `hw_express_order_detail`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '业务ID',
  `ORDER_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户订单号',
  `BILL_NO` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `SKU` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SKU',
  `STYLE_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货物名称',
  `COUNT` int(5) NULL DEFAULT NULL COMMENT '货物数量',
  `PRICE` decimal(18, 3) NULL DEFAULT NULL COMMENT '货物单价，精确到小数点后3位',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `order_id_inx`(`ORDER_ID`) USING BTREE,
  INDEX `bill_no_inx`(`BILL_NO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '顺丰快递商品' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_express_order_send
-- ----------------------------
DROP TABLE IF EXISTS `hw_express_order_send`;
CREATE TABLE `hw_express_order_send`  (
  `ORDER_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户订单号',
  `DELIVERY_STORE_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货门店',
  `COMPANY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄件方公司名称',
  `CONTACT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄件方联系人',
  `TEL` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄件方联系电话',
  `MOBILE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄件方手机',
  `PROVINCE` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄件方所在省份',
  `CITY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄件方所在城市名称，字段填写要求：必须是标准的城市称谓 ',
  `COUNTY` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄件人所在县/区，必须是标准的县/区称谓，示例：“福田区”。',
  `ADDRESS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄件方详细地址，包括省市区，示例：“广东省深圳市福田区新洲十一街万基商务大厦10楼” ，如果需要生成电子运单，则为必填。',
  `POST_CODE` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄方邮编，跨境件必填（中国大陆，港澳台互寄除外）。',
  PRIMARY KEY (`ORDER_ID`) USING BTREE,
  INDEX `DELIVERY_STORE_INX`(`DELIVERY_STORE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '顺丰快递寄件人信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_express_order_to
-- ----------------------------
DROP TABLE IF EXISTS `hw_express_order_to`;
CREATE TABLE `hw_express_order_to`  (
  `ORDER_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户订单号',
  `VIP_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员ID',
  `COMPANY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '到件方公司名称',
  `CONTACT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '到件方联系人',
  `TEL` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '到件方联系电话',
  `MOBILE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '到件方手机',
  `PROVINCE` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '到件方所在省份',
  `CITY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '到件方所在城市名称，字段填写要求：必须是标准的城市称谓 ',
  `COUNTY` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '到件人所在县/区，必须是标准的县/区称谓，示例：“福田区”。',
  `ADDRESS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '到件方详细地址，包括省市区，示例：“广东省深圳市福田区新洲十一街万基商务大厦10楼” ，如果需要生成电子运单，则为必填。',
  `POST_CODE` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '到方邮编，跨境件必填（中国大陆，港澳台互寄除外）。',
  PRIMARY KEY (`ORDER_ID`) USING BTREE,
  INDEX `VIP_INX`(`VIP_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '顺丰快递收件人信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_express_route
-- ----------------------------
DROP TABLE IF EXISTS `hw_express_route`;
CREATE TABLE `hw_express_route`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '业务ID',
  `ROUTE_ID` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由节点信息编号，每一个id代表一条不同的路由节点信息。',
  `MAIL_NO` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '顺丰回馈运单号',
  `ORDER_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户订单号',
  `ACCEPT_TIME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由节点产生的时间',
  `ACCEPT_ADDRESS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由节点发生的城市',
  `REMARK` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由节点具体描述',
  `OPCODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由节点操作码',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `order_id_key`(`ORDER_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '顺丰快递路由' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_express_status
-- ----------------------------
DROP TABLE IF EXISTS `hw_express_status`;
CREATE TABLE `hw_express_status`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '业务ID',
  `ORDER_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户订单号',
  `MAIL_NO` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户订单号',
  `ORDER_STATE_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `ORDER_STATE_DESC` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单状态描述',
  `EMP_CODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件员工工号',
  `EMP_PHONE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件员手机号',
  `NET_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网点',
  `LAST_TIME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最晚上门时间',
  `BOOK_TIME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户预约时间',
  `CARRIER_CODE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '承运商代码(SF)',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `ORDER_ID_KEY`(`ORDER_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '顺丰快递订单状态' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_express_yt_status
-- ----------------------------
DROP TABLE IF EXISTS `hw_express_yt_status`;
CREATE TABLE `hw_express_yt_status`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '业务ID',
  `customerCode` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderLogisticsCode` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderChannelCode` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `waybillNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ytExpressStateEnum` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weight` decimal(18, 2) NULL DEFAULT NULL,
  `freightFee` decimal(18, 2) NULL DEFAULT NULL,
  `takingEmpName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `takingEmpMobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `takingTime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `signedName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `signedTime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deliveryEmpName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deliveryEmpMobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deliveryTime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `abnormalCode` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `abnormalDesc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `abnormalTime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assignTime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assignEmpName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assignEmpMobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cancelCode` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cancelDesc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cancelTime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orgName` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orgType` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orgCityName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operateTime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nextOrgName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nextOrgCityName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operateStatus` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operateMessage` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `extendField` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `ORDER_ID_KEY`(`orderLogisticsCode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '圆通快递订单状态' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hdds_collect_data_dtl
-- ----------------------------
DROP TABLE IF EXISTS `hw_hdds_collect_data_dtl`;
CREATE TABLE `hw_hdds_collect_data_dtl`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '批次号',
  `queue_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '队列名称',
  `msg_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '0 代表sql查询操作，1代表sql增删改操作,2代表cmd命令(线程等待),3代表cmd命令(立即执行)',
  `send_msg` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发送消息体',
  `replay_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '0代表成功 1代表失败',
  `replay_msg` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '回复消息体',
  `modify_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uidx_batch`(`batch_no`, `queue_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '向下采集数据明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hdds_collect_data_mst
-- ----------------------------
DROP TABLE IF EXISTS `hw_hdds_collect_data_mst`;
CREATE TABLE `hw_hdds_collect_data_mst`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '批次号',
  `task_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `msg_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '0 代表sql查询操作，1代表sql增删改操作,2代表cmd命令(线程等待),3代表cmd命令(立即执行)',
  `msg` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '消息内容',
  `sql_one` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '查询回传数据用的sql',
  `sql_two` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '查询本地用的sql',
  `title_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '展示报表时候使用',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '向下采集数据主表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hdds_collect_data_source
-- ----------------------------
DROP TABLE IF EXISTS `hw_hdds_collect_data_source`;
CREATE TABLE `hw_hdds_collect_data_source`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `msg_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '0 代表sql查询操作，1代表sql增删改操作,2代表cmd命令(线程等待),3代表cmd命令(立即执行)',
  `msg` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '消息内容',
  `sql_one` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '查询回传数据用的sql',
  `sql_two` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '查询本地用的sql',
  `title_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '报表展示时候使用',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `record_state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '向下采集数据主表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hdds_db_source
-- ----------------------------
DROP TABLE IF EXISTS `hw_hdds_db_source`;
CREATE TABLE `hw_hdds_db_source`  (
  `Code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `Type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库类型，当前仅支持mysql',
  `Host` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主机',
  `Port` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '端口',
  `Database` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库名字',
  `UserName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `Password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `PoolMax` int(11) NULL DEFAULT NULL COMMENT '连接池最大数量',
  `PoolMin` int(11) NULL DEFAULT NULL COMMENT '连接池最小数量',
  `DriverClassName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驱动类',
  PRIMARY KEY (`Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据源' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hdds_error_send
-- ----------------------------
DROP TABLE IF EXISTS `hw_hdds_error_send`;
CREATE TABLE `hw_hdds_error_send`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOTICE_ID` bigint(20) NULL DEFAULT NULL COMMENT '通知编号',
  `RULE_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则标识',
  `ROUTE_KEY` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送的路由KEY',
  `MESSAGE_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MQ消息ID',
  `MESSAGE_BODY` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消息主体',
  `MESSAGE_TYPE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '1 TEXT，2 GZIP',
  `ERROR_MSG` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '发送失败原因',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '是否需要重复发送',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `NOTICE_ID_INX`(`NOTICE_ID`) USING BTREE,
  INDEX `MESSAGE_ID_INX`(`MESSAGE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15213 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hdds_grab_notice
-- ----------------------------
DROP TABLE IF EXISTS `hw_hdds_grab_notice`;
CREATE TABLE `hw_hdds_grab_notice`  (
  `NoticeID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '通知编号',
  `RuleCode` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '规则标识',
  `NeedProcessTime` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `StartProcessTime` timestamp(6) NULL DEFAULT NULL,
  `EndProcessTime` timestamp(6) NULL DEFAULT NULL,
  `ProcessStatus` int(1) NULL DEFAULT 0 COMMENT '执行状态,0未执行，1执行中，2，完成，3，失败，4，被跳过',
  `ErrorMessage` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '错误消息',
  PRIMARY KEY (`NoticeID`) USING BTREE,
  INDEX `GRAB_NOTICE_INDEX`(`RuleCode`, `NeedProcessTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 926950 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hdds_grab_rule
-- ----------------------------
DROP TABLE IF EXISTS `hw_hdds_grab_rule`;
CREATE TABLE `hw_hdds_grab_rule`  (
  `Code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则编号',
  `Desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `Rule` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则内容',
  `IsDistribute` tinyint(1) NULL DEFAULT NULL COMMENT '是否分发',
  `DistributField` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'StoreID' COMMENT '分发数据区分字段',
  `InspectField` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ModifyDate' COMMENT '抓取条件字段',
  `LastProcessTime` timestamp(6) NULL DEFAULT NULL COMMENT '最后执行时间',
  `DBSource` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源',
  `IsLock` tinyint(1) NULL DEFAULT NULL COMMENT '是否被锁定',
  `RouteKey` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MQ Route KEY',
  `SpecialMethod` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特殊方法采集数据',
  PRIMARY KEY (`Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据采集规则' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hdds_store_grab_rule
-- ----------------------------
DROP TABLE IF EXISTS `hw_hdds_store_grab_rule`;
CREATE TABLE `hw_hdds_store_grab_rule`  (
  `Code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则编号',
  `Desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `Rule` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则内容',
  `IsDistribute` tinyint(1) NULL DEFAULT NULL COMMENT '是否分发',
  `DistributField` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'StoreID' COMMENT '分发数据区分字段',
  `InspectField` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ModifyDate' COMMENT '抓取条件字段',
  `LastProcessTime` timestamp(6) NULL DEFAULT NULL COMMENT '最后执行时间',
  `DBSource` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源',
  `IsLock` tinyint(1) NULL DEFAULT NULL COMMENT '是否被锁定',
  `RouteKey` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MQ Route KEY',
  `SpecialMethod` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特殊方法采集数据',
  PRIMARY KEY (`Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据采集规则' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hdds_store_write_rule
-- ----------------------------
DROP TABLE IF EXISTS `hw_hdds_store_write_rule`;
CREATE TABLE `hw_hdds_store_write_rule`  (
  `Code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `Desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `DBSource` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源',
  `Rule` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则',
  `InspectField` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ModifyDate' COMMENT '条件字段,如果没有条件字段，则直接插入，否则通过条件进行新增或修改操作',
  `BeforeMethod` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '在生成sql语句之前执行的方法，返回false,则不继续往下走，返回true则继续执行',
  `AfterMethod` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行完生成的sql后执行的回调函数',
  `IsCheckUpdate` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y',
  PRIMARY KEY (`Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据回写规则，注意如果要重置接收到数据的更新时间，配置规则mapping的时候去掉时间字段的对应即可。' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hdds_write_rule
-- ----------------------------
DROP TABLE IF EXISTS `hw_hdds_write_rule`;
CREATE TABLE `hw_hdds_write_rule`  (
  `Code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `Desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `DBSource` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源',
  `Rule` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则',
  `InspectField` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ModifyDate' COMMENT '条件字段,如果没有条件字段，则直接插入，否则通过条件进行新增或修改操作',
  `BeforeMethod` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '在生成sql语句之前执行的方法，返回false,则不继续往下走，返回true则继续执行',
  `AfterMethod` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行完生成的sql后执行的回调函数',
  `IsCheckUpdate` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y',
  PRIMARY KEY (`Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据回写规则，注意如果要重置接收到数据的更新时间，配置规则mapping的时候去掉时间字段的对应即可。' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hhds_job_info
-- ----------------------------
DROP TABLE IF EXISTS `hw_hhds_job_info`;
CREATE TABLE `hw_hhds_job_info`  (
  `taskId` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `taskType` int(11) NULL DEFAULT NULL COMMENT '1-调价检查任务;',
  `task_batch_No` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务批次号',
  `taskName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `taskResult` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务结果',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  INDEX `taskId`(`taskId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hr_employee
-- ----------------------------
DROP TABLE IF EXISTS `hw_hr_employee`;
CREATE TABLE `hw_hr_employee`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `EMP_NO` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `TITLE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `TITLE2` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名',
  `ORG_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织',
  `ORG_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织名称',
  `POST_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位ID',
  `POST_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `JOB_STANDARD` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职务',
  `JOB_LEVEL` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职级',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '入职日期',
  `DISABLED_DATE` datetime(0) NULL DEFAULT NULL COMMENT '离职日期',
  `MOBILE_NO` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `EMAIL` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `EMP_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人员类别',
  `EMP_STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工状态',
  `NATION` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '民族',
  `COUNTRY` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍',
  `PARENT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实线汇报关系',
  `PARENT_ID2` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '虚线汇报关系',
  `ID_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型',
  `BIRTH_DATE` date NULL DEFAULT NULL COMMENT '出生日期',
  `ID_NO` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `GENDER` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `WORK_CITY` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作城市',
  `ISMT` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否MT人员',
  `ISGQ` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否高潜人才',
  `CHANGE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '变动日期',
  `EMP_ID` int(11) NULL DEFAULT NULL COMMENT 'hr后台编号',
  `ISPT` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否兼职',
  `JOB_STATUS` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '在职状态',
  `LIMIT_FLG` int(1) NULL DEFAULT 0 COMMENT '内购额度处理状态:0-未处理;1-已处理',
  `AMB_FLG` int(1) NULL DEFAULT 0 COMMENT '阿米巴密码处理状态:0-未处理;1-已处理',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` datetime(0) NULL DEFAULT NULL COMMENT '最后一次修改时间',
  `MODIFY_USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态:Y-有效;N-无效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_emp_no`(`EMP_NO`) USING BTREE,
  INDEX `idx_id_no`(`ID_NO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19645 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'hr人员信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hr_organization
-- ----------------------------
DROP TABLE IF EXISTS `hw_hr_organization`;
CREATE TABLE `hw_hr_organization`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ORG_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织代码',
  `TITLE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `ORG_ABBR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简称',
  `PARENT_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级组织',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `DISABLED` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失效',
  `DISABLED_DATE` datetime(0) NULL DEFAULT NULL COMMENT '失效日期',
  `ORDER_BY` int(11) NULL DEFAULT NULL COMMENT '排序',
  `ORG_GRADE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织级别',
  `ORG_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织类型',
  `ORG_LEVEL` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织层级',
  `EMP1` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门负责人',
  `EMP1_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门负责人姓名',
  `ORG1` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '虚拟上级组织',
  `ORG1_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '虚拟上级组织名称',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `REMARK` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `MODIFY_DATE` datetime(0) NULL DEFAULT NULL COMMENT '最后一次修改时间',
  `MODIFY_USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态:Y-有效;N-无效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_emp_no`(`ORG_CODE`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'hr人员信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hr_position
-- ----------------------------
DROP TABLE IF EXISTS `hw_hr_position`;
CREATE TABLE `hw_hr_position`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `PERSON_NUM` int(11) NOT NULL COMMENT '在岗人数',
  `DEPT_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `DEPT_WHILE_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门全称',
  `POST` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属职务',
  `POSITION_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `POSITION_CODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位编号',
  `POSITION_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '岗位性质',
  `AUTHORIZED_STRENGTH` int(11) NULL DEFAULT 1 COMMENT '编制人数',
  `MAX_LEVEL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最高职级',
  `MIN_LEVEL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最低职级',
  `PARENT_POSITION_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实线汇报岗位1',
  `PARENT_POSITION_NAME2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实线汇报岗位2',
  `PARENT_POSITION_NAME_DASHED` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '虚线汇报岗位1',
  `CHECK_STATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批标志',
  `MERCER_NO` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MERCER编码',
  `HEWITT_NO` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'HEWITT编码',
  `ATTACHMENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件上传',
  `AUTHORIZED_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编制属性',
  `POSITION_PROPERTIES` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位属性',
  `CREATE_USER_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8328 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'hr岗位表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_application
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_application`;
CREATE TABLE `hw_hrs_application`  (
  `APP_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用ID',
  `APP_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用编号',
  `APP_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用名称',
  `APP_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用描述',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`APP_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '应用表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_auth
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_auth`;
CREATE TABLE `hw_hrs_auth`  (
  `AUTH_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '授权ID',
  `AUTH_ROLE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权角色ID',
  `AUTH_MSG` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权信息',
  `AUTH_LEVEL` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权级别',
  `AUTH_BIZ_CLASS` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权业务类，以Spring容器中的BEAN ID为主，没有就作为一个类名来创建对象',
  `FUNC_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能ID',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`AUTH_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '授权表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_city
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_city`;
CREATE TABLE `hw_hrs_city`  (
  `CITY_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市ID',
  `CITY_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市编号',
  `CITY_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市名称',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`CITY_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '城市表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_dept
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_dept`;
CREATE TABLE `hw_hrs_dept`  (
  `DEPT_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门ID',
  `DEPT_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门编号',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`DEPT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_district
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_district`;
CREATE TABLE `hw_hrs_district`  (
  `DISTRICT_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城区ID',
  `DISTRICT_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城区编号',
  `DISTRICT_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城区名称',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`DISTRICT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '城区表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_exception
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_exception`;
CREATE TABLE `hw_hrs_exception`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EXCEPTION_INFO` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '异常信息',
  `DATA` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '参考数据',
  `LEVEL` int(11) NULL DEFAULT 0 COMMENT '异常级别:0-普通;1-重要;2-紧急',
  `REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '异常信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_field
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_field`;
CREATE TABLE `hw_hrs_field`  (
  `FIELD_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段ID',
  `FIELD_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段编号',
  `FIELD_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段名称',
  `FIELD_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段描述',
  `FIELD_TYPE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段类型',
  `FIELD_MAX_LENGTH` int(11) NULL DEFAULT NULL COMMENT '字段最大长度',
  `FIELD_MIN_LENGTH` int(11) NULL DEFAULT NULL COMMENT '字段最小长度',
  `FIELD_ENUMS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段枚举',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`FIELD_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字段表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_field_set
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_field_set`;
CREATE TABLE `hw_hrs_field_set`  (
  `FIELD_SET_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段集合ID',
  `FIELD_SET_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段集合编号',
  `FIELD_SET_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段集合名称',
  `FIELD_SET_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段集合描述',
  `FIELD_SET_TYPE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段集合类型',
  `PARENT_FIELD_SET_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级字段集合ID',
  `TOP_FIELD_SET_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '顶级字段集合ID',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`FIELD_SET_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字段集合表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_field_set_mapping
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_field_set_mapping`;
CREATE TABLE `hw_hrs_field_set_mapping`  (
  `FIELD_SET_MAPPING_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段集合映射ID',
  `FIELD_SET_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段集合ID',
  `FIELD_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段ID',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`FIELD_SET_MAPPING_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '功能字段表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_func
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_func`;
CREATE TABLE `hw_hrs_func`  (
  `FUNC_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '功能ID',
  `FUNC_CODE` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '功能编号',
  `FUNC_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能名称',
  `FUNC_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能描述',
  `FUNC_ACTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能动作',
  `IN_FIELD_SET_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '输入字段集合ID',
  `OUT_FIELD_SET_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '输出字段集合ID',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`FUNC_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '功能表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_group
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_group`;
CREATE TABLE `hw_hrs_group`  (
  `GROUP_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小组ID',
  `GROUP_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小组编号',
  `GROUP_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小组名称',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`GROUP_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小组表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_item_type
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_item_type`;
CREATE TABLE `hw_hrs_item_type`  (
  `ITEM_TYPE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品类ID',
  `ITEM_TYPE_CODE` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品类编号',
  `ITEM_TYPE_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品类名称',
  `ITEM_TYPE_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能描述',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ITEM_TYPE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '品类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_menu
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_menu`;
CREATE TABLE `hw_hrs_menu`  (
  `PARENT_MENU_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '\'0\'' COMMENT '上级菜单ID',
  `MENU_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单ID',
  `MENU_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单编号',
  `MENU_NAME` varchar(52) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `MEND_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单描述',
  `ICON` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式',
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '页面',
  `LEVEL` int(11) NULL DEFAULT 1 COMMENT '菜单层次(处于菜单中第几层)',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`MENU_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_permission
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_permission`;
CREATE TABLE `hw_hrs_permission`  (
  `PERMISSION_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限ID',
  `PERMISSION_CODE` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限编号',
  `PERMISSION_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `PERMISSION_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限描述',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`PERMISSION_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_permission_auth
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_permission_auth`;
CREATE TABLE `hw_hrs_permission_auth`  (
  `PERMISSION_AUTH_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限授权ID',
  `ROLE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `PERMISSION_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限ID',
  `AUTH_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '授权ID',
  `PERMISSION_AUTH_STATE` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ON' COMMENT '权限授权状态：ON-使用中，OFF-结束使用',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`PERMISSION_AUTH_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限授权表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_permission_func
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_permission_func`;
CREATE TABLE `hw_hrs_permission_func`  (
  `PERMISSION_FUNC_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限功能ID',
  `PERMISSION_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限ID',
  `FUNC_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '功能ID',
  `PERMISSION_FUNC_STATE` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ON' COMMENT '权限功能状态：ON-使用中，OFF-结束使用',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`PERMISSION_FUNC_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限功能表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_permission_func_field
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_permission_func_field`;
CREATE TABLE `hw_hrs_permission_func_field`  (
  `PERMISSION_FUNC_FIELD_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限功能字段ID',
  `PERMISSION_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限ID',
  `FUNC_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '功能ID',
  `FIELD_SET_MAPPING_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段集合映射ID',
  `PERMISSION_FUNC_FIELD_STATE` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ON' COMMENT '权限功能字段状态：ON-使用中，OFF-结束使用',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`PERMISSION_FUNC_FIELD_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限功能字段表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_permission_item_type
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_permission_item_type`;
CREATE TABLE `hw_hrs_permission_item_type`  (
  `PERMISSION_ITEM_TYPE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限品类ID',
  `PERMISSION_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限ID',
  `ITEM_TYPE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品类ID',
  `PERMISSION_ITEM_TYPE_STATE` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ON' COMMENT '权限品类状态：ON-使用中，OFF-结束使用',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`PERMISSION_ITEM_TYPE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限商品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_permission_menu
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_permission_menu`;
CREATE TABLE `hw_hrs_permission_menu`  (
  `PERMISSION_MENU_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限菜单ID',
  `PERMISSION_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限ID',
  `MENU_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单ID',
  `PERMISSION_MENU_STATE` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ON' COMMENT '权限菜单状态：ON-使用中，OFF-结束使用',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`PERMISSION_MENU_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限菜单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_permission_resource
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_permission_resource`;
CREATE TABLE `hw_hrs_permission_resource`  (
  `PERMISSION_RESOURCE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限单位ID',
  `PERMISSION_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限ID',
  `RESOURCE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源ID',
  `PERMISSION_RESOURCE_STATE` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ON' COMMENT '权限资源状态：ON-使用中，OFF-结束使用',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`PERMISSION_RESOURCE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限资源表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_permission_unit
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_permission_unit`;
CREATE TABLE `hw_hrs_permission_unit`  (
  `PERMISSION_UNIT_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限单位ID',
  `PERMISSION_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限ID',
  `UNIT_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位ID',
  `PERMISSION_UNIT_STATE` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ON' COMMENT '权限单位状态：ON-使用中，OFF-结束使用',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`PERMISSION_UNIT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限单位表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_position
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_position`;
CREATE TABLE `hw_hrs_position`  (
  `POSITION_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位ID',
  `POSITION_CODE` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位编号',
  `POSITION_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `POSITION_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位描述',
  `DEPT_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `CREATE_USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`POSITION_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_position_role
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_position_role`;
CREATE TABLE `hw_hrs_position_role`  (
  `POSITION_ROLE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位角色ID',
  `POSITION_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位ID',
  `ROLE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `POSITION_ROLE_STATE` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ON' COMMENT '岗位角色的状态：ON-使用中，OFF-结束使用',
  `DEFAULT_FLG` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '岗位默认角色标志:Y-是;N-否',
  `CREATE_USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`POSITION_ROLE_ID`) USING BTREE,
  INDEX `idx_PositionID`(`POSITION_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_region
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_region`;
CREATE TABLE `hw_hrs_region`  (
  `REGION_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域ID',
  `REGION_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域编号',
  `REGION_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域名称',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`REGION_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '区域表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_resource
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_resource`;
CREATE TABLE `hw_hrs_resource`  (
  `RESOURCE_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源ID',
  `RESOURCE_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源编号',
  `RESOURCE_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `RESOURCE_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源描述',
  `RESOURCE_LOCATION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源地址',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`RESOURCE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_resource_func
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_resource_func`;
CREATE TABLE `hw_hrs_resource_func`  (
  `RESOURCE_FUNC_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源功能ID',
  `RESOURCE_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源ID',
  `FUNC_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '功能ID',
  `RESOURCE_FUNC_STATE` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ON' COMMENT '资源功能状态：ON-使用中，OFF-结束使用',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`RESOURCE_FUNC_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源功能表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_role
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_role`;
CREATE TABLE `hw_hrs_role`  (
  `ROLE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `ROLE_CODE` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编号',
  `ROLE_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `ROLE_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_role_permission`;
CREATE TABLE `hw_hrs_role_permission`  (
  `ROLE_PERMISSION_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限ID',
  `ROLE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `PERMISSION_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限ID',
  `BEGIN_DATE` date NOT NULL COMMENT '开始日期',
  `END_DATE` date NOT NULL COMMENT '结束日期',
  `ROLE_PERMISSION_STATE` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ON' COMMENT '角色权限状态：ON-使用中，OFF-结束使用',
  `DEFAULT_FLG` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '默认权限标志:Y-是;N-否',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ROLE_PERMISSION_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_store
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_store`;
CREATE TABLE `hw_hrs_store`  (
  `STORE_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店ID',
  `STORE_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店编号',
  `STORE_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店名称',
  `STORE_ADDR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店地址',
  `PHONE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  `STORE_STATUS` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '审批状态:0-申报填写完成(可提交);1-提交完成(可审核);2-审核完成(通过);3-审核完成(有条件通过);4-审核完成(不通过);5-完成审批记录的表审批状态;10-区域拓展填写;11-区域行政填写;12-机构行政确认;13-区域财务填写;14-区域行政修改;15-区总审核;16-机构拓展审核;17-区总审批不通过;18-机构其他部门审核;19-机构拓展审批不通过;20-机构拓展补充意见;21-副总裁审批通过;22-副总裁审批不通过;23-机构其他部门审核;24-机构其他部门审核;25-中止;26-新店审批中止;27-导入数据;28-区域财务修改;29-区域拓展修改;',
  `STORE_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '门店类型:0-常规店;1-电子商务;2-特卖店;3-残品店',
  `STORE_MAIN_STATUS` int(11) NULL DEFAULT 0 COMMENT '门店总状态:0-新店筹备;1-营业中;2-整改中;3-临时停业;4-关闭店',
  PRIMARY KEY (`STORE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_store_except
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_store_except`;
CREATE TABLE `hw_hrs_store_except`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `STORE_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '门店ID',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `MODIFY_DATE` datetime(0) NULL DEFAULT NULL COMMENT '最后一次修改时间',
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态:Y-有效;N-无效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_region_id`(`STORE_ID`) USING BTREE,
  INDEX `idx_record_state`(`RECORD_STATE`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'unit无需同步的门店' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_store_ownership
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_store_ownership`;
CREATE TABLE `hw_hrs_store_ownership`  (
  `AutoIncID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `STORE_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店ID',
  `REGION_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域ID',
  `PROVINCE_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份ID',
  `PROVINCE_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份名称',
  `CITY_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市ID',
  `CITY_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市名称',
  `DISTRICT_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行政区ID',
  `DISTRICT_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行政区名称',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`AutoIncID`) USING BTREE,
  INDEX `idx_store_id`(`STORE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62708 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店行政归属表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_unit
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_unit`;
CREATE TABLE `hw_hrs_unit`  (
  `UNIT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位ID',
  `REGION_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域ID',
  `CITY_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市ID',
  `DISTRICT_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城区ID',
  `DEPT_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `STORE_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店ID',
  `GROUP_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '小组ID',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`UNIT_ID`) USING BTREE,
  INDEX `idx_region_id`(`REGION_ID`, `RECORD_STATE`) USING BTREE,
  INDEX `idx_store_id`(`STORE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单位表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_user
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_user`;
CREATE TABLE `hw_hrs_user`  (
  `USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `EMP_NO` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工号',
  `USER_CODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户编号',
  `USER_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `LOGIN_NAME` char(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录帐号',
  `USER_PWD` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `ID_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '证件类型：0-身份证',
  `ID_CARD` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证',
  `GENDER` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `LEVEL` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '级别',
  `EMAIL` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱地址',
  `MOBILE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `TEL` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `BIRTHDAY` date NULL DEFAULT NULL COMMENT '生日',
  `EXTENSION` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话分机',
  `USER_TYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户类型',
  `USER_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户状态：HIRE-在职，LEAVE-离职，休假-VACATION，病假-SICK',
  `HIRE_DATE` date NULL DEFAULT NULL COMMENT '入职日期',
  `LEAVE_DATE` date NULL DEFAULT NULL COMMENT '离职日期',
  `LEADER_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级用户ID',
  `UNIT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位ID',
  `REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `idx_UnitID`(`UNIT_ID`) USING BTREE,
  INDEX `idx_IdCard`(`ID_CARD`) USING BTREE,
  INDEX `idx_userid`(`USER_ID`) USING BTREE,
  INDEX `idx_emp_no`(`EMP_NO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_user_app_unit
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_user_app_unit`;
CREATE TABLE `hw_hrs_user_app_unit`  (
  `USER_APP_UNIT_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户应用借调ID',
  `USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `APP_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用ID',
  `UNIT_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位ID',
  `SECONDMENT_STATE` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ON' COMMENT '借调状态：ON-借调中，OFF-结束借调',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`USER_APP_UNIT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户应用借调表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_user_fingerprint
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_user_fingerprint`;
CREATE TABLE `hw_hrs_user_fingerprint`  (
  `FINGERPRINT_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '指纹ID',
  `USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `UNIT_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位ID',
  `FINGERPRINT` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '指纹',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`FINGERPRINT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户指纹表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_user_log
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_user_log`;
CREATE TABLE `hw_hrs_user_log`  (
  `USER_ID` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '用户ID',
  `CREATE_DATE` datetime(0) NOT NULL COMMENT '创建日期',
  `type` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '操作类型：1.新增，2删除',
  `RECORD_STATE` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'Y' COMMENT '记录状态'
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_user_position
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_user_position`;
CREATE TABLE `hw_hrs_user_position`  (
  `USER_POSITION_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户岗位ID',
  `USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `POSITION_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位ID',
  `USER_POSITION_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ON' COMMENT '岗位状态：ON-在岗，OFF-下岗',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`USER_POSITION_ID`) USING BTREE,
  INDEX `idx_UserID`(`USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户岗位表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_hrs_user_role
-- ----------------------------
DROP TABLE IF EXISTS `hw_hrs_user_role`;
CREATE TABLE `hw_hrs_user_role`  (
  `USER_ROLE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户角色ID',
  `USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `ROLE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `USER_ROLE_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ON' COMMENT '角色状态：ON-使用中，OFF-结束使用',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`USER_ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_item_attribute
-- ----------------------------
DROP TABLE IF EXISTS `hw_item_attribute`;
CREATE TABLE `hw_item_attribute`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `attrib_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性编码',
  `attrib_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性值',
  `super_id` int(10) NULL DEFAULT NULL COMMENT '父类属性ID',
  `created_time` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `updated_time` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `updated_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `is_delete` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除：0-否；1-已删除；',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_attribute`(`attrib_code`, `attrib_name`, `super_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3546 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_item_big_type
-- ----------------------------
DROP TABLE IF EXISTS `hw_item_big_type`;
CREATE TABLE `hw_item_big_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物理主键',
  `big_type_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大类CODE',
  `big_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大类名称',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_time` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `updated_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `is_delete` int(1) NULL DEFAULT 0 COMMENT '是否删除：0-否；1-已删除；',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_code`(`big_type_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品大类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_item_middle_type
-- ----------------------------
DROP TABLE IF EXISTS `hw_item_middle_type`;
CREATE TABLE `hw_item_middle_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物理主键',
  `middle_type_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中类CODE',
  `middle_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中类名称',
  `big_type_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大类CODE',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_time` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `updated_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `is_delete` int(1) NULL DEFAULT 0 COMMENT '是否删除：0-否；1-已删除；',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_code`(`middle_type_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品中类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_item_small_type
-- ----------------------------
DROP TABLE IF EXISTS `hw_item_small_type`;
CREATE TABLE `hw_item_small_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物理主键',
  `small_type_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小类CODE',
  `small_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小类名称',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_time` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `updated_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `is_delete` int(1) NULL DEFAULT 0 COMMENT '是否删除：0-否；1-已删除；',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_code`(`small_type_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2955 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品小类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_master_color
-- ----------------------------
DROP TABLE IF EXISTS `hw_master_color`;
CREATE TABLE `hw_master_color`  (
  `ColorID` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ColorName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `IsDelete` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`ColorID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_master_foustylepic
-- ----------------------------
DROP TABLE IF EXISTS `hw_master_foustylepic`;
CREATE TABLE `hw_master_foustylepic`  (
  `AutoID` int(11) NOT NULL AUTO_INCREMENT,
  `StyleID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PicName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Pic` mediumblob NULL,
  `PicType` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AutoInc` int(11) NULL DEFAULT 0,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ImageID` int(11) NULL DEFAULT NULL,
  `Colorid` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ColorName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IsDefault` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `MinPic` mediumblob NULL,
  `MediumPic` mediumblob NULL,
  `SortNO` int(5) NULL DEFAULT 0,
  `isconvert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`AutoID`) USING BTREE,
  INDEX `Index_StyleNo`(`StyleID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48876 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_master_price_type
-- ----------------------------
DROP TABLE IF EXISTS `hw_master_price_type`;
CREATE TABLE `hw_master_price_type`  (
  `ItemPriceTypeID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ItemPriceTypeCode` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ItemPriceTypeName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Status` tinyint(4) NULL DEFAULT 1,
  `CustomerID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `ModifyBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `IsDelete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ItemPriceTypeID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_master_punit
-- ----------------------------
DROP TABLE IF EXISTS `hw_master_punit`;
CREATE TABLE `hw_master_punit`  (
  `PUnitID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PUnitName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`PUnitID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单位字典' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_master_size
-- ----------------------------
DROP TABLE IF EXISTS `hw_master_size`;
CREATE TABLE `hw_master_size`  (
  `SizeID` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SizeName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `IsDelete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`SizeID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_master_sku
-- ----------------------------
DROP TABLE IF EXISTS `hw_master_sku`;
CREATE TABLE `hw_master_sku`  (
  `SKUID` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `StyleID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ColorID` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SizeID` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `IsDelete` int(1) NOT NULL DEFAULT 0,
  `Price` decimal(10, 2) NULL DEFAULT NULL COMMENT '吊牌价',
  `SalePrice` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  PRIMARY KEY (`SKUID`) USING BTREE,
  INDEX `idx_StyleID`(`StyleID`) USING BTREE,
  INDEX `idx_ColorID`(`ColorID`) USING BTREE,
  INDEX `idx_SizeID`(`SizeID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_master_style
-- ----------------------------
DROP TABLE IF EXISTS `hw_master_style`;
CREATE TABLE `hw_master_style`  (
  `StyleID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `StyleName` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PUnitID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CustomerID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateBy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `ModifyBy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `IsDelete` int(11) NOT NULL DEFAULT 0,
  `Image` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `AttDId` int(11) NULL DEFAULT NULL,
  `HaveShoebox` int(1) NULL DEFAULT NULL COMMENT '是否有鞋盒',
  `BigTypeCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '大类Code',
  `MiddleTypeCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '中分类Code',
  `SmallTypeCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '小类Code',
  `BrandCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌Code',
  `SexCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别Code',
  `YearCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年份Code',
  `SeasonCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '季节Code',
  PRIMARY KEY (`StyleID`) USING BTREE,
  INDEX `idx_BigTypeCode`(`BigTypeCode`) USING BTREE,
  INDEX `idx_SmallTypeCode`(`SmallTypeCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_master_style_type
-- ----------------------------
DROP TABLE IF EXISTS `hw_master_style_type`;
CREATE TABLE `hw_master_style_type`  (
  `AttDId` int(11) NOT NULL,
  `AttDName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AttGrpID` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IsDelete` int(1) NULL DEFAULT NULL,
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`AttDId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_mq_grab_rule
-- ----------------------------
DROP TABLE IF EXISTS `hw_mq_grab_rule`;
CREATE TABLE `hw_mq_grab_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `tableName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `primaryKey` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业务表的主键字段',
  `ruleTime` int(4) NULL DEFAULT 1 COMMENT '抓取的时间段',
  `specifiedSql` varchar(521) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '多主键时，指定sql',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_mq_send_log
-- ----------------------------
DROP TABLE IF EXISTS `hw_mq_send_log`;
CREATE TABLE `hw_mq_send_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `tableName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `primaryValue` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键值',
  `sendTime` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `uniqueValue` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msgId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `log_table_name_index`(`tableName`) USING BTREE,
  INDEX `log_primaryValue_index`(`primaryValue`) USING BTREE,
  INDEX `log_sendTime_index`(`sendTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7563496 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_name_record_info
-- ----------------------------
DROP TABLE IF EXISTS `hw_name_record_info`;
CREATE TABLE `hw_name_record_info`  (
  `ids` int(11) NOT NULL AUTO_INCREMENT,
  `TABLE_NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STORE_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DATA_LOCATION` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_one_idea_disc6_user
-- ----------------------------
DROP TABLE IF EXISTS `hw_one_idea_disc6_user`;
CREATE TABLE `hw_one_idea_disc6_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CARD` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VIRTUAL_ID_CARD` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_idcard`(`ID_CARD`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_one_idea_limit_bill
-- ----------------------------
DROP TABLE IF EXISTS `hw_one_idea_limit_bill`;
CREATE TABLE `hw_one_idea_limit_bill`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `reverse_bill_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '撤销交易订单号',
  `sku_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku',
  `bill_disc` decimal(20, 2) NULL DEFAULT NULL COMMENT '内购被当前订单扣减的额度',
  `count` int(2) NULL DEFAULT NULL COMMENT '个数',
  `state` int(2) NULL DEFAULT NULL COMMENT '0-买入，1-退货',
  `modify_user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `modify_date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `record_state` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 170345 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '畹町员工内购与订单映射表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_one_idea_user_limit
-- ----------------------------
DROP TABLE IF EXISTS `hw_one_idea_user_limit`;
CREATE TABLE `hw_one_idea_user_limit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `discount` int(2) NULL DEFAULT 7 COMMENT '额度折扣',
  `remain_disc` decimal(20, 2) NULL DEFAULT NULL COMMENT '内购有效额度',
  `total_disc` decimal(20, 2) NULL DEFAULT NULL COMMENT '内购剩余额度',
  `modify_user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `modify_date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `record_state` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_id_card`(`id_card`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56356 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '畹町员工内购额度表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_bank_account
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_bank_account`;
CREATE TABLE `hw_pos_bank_account`  (
  `BankAccountId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '银行账号ID',
  `BankAccount` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '银行账号',
  `BankAccountName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行账号名称',
  `BankCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开户行',
  `BankBranch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '开户支行',
  `CreateDate` datetime(0) NOT NULL COMMENT '创建日期',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改日期',
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`BankAccountId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '银行账号表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_card_bin
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_card_bin`;
CREATE TABLE `hw_pos_card_bin`  (
  `CARD_BIN` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CARD_LEN` int(11) NOT NULL,
  `BIN_LEN` int(11) NOT NULL,
  `CARD_ISSUER` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BANK_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CARD_TYPE` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STAT` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESV1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CARD_BIN`, `CARD_ISSUER`, `CARD_LEN`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_coupon_order
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_coupon_order`;
CREATE TABLE `hw_pos_coupon_order`  (
  `ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `custId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员 ID',
  `couponId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠券编号',
  `storeId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店编号',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `modifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员优惠券 订单关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_coupon_unit
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_coupon_unit`;
CREATE TABLE `hw_pos_coupon_unit`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `CHANNEL_TYPE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '礼券发放渠道',
  `COUPON_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '礼券ID',
  `REGION_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '区域ID',
  `CITY_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '城市ID',
  `DISTRICT_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '城区ID',
  `STORE_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '门店ID',
  `CREATE_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `idx_channel_type`(`CHANNEL_TYPE`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '礼券使用范围表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_coupon_update_log
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_coupon_update_log`;
CREATE TABLE `hw_pos_coupon_update_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `coupon_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '礼券编号',
  `cust_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员号',
  `used_time` timestamp(0) NULL DEFAULT NULL COMMENT '使用时间',
  `bill_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `store_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消费门店',
  `update_time` int(11) NULL DEFAULT 0 COMMENT '核销次数',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `modify_user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `record_state` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_coupon_no`(`coupon_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 157 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '礼券核销失败记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_cus_tag
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_cus_tag`;
CREATE TABLE `hw_pos_cus_tag`  (
  `CUS_TAG_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员标签ID',
  `CUS_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员ID',
  `TAG_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签ID',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`CUS_TAG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员标签表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_cust
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_cust`;
CREATE TABLE `hw_pos_cust`  (
  `CustID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员ID',
  `CustNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员卡号',
  `CustName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员姓名',
  `CustPwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员密码',
  `Mobile` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员手机号',
  `IdType` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型 0:身份证 1:护照 2:军官证 3:士兵证 4:回乡证 5:临时身份证 6:户口簿 7:警官证 8:台胞证 9:营业执照 10其它证件',
  `IdNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `Sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员性别',
  `CustGroup` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员分组',
  `TotalPoint` bigint(20) NULL DEFAULT NULL COMMENT '会员总积分',
  `UsedPoint` bigint(20) NULL DEFAULT NULL COMMENT '已用积分',
  `RemainPoint` bigint(20) NULL DEFAULT NULL COMMENT '剩余积分',
  `Nationality` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍',
  `Country` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员所在国家',
  `Province` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员所在省份',
  `City` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员所在城市',
  `Address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员收货地址',
  `Birthday` date NULL DEFAULT NULL COMMENT '生日',
  `EMail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `Hobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '兴趣爱好',
  `Tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员标签',
  `BankCardNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `OpenId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'OPENID',
  `SourceCode` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注册渠道 1.微信注册 2.手动创建 3.系统导入 4.支付宝导入',
  `CustType` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户类型 1.FANS 2.MEMBER 3.CUSTOMER 4.VIP 5.STUDENT',
  `CustStatus` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '客户状态 1.激活 2.失效',
  `Married` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '婚姻状况',
  `QQ` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `WeiBo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微博账号',
  `WeChat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信账号',
  `Occupation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业',
  `Title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `StudentID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号',
  `CustOrgName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员所在机构名称',
  `AttentionTime` datetime(0) NULL DEFAULT NULL COMMENT '关注时间',
  `CancelAttentionTime` datetime(0) NULL DEFAULT NULL COMMENT '取消关注时间',
  `RegTime` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `IsCertified` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'F' COMMENT '是否通过实名认证。T是通过 F是没有实名认证',
  `Signature` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签名',
  `Avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `Memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `StoreID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '门店ID',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`CustID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_cust_consumeinfo
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_cust_consumeinfo`;
CREATE TABLE `hw_pos_cust_consumeinfo`  (
  `custInfoId` int(11) NOT NULL COMMENT '会员信息表id',
  `BillNo` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `custNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员id',
  `ActionDate` datetime(0) NULL DEFAULT NULL COMMENT '使用时间',
  `ActionType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用类型',
  `ConsumeQty` int(11) NULL DEFAULT NULL COMMENT '消费数量',
  `ConsumeAmt` decimal(14, 4) NULL DEFAULT NULL COMMENT '消费金额',
  `Point` decimal(14, 4) NULL DEFAULT NULL COMMENT '积分金额',
  `OptMan` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人员',
  `StoreID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店id',
  `IsUpSR` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否上传到SR',
  `IsUpMec` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `PointRate` decimal(14, 2) NULL DEFAULT 1.00 COMMENT '积分率',
  PRIMARY KEY (`custInfoId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员消费记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_cust_coupon
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_cust_coupon`;
CREATE TABLE `hw_pos_cust_coupon`  (
  `CustCouponID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员优惠券ID',
  `CouponID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券ID',
  `CustID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员ID',
  `ReceiveFlag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否领取',
  `InuseFlag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否使用',
  `ReceiveTime` datetime(0) NULL DEFAULT NULL COMMENT '领取时间',
  `InuseTime` datetime(0) NULL DEFAULT NULL COMMENT '使用时间',
  `StoreID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '使用的门店ID',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`CustCouponID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员优惠券表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_deletestyleid
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_deletestyleid`;
CREATE TABLE `hw_pos_deletestyleid`  (
  `styleId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_dis_barcode
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_dis_barcode`;
CREATE TABLE `hw_pos_dis_barcode`  (
  `OREDER_BARCODE_NO` int(11) NOT NULL AUTO_INCREMENT,
  `BILL_DETAIL_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售明细id:对应hw_pos_salposdtl表中AutoIncID',
  `BILL_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售单',
  `BAR_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物料',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `RECORD_STATE` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效记录:Y-有效;N-无效;',
  PRIMARY KEY (`OREDER_BARCODE_NO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 427 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_email
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_email`;
CREATE TABLE `hw_pos_email`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `STORE_ID` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CUR_DATE` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EMAIL` bit(1) NULL DEFAULT NULL,
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_email_address
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_email_address`;
CREATE TABLE `hw_pos_email_address`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `userName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户名',
  `regionName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '区域名称',
  `cityName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '城市名称',
  `position` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '职能岗位',
  `bigType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '负责大类',
  `tellphone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '固定电话',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '邮箱',
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 282 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户邮箱表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_enable
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_enable`;
CREATE TABLE `hw_pos_enable`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店编号',
  `is_enable` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否启用',
  `modify_date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uidx_StoreId`(`store_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店是否启用新POS买单' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_express_dtl
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_express_dtl`;
CREATE TABLE `hw_pos_express_dtl`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '业务ID',
  `BILL_NO` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小票号',
  `EXPRESS_ID` int(11) NULL DEFAULT NULL COMMENT '快递主表',
  `EXPRESS_VIP_ID` int(11) NULL DEFAULT NULL COMMENT '快递收货信息ID',
  `EXPRESS_SKU_ID` int(11) NULL DEFAULT NULL COMMENT '快递商品信息ID',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CANCEL_STATE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否退货',
  `CANCEL_TIME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货时间',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_EXPRESS_SKU_ID`(`EXPRESS_SKU_ID`) USING BTREE,
  INDEX `IDX_EXPRESS_ID`(`EXPRESS_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '快递到家快递明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_express_mst
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_express_mst`;
CREATE TABLE `hw_pos_express_mst`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '业务ID',
  `ORDER_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户订单号',
  `MAIL_NO` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运单号',
  `RETURN_MAIL_NO` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '顺丰回馈运单号',
  `DELIVERY_STORE_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货门店',
  `EXPRESS_COMPANY` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '顺丰' COMMENT '快递公司',
  `PICK_UP_TIME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取件时间',
  `RECEIVE_TIME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客人收件时间',
  `EXPRESS_STATE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递状态',
  `CANCEL_ORDER` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否整单退货',
  `CANCEL_TIME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '整单退时间',
  `EXPRESS_COST` decimal(14, 4) NULL DEFAULT NULL COMMENT '快递费用',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_MAIL_NO`(`MAIL_NO`) USING BTREE,
  INDEX `IDX_RETURN_MAIL_NO`(`RETURN_MAIL_NO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '快递到家快递主表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_express_sku
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_express_sku`;
CREATE TABLE `hw_pos_express_sku`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '业务ID',
  `BILL_NO` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小票号',
  `BILL_DATE` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单日期',
  `SALE_STORE_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售门店',
  `DELIVERY_STORE_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货门店',
  `ALLOT_TIME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分配发货门店时间,YYYY-MM-DD HH24:MM:SS',
  `SKU` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SKU',
  `STYLE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '款号',
  `STYLE_NAME` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `QRY` decimal(14, 4) NULL DEFAULT 1.0000 COMMENT '数量',
  `PRICE` decimal(18, 4) NULL COMMENT '售价',
  `BID_PRICE` decimal(18, 4) NULL COMMENT '买单时商品标价（有调价则显示调价）',
  `AMOUNT` decimal(18, 4) NULL DEFAULT NULL COMMENT '金额',
  `EMPLOY_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售员',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_BILLNO`(`BILL_NO`) USING BTREE,
  INDEX `IDX_STOREID`(`SALE_STORE_ID`) USING BTREE,
  INDEX `idx_sku`(`SKU`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 484 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '快递到家sku表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_express_vip
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_express_vip`;
CREATE TABLE `hw_pos_express_vip`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '业务ID',
  `BILL_NO` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小票号',
  `FORMID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OPENID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微商城openid',
  `VIP_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员ID',
  `CUSTOMER_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人名称',
  `CUSTOMER_DISTRICT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUSTOMER_ADDRESS` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人地址',
  `CUSTOMER_TEL` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人电话',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_BILLNO`(`BILL_NO`) USING BTREE,
  INDEX `IDX_VIPID`(`VIP_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 276 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '快递到家VIP收货信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_fetch_rule
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_fetch_rule`;
CREATE TABLE `hw_pos_fetch_rule`  (
  `Id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则编号',
  `DistributionType` int(2) NOT NULL COMMENT '0:公共，1按门店分发',
  `Rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '抓取规则',
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则名称',
  `ModifyDate` datetime(0) NULL DEFAULT '1970-01-01 00:00:00',
  `IsLock` int(11) NULL DEFAULT 0 COMMENT '0:未锁定，1锁定',
  UNIQUE INDEX `id`(`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_free_small_type
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_free_small_type`;
CREATE TABLE `hw_pos_free_small_type`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '物理主键',
  `SMALL_TYPE_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小类CODE',
  `SMALL_TYPE_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小类名称',
  `CREATED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `MODIFY_USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `RECORD_STATE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '状态',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `idx_code`(`SMALL_TYPE_CODE`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品小类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_holiday
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_holiday`;
CREATE TABLE `hw_pos_holiday`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `CUR_DATE` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '当期时间',
  `PERIOD_DATE` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '同期时间，可空',
  `HOLIDAY` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT '是否节假日',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_cur_date`(`CUR_DATE`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '当期对应的去年同期日期' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_import_batch
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_import_batch`;
CREATE TABLE `hw_pos_import_batch`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createTime` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '导入时间',
  `batchTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `isAudit` int(2) NULL DEFAULT 0 COMMENT '是否审核（0：否，1：是）',
  `startDate` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `endDate` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `peopleNum` int(11) NULL DEFAULT 0 COMMENT '人数',
  `totalAmount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '总金额',
  `couponNum` int(11) NULL DEFAULT NULL COMMENT '券张数',
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_cancel_order
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_cancel_order`;
CREATE TABLE `hw_pos_invoice_cancel_order`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `CANCEL_BILL_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '全渠道退货订单编号',
  `BILL_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '全渠道订单编号',
  `CANCEL_TOTAL` decimal(10, 2) NULL DEFAULT NULL COMMENT '退货总金额',
  `CANCEL_SMALL_TYPE_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '退货小分类',
  `CANCEL_SMALL_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货小分类名称',
  `CANCEL_SMALL_TYPE_AMT` decimal(10, 4) NULL DEFAULT NULL COMMENT '退货小分类金额',
  `CANCEL_QRY` int(10) NULL DEFAULT NULL COMMENT '退货小分类商品数量',
  `CANCEL_STORE_NO` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '退货门店编号',
  `CANCEL_BILL_DATE` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '退货订单时间',
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  `POS_BILL_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'pos订单号',
  `CANCEL_POS_BILL_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'POS退货订单号',
  `IS_ONLINE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否线上;',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `idx_cancel_bill_no`(`CANCEL_BILL_NO`) USING BTREE,
  INDEX `idx_bill_no`(`BILL_NO`) USING BTREE,
  INDEX `idx_bill_date`(`CANCEL_BILL_DATE`) USING BTREE,
  INDEX `idx_store_id`(`CANCEL_STORE_NO`) USING BTREE,
  INDEX `idx_small_type_code`(`CANCEL_SMALL_TYPE_CODE`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71073 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退货小票订单' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_cancel_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_cancel_order_detail`;
CREATE TABLE `hw_pos_invoice_cancel_order_detail`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `CANCEL_BILL_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '全渠道退货订单',
  `BILL_SMALL_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '小分类ID',
  `QTY` int(10) NULL DEFAULT NULL COMMENT 'sku数量',
  `SKU` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SKU_AMT` decimal(10, 2) NULL DEFAULT NULL,
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `BILL_NO_IND`(`CANCEL_BILL_NO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77017 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_cancel_order_master
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_cancel_order_master`;
CREATE TABLE `hw_pos_invoice_cancel_order_master`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `CANCEL_BILL_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '全渠道退货订单编号',
  `CANCEL_POS_BILL_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'pos退货订单',
  `BILL_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '全渠道订单编号',
  `POS_BILL_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'pos 订单号',
  `IS_ONLINE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否线上;',
  `CANCEL_TOTAL` decimal(10, 2) NULL DEFAULT NULL COMMENT '总金额',
  `CANCEL_QTY` int(10) NULL DEFAULT NULL COMMENT '订单总数量',
  `CANCEL_STORE_NO` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '门店编号',
  `CANCEL_BILL_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '订单时间',
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `BILL_NO_IND`(`BILL_NO`) USING BTREE,
  INDEX `STORE_NO_IND`(`CANCEL_STORE_NO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64984 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单主表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_channel
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_channel`;
CREATE TABLE `hw_pos_invoice_channel`  (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `BILLNO` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `CHANNELID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道ID',
  `TYPE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道状态（1：微信ID ）',
  `CREATE_DATE` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `MODIFY_DATE` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_column
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_column`;
CREATE TABLE `hw_pos_invoice_column`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `COLUMN_SER` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏位序号',
  `COLUMN_ID` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏位编号',
  `COLUMN_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏位名称',
  `COLUMN_DESC` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏位描述',
  `MENU_ICON` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏位图标',
  `MENU_STYLE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏位样式',
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏位表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_company
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_company`;
CREATE TABLE `hw_pos_invoice_company`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `AREA` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域',
  `COMPANY_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '公司状态：1：使用，2：未使用',
  `COMPANY_NAME` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `NATURE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '性质',
  `TAX_NO` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '社会统一代码/税务登记号',
  `ADDRESS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `PHONE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `BANK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行',
  `ACCOUNT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `RECEIPT_NO` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票 1.增值税专用,2.增值税普通',
  `GATHER` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款人',
  `REVIEW` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '复核',
  `DRAWER` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开票人',
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `TAX_NO`(`TAX_NO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 135 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '人事开票信息发票' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_document
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_document`;
CREATE TABLE `hw_pos_invoice_document`  (
  `DOCUMENT_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文档ID',
  `BILL_NO` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `DOCUMENT_URL` int(255) NULL DEFAULT NULL COMMENT '文档路径',
  `DOCUMENT_NAME` int(255) NULL DEFAULT NULL COMMENT '文档内部名称',
  `DOCUMENT_EXTERNAL_NAME` int(255) NULL DEFAULT NULL COMMENT '文档外部名称',
  `DOCUMENT_TYPE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文档类型',
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`DOCUMENT_ID`) USING BTREE,
  INDEX `IND_BILL_NO`(`BILL_NO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '发票文档表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_get_log
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_get_log`;
CREATE TABLE `hw_pos_invoice_get_log`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `BILL_NO` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `GET_COUNT` int(9) NULL DEFAULT NULL COMMENT '获取次数',
  `EMAIL` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `GET_TYPE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '获取类型:1 发送邮件，2.下载pdf,3保存微信，5保存支付宝，6成为热风会员',
  `SEND_TYPE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IND_BILL_NO`(`BILL_NO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 154 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小票获取发票表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_goods_code
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_goods_code`;
CREATE TABLE `hw_pos_invoice_goods_code`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `GOODS_CODE` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编号',
  `GOODS_NAME` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `GOODS_SIMPLE_CODE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简码',
  `GOODS_TAX_PROJECT` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品税目',
  `GOODS_RATE` decimal(10, 2) NULL DEFAULT NULL COMMENT '税率',
  `SPECIFICATION` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格型号',
  `MEASURING_UNIT` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计量单位',
  `GOODS_PRICE` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `INCLUDING_TAX_PRICE_FALG` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '含税价标志',
  `HIDE_LOGO` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '隐藏标志',
  `SINO_FOREIGN` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中外合作油气田',
  `TAX_CLASS_CODE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '税收分类编码',
  `IS_ENJOY_FAVOURED_POLICY` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否享受优惠政策',
  `TAX_CLASS_CODE_NAME` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '税收分类编码名称',
  `FAVOURED_POLICY_TYPE` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠政策类型',
  `ZERO_TAX_RATE_FALG` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '零税率标识',
  `CODE_VERSION` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码版本号',
  `GENERATE_COMMODITY_CODE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生产商品编码',
  `CLASS_BEHAVIOR` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '此行为分类',
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1226 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '税务局商品编码' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_individual
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_individual`;
CREATE TABLE `hw_pos_invoice_individual`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `REQUEST_LOG` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '发票请求流水号',
  `TAX_CONTROL_EQUIPMENT_CODE` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '税控设备编号',
  `INVOICE_CODE` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '发票代码',
  `INVOICE_NO` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票号码',
  `INVOICE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '开票日期',
  `INVOICE_CIPHER` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '发票密文',
  `CHECK_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '校验码',
  `QR_CODE` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '二维码',
  `REMARK` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '备注',
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `REQUEST_LOG_INDEX`(`REQUEST_LOG`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 710 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '个人发票信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_log
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_log`;
CREATE TABLE `hw_pos_invoice_log`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `ENTERPRISE_TYPE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '企业类型 1.企业，2.个人',
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `TAX_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '税号',
  `ADDRESS_PHONE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址，电话',
  `OPEN_BANK_ACCOUNT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户行以及账号',
  `MOBILE_NUMBER` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '手机号码',
  `EMAIL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '邮箱',
  `STATE_RECEIPT` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '开票状态: 未开票：1, 开票失败 2, 开票成功：3,红冲：4',
  `STATE_CHARGEBACK` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '退款状态:0未进行红冲，1有开票红冲成功，2在开票之前已经红冲过，3未开票,4.开票异常',
  `STORE_NO` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BILL_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUEST_LOG` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票请求流水号',
  `CHARGEBACK_REQUEST_LOG` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款订单号',
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  `BILL_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单ID',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `REQUEST_LOG_INDEX`(`REQUEST_LOG`) USING BTREE,
  INDEX `BILL_ID`(`BILL_ID`) USING BTREE,
  INDEX `BILL_NO`(`BILL_NO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 475 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小票录入信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_mail_mst
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_mail_mst`;
CREATE TABLE `hw_pos_invoice_mail_mst`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `MAIL_ID` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '邮件主表ID',
  `MAIL_TITLE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件标题',
  `HTML_CONTEXT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `MAIL_CONTEXT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邮件主表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_mail_send_user
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_mail_send_user`;
CREATE TABLE `hw_pos_invoice_mail_send_user`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `MAIL_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '邮件主表ID',
  `IS_PERSON` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否是人员,0 不是，1是',
  `PARENT_CODE` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父节点编码',
  `USER_ID` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `USER_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `MAIL_TYPE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件类型:1.主发送人，2抄送人',
  `MAIL` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 440 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邮件发送人员' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_menu
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_menu`;
CREATE TABLE `hw_pos_invoice_menu`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `SERIAL_NO` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '序号',
  `MENU_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单ID',
  `MENU_NAME` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `MENU_HREF` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单href，',
  `MENU_URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `MENU_DESC` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单描述',
  `SUPER_MENU` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级菜单',
  `MENU_ICON` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `MENU_STYLE` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单样式',
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_order
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_order`;
CREATE TABLE `hw_pos_invoice_order`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `BILL_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '订单编号,拆单后订单号',
  `BILL_TYPE` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '1正常订单,2.抬头开错订单，3.退单后新开订单',
  `TOTAL` decimal(10, 2) NULL DEFAULT NULL COMMENT '总金额',
  `SMALL_TYPE_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '小分类',
  `SMALL_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0',
  `SMALL_TYPE_AMT` decimal(10, 4) NULL DEFAULT NULL COMMENT '小分类金额',
  `SMALL_TYPE_FOUR_TWO_AMT` decimal(10, 2) NULL DEFAULT NULL,
  `QRY` int(10) NULL DEFAULT NULL,
  `STORE_NO` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '门店编号',
  `BILL_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '订单时间',
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  `OLD_BILL_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新生成的订单号',
  `OLD_BILL_DATE` timestamp(0) NULL DEFAULT NULL,
  `BILL_SMALL_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小分类唯一编码',
  `POS_BILL_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `BILL_NO_IND`(`BILL_NO`) USING BTREE,
  INDEX `SMALL_TYPE_CODE_IND`(`SMALL_TYPE_CODE`) USING BTREE,
  INDEX `STORE_NO_IND`(`STORE_NO`) USING BTREE,
  INDEX `OLD_BILL_NO_IND`(`OLD_BILL_NO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10570 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小票订单' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_order_detail`;
CREATE TABLE `hw_pos_invoice_order_detail`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `BILL_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '订单编号',
  `BILL_SMALL_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '小分类ID',
  `QTY` int(10) NULL DEFAULT NULL COMMENT 'sku数量',
  `SKU` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SKU_AMT` decimal(10, 2) NULL DEFAULT NULL,
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `BILL_NO_IND`(`BILL_NO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12013 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_order_master
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_order_master`;
CREATE TABLE `hw_pos_invoice_order_master`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `BILL_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '全渠道订单编码',
  `POS_BILL_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'POS单号',
  `MOBILE` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `CUST_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员号',
  `IS_ONLINE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否线上',
  `TOTAL` decimal(10, 2) NULL DEFAULT NULL COMMENT '总金额',
  `QTY` int(10) NULL DEFAULT NULL COMMENT '订单总数量',
  `STORE_NO` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '门店编号',
  `BILL_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '订单时间',
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `BILL_NO_IND`(`BILL_NO`) USING BTREE,
  INDEX `STORE_NO_IND`(`STORE_NO`) USING BTREE,
  INDEX `MOBILE_IND`(`MOBILE`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6623 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单主表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_org_detp
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_org_detp`;
CREATE TABLE `hw_pos_invoice_org_detp`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `DEPT_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门id',
  `DEPT_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名字',
  `SUPER_DEPT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级部门',
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组织机构表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_param
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_param`;
CREATE TABLE `hw_pos_invoice_param`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `PM_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数名',
  `PM_VALUE` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数值',
  `PM_TYPE` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数类型',
  `PM_DESC` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数描述',
  `PM_ADD2` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '附加1',
  `PM_ADD3` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加2',
  `MODIFY_USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_repeat_order
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_repeat_order`;
CREATE TABLE `hw_pos_invoice_repeat_order`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `BILL_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '订单编号',
  `CANCEL_BILL_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货订单编号',
  `BILL_TYPE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '1。原订单编号，2。退货订单编号',
  `TOTAL` decimal(10, 2) NULL DEFAULT NULL COMMENT '总金额',
  `SMALL_TYPE_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '小分类',
  `SMALL_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0',
  `SMALL_TYPE_AMT` decimal(10, 4) NULL DEFAULT NULL COMMENT '小分类金额',
  `QRY` int(10) NULL DEFAULT NULL,
  `STORE_NO` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '门店编号',
  `BILL_DATE` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '订单时间',
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2395304 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '重复的小票订单' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_role
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_role`;
CREATE TABLE `hw_pos_invoice_role`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `ROLE_ID` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '角色ID',
  `ROLE_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `ROED_DESC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '角色描述',
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_role_menu_column
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_role_menu_column`;
CREATE TABLE `hw_pos_invoice_role_menu_column`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `ROLE_ID` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色ID',
  `MENU_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单ID',
  `COLUMN_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏位ID',
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 262 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单栏位表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_status_log
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_status_log`;
CREATE TABLE `hw_pos_invoice_status_log`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `BILL_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '订单ID',
  `BILL_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '订单编号',
  `INTERFACE_TYPE` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '接口类型',
  `COMP_LOG` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '只有航信返回的有完整日志',
  `SIMP_LOG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '简单日志，标题',
  `IS_SUCFUL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1-表示成功；0-表示失败；跟主表状态重复',
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `BILL_ID_IND`(`BILL_ID`) USING BTREE,
  INDEX `BILL_NO_IND`(`BILL_NO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '开票是否成功记录状态' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_store
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_store`;
CREATE TABLE `hw_pos_invoice_store`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `STORE_CODE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店编号',
  `REGION_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REGION_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EXTENSION` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分机号',
  `STORE_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '门店名称',
  `STORE_ADDRESS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '门店及地址',
  `STORE_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '0.新店筹备，1.营业中',
  `MAKE_INVOICE_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2' COMMENT '1.可用，2不可用',
  `TAX_NO` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司税号',
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `STORE_CODE`(`STORE_CODE`) USING BTREE,
  INDEX `TAX_NO`(`TAX_NO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7466 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小票门店表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_user
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_user`;
CREATE TABLE `hw_pos_invoice_user`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `EMP_NO` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '工号，',
  `USER_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `PWSS_WORD` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户密码',
  `SYS_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统类型',
  `QQ` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq',
  `MAIL` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'mail',
  `SEX` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '性别',
  `AGE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '年龄',
  `ADDRES` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '联系地址',
  `PHONE` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '联系电话',
  `IS_LEAVE` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否离职',
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  `ORGANIZE` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织',
  `POSITION` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `SUPERIOR` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `uuu`(`EMP_NO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1000000 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_user_org
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_user_org`;
CREATE TABLE `hw_pos_invoice_user_org`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店ID',
  `DEPT_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '9.用户机构表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_invoice_user_role
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_invoice_user_role`;
CREATE TABLE `hw_pos_invoice_user_role`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `ROLE_ID` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色ID',
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 154 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_ip_id
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_ip_id`;
CREATE TABLE `hw_pos_ip_id`  (
  `pos_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`pos_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Pos机器IP与pos机器绑定相关信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_item_temp
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_item_temp`;
CREATE TABLE `hw_pos_item_temp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PromotionID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '促销ID',
  `skuID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'skuID',
  `StyleID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'StyleID',
  `color` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `SizeID` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '码',
  `bigTypeCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大类',
  `middleTypeCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中类',
  `smallTypeCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小类',
  `dataType` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据类型 1，导入 2，分类',
  `isGiveGoods` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否赠送商品 1，促销商品 2，赠送商品',
  `isEditStatus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2' COMMENT '是否是编辑状态 1，否 2，是',
  `isExcludeGoods` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否是排除本sku 1，否 2，是',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_PromotionID`(`PromotionID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8568668 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品导入临时表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_long_price_dtl
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_long_price_dtl`;
CREATE TABLE `hw_pos_long_price_dtl`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `price_id` int(11) NOT NULL COMMENT '调价单号',
  `city_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `store_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店ID',
  `style_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '款号',
  `color_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `size_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺码',
  `price` decimal(18, 2) NULL DEFAULT NULL COMMENT '价格',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  `record_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_price_id`(`price_id`) USING BTREE,
  INDEX `idx_color_id`(`color_id`) USING BTREE,
  INDEX `idx_city_style_color`(`city_id`, `style_id`, `color_id`) USING BTREE,
  INDEX `idx_id_status`(`price_id`, `record_status`) USING BTREE,
  INDEX `idx_city`(`city_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87366 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '长期调价明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_long_price_dtl_temp
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_long_price_dtl_temp`;
CREATE TABLE `hw_pos_long_price_dtl_temp`  (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `warehouseid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `style_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `color_id` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 0) NULL DEFAULT NULL,
  `index` int(11) NULL DEFAULT NULL,
  `pid` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_long_price_mst
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_long_price_mst`;
CREATE TABLE `hw_pos_long_price_mst`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '调价单号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调价名称、标题',
  `start_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调价开始日期',
  `end_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调价结束日期，长期调价无结束日期',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调价内容',
  `create_user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  `modify_user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `record_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y' COMMENT '记录状态',
  `mds_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'mds状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2149 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '长期调价表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_long_price_result
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_long_price_result`;
CREATE TABLE `hw_pos_long_price_result`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price_id` int(11) NOT NULL,
  `city_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市id',
  `style_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '款号',
  `color_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `size_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺码',
  `price` decimal(18, 2) NULL DEFAULT NULL COMMENT '价格',
  `effect_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '生效日期',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  `record_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique`(`city_id`, `style_id`, `color_id`, `size_id`) USING BTREE,
  INDEX `idx_modify_date`(`modify_date`) USING BTREE,
  INDEX `city`(`city_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '长期调价最终结果表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_machine
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_machine`;
CREATE TABLE `hw_pos_machine`  (
  `posId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收银机ID',
  `posCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收银机编号',
  `posName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '收银机名称',
  `storeId` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店ID',
  `posSwitch` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '开关',
  `online` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '在线状态',
  `lastOnlineTime` datetime(0) NULL DEFAULT NULL COMMENT '最后在线时间',
  `version` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'pos最新版本号',
  `posSpace` int(20) NULL DEFAULT NULL COMMENT 'pos硬盘空间大小',
  `printMachine` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'pos默认打印机',
  `templateId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '配置的打印文件模板',
  `templateModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '小票机模板下派时间',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `recordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`posId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店收银机表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_machine_transition
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_machine_transition`;
CREATE TABLE `hw_pos_machine_transition`  (
  `transitionId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '序号',
  `posId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收银机ID',
  `posCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收银机编号',
  `posName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '收银机名称',
  `storeId` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店ID',
  `posSwitch` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '开关',
  `online` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '在线状态',
  `lastOnlineTime` datetime(0) NULL DEFAULT NULL COMMENT '最后在线时间',
  `version` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'pos最新版本号',
  `posSpace` int(20) NULL DEFAULT NULL COMMENT 'pos硬盘空间大小',
  `printMachine` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'pos默认打印机',
  `templateId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '配置的打印文件模板',
  `templateModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '小票机模板下派时间',
  `modifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `recordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`transitionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店收银机监控流水表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_manual_sale
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_manual_sale`;
CREATE TABLE `hw_pos_manual_sale`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `manual_sale_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手工单ID',
  `batch_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手工单批次号',
  `city_batch_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下发城市手工单批次号',
  `store_batch_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下发门店手工单批次号',
  `bill_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '票号',
  `payModeId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `amount` decimal(10, 2) NULL COMMENT '销售金额',
  `sale_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '手工单状态 0:新建，1:总部派发城市，2，城市派发门店，3:已使用 4：作废',
  `city_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '城市ID',
  `store_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店ID',
  `modify_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `modify_user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `pay_date` datetime(0) NULL DEFAULT NULL COMMENT '支付日期',
  `sale_date` datetime(0) NULL DEFAULT NULL COMMENT '销售日期',
  `record_state` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态 ',
  `verify_state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ModifyDate`(`modify_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '手工单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_manual_sale_batch
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_manual_sale_batch`;
CREATE TABLE `hw_pos_manual_sale_batch`  (
  `batch_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手工单批次号',
  `begin_sale_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手工单起始号',
  `end_sale_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手工单中止号',
  `modify_date` date NULL DEFAULT NULL COMMENT '修改日期',
  `sale_count` int(10) NOT NULL COMMENT '批次下手工单数量',
  `un_sale_count` int(10) NOT NULL COMMENT '批次下手工单未领数量',
  `record_State` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  `modify_user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  PRIMARY KEY (`batch_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '手工单入库批次表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_manual_sale_city_batch
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_manual_sale_city_batch`;
CREATE TABLE `hw_pos_manual_sale_city_batch`  (
  `batch_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手工单批次号',
  `region_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '区域ID',
  `city_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '城市ID',
  `begin_sale_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手工单起始号',
  `end_sale_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手工单中止号',
  `modify_date` date NULL DEFAULT NULL COMMENT '修改日期',
  `sale_count` int(10) NOT NULL COMMENT '批次下手工单数量',
  `un_sale_count` int(10) NOT NULL COMMENT '批次下手工单未领数量',
  `record_State` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  `modify_user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `province_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份id',
  PRIMARY KEY (`batch_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '手工单城市派发批次表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_manual_sale_store_batch
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_manual_sale_store_batch`;
CREATE TABLE `hw_pos_manual_sale_store_batch`  (
  `batch_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手工单批次号',
  `district_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '城区ID',
  `store_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店ID',
  `begin_sale_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手工单起始号',
  `end_sale_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手工单中止号',
  `modify_date` date NULL DEFAULT NULL COMMENT '修改日期',
  `sale_count` int(10) NOT NULL COMMENT '批次下手工单数量',
  `un_sale_count` int(10) NOT NULL COMMENT '批次下手工单未领数量',
  `verify_count` int(10) NOT NULL DEFAULT 0 COMMENT '已核销数量',
  `record_State` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  `modify_user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  PRIMARY KEY (`batch_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '手工单门店派发批次表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_mq_callback
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_mq_callback`;
CREATE TABLE `hw_pos_mq_callback`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `STORE_ID` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CUR_DATE` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `RULE_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_non_operating_income
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_non_operating_income`;
CREATE TABLE `hw_pos_non_operating_income`  (
  `NonOperatingIncomeID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '营业外收入ID',
  `IncomeDate` datetime(0) NOT NULL COMMENT '营业外收入日期',
  `StoreID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店ID',
  `PosID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收银机ID',
  `IncomeType` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '营业外收入类型',
  `IncomeMode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收款方式',
  `IncomeCur` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'CNY' COMMENT '收入币种',
  `IncomeAmt` decimal(10, 0) NOT NULL COMMENT '收入金额',
  `IsBalance` int(1) NULL DEFAULT 0 COMMENT '是否已日结:0-未日结;1-已日结',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`NonOperatingIncomeID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '营业外收入表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_operation_manager
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_operation_manager`;
CREATE TABLE `hw_pos_operation_manager`  (
  `operationId` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `idCard` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `virtualIdCard` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `regionName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `modifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `recordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`operationId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_order
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_order`;
CREATE TABLE `hw_pos_order`  (
  `OrderId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `StoreID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ModifyDate` timestamp(0) NULL DEFAULT NULL,
  UNIQUE INDEX `OrderId`(`OrderId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_param
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_param`;
CREATE TABLE `hw_pos_param`  (
  `PmID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参数ID',
  `PmName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数名',
  `PmValue` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数值',
  `PmType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数类型',
  `PmDesc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数描述',
  `PmAdd2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '附加1',
  `PmAdd3` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加2',
  `TagID` int(11) NULL DEFAULT 0 COMMENT 'Tagid',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`PmID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_pay_mode
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_pay_mode`;
CREATE TABLE `hw_pos_pay_mode`  (
  `PayModeID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式ID',
  `PayModeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式名称',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `RecordState` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`PayModeID`) USING BTREE,
  INDEX `idx_pay_model_name`(`PayModeName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付方式表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_period_sale
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_period_sale`;
CREATE TABLE `hw_pos_period_sale`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `STORE_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店ID',
  `CUR_DATE` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '当期时间',
  `SALE_AMT` decimal(18, 4) NULL DEFAULT NULL COMMENT '去年同期销售总额',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3726 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '当期对应的去年同期销售总额' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_point_log
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_point_log`;
CREATE TABLE `hw_pos_point_log`  (
  `PointLogID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '流水ID',
  `CustID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员ID',
  `UserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `StoreID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店ID',
  `FuncID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能ID',
  `BizDate` datetime(0) NULL DEFAULT NULL COMMENT '交易日期',
  `AddPoint` int(10) NULL DEFAULT NULL COMMENT '增加积分',
  `ReducePoint` int(10) NULL DEFAULT NULL COMMENT '扣除积分',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改日期',
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`PointLogID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分流水表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_point_subtract
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_point_subtract`;
CREATE TABLE `hw_pos_point_subtract`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `CUST_NO` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员号',
  `BILL_NO` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `RATE` decimal(14, 2) NULL DEFAULT 1.00 COMMENT '倍数',
  `UNIT_POINT` decimal(14, 2) NULL DEFAULT 1.00 COMMENT '积分单元',
  `FLG` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否已扣除',
  `PROMOTION_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '促销ID',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `idx_cust_no`(`CUST_NO`) USING BTREE,
  INDEX `idx_bill_no`(`BILL_NO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交易抵扣积分记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_price_city_reference
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_price_city_reference`;
CREATE TABLE `hw_pos_price_city_reference`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `warehouse_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大仓',
  `warehouse_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库名称',
  `source_city_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参考城市',
  `city_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市名称',
  `create_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `modify_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  `record_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_warehouse_id`(`warehouse_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新城市调价单参考表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_pricelimit
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_pricelimit`;
CREATE TABLE `hw_pos_pricelimit`  (
  `idno` int(11) NOT NULL AUTO_INCREMENT,
  `style_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `color_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`idno`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_print_template
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_print_template`;
CREATE TABLE `hw_pos_print_template`  (
  `template_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '序号',
  `template_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `template_file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板文件名称',
  `template_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板名称',
  `modify_date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`template_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小票机打印模板' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_promotion
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_promotion`;
CREATE TABLE `hw_pos_promotion`  (
  `PromotionID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '促销ID',
  `StartDate` date NOT NULL COMMENT '开始日期',
  `ExpireDate` date NOT NULL COMMENT '失效日期',
  `StartTime` time(0) NULL DEFAULT NULL COMMENT '开始时间',
  `ExpireTime` time(0) NULL DEFAULT NULL COMMENT '失效时间',
  `PromotionCondition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '促销条件',
  `PromotionAction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '促销动作',
  `PromotionName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '促销名称',
  `PromotionDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '促销描述',
  `BaseConditionType` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '基本条件类型',
  `BaseActionType` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '基本内容类型',
  `CalendarType` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生效日历类型',
  `CalendarValue` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生效日历内容',
  `Priority` int(10) NULL DEFAULT 1 COMMENT '优先级',
  `SharePromotionFlag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可以与其他促销共用的标志',
  `AdditionalPromotionFlag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '折上折的标志',
  `CreateUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  `prePromotionId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '前促销ID',
  PRIMARY KEY (`PromotionID`) USING BTREE,
  INDEX `idx_modifydate`(`ModifyDate`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '促销表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_promotion_attribute
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_promotion_attribute`;
CREATE TABLE `hw_pos_promotion_attribute`  (
  `PromotionAttributeID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '促销商品属性ID',
  `PromotionID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '促销ID',
  `Code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'CODE',
  `Name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `Type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型 2，性别 3，年份 4，季节',
  `IsGiveGoods` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否赠送商品 1，促销商品 2，赠送商品',
  `isExcludeGoods` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否是排除本sku 1，否 2，是',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`PromotionAttributeID`) USING BTREE,
  INDEX `inx_promotionId`(`PromotionID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '促销商品属性表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_promotion_coupon
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_promotion_coupon`;
CREATE TABLE `hw_pos_promotion_coupon`  (
  `PromotionCouponID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '促销指定优惠券ID',
  `CouponID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券ID',
  `PromotionID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '促销ID',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`PromotionCouponID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '促销指定优惠券表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_promotion_customer
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_promotion_customer`;
CREATE TABLE `hw_pos_promotion_customer`  (
  `PromotionCustomerID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '促销客户ID',
  `CustomerExpr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户表达式，用于记录目标客户群的特征',
  `PromotionID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '促销ID',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`PromotionCustomerID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '促销涉及客户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_promotion_exclude_item
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_promotion_exclude_item`;
CREATE TABLE `hw_pos_promotion_exclude_item`  (
  `PromotionExcludeItemID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '促销涉及商品ID',
  `PromotionID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '促销ID',
  `SkuId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SKU的ID，款色码',
  `BigTypeId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大分类ID',
  `MiddleTypeId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中分类ID',
  `SmallTypeId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小分类ID',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`PromotionExcludeItemID`) USING BTREE,
  INDEX `idx_PromotionID`(`PromotionID`) USING BTREE,
  INDEX `idx_skuid`(`SkuId`) USING BTREE,
  INDEX `idx_typeid`(`BigTypeId`, `MiddleTypeId`, `SmallTypeId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '促销涉及商品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_promotion_gift
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_promotion_gift`;
CREATE TABLE `hw_pos_promotion_gift`  (
  `PromotionGiftID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '促销指定礼品ID',
  `GiftID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '礼品ID,被赠送的商品skuID',
  `bigTypeCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大类',
  `middleTypeCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中类',
  `smallTypeCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小类',
  `giveCount` int(255) NULL DEFAULT NULL COMMENT '赠送数量',
  `PromotionID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '促销ID',
  `level` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '预留字段',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`PromotionGiftID`) USING BTREE,
  INDEX `inx_promotionId`(`PromotionID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '促销指定礼品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_promotion_item
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_promotion_item`;
CREATE TABLE `hw_pos_promotion_item`  (
  `PromotionItemID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '促销涉及商品ID',
  `BigTypeId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大分类ID',
  `MiddleTypeId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中分类ID',
  `SmallTypeId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小分类ID',
  `SkuId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SKU的ID，款色码',
  `ReturnFlag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '退货标志',
  `ChangeFlag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '换货标志',
  `minQuantity` int(255) NULL DEFAULT NULL COMMENT '数量的最小值',
  `maxQuantity` int(255) NULL DEFAULT NULL COMMENT '数量的最大值',
  `PromotionID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '促销ID',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`PromotionItemID`) USING BTREE,
  INDEX `idx_PromotionID`(`PromotionID`) USING BTREE,
  INDEX `idx_skuid`(`SkuId`) USING BTREE,
  INDEX `idx_typeid`(`BigTypeId`, `MiddleTypeId`, `SmallTypeId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '促销涉及商品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_promotion_relation
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_promotion_relation`;
CREATE TABLE `hw_pos_promotion_relation`  (
  `PromotionID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '促销ID',
  `OtherPromotionID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '另一个促销ID',
  `RelationType` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '促销关系',
  `Priority` int(255) NULL DEFAULT NULL,
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`PromotionID`, `OtherPromotionID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '促销关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_promotion_store
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_promotion_store`;
CREATE TABLE `hw_pos_promotion_store`  (
  `promotionStoreId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '促销门店ID',
  `regionId` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域ID',
  `cityId` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市ID',
  `districtId` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城区ID',
  `storeId` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店ID',
  `promotionId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '促销ID',
  `modifyUserId` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  `recordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`promotionStoreId`) USING BTREE,
  INDEX `idx_promotionId`(`promotionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '促销涉及门店表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_promotion_store_temp
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_promotion_store_temp`;
CREATE TABLE `hw_pos_promotion_store_temp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `promotionId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '促销ID',
  `regionId` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域ID',
  `cityId` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市ID',
  `storeId` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店ID',
  `specialArea` tinyint(1) NULL DEFAULT 0 COMMENT '特卖区域，0 普通店 1 特卖店',
  `modifyUserId` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  `recordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_promotionId`(`promotionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '促销导入门店' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_promotion_type
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_promotion_type`;
CREATE TABLE `hw_pos_promotion_type`  (
  `PromotionTypeID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '促销typeID',
  `TypeExpr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '促销类型，是否新店促销，促销有排他性',
  `PromotionID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '促销ID',
  `ModifyDate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`PromotionTypeID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '促销类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_region_repurchaserate
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_region_repurchaserate`;
CREATE TABLE `hw_pos_region_repurchaserate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `regionId` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域ID',
  `statisticsDate` datetime(0) NOT NULL COMMENT '统计时间',
  `vipCount` decimal(12, 0) NULL DEFAULT NULL COMMENT 'VIP人数',
  `saleSkuCount` decimal(12, 0) NULL DEFAULT NULL COMMENT '销售总数量',
  `saleBillCount` decimal(12, 0) NULL DEFAULT NULL COMMENT '销售小票数',
  `vipBillNoCount` decimal(12, 0) NULL DEFAULT NULL COMMENT 'VIP小票数',
  `associatedPurchaseRate` decimal(10, 2) NULL DEFAULT NULL COMMENT '连带率',
  `rePurchaseVipCount` decimal(12, 0) NULL DEFAULT NULL COMMENT '复购人数',
  `rePurchaseBillCount` decimal(12, 0) NULL DEFAULT NULL COMMENT '复购单数',
  `repurchaseRate` decimal(10, 2) NULL DEFAULT NULL COMMENT '复购率',
  `Add1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加1',
  `Add2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加2',
  `Add3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加3',
  `CreateMan` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_statisticsDate`(`statisticsDate`) USING BTREE,
  INDEX `idx_regionId`(`regionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '区域复购率统计表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_return_dtl
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_return_dtl`;
CREATE TABLE `hw_pos_return_dtl`  (
  `ID` int(11) NOT NULL DEFAULT 0,
  `REASON_ID` int(11) NOT NULL,
  `BILL_NO` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '小票号',
  `SKU` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SKU',
  `QRY` int(5) NULL DEFAULT 1 COMMENT '数量',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '退货销售员',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`, `BILL_NO`) USING BTREE,
  INDEX `idx_billno`(`BILL_NO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退货明细' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_return_reason
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_return_reason`;
CREATE TABLE `hw_pos_return_reason`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BIG_TYPE_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大类CODE',
  `BIG_TYPE_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大类名称',
  `REASON` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '退货原因',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退货原因' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_revolving_amt
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_revolving_amt`;
CREATE TABLE `hw_pos_revolving_amt`  (
  `revolving_amt_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备用金ID',
  `last_revolving_amt_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改前备用金ID',
  `pos_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收银电脑ID',
  `store_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店ID',
  `revolving_cur` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'CNY' COMMENT '备用金币种',
  `revolving_amt` decimal(10, 2) NOT NULL COMMENT '备用金金额',
  `modify_user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `modify_date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `record_state` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`revolving_amt_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '备用金表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_salbalance
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_salbalance`;
CREATE TABLE `hw_pos_salbalance`  (
  `SysID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `BillNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `BillDate` datetime(0) NULL DEFAULT NULL COMMENT '结算日期',
  `StoreID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店ID',
  `TillID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机器号',
  `PayID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付类型',
  `PosID` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财务jde 设置PosID',
  `Amount` decimal(12, 4) NULL DEFAULT NULL COMMENT '结算金额',
  `Extamount` decimal(12, 4) NULL DEFAULT NULL COMMENT '外卡金额',
  `IsUp` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '上传标志',
  `IsBalance` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '结算标志',
  `BalacneDate` datetime(0) NULL DEFAULT NULL COMMENT '结算日期',
  `IsUpdatetime` datetime(0) NULL DEFAULT NULL COMMENT '上传日期',
  `Add1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加1',
  `Add2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加2',
  `Add3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加3',
  `Add4` decimal(12, 4) NULL DEFAULT NULL COMMENT '附加4',
  `Add5` datetime(0) NULL DEFAULT NULL COMMENT '附加5',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`SysID`) USING BTREE,
  UNIQUE INDEX `key_index`(`BillNo`, `PayID`, `PosID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35855 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '结算表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_sale_invoice_out
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_sale_invoice_out`;
CREATE TABLE `hw_pos_sale_invoice_out`  (
  `BILL_NO` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '-1' COMMENT '小票号',
  `INVOICE_STATUS` bit(1) NULL DEFAULT NULL COMMENT '电子发票状态',
  `TRY` int(5) NULL DEFAULT 0 COMMENT '尝试次数',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `SUCCESS_DATE` datetime(0) NULL DEFAULT NULL COMMENT '响应成功日期',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`BILL_NO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'POS发送到电子发票记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_sale_kingdee
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_sale_kingdee`;
CREATE TABLE `hw_pos_sale_kingdee`  (
  `KINGDEE_BILL_NO` int(11) NOT NULL AUTO_INCREMENT,
  `BILL_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售单号',
  `STORE_NO` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店编码',
  `SALE_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传给金蝶的销售单号',
  `BILL_TYPE` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售类型:0-销售;1-退货;',
  `DATA_CENTER_NO` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据中心:1-数据中心1;2-数据中心2;',
  `PURCHASE_ORG_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购组织',
  `BILL_DETAIL_NUM` int(11) NULL DEFAULT NULL COMMENT '销售明细数量',
  `TRANSFER_DATA` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '传输数据',
  `RESULT_STATUS` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传输状态:0-失败;1-成功;2-明细数量为0;',
  `RESULT_INFO` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '返回信息',
  `CHANGE_TRANSFER_DATA` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '传输数据',
  `CHANGE_RESULT_STATUS` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更传输状态:0-失败;1-成功;2-明细数量为0;',
  `CHANGE_RESULT_INFO` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '变更返回信息',
  `IS_ADD_SUCCESS` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新增是否上传成功:Y-成功;N-失败;',
  `CHANGE_PAY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '支付方式变更的时间',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `RECORD_STATE` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态:Y-有效;N-无效;',
  PRIMARY KEY (`KINGDEE_BILL_NO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 282 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_sale_pay_change_stock_out
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_sale_pay_change_stock_out`;
CREATE TABLE `hw_pos_sale_pay_change_stock_out`  (
  `BILL_NO` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '-1' COMMENT '小票号',
  `STOCK_STATUS` bit(1) NULL DEFAULT NULL COMMENT '库存中心状态',
  `TRY` int(5) NULL DEFAULT 0 COMMENT '尝试次数',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `SUCCESS_DATE` datetime(0) NULL DEFAULT NULL COMMENT '响应成功日期',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`BILL_NO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'POS支付更正发送到库存中心' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_sale_stock_out
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_sale_stock_out`;
CREATE TABLE `hw_pos_sale_stock_out`  (
  `BILL_NO` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '-1' COMMENT '小票号',
  `STOCK_STATUS` bit(1) NULL DEFAULT NULL COMMENT '库存中心状态',
  `TRY` int(5) NULL DEFAULT 0 COMMENT '尝试次数',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `SUCCESS_DATE` datetime(0) NULL DEFAULT NULL COMMENT '响应成功日期',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`BILL_NO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'POS发送到库存中心' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_salorderbalance_drp
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_salorderbalance_drp`;
CREATE TABLE `hw_pos_salorderbalance_drp`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `storeId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店编号',
  `posId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店POS机器号',
  `billNo` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'drp日结单号',
  `billDate` datetime(0) NOT NULL COMMENT '日结日期',
  `orderNum` int(11) NOT NULL COMMENT '订单数量',
  `mstQry` decimal(18, 4) NOT NULL COMMENT '主表中的商品数量',
  `mstAmount` decimal(18, 4) NOT NULL COMMENT '主表明细中的金额',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `isDrp` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '0待处理,1处理成功，2处理失败，3',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dtlQry` decimal(18, 4) NULL COMMENT '商品明细表中的数量',
  `payAmount` decimal(18, 4) NULL COMMENT '支付表中的金额',
  `dtlAmount` decimal(18, 4) NULL COMMENT '商品明细表中的金额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key_posId_billNo`(`posId`, `billNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2482 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单数据日结后销售数据传递到DRP系统' ROW_FORMAT = Compact;

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
-- Table structure for hw_pos_salposdiscount
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_salposdiscount`;
CREATE TABLE `hw_pos_salposdiscount`  (
  `BillNO` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品订单编号',
  `Discount` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '折扣编号',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CreateUserID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyUserID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售表-订单折扣使用表(每个订单可使用多种折扣)' ROW_FORMAT = Compact;

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
-- Table structure for hw_pos_salposdtl_1
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_salposdtl_1`;
CREATE TABLE `hw_pos_salposdtl_1`  (
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
  `add4` decimal(18, 4) NULL COMMENT '买单时商品标价（有调价则显示调价）',
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
  INDEX `idx_barCode`(`BarCode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 699977 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售表-商品明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_salposdtlactivity
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_salposdtlactivity`;
CREATE TABLE `hw_pos_salposdtlactivity`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `BillNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `SKUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品条码',
  `ActiviceCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '活动编码',
  `ActiviceName` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '活动名称',
  `Qry` int(11) NOT NULL DEFAULT 0 COMMENT '数量',
  `Amount` decimal(18, 4) NOT NULL COMMENT '金额',
  `Price` decimal(18, 4) NULL COMMENT '销售的单价',
  `RefPrice` decimal(18, 4) NULL COMMENT '吊牌价',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `u_index`(`BillNo`, `SKUID`, `ActiviceCode`, `Qry`, `Amount`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 546775 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售表-订单商品参与活动表(每个订单中 每个商品 参与的活动)' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_salposdtlactivity_report
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_salposdtlactivity_report`;
CREATE TABLE `hw_pos_salposdtlactivity_report`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `BillNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `SKUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品条码',
  `ActiviceCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '活动编码',
  `ActiviceName` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '活动名称',
  `Qry` int(11) NOT NULL DEFAULT 0 COMMENT '数量',
  `Amount` decimal(18, 4) NOT NULL COMMENT '金额',
  `Price` decimal(18, 4) NULL COMMENT '销售的单价',
  `RefPrice` decimal(18, 4) NULL COMMENT '吊牌价',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `u_index`(`BillNo`, `SKUID`, `ActiviceCode`, `Qry`, `Amount`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1197 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售表-订单商品参与活动表(每个订单中 每个商品 参与的活动)' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_salposmst
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
-- Table structure for hw_pos_salposmst_1
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_salposmst_1`;
CREATE TABLE `hw_pos_salposmst_1`  (
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
  INDEX `nd_idx`(`mqDate`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售表-主表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_salpospay
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_salpospay`;
CREATE TABLE `hw_pos_salpospay`  (
  `SID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `StoreID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店ID',
  `BillNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '小票号',
  `TillID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '机器号',
  `PosID` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'PosID',
  `PayID` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付类型',
  `PayChannel` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PayMoney` decimal(18, 4) NULL COMMENT '支付金额',
  `AlPayAmount` decimal(18, 4) NULL COMMENT '支付宝优惠金额',
  `PayState` bit(1) NULL DEFAULT b'1',
  `VipID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员ID',
  `IsUp` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否上传',
  `CreateUserID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建记录人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`SID`) USING BTREE,
  INDEX `BillNo`(`BillNo`) USING BTREE,
  INDEX `indx_payid`(`PayID`) USING BTREE,
  INDEX `idx_CreateDate`(`CreateDate`) USING BTREE,
  INDEX `idx_StoreID`(`StoreID`) USING BTREE,
  INDEX `idx_mddate`(`ModifyDate`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售表-支付明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_salpospay_1
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_salpospay_1`;
CREATE TABLE `hw_pos_salpospay_1`  (
  `SID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `StoreID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店ID',
  `BillNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '小票号',
  `TillID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '机器号',
  `PosID` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'PosID',
  `PayID` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付类型',
  `PayChannel` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PayMoney` decimal(18, 4) NULL COMMENT '支付金额',
  `AlPayAmount` decimal(18, 4) NULL COMMENT '支付宝优惠金额',
  `PayState` bit(1) NULL DEFAULT b'1',
  `VipID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员ID',
  `IsUp` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否上传',
  `CreateUserID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建记录人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`SID`) USING BTREE,
  INDEX `BillNo`(`BillNo`) USING BTREE,
  INDEX `indx_payid`(`PayID`) USING BTREE,
  INDEX `idx_CreateDate`(`CreateDate`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售表-支付明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_salpospay_kq
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_salpospay_kq`;
CREATE TABLE `hw_pos_salpospay_kq`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BillNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `TransType` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '交易类型',
  `ResponseCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易返回代码',
  `CardID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略卡号',
  `CardType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡类型',
  `SysReference` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统参考号',
  `TransTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易时间',
  `Amount` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易金额	（以分为单位，不够12位左补0）',
  `trace` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易凭证号',
  `authcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易授权号',
  `Teminal_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '终端号',
  `Errorinfo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `Remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `POSID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OperatorID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OrderID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SendRemark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SendAmount` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Old_trace` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原交易凭证号',
  `Old_DateTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原交易日期时间（月月日日时时分分秒秒）	 ',
  `Old_authcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原交易授权号	 ',
  `Old_Refno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原交易参考号	',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RecordState` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7535 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_salpospay_log
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_salpospay_log`;
CREATE TABLE `hw_pos_salpospay_log`  (
  `SID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `StoreID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店ID',
  `BillNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '小票号',
  `TillID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '机器号',
  `PosID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'PosID',
  `PayID` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '支付类型',
  `PayChannel` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PayMoney` decimal(18, 4) NULL COMMENT '支付金额',
  `AlPayAmount` decimal(18, 4) NULL DEFAULT NULL COMMENT '支付宝优惠金额',
  `Detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '支付请求参数',
  `PayState` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '2' COMMENT '0支付失败，1代表支付成功，2代表未支付',
  `VipID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员ID',
  `IsUp` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否上传',
  `CreateUserID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建记录人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  INDEX `BillNo`(`BillNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售表-支付明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_salpospay_return
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_salpospay_return`;
CREATE TABLE `hw_pos_salpospay_return`  (
  `autoid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `ID` int(11) NULL DEFAULT NULL COMMENT '门店的自增长id',
  `BILL_NO` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '当前单小票号',
  `ORIG_BILL_NO` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退单的小票号',
  `RETURN_BILL_NO` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退钱的小票号',
  `START_BILL_NO` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原始买单小票号',
  `AMOUNT` decimal(18, 4) NULL COMMENT '订单金额',
  `PAY_MODE_ID` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '创建人',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`autoid`) USING BTREE,
  UNIQUE INDEX `idx_union_unique`(`ID`, `BILL_NO`) USING BTREE,
  INDEX `idx_bill_no`(`BILL_NO`) USING BTREE,
  INDEX `idx_start_bill_no`(`START_BILL_NO`) USING BTREE,
  INDEX `idx_original_bill_no`(`ORIG_BILL_NO`) USING BTREE,
  INDEX `idx_return_bill_no`(`RETURN_BILL_NO`) USING BTREE,
  INDEX `idx_union`(`RETURN_BILL_NO`, `PAY_MODE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 550 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售表-退单关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_salpospay_return2
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_salpospay_return2`;
CREATE TABLE `hw_pos_salpospay_return2`  (
  `autoid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `ID` int(11) NULL DEFAULT NULL COMMENT '门店的自增长id',
  `BILL_NO` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '当前单小票号',
  `ORIG_BILL_NO` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退单的小票号',
  `RETURN_BILL_NO` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退钱的小票号',
  `START_BILL_NO` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原始买单小票号',
  `AMOUNT` decimal(18, 4) NULL COMMENT '订单金额',
  `PAY_MODE_ID` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '创建人',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`autoid`) USING BTREE,
  UNIQUE INDEX `idx_union_unique`(`ID`, `BILL_NO`) USING BTREE,
  INDEX `idx_bill_no`(`BILL_NO`) USING BTREE,
  INDEX `idx_start_bill_no`(`START_BILL_NO`) USING BTREE,
  INDEX `idx_original_bill_no`(`ORIG_BILL_NO`) USING BTREE,
  INDEX `idx_return_bill_no`(`RETURN_BILL_NO`) USING BTREE,
  INDEX `idx_union`(`RETURN_BILL_NO`, `PAY_MODE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37203 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售表-退单关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_salpospay_sd
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_salpospay_sd`;
CREATE TABLE `hw_pos_salpospay_sd`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BillNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `TransType` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '交易类型',
  `ResponseCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易返回代码',
  `CardID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略卡号',
  `CardType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡类型',
  `SysReference` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统参考号',
  `TransTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易时间',
  `Amount` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易金额	（以分为单位，不够12位左补0）',
  `trace` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易凭证号',
  `authcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易授权号',
  `Teminal_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '终端号',
  `Errorinfo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `Remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `POSID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OperatorID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OrderID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SendRemark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SendAmount` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Old_trace` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原交易凭证号',
  `Old_DateTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原交易日期时间（月月日日时时分分秒秒）	 ',
  `Old_authcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原交易授权号	 ',
  `Old_Refno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原交易参考号	',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RecordState` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y',
  `TransDate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BackDate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BatchNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_salpospaychange
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_salpospaychange`;
CREATE TABLE `hw_pos_salpospaychange`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `BillNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `Amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `BeforeChange` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更改前信息',
  `AfterChange` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更改后信息',
  `CreateUserName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RecordState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `idx_bill_no`(`BillNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27706 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_saving
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_saving`;
CREATE TABLE `hw_pos_saving`  (
  `SavingID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '每日记账现金ID',
  `SavingCur` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'CNY' COMMENT '存入金额币种',
  `SavingAmt` decimal(18, 3) NOT NULL COMMENT '存入金额',
  `SavingDate` date NULL DEFAULT NULL COMMENT '存入日期',
  `SavingTime` time(0) NULL DEFAULT NULL COMMENT '存入时间',
  `StoreID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店ID',
  `PosID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收银机ID',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`SavingID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '每日记账现金表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_second_screen_template
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_second_screen_template`;
CREATE TABLE `hw_pos_second_screen_template`  (
  `TEMPLATE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板ID',
  `TEMPLATE_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板名称',
  `TEMPLATE_TYPE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板类型:1;2',
  `DISPATCH_DATE` datetime(0) NULL DEFAULT NULL COMMENT '下派时间',
  `SETTING_STATUS` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '第二屏生效状态',
  `FILE_PATH` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `IMAGE_NAMES` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '展示的图片名称集合',
  `VIDEO_TYPE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '播放类型:1-视频 2-图片',
  `VIDEO_NAME` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '展示的视频名称',
  `VIDEO_IMAGE_NAME` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '展示的视频选择的图片名称',
  `VIP_QRCODE_PATH` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员二维码路径',
  `IMAGE_CHANGE_INTERVAL` int(11) NULL DEFAULT 100 COMMENT '广告图片切换的时长(秒)',
  `IMAGE_PLAY_TYPE` int(11) NULL DEFAULT 1 COMMENT '图片播放频率，1 循环播放',
  `VIDEO_PLAY_TYPE` int(11) NOT NULL DEFAULT 1 COMMENT '视频播放频率，1 循环播放',
  `WELCOME_CONTENT` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '欢迎词',
  `ECOMMEND` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告',
  `MODIFY_TYPE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改类型:0-不修改 1-修改图片,2-修改视频,3都修改',
  `BEGIN_DATE` datetime(0) NULL DEFAULT NULL,
  `END_DATE` datetime(0) NULL DEFAULT NULL,
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`TEMPLATE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '第二屏模板表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_shift
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_shift`;
CREATE TABLE `hw_pos_shift`  (
  `ShiftID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收银员交接班ID',
  `BusinessDate` date NOT NULL COMMENT '营业日期',
  `UserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收银员ID',
  `LoginTime` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  `ExitTime` datetime(0) NULL DEFAULT NULL COMMENT '注销时间',
  `AllCashAmt` decimal(10, 0) NULL DEFAULT NULL COMMENT '现金总数',
  `RevolvingAmt` decimal(10, 0) NULL DEFAULT NULL COMMENT '备用金',
  `SavingAmt` decimal(10, 0) NULL DEFAULT NULL COMMENT '存入金额',
  `RemainingAmt` decimal(10, 0) NULL DEFAULT NULL COMMENT '剩余金额',
  `StoreID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店ID',
  `PosID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收银机ID',
  `LastShiftID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上个班次的ID',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改日期',
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ShiftID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收银员交接班表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_short_price_data
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_short_price_data`;
CREATE TABLE `hw_pos_short_price_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `price_id` int(11) NOT NULL COMMENT '调价id',
  `city_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `store_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店ID',
  `style_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '款号',
  `color_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `size_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺码',
  `price` decimal(18, 2) NULL DEFAULT NULL COMMENT '价格',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `modify_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  `record_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_store_style_index`(`store_id`, `style_id`, `color_id`) USING BTREE,
  INDEX `city_id`(`city_id`) USING BTREE,
  INDEX `orderbydate`(`modify_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 533 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '短期调价明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_short_price_dtl
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_short_price_dtl`;
CREATE TABLE `hw_pos_short_price_dtl`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `price_id` int(11) NOT NULL COMMENT '调价id',
  `city_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `store_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店ID',
  `style_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '款号',
  `color_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `size_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺码',
  `price` decimal(18, 2) NULL DEFAULT NULL COMMENT '价格',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  `record_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_store_style_index`(`store_id`, `style_id`, `color_id`) USING BTREE,
  INDEX `idx_price_id`(`price_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59447312 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '短期调价明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_short_price_dtl_back
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_short_price_dtl_back`;
CREATE TABLE `hw_pos_short_price_dtl_back`  (
  `id` int(11) NOT NULL COMMENT 'id',
  `price_id` int(11) NOT NULL,
  `city_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `store_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店ID',
  `style_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '款号',
  `color_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `size_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺码',
  `price` decimal(18, 2) NULL DEFAULT NULL COMMENT '价格',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `modify_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  `record_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_store_style_index`(`store_id`, `style_id`, `color_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '短期过期调价明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_short_price_mst
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_short_price_mst`;
CREATE TABLE `hw_pos_short_price_mst`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '调价单号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调价名称、标题',
  `start_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调价开始日期',
  `end_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调价结束日期',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调价内容',
  `create_user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  `modify_user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `record_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y' COMMENT '记录状态',
  `mds_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'mds状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_record_status`(`record_status`) USING BTREE,
  INDEX `idx_mds_status`(`mds_status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4763 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '短期调价表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_stocktake
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_stocktake`;
CREATE TABLE `hw_pos_stocktake`  (
  `stocktakeId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盘点编号',
  `storeId` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店ID',
  `regionId` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域ID',
  `planStocktakeDate` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '计划盘点日期',
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盘点类型 1，整盘 2，抽盘 3，按类型盘',
  `modifyUserId` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `modifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `recordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '盘点状态',
  PRIMARY KEY (`stocktakeId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品盘点表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_store_bank_account
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_store_bank_account`;
CREATE TABLE `hw_pos_store_bank_account`  (
  `StoreBankAccountID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店对应存入银行账号ID',
  `BankAccountId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店对应存入银行账号ID',
  `StartDate` datetime(0) NULL DEFAULT NULL COMMENT '银行账号的开始日期',
  `ExpireDate` datetime(0) NULL DEFAULT NULL COMMENT '银行账号的失效日期',
  `StoreID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店ID',
  `CreateDate` datetime(0) NOT NULL COMMENT '创建时间',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改日期',
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`StoreBankAccountID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店对应存入银行账号表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_store_city_area
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_store_city_area`;
CREATE TABLE `hw_pos_store_city_area`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `city_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市名称',
  `area_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域',
  `area_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域名称',
  `create_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `modify_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  `record_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 436 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店城市仓库关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_store_city_info
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_store_city_info`;
CREATE TABLE `hw_pos_store_city_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店ID',
  `store_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店名称',
  `city_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `city_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市名称',
  `area_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域',
  `area_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域名称',
  `warehouse_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库编码',
  `warehouse_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库名称',
  `new_store_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否新门店，营业50天内为新门店',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注，记录下什么时候转成非新门店',
  `create_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `modify_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  `record_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `store_unique`(`store_id`) USING BTREE,
  INDEX `cityid`(`city_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3881 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店仓库区域城市关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_store_city_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_store_city_warehouse`;
CREATE TABLE `hw_pos_store_city_warehouse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `city_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市名称',
  `warehouse_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域',
  `warehouse_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库名称',
  `create_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `modify_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  `record_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店城市仓库关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_store_discount
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_store_discount`;
CREATE TABLE `hw_pos_store_discount`  (
  `STORE_DISCOUNT_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商场折扣记录ID',
  `STORE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店ID',
  `STORE_DISCOUNT_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商场折扣名称',
  `STORE_DISCOUNT` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商场折扣额度',
  `STORE_DISCOUNT_RULE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '折扣规则:1-原价折扣;2-现价折扣(折上折);3-原价满减;4-现价满减',
  `VALID_BEGIN_TIME` datetime(0) NULL DEFAULT NULL COMMENT '有效开始时间',
  `VALID_END_TIME` datetime(0) NULL DEFAULT NULL COMMENT '有效结束时间',
  `SOURCE_TYPE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '折扣来源:0-OSS后台;1-企业微信',
  `CONDITION_MIN_NUM` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条件最小值',
  `CONDITION_MAX_NUM` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条件最大值',
  `BUSINESS_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务编号',
  `APPROVAL_STEP` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批阶段:discountApply-区域申请;discountApproval1-营销部审批;discountApproval2-商品部审批',
  `APPROVAL_STATE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批状态',
  `APPROVAL_USER_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批人员',
  `APPROVAL_DATE` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `APPLY_REASON` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请理由',
  `REMARK` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批1备注',
  `REMARK2` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批2备注',
  `SHARE_PROMOTION_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可以与其他促销共享',
  `ADDITIONAL_PROMOTION_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '折上折',
  `REPEAT_FLG` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可以重复生效;Y-可以,N-不可以',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `MODIFY_TIME` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`STORE_DISCOUNT_ID`) USING BTREE,
  INDEX `IDX_STORE_ID`(`STORE_ID`) USING BTREE,
  INDEX `idx_business_id`(`BUSINESS_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商场折扣记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_store_maintain
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_store_maintain`;
CREATE TABLE `hw_pos_store_maintain`  (
  `MAINTAIN_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '维修单号',
  `MOBILE` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `CUST_NO` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员编号',
  `CUST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员姓氏',
  `SEX` int(3) NULL DEFAULT NULL COMMENT '性别:0-男,1-女',
  `STYLE_ID` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品款号ID(不包含颜色尺码)',
  `MAINTAIN_TYPE` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维修品类:1鞋,2服,4包,3配,7其他',
  `REASON` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维修原因:鞋,服,包,配,其他',
  `REASON_DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维修原因详情(维修原因为其他时填写)',
  `ARRIVAL_DATE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预计到货时间',
  `MAINTAIN_STATE` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '维修状态:1-申请,2-送修,3-到货,4-取回',
  `STORE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店Id',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `SEND_DATE` datetime(0) NULL DEFAULT NULL COMMENT '送修时间',
  `DELIVERY_DATE` datetime(0) NULL DEFAULT NULL COMMENT '交货时间',
  `BACK_DATE` datetime(0) NULL DEFAULT NULL COMMENT '取回时间',
  `MODIFY_USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者ID',
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`MAINTAIN_ID`, `MAINTAIN_STATE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_store_omnichannel
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_store_omnichannel`;
CREATE TABLE `hw_pos_store_omnichannel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `STORE_OMNICHANNEL_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '仓库上线ID',
  `WAREHOUSE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '仓库代码',
  `STORE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '门店编号',
  `ONLINE_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '上线状态:Y-上线;N-不上线',
  `ONLINE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '上线时间',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` datetime(0) NULL DEFAULT NULL COMMENT '最后一次修改时间',
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'Y' COMMENT '记录状态:Y-有效;N-无效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_warehouse_id`(`WAREHOUSE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '仓库上线全渠道时间' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_store_omnichannel_except_sku
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_store_omnichannel_except_sku`;
CREATE TABLE `hw_pos_store_omnichannel_except_sku`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `SKU_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SKU',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` datetime(0) NULL DEFAULT NULL COMMENT '最后一次修改时间',
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态:Y-有效;N-无效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sku_id`(`SKU_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '非全渠道sku' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_store_omnichannel_req_log
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_store_omnichannel_req_log`;
CREATE TABLE `hw_pos_store_omnichannel_req_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LOG_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日志ID',
  `STORE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店ID',
  `SKU_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `MODIFY_USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_store_id`(`STORE_ID`) USING BTREE,
  INDEX `idx_sku_id`(`SKU_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8514 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全渠道库存查询请求日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_store_omnichannel_rsp_log
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_store_omnichannel_rsp_log`;
CREATE TABLE `hw_pos_store_omnichannel_rsp_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LOG_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日志ID',
  `STORE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店ID',
  `SKU_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku',
  `STOCK_NUM` int(11) NULL DEFAULT NULL COMMENT '库存量',
  `RSP_CODE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '返回结果:-2-登录失效;-1-异常;0-失败;1-成功;',
  `RSP_MSG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '返回信息',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `MODIFY_USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_store_id`(`STORE_ID`) USING BTREE,
  INDEX `idx_sku_id`(`SKU_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8450 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全渠道库存查询响应日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_store_pay_mode
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_store_pay_mode`;
CREATE TABLE `hw_pos_store_pay_mode`  (
  `StorePayModeID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店支付方式ID',
  `PayModeID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式ID',
  `PayChannel` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付渠道',
  `StoreID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店ID',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  `posID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Pos 编号',
  PRIMARY KEY (`StorePayModeID`) USING BTREE,
  INDEX `idx_PayModeId`(`PayModeID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店支付方式表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_store_price_result
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_store_price_result`;
CREATE TABLE `hw_pos_store_price_result`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price_id` int(11) NOT NULL,
  `store_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店ID',
  `style_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '款号',
  `color_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `size_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺码',
  `price` decimal(18, 2) NULL DEFAULT NULL COMMENT '价格',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '1 长期调价；2 短期调价',
  `effect_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '生效日期',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改日期',
  `record_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `modifydate`(`modify_date`) USING BTREE,
  INDEX `price`(`price_id`) USING BTREE,
  INDEX `shop_id`(`store_id`) USING BTREE,
  INDEX `effect_date`(`effect_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店生效调价最终结果表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_store_repurchaserate
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_store_repurchaserate`;
CREATE TABLE `hw_pos_store_repurchaserate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storeId` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店ID',
  `statisticsDate` datetime(0) NOT NULL COMMENT '统计时间',
  `vipCount` decimal(12, 0) NULL DEFAULT NULL COMMENT 'VIP人数',
  `saleSkuCount` decimal(12, 0) NULL DEFAULT NULL COMMENT '销售总数量',
  `saleBillCount` decimal(12, 0) NULL DEFAULT NULL COMMENT '销售小票数',
  `vipBillNoCount` decimal(12, 0) NULL DEFAULT NULL COMMENT 'VIP小票数',
  `associatedPurchaseRate` decimal(10, 2) NULL DEFAULT NULL COMMENT '连带率',
  `rePurchaseVipCount` decimal(12, 0) NULL DEFAULT NULL COMMENT '复购人数',
  `rePurchaseBillCount` decimal(12, 0) NULL DEFAULT NULL COMMENT '复购单数',
  `repurchaseRate` decimal(10, 2) NULL DEFAULT NULL COMMENT '复购率',
  `Add1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加1',
  `Add2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加2',
  `Add3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加3',
  `CreateMan` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_statisticsDate`(`statisticsDate`) USING BTREE,
  INDEX `idx_storeID`(`storeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店复购率统计表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_store_second_screen_template
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_store_second_screen_template`;
CREATE TABLE `hw_pos_store_second_screen_template`  (
  `STORE_SECOND_SCREEN_TEMPLATE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店与第二屏模板关系ID',
  `TEMPLATE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板ID',
  `REGION_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域ID',
  `CITY_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市ID',
  `DISTRICT_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城区ID',
  `STORE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店ID',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`STORE_SECOND_SCREEN_TEMPLATE_ID`) USING BTREE,
  INDEX `IDX_TEMPLATE_ID`(`TEMPLATE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店与第二屏模板关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_tag
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_tag`;
CREATE TABLE `hw_pos_tag`  (
  `TAG_ID` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签ID',
  `TAG_CODE` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签编号',
  `TAG_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名称',
  `CREATE_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`TAG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_up_log
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_up_log`;
CREATE TABLE `hw_pos_up_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `bill_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号且唯一',
  `flag` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '标记位',
  `uptime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '插入时间',
  `modify_date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uidx_BillNo`(`bill_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5329 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商场上传数据日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_user
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_user`;
CREATE TABLE `hw_pos_user`  (
  `USER_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `STORE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `GROUP_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ROLE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USER_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `USER_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店ID',
  `LOGIN_NAME` char(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录帐号',
  `USER_PWD` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改者',
  `MOBILE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `CREATE_DATE` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '记录状态',
  `MODIFY_USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MODIFY_DATE` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `RECORD_STATE` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y',
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_user_limit
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_user_limit`;
CREATE TABLE `hw_pos_user_limit`  (
  `LimitID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内购额度ID',
  `idCard` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Year` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '当前年份',
  `Season` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '季节',
  `RemainDisc6` decimal(10, 2) NULL COMMENT '6折剩余额度',
  `TotalDisc6` decimal(10, 2) NULL COMMENT '6折总额度',
  `RemainDisc7` decimal(10, 2) NULL COMMENT '7折剩余额度',
  `TotalDisc7` decimal(10, 2) NULL COMMENT '7折总额度',
  `RemainDisc8` decimal(10, 2) NULL DEFAULT NULL,
  `TotalDisc8` decimal(10, 2) NULL DEFAULT NULL,
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`LimitID`) USING BTREE,
  INDEX `idx_year`(`Year`, `Season`) USING BTREE,
  INDEX `ide_idcard`(`idCard`, `Year`, `Season`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户内购额度表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_user_limit_20200421
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_user_limit_20200421`;
CREATE TABLE `hw_pos_user_limit_20200421`  (
  `LimitID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内购额度ID',
  `idCard` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Year` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '当前年份',
  `Season` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '季节',
  `RemainDisc6` decimal(10, 2) NULL COMMENT '6折剩余额度',
  `TotalDisc6` decimal(10, 2) NULL COMMENT '6折总额度',
  `RemainDisc7` decimal(10, 2) NULL COMMENT '7折剩余额度',
  `TotalDisc7` decimal(10, 2) NULL COMMENT '7折总额度',
  `RemainDisc8` decimal(10, 2) NULL DEFAULT NULL,
  `TotalDisc8` decimal(10, 2) NULL DEFAULT NULL,
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`LimitID`) USING BTREE,
  INDEX `idx_year`(`Year`, `Season`) USING BTREE,
  INDEX `ide_idcard`(`idCard`, `Year`, `Season`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户内购额度表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_user_limit_20200422
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_user_limit_20200422`;
CREATE TABLE `hw_pos_user_limit_20200422`  (
  `LimitID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内购额度ID',
  `idCard` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Year` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '当前年份',
  `Season` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '季节',
  `RemainDisc6` decimal(10, 2) NULL COMMENT '6折剩余额度',
  `TotalDisc6` decimal(10, 2) NULL COMMENT '6折总额度',
  `RemainDisc7` decimal(10, 2) NULL COMMENT '7折剩余额度',
  `TotalDisc7` decimal(10, 2) NULL COMMENT '7折总额度',
  `RemainDisc8` decimal(10, 2) NULL DEFAULT NULL,
  `TotalDisc8` decimal(10, 2) NULL DEFAULT NULL,
  `ModifyUserID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RecordState` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`LimitID`) USING BTREE,
  INDEX `idx_year`(`Year`, `Season`) USING BTREE,
  INDEX `ide_idcard`(`idCard`, `Year`, `Season`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户内购额度表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_user_limit_bill
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_user_limit_bill`;
CREATE TABLE `hw_pos_user_limit_bill`  (
  `limit_bill_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内购与订单映射ID',
  `bill_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `idCard` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_disc6` decimal(20, 2) NULL DEFAULT NULL COMMENT '内购被当前订单扣减的6折额度',
  `bill_disc7` decimal(20, 2) NULL DEFAULT NULL COMMENT '内购被当前订单扣减的7折额度',
  `modify_user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改日期',
  `record_state` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  `bill_disc8` decimal(20, 2) NULL DEFAULT NULL COMMENT '内购被当前订单扣减的8折额度',
  PRIMARY KEY (`limit_bill_id`) USING BTREE,
  INDEX `inx_bill_no`(`bill_no`) USING BTREE,
  INDEX `idcard_index`(`idCard`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内购与订单映射表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_user_limit_daily
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_user_limit_daily`;
CREATE TABLE `hw_pos_user_limit_daily`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码',
  `company_type` int(1) NULL DEFAULT 0 COMMENT '公司类型:0-热风;1-畹町',
  `job_status` int(1) NULL DEFAULT 1 COMMENT '在职状态:1-在职;0-离职',
  `CREATE_DATE` date NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1274 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '区域表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_user_limit_except
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_user_limit_except`;
CREATE TABLE `hw_pos_user_limit_except`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ID_CARD` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '证件号',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '修改人员',
  `MODIFY_DATE` datetime(0) NULL DEFAULT NULL COMMENT '最后一次更新时间',
  `RECORD_STATE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 199 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '每天内购额度任务排除人员' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_user_limit_param
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_user_limit_param`;
CREATE TABLE `hw_pos_user_limit_param`  (
  `billNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `exBillNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `amt` decimal(14, 4) NULL DEFAULT NULL COMMENT '消费金额',
  `idCard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代表退货或者正常买单',
  `discountType` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代表六折或者七折',
  `modifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户内购额度参数表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_user_limit_sku
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_user_limit_sku`;
CREATE TABLE `hw_pos_user_limit_sku`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `idCard` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内购ID',
  `SKU` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BigTypeCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大类Code',
  `Qry` decimal(14, 4) NULL COMMENT '数量',
  `modify_user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `modifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改日期',
  `record_state` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69570 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内购商品记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_user_limit_staff
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_user_limit_staff`;
CREATE TABLE `hw_pos_user_limit_staff`  (
  `USER_LIMIT_STAFF_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工信息ID',
  `USER_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工姓名',
  `ID_CARD` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工身份证',
  `WORK_UNIT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '业务单位',
  `WORK_CITY` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工作所在地',
  `WORK_DEPT` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门/门店',
  `HIRE_DATE` date NOT NULL COMMENT '入职日期',
  `CREATE_USER_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `RECORD_STATE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  `LEAVE_DATE` date NULL DEFAULT NULL COMMENT '离职日期',
  PRIMARY KEY (`USER_LIMIT_STAFF_ID`) USING BTREE,
  INDEX `IDX_ID_CARD`(`ID_CARD`) USING BTREE,
  INDEX `id_card_index`(`ID_CARD`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_user_limit_welfare
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_user_limit_welfare`;
CREATE TABLE `hw_pos_user_limit_welfare`  (
  `WELFARE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工福利ID',
  `USER_LIMIT_STAFF_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工信息ID',
  `BILL_CITY` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购买城市',
  `WELFARE_TYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '福利类型 1.心系父母 2.优秀员工',
  `WELFARE_VALUE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '福利内容',
  `ID_CARD` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工身份证',
  `WELFARE_TIME` int(11) NOT NULL COMMENT '福利次数',
  `WELFARE_STATE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y' COMMENT '福利状态',
  `START_DATE` date NOT NULL COMMENT '开始日期',
  `EXPIRE_DATE` date NOT NULL COMMENT '失效日期',
  `PROMOTION_CONDITION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '促销条件',
  `PROMOTION_ACTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '促销动作',
  `MEMO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CREATE_USER_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  `CHECK_USER_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人员',
  `check_state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '审核状态',
  `WELFARE_YEAR` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2016' COMMENT '福利年份',
  `WELFARE_MONTH` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '福利月份',
  `BATCH_ID` int(11) NULL DEFAULT 0 COMMENT '导入批次id',
  PRIMARY KEY (`WELFARE_ID`) USING BTREE,
  INDEX `IDX_ID_CARD`(`ID_CARD`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工福利表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_pos_user_limit_welfare_log
-- ----------------------------
DROP TABLE IF EXISTS `hw_pos_user_limit_welfare_log`;
CREATE TABLE `hw_pos_user_limit_welfare_log`  (
  `WELFARE_LOG_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工福利流水ID',
  `STORE_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购买门店',
  `BILL_NO` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `AMT` decimal(14, 4) NOT NULL COMMENT '消费金额',
  `WELFARE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_USER_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`WELFARE_LOG_ID`) USING BTREE,
  INDEX `IDX_BILL_NO`(`BILL_NO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工福利流水表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_receive_customer_log
-- ----------------------------
DROP TABLE IF EXISTS `hw_receive_customer_log`;
CREATE TABLE `hw_receive_customer_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `cust_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员号',
  `birthday` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生日',
  `social_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '社交账号',
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '手机号',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `modify_user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `record_state` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cust_id`(`cust_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '其他渠道注册会员接收失败记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_statistics_store
-- ----------------------------
DROP TABLE IF EXISTS `hw_statistics_store`;
CREATE TABLE `hw_statistics_store`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STORE_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店ID',
  `BILL_DATE` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单日期',
  `BILL_COUNT` int(11) NULL DEFAULT NULL COMMENT '销售小票数',
  `QRY` int(11) NULL DEFAULT NULL COMMENT '销售总数量',
  `AMOUNT` decimal(18, 4) NULL DEFAULT NULL COMMENT '销售总金额',
  `DISCOUNT` decimal(18, 4) NULL DEFAULT NULL COMMENT '优惠总金额',
  `ADD1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加1',
  `ADD2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加2',
  `ADD3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加3',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `RECORDSTATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_BILLDATE`(`BILL_DATE`) USING BTREE,
  INDEX `IDX_STOREID`(`STORE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店销售统计表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_statistics_store_sale
-- ----------------------------
DROP TABLE IF EXISTS `hw_statistics_store_sale`;
CREATE TABLE `hw_statistics_store_sale`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STORE_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店ID',
  `BILL_DATE` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单日期',
  `BILL_COUNT` int(11) NULL DEFAULT NULL COMMENT '销售小票数',
  `QRY` int(11) NULL DEFAULT NULL COMMENT '销售总数量',
  `AMOUNT` decimal(18, 4) NULL DEFAULT NULL COMMENT '销售总金额',
  `DISCOUNT` decimal(18, 4) NULL DEFAULT NULL COMMENT '优惠总金额',
  `ADD1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加1',
  `ADD2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加2',
  `ADD3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加3',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `RECORDSTATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_BILLDATE`(`BILL_DATE`) USING BTREE,
  INDEX `IDX_STOREID`(`STORE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 236531 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店销售统计表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_statistics_store_sku
-- ----------------------------
DROP TABLE IF EXISTS `hw_statistics_store_sku`;
CREATE TABLE `hw_statistics_store_sku`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STORE_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店ID',
  `BILL_DATE` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单日期',
  `SKU` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SKU',
  `style_Id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '款',
  `color_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '色',
  `size_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '码',
  `QRY` int(11) NULL DEFAULT NULL COMMENT 'sku销售总数量',
  `AMOUNT` decimal(18, 4) NULL DEFAULT NULL COMMENT 'sku销售总金额',
  `DISCOUNT` decimal(18, 4) NULL DEFAULT NULL COMMENT 'sku优惠总金额',
  `ADD1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加1',
  `ADD2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加2',
  `ADD3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加3',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_BILLDATE`(`BILL_DATE`) USING BTREE,
  INDEX `IDX_STOREID`(`STORE_ID`) USING BTREE,
  INDEX `sku_idx`(`SKU`) USING BTREE,
  INDEX `style_idx`(`style_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33201815 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店sku销售统计表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_stock_allow_store
-- ----------------------------
DROP TABLE IF EXISTS `hw_stock_allow_store`;
CREATE TABLE `hw_stock_allow_store`  (
  `STORE_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店ID',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  `RECORD_STATE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '状态',
  PRIMARY KEY (`STORE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全渠道上线门店表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_stock_allow_store_v2
-- ----------------------------
DROP TABLE IF EXISTS `hw_stock_allow_store_v2`;
CREATE TABLE `hw_stock_allow_store_v2`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `STORE_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店ID',
  `BEGIN_TIME` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '全渠道上线日期',
  `END_TIME` timestamp(0) NULL DEFAULT NULL COMMENT '全渠道下线日期',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全渠道上线门店表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_stock_bill_type
-- ----------------------------
DROP TABLE IF EXISTS `hw_stock_bill_type`;
CREATE TABLE `hw_stock_bill_type`  (
  `BILL_NO` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '小票号',
  `BILL_DATE` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '单据日期',
  `BILL_TYPE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '单据类型,0为非全渠道订单，1全渠道订单',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y',
  PRIMARY KEY (`BILL_NO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单类型表，判断是否全渠道订单' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_store_init_db_detail
-- ----------------------------
DROP TABLE IF EXISTS `hw_store_init_db_detail`;
CREATE TABLE `hw_store_init_db_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `init_id` int(11) NOT NULL COMMENT '初始化批次号',
  `table_id` int(4) NOT NULL COMMENT '初始化表名',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否初始化成功，1 成功 0 失败',
  `exception` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录原因',
  `modify_user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `modify_date` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设置当前记录时间，精确到秒',
  `record_state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `init_id_idx`(`init_id`) USING BTREE,
  INDEX `table_id_idx`(`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店初始化表明细' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_store_init_db_master
-- ----------------------------
DROP TABLE IF EXISTS `hw_store_init_db_master`;
CREATE TABLE `hw_store_init_db_master`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `store_id` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行初始化的门店编号',
  `request_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店请求初始化的时间',
  `response_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务器完成导出sql文件时间',
  `sql_file` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成sql文件的目录',
  `request_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店请求的ip地址',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否整体初始化成功，1 成功 0 失败',
  `modify_user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `modify_date` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设置当前记录时间，精确到秒',
  `record_state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `store_id_idx`(`store_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店初始化db记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_store_install_client_version
-- ----------------------------
DROP TABLE IF EXISTS `hw_store_install_client_version`;
CREATE TABLE `hw_store_install_client_version`  (
  `version` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modify_date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '门店POS SWMS 服务安装 客户端版本' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_store_synchronize_list
-- ----------------------------
DROP TABLE IF EXISTS `hw_store_synchronize_list`;
CREATE TABLE `hw_store_synchronize_list`  (
  `LIST_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '门店表ID',
  `TABLE_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店表名称',
  `CONDITION_SQL` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询数据的sql语句',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `MODIFY_USER_ID` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `Modify_Date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  `DATA_LOCATION` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'pos或者swms',
  `STEP` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态',
  `SORT_FIRID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序字段',
  PRIMARY KEY (`LIST_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 212 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '服务器数据清单' ROW_FORMAT = Compact;

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

-- ----------------------------
-- Table structure for hw_sys_user_limit_bind
-- ----------------------------
DROP TABLE IF EXISTS `hw_sys_user_limit_bind`;
CREATE TABLE `hw_sys_user_limit_bind`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `ID_CARD` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '身份证',
  `MOBILE` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '手机号码',
  `OPENID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '微信唯一标示',
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ERROR_OPENID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_DATE` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `RECORD_STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '记录状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 241 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工内购额度绑定表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_wechat_customer_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `hw_wechat_customer_subscribe`;
CREATE TABLE `hw_wechat_customer_subscribe`  (
  `Open_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'OPENID',
  `subscribe_flag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订阅标志',
  `modify_date` date NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`Open_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户订阅主表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hw_wechat_customer_subscribe_log
-- ----------------------------
DROP TABLE IF EXISTS `hw_wechat_customer_subscribe_log`;
CREATE TABLE `hw_wechat_customer_subscribe_log`  (
  `customer_subscribe_log_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户订阅日志ID',
  `Open_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'OPENID',
  `subscribe_flag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订阅标志',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`customer_subscribe_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户订阅流水表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province`  (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AreaID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for salonofflinevipactionlog
-- ----------------------------
DROP TABLE IF EXISTS `salonofflinevipactionlog`;
CREATE TABLE `salonofflinevipactionlog`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `BillNo` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VipID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ActionDate` datetime(0) NULL DEFAULT NULL,
  `ActionType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ConsumeQty` int(11) NULL DEFAULT NULL,
  `ConsumeAmt` decimal(14, 4) NULL DEFAULT NULL,
  `Point` decimal(14, 4) NULL DEFAULT NULL,
  `OptMan` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `StoreID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IsUpSR` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `IsUpMec` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `PointRate` decimal(14, 2) NULL DEFAULT 1.00,
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_vipid`(`VipID`) USING BTREE,
  INDEX `idx_ActionType`(`ActionDate`) USING BTREE,
  INDEX `idx_IsUpSR`(`IsUpSR`) USING BTREE,
  INDEX `idx_BillNo`(`BillNo`) USING BTREE,
  INDEX `idx_StoreID`(`StoreID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24016 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '使用老pos的积分系统，将会员买单的信息保存到该表中' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for saltowmsnotice
-- ----------------------------
DROP TABLE IF EXISTS `saltowmsnotice`;
CREATE TABLE `saltowmsnotice`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `storeId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `posId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `billNo` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `billDate` datetime(0) NULL DEFAULT NULL,
  `ModifyDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单数据传递到DRP系统，通知wms系统取订单数据, 后期不需要该数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for unit_store_ownership
-- ----------------------------
DROP TABLE IF EXISTS `unit_store_ownership`;
CREATE TABLE `unit_store_ownership`  (
  `unit_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份id',
  `store_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店名称',
  `u_region_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'OSS大区id',
  `u_city_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'OSS城市id',
  `u_district_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'OSS区县id',
  `o_region_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店系统对应OSS大区id',
  `o_province_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店系统省份id',
  `o_city_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店系统城市id',
  `o_district_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店系统区县id',
  `o_province_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店系统省份名称',
  `o_city_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店系统城市名称',
  `o_district_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店系统区县名称',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19758 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zzj
-- ----------------------------
DROP TABLE IF EXISTS `zzj`;
CREATE TABLE `zzj`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `co` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_co`(`co`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61242 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zzj1
-- ----------------------------
DROP TABLE IF EXISTS `zzj1`;
CREATE TABLE `zzj1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `co` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_co`(`co`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 150383 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zzj2
-- ----------------------------
DROP TABLE IF EXISTS `zzj2`;
CREATE TABLE `zzj2`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `co` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 952721 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- View structure for pos_sal_dtl_activity_view
-- ----------------------------
DROP VIEW IF EXISTS `pos_sal_dtl_activity_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `pos_sal_dtl_activity_view` AS select `spd`.`BarCode` AS `SKU`,`spm`.`BillNo` AS `OrderCode`,`spm`.`StoreID` AS `StoreId`,`spm`.`PosID` AS `PosId`,`spd`.`StyleName` AS `Name`,`spd`.`Qry` AS `Count`,`spd`.`RefPrice` AS `RefPrice`,`spd`.`Price` AS `Price`,`spd`.`Discount` AS `Discount`,`spd`.`Amount` AS `Amount`,`spm`.`VipID` AS `VipID`,`spm`.`CreateMan` AS `CreaeMan`,date_format(`spm`.`BillDate`,'%Y-%m-%d %H:%i:%s') AS `BillDate`,`spm`.`IsBalance` AS `IsBalance`,`spd`.`TradeMode` AS `Type`,group_concat(`spa`.`ActiviceName` separator ',') AS `ActiviDesc` from ((`hw_pos_salposdtl` `spd` left join `hw_pos_salposmst` `spm` on((`spd`.`BillNo` = `spm`.`BillNo`))) left join `hw_pos_salposactivi` `spa` on(((`spa`.`BillNO` = `spd`.`BillNo`) and (`spa`.`SKUID` = `spd`.`BarCode`)))) where ((`spm`.`RecordState` = 'Y') and (`spd`.`RecordState` = 'Y')) group by `SKU`,`spm`.`BillNo` order by `spm`.`ModifyDate` desc;

-- ----------------------------
-- View structure for pos_sal_dtl_view
-- ----------------------------
DROP VIEW IF EXISTS `pos_sal_dtl_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `pos_sal_dtl_view` AS select `spd`.`BarCode` AS `SKU`,`spm`.`BillNo` AS `OrderCode`,`spm`.`StoreID` AS `StoreId`,`spm`.`PosID` AS `PosId`,`spd`.`StyleName` AS `SkuName`,`spd`.`Qry` AS `Qry`,`spd`.`Amount` AS `Amount`,`spd`.`TradeMode` AS `Type`,`spm`.`VipID` AS `VipID`,`spm`.`CreateMan` AS `CreaeMan`,date_format(`spm`.`BillDate`,'%Y-%m-%d %H:%i:%s') AS `BillDate` from (`hw_pos_salposdtl` `spd` left join `hw_pos_salposmst` `spm` on((`spd`.`BillNo` = `spm`.`BillNo`))) where ((`spm`.`RecordState` = 'Y') and (`spd`.`RecordState` = 'Y')) order by `spm`.`ModifyDate` desc;

-- ----------------------------
-- View structure for pos_sal_order_pay_view
-- ----------------------------
DROP VIEW IF EXISTS `pos_sal_order_pay_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `pos_sal_order_pay_view` AS select `spm`.`BillNo` AS `OrderCode`,`spm`.`StoreID` AS `StoreId`,`spm`.`PosID` AS `PosId`,date_format(`spm`.`BillDate`,'%Y-%m-%d %H:%i:%s') AS `BillDate`,`spm`.`Qry` AS `Count`,`spm`.`Amount` AS `Amount`,`spm`.`CreateMan` AS `CreateMan`,`spm`.`BillType` AS `BillType`,`spm`.`IsBalance` AS `IsBalance`,group_concat(distinct `ppm`.`PayModeName` separator ',') AS `PayModeName` from (((`hw_pos_salposmst` `spm` left join `hw_pos_salposdtl` `spd` on((`spm`.`BillNo` = `spd`.`BillNo`))) left join `hw_pos_salpospay` `spp` on((`spm`.`BillNo` = `spp`.`BillNo`))) left join `hw_pos_pay_mode` `ppm` on((`ppm`.`PayModeID` = `spp`.`PayID`))) where ((`spm`.`RecordState` = 'Y') and (`spd`.`RecordState` = 'Y') and (`spp`.`RecordState` = 'Y')) group by `spm`.`BillNo` order by `spm`.`ModifyDate` desc;

-- ----------------------------
-- View structure for pos_sal_order_view
-- ----------------------------
DROP VIEW IF EXISTS `pos_sal_order_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `pos_sal_order_view` AS select `spm`.`BillNo` AS `OrderCode`,`spm`.`StoreID` AS `StoreId`,`spm`.`PosID` AS `PosId`,date_format(`spm`.`BillDate`,'%Y-%m-%d %H:%i:%s') AS `BillDate`,`spm`.`Qry` AS `Qry`,`spm`.`Amount` AS `Amount`,`spm`.`CreateMan` AS `CreateMan`,`spm`.`BillType` AS `BillType`,`spm`.`IsBalance` AS `IsBalance` from (`hw_pos_salposmst` `spm` left join `hw_pos_salposdtl` `spd` on((`spm`.`BillNo` = `spd`.`BillNo`))) where ((`spm`.`RecordState` = 'Y') and (`spd`.`RecordState` = 'Y')) group by `spm`.`BillNo` order by `spm`.`ModifyDate` desc;

-- ----------------------------
-- View structure for promotionstorelist
-- ----------------------------
DROP VIEW IF EXISTS `promotionstorelist`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `promotionstorelist` AS select `b`.`promotionStoreId` AS `promotionStoreId`,`b`.`regionId` AS `regionId`,`b`.`cityId` AS `cityId`,`b`.`districtId` AS `districtId`,`b`.`storeId` AS `storeId`,`b`.`promotionId` AS `promotionId`,`b`.`modifyUserId` AS `modifyUserId`,`b`.`ModifyDate` AS `ModifyDate`,`b`.`recordState` AS `recordState`,`a`.`regionName` AS `regionName`,`a`.`cityName` AS `cityName`,`a`.`districtName` AS `districtName`,`a`.`storeName` AS `storeName` from (`storelocationview` `a` join `hw_pos_promotion_store` `b`) where ((((`b`.`storeId` is not null) and (`b`.`storeId` = `a`.`storeId`)) or (isnull(`b`.`storeId`) and (`b`.`districtId` is not null) and (`b`.`districtId` = `a`.`districtId`)) or (isnull(`b`.`storeId`) and isnull(`b`.`districtId`) and (`b`.`cityId` is not null) and (`b`.`cityId` = `a`.`cityId`)) or (isnull(`b`.`storeId`) and isnull(`b`.`districtId`) and isnull(`b`.`cityId`) and (`b`.`regionId` is not null) and (`b`.`regionId` = `a`.`regionId`))) and (`b`.`recordState` = 'Y'));

-- ----------------------------
-- View structure for sku_store_price
-- ----------------------------
DROP VIEW IF EXISTS `sku_store_price`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `sku_store_price` AS (select `sku`.`StyleID` AS `styleId`,`style`.`StyleName` AS `NAME`,`sku`.`SKUID` AS `BarCode`,`sku`.`ColorID` AS `ColorCode`,`color`.`ColorName` AS `ColorName`,`sku`.`SizeID` AS `SizeId`,`size`.`SizeName` AS `SizeName`,`prc`.`price` AS `OriginalPrice`,`prc`.`sale_price` AS `UnitPrice` from ((((`hw_master_sku` `sku` left join `hw_master_style` `style` on((`sku`.`StyleID` = `style`.`StyleID`))) left join `hw_master_color` `color` on((`sku`.`ColorID` = `color`.`ColorID`))) left join `hw_master_size` `size` on((`sku`.`SizeID` = `size`.`SizeID`))) left join `hw_pos_store_price_info` `prc` on(((`sku`.`StyleID` = `prc`.`style_id`) and (`sku`.`ColorID` = `prc`.`color_id`) and (`sku`.`SizeID` = `prc`.`size_id`)))));

-- ----------------------------
-- View structure for special_role_under_store
-- ----------------------------
DROP VIEW IF EXISTS `special_role_under_store`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `special_role_under_store` AS (select `hw_hrs_role`.`ROLE_ID` AS `ROLE_ID`,`hw_hrs_role`.`ROLE_CODE` AS `ROLE_CODE`,`hw_hrs_role`.`ROLE_NAME` AS `ROLE_NAME`,`hw_hrs_role`.`ROLE_DESC` AS `ROLE_DESC`,`hw_hrs_role`.`CREATE_USER_ID` AS `CREATE_USER_ID`,`hw_hrs_role`.`CREATE_DATE` AS `CREATE_DATE`,`hw_hrs_role`.`MODIFY_USER_ID` AS `MODIFY_USER_ID`,`hw_hrs_role`.`Modify_Date` AS `MODIFY_DATE`,`hw_hrs_role`.`RECORD_STATE` AS `RECORD_STATE` from `hw_hrs_role` where ((`hw_hrs_role`.`ROLE_ID` in ('16050315836080395372','16050315836080395373','16050315836080395374')) and (`hw_hrs_role`.`RECORD_STATE` = 'Y')));

-- ----------------------------
-- View structure for storelocationview
-- ----------------------------
DROP VIEW IF EXISTS `storelocationview`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `storelocationview` AS (select distinct `hr`.`REGION_NAME` AS `regionName`,`hc`.`CITY_NAME` AS `cityName`,NULL AS `districtName`,`hs`.`STORE_NAME` AS `storeName`,`hs`.`STORE_ID` AS `storeId`,`hc`.`CITY_ID` AS `cityId`,`hr`.`REGION_ID` AS `regionId`,NULL AS `districtId` from (((`hw_hrs_store` `hs` left join `hw_hrs_unit` `hu` on((`hs`.`STORE_ID` = `hu`.`STORE_ID`))) left join `hw_hrs_region` `hr` on((`hr`.`REGION_ID` = `hu`.`REGION_ID`))) left join `hw_hrs_city` `hc` on((`hc`.`CITY_ID` = `hu`.`CITY_ID`))) where ((`hs`.`RECORD_STATE` = 'Y') and (`hu`.`RECORD_STATE` = 'Y') and (`hr`.`RECORD_STATE` = 'Y') and (`hc`.`RECORD_STATE` = 'Y')));

-- ----------------------------
-- View structure for test
-- ----------------------------
DROP VIEW IF EXISTS `test`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `test` AS (select `hw_hrs_menu`.`PARENT_MENU_ID` AS `PARENT_MENU_ID`,`hw_hrs_menu`.`MENU_ID` AS `MENU_ID`,`hw_hrs_menu`.`MENU_CODE` AS `MENU_CODE`,`hw_hrs_menu`.`MENU_NAME` AS `MENU_NAME`,`hw_hrs_menu`.`MEND_DESC` AS `MEND_DESC`,`hw_hrs_menu`.`ICON` AS `ICON`,`hw_hrs_menu`.`CODE` AS `CODE`,`hw_hrs_menu`.`URL` AS `URL`,`hw_hrs_menu`.`LEVEL` AS `LEVEL`,`hw_hrs_menu`.`CREATE_USER_ID` AS `CREATE_USER_ID`,`hw_hrs_menu`.`CREATE_DATE` AS `CREATE_DATE`,`hw_hrs_menu`.`MODIFY_USER_ID` AS `MODIFY_USER_ID`,`hw_hrs_menu`.`Modify_Date` AS `Modify_Date`,`hw_hrs_menu`.`RECORD_STATE` AS `RECORD_STATE` from `hw_hrs_menu`);

-- ----------------------------
-- View structure for test1
-- ----------------------------
DROP VIEW IF EXISTS `test1`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `test1` AS (select `hw_hrs_menu`.`PARENT_MENU_ID` AS `PARENT_MENU_ID`,`hw_hrs_menu`.`MENU_ID` AS `MENU_ID`,`hw_hrs_menu`.`MENU_CODE` AS `MENU_CODE`,`hw_hrs_menu`.`MENU_NAME` AS `MENU_NAME`,`hw_hrs_menu`.`MEND_DESC` AS `MEND_DESC`,`hw_hrs_menu`.`ICON` AS `ICON`,`hw_hrs_menu`.`CODE` AS `CODE`,`hw_hrs_menu`.`URL` AS `URL`,`hw_hrs_menu`.`LEVEL` AS `LEVEL`,`hw_hrs_menu`.`CREATE_USER_ID` AS `CREATE_USER_ID`,`hw_hrs_menu`.`CREATE_DATE` AS `CREATE_DATE`,`hw_hrs_menu`.`MODIFY_USER_ID` AS `MODIFY_USER_ID`,`hw_hrs_menu`.`Modify_Date` AS `Modify_Date`,`hw_hrs_menu`.`RECORD_STATE` AS `RECORD_STATE` from `hw_hrs_menu`);

-- ----------------------------
-- View structure for unit_store_ownership_view
-- ----------------------------
DROP VIEW IF EXISTS `unit_store_ownership_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `unit_store_ownership_view` AS (select `u`.`UNIT_ID` AS `unit_id`,`u`.`STORE_ID` AS `store_id`,`s`.`STORE_NAME` AS `store_name`,`u`.`REGION_ID` AS `u_region_id`,`u`.`CITY_ID` AS `u_city_id`,`u`.`DISTRICT_ID` AS `u_district_id`,`o`.`REGION_ID` AS `o_region_id`,`o`.`PROVINCE_ID` AS `o_province_id`,`o`.`CITY_ID` AS `o_city_id`,`o`.`DISTRICT_ID` AS `o_district_id`,`o`.`PROVINCE_NAME` AS `o_province_name`,`o`.`CITY_NAME` AS `o_city_name`,`o`.`DISTRICT_NAME` AS `o_district_name` from (`hw_hrs_store_ownership` `o` join (`hw_hrs_unit` `u` left join `hw_hrs_store` `s` on((`u`.`STORE_ID` = `s`.`STORE_ID`)))) where ((`u`.`RECORD_STATE` = 'Y') and (`o`.`RECORD_STATE` = 'Y') and ((`u`.`STORE_ID` = `o`.`STORE_ID`) or ((`u`.`REGION_ID` = `o`.`REGION_ID`) and isnull(`u`.`STORE_ID`)))));

-- ----------------------------
-- View structure for user_working_in_store
-- ----------------------------
DROP VIEW IF EXISTS `user_working_in_store`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `user_working_in_store` AS (select `ut`.`STORE_ID` AS `STORE_ID`,`ut`.`GROUP_ID` AS `GROUP_ID`,`pr`.`ROLE_ID` AS `ROLE_ID`,`u`.`USER_ID` AS `USER_ID`,`u`.`USER_CODE` AS `USER_CODE`,`u`.`USER_NAME` AS `USER_NAME`,`u`.`LOGIN_NAME` AS `LOGIN_NAME`,`u`.`USER_PWD` AS `USER_PWD`,`u`.`MOBILE` AS `MOBILE`,`u`.`CREATE_USER_ID` AS `CREATE_USER_ID`,`u`.`CREATE_DATE` AS `CREATE_DATE`,`u`.`MODIFY_USER_ID` AS `MODIFY_USER_ID`,`u`.`Modify_Date` AS `MODIFY_DATE`,`u`.`RECORD_STATE` AS `RECORD_STATE` from (((`hw_hrs_user` `u` left join `hw_hrs_unit` `ut` on(((`u`.`UNIT_ID` = `ut`.`UNIT_ID`) and (`ut`.`RECORD_STATE` = 'Y')))) left join `hw_hrs_user_position` `up` on(((`u`.`USER_ID` = `up`.`USER_ID`) and (`up`.`RECORD_STATE` = 'Y')))) left join `hw_hrs_position_role` `pr` on(((`up`.`POSITION_ID` = `pr`.`POSITION_ID`) and (`pr`.`RECORD_STATE` = 'Y')))) where ((`ut`.`STORE_ID` is not null) and (`u`.`RECORD_STATE` = 'Y')) order by `ut`.`STORE_ID`,`ut`.`GROUP_ID`,`pr`.`ROLE_ID`,cast(`u`.`USER_ID` as signed));

-- ----------------------------
-- Procedure structure for exe_priceinfo_new
-- ----------------------------
DROP PROCEDURE IF EXISTS `exe_priceinfo_new`;
delimiter ;;
CREATE PROCEDURE `exe_priceinfo_new`()
BEGIN
	DECLARE result_code INTEGER DEFAULT 0; -- 定义返回结果并赋初值0
	DECLARE shortDate DATETIME ;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET result_code=1;
	
	
if HOUR(now())>12 then
  set  shortDate=DATE_ADD(NOW(),INTERVAL 1 DAY );
 else 
  set shortDate=now();
   -- 调价记录折算到颜色，产生临时表
	DROP TABLE IF EXISTS t_record;
	CREATE TEMPORARY TABLE t_record 
	SELECT a.* FROM hw_pos_long_price_dtl  a,`hw_master_color` b
	WHERE  a.price_id IN ( SELECT id FROM hw_pos_long_price_mst
	 WHERE record_status='Y' AND mds_status='0' AND start_date=DATE(NOW())) AND 
	a.color_id=b.colorid AND a.record_status='Y'
	UNION ALL
	SELECT a.id,a.price_id,a.city_id,a.store_id ,a.style_id,b.colorid,a.size_id,a.price,create_date,modify_date,record_status
	 FROM hw_pos_long_price_dtl a,(SELECT styleid,colorid FROM `hw_master_sku`
	GROUP BY styleid,colorid) b 
	WHERE  a.price_id IN ( SELECT id FROM hw_pos_long_price_mst
	 WHERE record_status='Y' AND mds_status='0' AND start_date=DATE(NOW())) AND
	 a.style_id=b.styleid AND (a.color_id IS NULL OR a.color_id='') AND a.record_status='Y';
	 
	 
	ALTER TABLE t_record ADD INDEX idx_orderby (city_id,style_id,color_id,price_id,price);
	DROP TABLE IF EXISTS t_record_1;
	CREATE TEMPORARY TABLE t_record_1
	SELECT * FROM t_record;
	ALTER TABLE t_record_1 ADD INDEX idx_orderby (city_id,style_id,color_id,price_id,price);
	-- 计算长期结果表
	-- 产生新版调价结果数据
	DROP TABLE IF EXISTS t_price_result;
	CREATE TEMPORARY TABLE t_price_result
	SELECT * FROM (
	SELECT a.*,
	CASE WHEN CONCAT(a.city_id,'-',a.style_id,'-',a.color_id)<>@okey THEN  @row:=1 ELSE @row:=@row+1 END gridx, @okey:=b.gkey
	  FROM (SELECT * FROM t_record_1 a ORDER BY city_id,style_id,color_id,price_id DESC,price) a,(
	SELECT city_id,style_id,color_id,COUNT(1) n,CONCAT(city_id,'-',style_id,'-',color_id)  gkey
	FROM t_record GROUP BY city_id,style_id,color_id) b,(SELECT @row:=0,@okey:='') c
	WHERE a.city_id=b.city_id AND a.style_id=b.style_id AND a.color_id=b.color_id) e WHERE gridx=1;
	-- 新版长期调价数据插入实体表
		
	SET result_code=0 ;
	START TRANSACTION;
	REPLACE INTO hw_pos_long_price_result(price_id,city_id,style_id,color_id,size_id,price,effect_date,modify_date,record_status)
	SELECT  a.price_id,a.city_id,a.style_id,a.color_id,IFNULL(a.size_id,''),a.price,b.`start_date`,NOW(),a.record_status  
	FROM t_price_result a,hw_pos_long_price_mst b
	WHERE a.price_id=b.`id`;
	-- 更新调价单状态
	UPDATE  hw_pos_long_price_mst SET mds_status='2'
	WHERE id IN (SELECT DISTINCT price_id FROM t_price_result);
	IF result_code=0 THEN 
	  COMMIT;
	ELSE
	  ROLLBACK;
	  SET result_code=0;
	END IF;  
 end if;
-- 短期调价
DROP TABLE IF EXISTS t_record_s;
CREATE TEMPORARY TABLE t_record_s
 SELECT c.id,c.price_id,c.city_id,d.store_id,c.style_id,c.color_id,c.size_id,c.price,c.create_date,c.modify_date,c.record_status FROM
 (SELECT b.*
  FROM `hw_pos_short_price_mst` a,`hw_pos_short_price_dtl` b
 WHERE a.record_status='Y' AND start_date<=DATE(shortDate) AND end_date>=DATE(shortDate) AND a.mds_status IN ('0','2') AND a.id=b.price_id AND b.record_status='Y'  AND TRIM(b.store_id)='' AND NOT TRIM(b.`color_id`)='') c,(
SELECT store_id,store_name,city_id FROM hw_pos_store_city_info
 ) d
 WHERE c.city_id=d.city_id   -- 城市有色
 UNION ALL
  SELECT c.id,c.price_id,c.city_id,d.store_id,c.style_id,e.colorid,c.size_id,c.price,c.create_date,c.modify_date,c.record_status FROM
 (SELECT b.*
  FROM `hw_pos_short_price_mst` a,`hw_pos_short_price_dtl` b
 WHERE a.record_status='Y' AND start_date<=DATE(shortDate) AND end_date>=DATE(shortDate) AND a.mds_status IN ('0','2') AND a.id=b.price_id AND b.record_status='Y'  AND TRIM(b.store_id)='' AND TRIM(b.`color_id`)='') c,(
SELECT store_id,store_name,city_id FROM hw_pos_store_city_info
 ) d,(SELECT styleid,colorid FROM `hw_master_sku`
GROUP BY styleid,colorid) e
 WHERE c.city_id=d.city_id AND c.style_id=e.styleid  -- 城市无色
UNION ALL
 SELECT b.*
  FROM `hw_pos_short_price_mst` a,`hw_pos_short_price_dtl` b
 WHERE a.record_status='Y' AND start_date<=DATE(shortDate) AND end_date>=DATE(shortDate) AND a.mds_status IN ('0','2') AND a.id=b.price_id AND b.record_status='Y'  AND NOT TRIM(b.store_id)=''  AND NOT TRIM(b.`color_id`)=''
 UNION ALL 
 SELECT c.id,c.price_id,c.city_id,c.store_id,c.style_id,e.colorid,c.size_id,c.price,c.create_date,c.modify_date,c.record_status FROM
 (SELECT b.*
  FROM `hw_pos_short_price_mst` a,`hw_pos_short_price_dtl` b
 WHERE a.record_status='Y' AND start_date<=DATE(shortDate) AND end_date>=DATE(shortDate) AND a.mds_status IN ('0','2') AND a.id=b.price_id AND b.record_status='Y'  AND NOT TRIM(b.store_id)='' AND TRIM(b.`color_id`)='') c,
 (SELECT styleid,colorid FROM `hw_master_sku` GROUP BY styleid,colorid) e
 WHERE c.style_id=e.styleid;
 
  DROP TABLE IF EXISTS t_record_s1;
  CREATE TEMPORARY TABLE t_record_s1
 SELECT * FROM t_record_s;
ALTER TABLE t_record_s ADD INDEX idx_key (store_id,style_id,color_id,price_id,price);
ALTER TABLE t_record_s1 ADD INDEX idx_key (store_id,style_id,color_id,price_id,price);
 
 
 -- 短期调价覆盖重启调价
 
 SET result_code=0;
START TRANSACTION;
 DELETE FROM hw_pos_store_price_result WHERE effect_date=DATE(shortDate);
INSERT INTO hw_pos_store_price_result(price_id,store_id,style_id,color_id,price,STATUS,effect_date,modify_date,record_status,size_id)
 SELECT  price_id,store_id,style_id,color_id,price,2,DATE(shortDate),NOW(),'Y','' FROM (
 SELECT a.*,
CASE WHEN CONCAT(a.store_id,'-',a.style_id,'-',a.color_id)<>@okey THEN  @row:=1 ELSE @row:=@row+1 END gridx, @okey:=b.gkey
  FROM (SELECT * FROM t_record_s1 a ORDER BY store_id,style_id,color_id,price_id DESC,price) a,(
SELECT store_id,style_id,color_id,COUNT(1) n,CONCAT(store_id,'-',style_id,'-',color_id)  gkey
FROM t_record_s GROUP BY store_id,style_id,color_id) b,(SELECT @row:=0,@okey:='') c
WHERE a.store_id=b.store_id AND a.style_id=b.style_id AND a.color_id=b.color_id) e WHERE gridx=1;
if HOUR(shortDate)<=12 then
 UPDATE hw_pos_short_price_mst SET mds_status='2'
WHERE id IN (SELECT DISTINCT price_id FROM  hw_pos_store_price_result WHERE effect_date=DATE(NOW()));
end if;			
IF result_code=0 THEN 
  COMMIT;
ELSE
  ROLLBACK;
  SET result_code=0;
END  IF;
	
	
    END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_selectTotalMoney
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_selectTotalMoney`;
delimiter ;;
CREATE PROCEDURE `procedure_selectTotalMoney`(IN pos_id VARCHAR(20),
	IN store_id VARCHAR(20))
BEGIN

		SET @pos_saving = (
			SELECT
				ifnull(SUM(SavingAmt),0)
			FROM
				hw_pos_saving
			where
				PosID = pos_id
				AND StoreID = store_id
		);


		SET @pos_cash = (
			SELECT
				ifnull(SUM(PayMoney),0)
			FROM
				hw_pos_salpospay
			WHERE
				PayId = '01'
				AND PosId = pos_id
				AND StoreID = store_id
		);

		SET @pos_non = (
			SELECT
				ifnull(SUM(IncomeAmt),0)
			FROM
				hw_pos_non_operating_income
			WHERE
				IncomeMode = '01'
				AND PosID = pos_id
				AND StoreID = store_id
		);

		SET @totalMaoney = @pos_cash +@pos_non - @pos_saving;

		SELECT
			@totalMaoney as TotalMoney;


	END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for shortPrice
-- ----------------------------
DROP PROCEDURE IF EXISTS `shortPrice`;
delimiter ;;
CREATE PROCEDURE `shortPrice`(n int)
BEGIN
	DECLARE result_code INTEGER DEFAULT 0; -- 定义返回结果并赋初值0
	DECLARE shortDate DATETIME ;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET result_code=1;
	SET  shortDate=DATE_ADD(NOW(),INTERVAL n DAY );
	DROP TABLE IF EXISTS t_record_s;
CREATE TEMPORARY TABLE t_record_s
 SELECT c.id,c.price_id,c.city_id,d.store_id,c.style_id,c.color_id,c.size_id,c.price,c.create_date,c.modify_date,c.record_status FROM
 (SELECT b.*
  FROM `hw_pos_short_price_mst` a,`hw_pos_short_price_dtl` b
 WHERE a.record_status='Y' AND start_date<=DATE(shortDate) AND end_date>=DATE(shortDate) AND a.mds_status IN ('0','2') AND a.id=b.price_id AND b.record_status='Y'  AND TRIM(b.store_id)='' AND NOT TRIM(b.`color_id`)='') c,(
SELECT store_id,store_name,city_id FROM hw_pos_store_city_info
 ) d
 WHERE c.city_id=d.city_id   -- 城市有色
 UNION ALL
  SELECT c.id,c.price_id,c.city_id,d.store_id,c.style_id,e.colorid,c.size_id,c.price,c.create_date,c.modify_date,c.record_status FROM
 (SELECT b.*
  FROM `hw_pos_short_price_mst` a,`hw_pos_short_price_dtl` b
 WHERE a.record_status='Y' AND start_date<=DATE(shortDate) AND end_date>=DATE(shortDate) AND a.mds_status IN ('0','2') AND a.id=b.price_id AND b.record_status='Y'  AND TRIM(b.store_id)='' AND TRIM(b.`color_id`)='') c,(
SELECT store_id,store_name,city_id FROM hw_pos_store_city_info
 ) d,(SELECT styleid,colorid FROM `hw_master_sku`
GROUP BY styleid,colorid) e
 WHERE c.city_id=d.city_id AND c.style_id=e.styleid  -- 城市无色
UNION ALL
 SELECT b.*
  FROM `hw_pos_short_price_mst` a,`hw_pos_short_price_dtl` b
 WHERE a.record_status='Y' AND start_date<=DATE(shortDate) AND end_date>=DATE(shortDate) AND a.mds_status IN ('0','2') AND a.id=b.price_id AND b.record_status='Y'  AND NOT TRIM(b.store_id)=''  AND NOT TRIM(b.`color_id`)=''
 UNION ALL 
 SELECT c.id,c.price_id,c.city_id,c.store_id,c.style_id,e.colorid,c.size_id,c.price,c.create_date,c.modify_date,c.record_status FROM
 (SELECT b.*
  FROM `hw_pos_short_price_mst` a,`hw_pos_short_price_dtl` b
 WHERE a.record_status='Y' AND start_date<=DATE(shortDate) AND end_date>=DATE(shortDate) AND a.mds_status IN ('0','2') AND a.id=b.price_id AND b.record_status='Y'  AND NOT TRIM(b.store_id)='' AND TRIM(b.`color_id`)='') c,
 (SELECT styleid,colorid FROM `hw_master_sku` GROUP BY styleid,colorid) e
 WHERE c.style_id=e.styleid;
 
  DROP TABLE IF EXISTS t_record_s1;
  CREATE TEMPORARY TABLE t_record_s1
 SELECT * FROM t_record_s;
ALTER TABLE t_record_s ADD INDEX idx_key (store_id,style_id,color_id,price_id,price);
ALTER TABLE t_record_s1 ADD INDEX idx_key (store_id,style_id,color_id,price_id,price);
 
 
 -- 短期调价覆盖重启调价
 
 SET result_code=0;
START TRANSACTION;
 DELETE FROM hw_pos_store_price_result WHERE effect_date=DATE(shortDate);
INSERT INTO hw_pos_store_price_result(price_id,store_id,style_id,color_id,price,STATUS,effect_date,modify_date,record_status,size_id)
 SELECT  price_id,store_id,style_id,color_id,price,2,DATE(shortDate),NOW(),'Y','' FROM (
 SELECT a.*,
CASE WHEN CONCAT(a.store_id,'-',a.style_id,'-',a.color_id)<>@okey THEN  @row:=1 ELSE @row:=@row+1 END gridx, @okey:=b.gkey
  FROM (SELECT * FROM t_record_s1 a ORDER BY store_id,style_id,color_id,price_id DESC,price) a,(
SELECT store_id,style_id,color_id,COUNT(1) n,CONCAT(store_id,'-',style_id,'-',color_id)  gkey
FROM t_record_s GROUP BY store_id,style_id,color_id) b,(SELECT @row:=0,@okey:='') c
WHERE a.store_id=b.store_id AND a.style_id=b.style_id AND a.color_id=b.color_id) e WHERE gridx=1;
IF HOUR(shortDate)<=14 THEN
 UPDATE hw_pos_short_price_mst SET mds_status='2'
WHERE id IN (SELECT DISTINCT price_id FROM  hw_pos_store_price_result WHERE effect_date=DATE(NOW()));
END IF;			
IF result_code=0 THEN 
  COMMIT;
ELSE
  ROLLBACK;
  SET result_code=0;
END  IF;
    END
;;
delimiter ;

-- ----------------------------
-- Event structure for auto_delete_hw_pos_user
-- ----------------------------
DROP EVENT IF EXISTS `auto_delete_hw_pos_user`;
delimiter ;;
CREATE EVENT `auto_delete_hw_pos_user`
ON SCHEDULE
EVERY '1' DAY STARTS '2016-10-18 02:00:00'
DO truncate table hw_pos_user
;;
delimiter ;

-- ----------------------------
-- Event structure for download_check_table
-- ----------------------------
DROP EVENT IF EXISTS `download_check_table`;
delimiter ;;
CREATE EVENT `download_check_table`
ON SCHEDULE
EVERY '1' DAY STARTS '2019-10-23 10:30:00'
DO insert into hw_hdds_grab_notice (rulecode)values ('check_unit_table')
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
