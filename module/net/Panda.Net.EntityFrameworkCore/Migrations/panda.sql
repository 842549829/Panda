/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.5.245
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : 192.168.5.245:3306
 Source Schema         : panda

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 23/01/2025 11:15:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for __efmigrationshistory
-- ----------------------------
DROP TABLE IF EXISTS `__efmigrationshistory`;
CREATE TABLE `__efmigrationshistory`  (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of __efmigrationshistory
-- ----------------------------
INSERT INTO `__efmigrationshistory` VALUES ('20240829020544_init', '8.0.4');
INSERT INTO `__efmigrationshistory` VALUES ('20250123030741_net91', '9.0.0');

-- ----------------------------
-- Table structure for abpannouncements
-- ----------------------------
DROP TABLE IF EXISTS `abpannouncements`;
CREATE TABLE `abpannouncements`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PublishTime` datetime(6) NOT NULL,
  `PublishType` int NOT NULL,
  `Content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `OrganizationCode` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `DeletionTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpannouncements
-- ----------------------------

-- ----------------------------
-- Table structure for abpauditlogactions
-- ----------------------------
DROP TABLE IF EXISTS `abpauditlogactions`;
CREATE TABLE `abpauditlogactions`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `AuditLogId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ServiceName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `MethodName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Parameters` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ExecutionTime` datetime(6) NOT NULL,
  `ExecutionDuration` int NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AbpAuditLogActions_AuditLogId`(`AuditLogId` ASC) USING BTREE,
  INDEX `IX_AbpAuditLogActions_TenantId_ServiceName_MethodName_Execution~`(`TenantId` ASC, `ServiceName` ASC, `MethodName` ASC, `ExecutionTime` ASC) USING BTREE,
  CONSTRAINT `FK_AbpAuditLogActions_AbpAuditLogs_AuditLogId` FOREIGN KEY (`AuditLogId`) REFERENCES `abpauditlogs` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpauditlogactions
-- ----------------------------
INSERT INTO `abpauditlogactions` VALUES ('3a1631ac-5965-f2ab-3fe7-507828dc7fb4', NULL, '3a1631ac-5965-98bb-4451-67e2a20c499b', 'Volo.Abp.Account.Web.Pages.Account.LoginModel', 'OnPostAsync', '{\"action\":\"Login\"}', '2024-11-12 16:31:07.404191', 2764, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a1736c4-f2bb-c12e-a0f1-cfc91e21c2c6', NULL, '3a1736c4-f2ba-cd5b-2482-d3093bb16628', 'Volo.Abp.Account.Web.Pages.Account.LoginModel', 'OnPostAsync', '{\"action\":\"Login\"}', '2025-01-02 09:12:57.762079', 357785, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a1736c7-7450-e27e-a2cf-dfb37cbe6b10', NULL, '3a1736c7-7450-7250-c2e2-7dd1eee1c27d', 'Volo.Abp.Account.Web.Pages.Account.LoginModel', 'OnPostAsync', '{\"action\":\"Login\"}', '2025-01-02 09:21:38.531046', 1345, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a17999c-edcc-3c17-21cb-d020dafc296d', NULL, '3a17999c-edcc-974f-5ea5-88e356deb25f', 'Volo.Abp.Account.Web.Pages.Account.LoginModel', 'OnPostAsync', '{\"action\":\"Login\"}', '2025-01-21 13:53:49.053071', 228248, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a17999e-5985-db2c-383f-2af21b4ea68f', NULL, '3a17999e-5985-f013-c156-2d687c1dc4ce', 'Volo.Abp.Account.Web.Pages.Account.LoginModel', 'OnPostAsync', '{\"action\":\"Login\"}', '2025-01-21 13:59:01.693742', 8773, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a17999f-3804-803d-279e-2690ed5af6b7', NULL, '3a17999f-3804-51ac-a352-8ab8a2adc415', 'Volo.Abp.Account.Web.Pages.Account.LoginModel', 'OnPostAsync', '{\"action\":\"Login\"}', '2025-01-21 14:00:05.973260', 1382, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a1799a0-6b39-06d4-1ada-ea9547244427', NULL, '3a1799a0-6b38-537f-39db-7ced67848cb2', 'Volo.Abp.Account.Web.Pages.Account.LoginModel', 'OnPostAsync', '{\"action\":\"Login\"}', '2025-01-21 14:00:56.751367', 29273, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a1799a3-1ad6-9d40-dfd2-cc7dce01f2f7', NULL, '3a1799a3-1ad6-1465-d4a5-f6b377b143dc', 'Volo.Abp.Account.Web.Pages.Account.LoginModel', 'OnPostAsync', '{\"action\":\"Login\"}', '2025-01-21 14:04:09.746954', 12351, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a1799a4-c563-8cd1-509d-c0a57f803e75', NULL, '3a1799a4-c563-6b7b-deb1-6aad2dec04e5', 'Volo.Abp.Account.Web.Pages.Account.LoginModel', 'OnPostAsync', '{\"action\":\"Login\"}', '2025-01-21 14:05:27.046951', 44250, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a1799dd-b23a-b0e9-2be3-5305e86b661b', NULL, '3a1799dd-b22b-38f5-29da-f82be3007ee0', 'Volo.Abp.Account.Web.Pages.Account.LoginModel', 'OnPostAsync', '{\"action\":\"Login\"}', '2025-01-21 14:18:20.378194', 2998194, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a1799e5-a215-204e-9a67-6ba7545cf031', NULL, '3a1799e5-a214-d2c6-f8d4-451a8ea39f29', 'Volo.Abp.Account.Web.Pages.Account.LoginModel', 'OnPostAsync', '{\"action\":\"Login\"}', '2025-01-21 15:16:45.522382', 16520, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a179a2d-3037-f807-1606-e9fe732ea845', NULL, '3a179a2d-3036-96dd-2a83-ca02f9a01d65', 'Volo.Abp.Account.Web.Pages.Account.LoginModel', 'OnPostAsync', '{\"action\":\"Login\"}', '2025-01-21 16:34:44.155511', 27369, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a179a44-b424-0d9b-d0b9-9aa273091b3f', NULL, '3a179a44-b423-6cc5-bc76-c1c3b48eb80b', 'Volo.Abp.Account.Web.Pages.Account.LoginModel', 'OnPostAsync', '{\"action\":\"Login\"}', '2025-01-21 17:00:51.598490', 1036, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a17a323-4cd1-86b2-053e-4580c0888b15', NULL, '3a17a323-4cd1-e1c2-f9c7-2d8bf8d64924', 'Volo.Abp.OpenIddict.Controllers.TokenController', 'HandleAsync', '{}', '2025-01-23 10:20:56.445116', 1744, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a17a323-4e9c-699a-4f70-7dfa46849b7a', NULL, '3a17a323-4e9c-15f0-8921-379d6e3b5cdb', 'Volo.Abp.AspNetCore.Mvc.UI.Theme.Shared.Controllers.ErrorController', 'Index', '{}', '2025-01-23 10:20:58.762983', 3, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a17a32a-2a1f-71d5-7d7e-6433d6d83061', NULL, '3a17a32a-2a1c-9523-7ca5-11423a505da1', 'Volo.Abp.OpenIddict.Controllers.TokenController', 'HandleAsync', '{}', '2025-01-23 10:27:40.553979', 41572, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a17a32f-0bd6-0595-d19f-36ad24924cfc', NULL, '3a17a32f-0bd6-bc21-0b7d-bfc37593acff', 'Volo.Abp.OpenIddict.Controllers.TokenController', 'HandleAsync', '{}', '2025-01-23 10:33:43.366474', 3732, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a17a335-0639-d16a-7ebe-222fd1239453', NULL, '3a17a335-0639-60bc-bdb7-38c6c4026dcb', 'Volo.Abp.OpenIddict.Controllers.TokenController', 'HandleAsync', '{}', '2025-01-23 10:40:19.283201', 432, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a17a338-f355-2e41-7ab4-13ab854f5116', NULL, '3a17a338-f355-553c-b91a-cdf959c71b83', 'Volo.Abp.OpenIddict.Controllers.TokenController', 'HandleAsync', '{}', '2025-01-23 10:44:36.588969', 295, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a17a33a-277e-0b1f-a335-b24301340d99', NULL, '3a17a33a-277e-2fe7-6864-3604798944c8', 'Volo.Abp.OpenIddict.Controllers.TokenController', 'HandleAsync', '{}', '2025-01-23 10:45:14.371351', 40880, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a17a33a-5fa4-a157-6efd-72a49537844a', NULL, '3a17a33a-5fa4-306d-ca71-f7e9463cb882', 'Volo.Abp.OpenIddict.Controllers.TokenController', 'HandleAsync', '{}', '2025-01-23 10:46:09.816913', 399, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a17a33a-6fbf-32cb-efe4-cf9004adccd5', NULL, '3a17a33a-6fbf-0c05-3c19-c0fa64f88b28', 'Volo.Abp.OpenIddict.Controllers.TokenController', 'HandleAsync', '{}', '2025-01-23 10:46:13.652781', 364, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a17a33d-1d63-b430-397c-4ce1da303ee8', NULL, '3a17a33d-1d63-9276-5e2a-e3e9ea0fc334', 'Volo.Abp.OpenIddict.Controllers.TokenController', 'HandleAsync', '{}', '2025-01-23 10:46:27.809071', 107058, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a17a33d-49f2-f15f-e822-c3849b5041fa', NULL, '3a17a33d-49f2-607a-99cc-fbd52ca75dd5', 'Volo.Abp.OpenIddict.Controllers.TokenController', 'HandleAsync', '{}', '2025-01-23 10:49:14.717710', 6537, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a17a341-5842-168e-49c6-3197b83b6ecd', NULL, '3a17a341-5841-4e38-c339-44981c59cf77', 'Volo.Abp.OpenIddict.Controllers.TokenController', 'HandleAsync', '{}', '2025-01-23 10:53:21.387757', 25577, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a17a354-a8b7-f3d7-6b8e-efeb42d1067d', NULL, '3a17a354-a8b7-4a45-f2ab-d4a3044d8969', 'Volo.Abp.Account.Web.Pages.Account.LoginModel', 'OnPostAsync', '{\"action\":\"Login\"}', '2025-01-23 11:14:51.347289', 1880, '{}');
INSERT INTO `abpauditlogactions` VALUES ('3a17a354-d0b9-0c85-5e22-385f0bf76557', NULL, '3a17a354-d0b9-ba9a-12b3-29e2475662ed', 'Volo.Abp.OpenIddict.Controllers.TokenController', 'HandleAsync', '{}', '2025-01-23 11:15:00.067024', 647, '{}');

-- ----------------------------
-- Table structure for abpauditlogs
-- ----------------------------
DROP TABLE IF EXISTS `abpauditlogs`;
CREATE TABLE `abpauditlogs`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ApplicationName` varchar(96) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `TenantName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ImpersonatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `ImpersonatorUserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ImpersonatorTenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `ImpersonatorTenantName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ExecutionTime` datetime(6) NOT NULL,
  `ExecutionDuration` int NOT NULL,
  `ClientIpAddress` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ClientName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ClientId` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CorrelationId` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `BrowserInfo` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `HttpMethod` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Exceptions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Comments` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `HttpStatusCode` int NULL DEFAULT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AbpAuditLogs_TenantId_ExecutionTime`(`TenantId` ASC, `ExecutionTime` ASC) USING BTREE,
  INDEX `IX_AbpAuditLogs_TenantId_UserId_ExecutionTime`(`TenantId` ASC, `UserId` ASC, `ExecutionTime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpauditlogs
-- ----------------------------
INSERT INTO `abpauditlogs` VALUES ('3a1631ac-5965-98bb-4451-67e2a20c499b', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-12 16:31:07.375260', 2799, '::1', NULL, NULL, '189341a46e7445c0a537f08156aae84b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'POST', '/Account/Login', NULL, '', 302, '{}', 'eccd8b04356944d98fd51bed13ab40a5');
INSERT INTO `abpauditlogs` VALUES ('3a1736c4-f2ba-cd5b-2482-d3093bb16628', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-02 09:12:57.733887', 357928, '::1', NULL, NULL, '4766a4ea53e24771a3937615e0dd857d', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'POST', '/Account/Login', '[\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"对不起，在处理您的请求期间产生了一个服务器内部错误！！\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  }\r\n]', '', 500, '{}', '5ba9c66389e642e9a572374869c98b3b');
INSERT INTO `abpauditlogs` VALUES ('3a1736c7-7450-7250-c2e2-7dd1eee1c27d', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-02 09:21:38.491519', 1405, '::1', NULL, NULL, '324e7395ae7e4d058fc9474bb7a827cb', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'POST', '/Account/Login', '[\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"对不起，在处理您的请求期间产生了一个服务器内部错误！！\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  }\r\n]', '', 500, '{}', '11e0924428504edcae4a6e2a48ab9fdf');
INSERT INTO `abpauditlogs` VALUES ('3a17999c-edcc-974f-5ea5-88e356deb25f', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-21 13:53:49.031196', 228310, '::1', NULL, NULL, '853d6ba45e6c4ce5b2a08d5f14c635a8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'POST', '/Account/Login', '[\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"对不起，在处理您的请求期间产生了一个服务器内部错误！！\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  }\r\n]', '', 500, '{}', '0e9a0ea11f1d4321bed3c3966683ecc2');
INSERT INTO `abpauditlogs` VALUES ('3a17999e-5985-f013-c156-2d687c1dc4ce', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-21 13:59:01.682489', 8786, '::1', NULL, NULL, 'd7c37a60cd454542a078606ab43eff50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'POST', '/Account/Login', '[\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"对不起，在处理您的请求期间产生了一个服务器内部错误！！\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  }\r\n]', '', 500, '{}', '0f2ac10030dc4e359fa52e0a213705bb');
INSERT INTO `abpauditlogs` VALUES ('3a17999f-3804-51ac-a352-8ab8a2adc415', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-21 14:00:05.941701', 1473, '::1', NULL, NULL, '318cb379ccda4249a92aa8b68bcdf5cd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'POST', '/Account/Login', '[\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"对不起，在处理您的请求期间产生了一个服务器内部错误！！\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  }\r\n]', '', 500, '{}', '2b26b70a0d4e42509c75af2de7a9f946');
INSERT INTO `abpauditlogs` VALUES ('3a1799a0-6b38-537f-39db-7ced67848cb2', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-21 14:00:56.713405', 29343, '::1', NULL, NULL, '882b683b69924ee5a75086d55f77d531', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'POST', '/Account/Login', '[\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"对不起，在处理您的请求期间产生了一个服务器内部错误！！\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  }\r\n]', '', 500, '{}', '713175b8024a4205bfd631080b087aa0');
INSERT INTO `abpauditlogs` VALUES ('3a1799a3-1ad6-1465-d4a5-f6b377b143dc', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-21 14:04:09.737547', 12364, '::1', NULL, NULL, 'c6feca215cea4fb593c0260a1f0caa98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'POST', '/Account/Login', '[\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"对不起，在处理您的请求期间产生了一个服务器内部错误！！\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  }\r\n]', '', 500, '{}', '332b515f76d9423494e47d992b95efd6');
INSERT INTO `abpauditlogs` VALUES ('3a1799a4-c563-6b7b-deb1-6aad2dec04e5', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-21 14:05:27.038073', 44261, '::1', NULL, NULL, '6d19e6ace2e244529122817e8c04be78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'POST', '/Account/Login', '[\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"对不起，在处理您的请求期间产生了一个服务器内部错误！！\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  }\r\n]', '', 500, '{}', '6f2e69f56071406c82b30e325d3ed3d3');
INSERT INTO `abpauditlogs` VALUES ('3a1799dd-b22b-38f5-29da-f82be3007ee0', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-21 14:18:20.353503', 3000631, '::1', NULL, NULL, '4449f099f7d647d891683baed56fb5f0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'POST', '/Account/Login', '[\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"对不起，在处理您的请求期间产生了一个服务器内部错误！！\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  }\r\n]', '', 500, '{}', '865c8dfcf8dc459799970a8a5b718d29');
INSERT INTO `abpauditlogs` VALUES ('3a1799e5-a214-d2c6-f8d4-451a8ea39f29', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-21 15:16:45.491318', 16590, '::1', NULL, NULL, 'a778c2b83631447a8e952b885117764f', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'POST', '/Account/Login', '[\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"对不起，在处理您的请求期间产生了一个服务器内部错误！！\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  }\r\n]', '', 500, '{}', 'e8676ff7455b4d0abb62adb2721de294');
INSERT INTO `abpauditlogs` VALUES ('3a179a2d-3036-96dd-2a83-ca02f9a01d65', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-21 16:34:44.132160', 27400, '::1', NULL, NULL, 'ea0bfda4e7f5478983ef99758c44a07f', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'POST', '/Account/Login', NULL, '', 302, '{}', 'ec1565b172bc49aeb8cb1a20bc3b0c2a');
INSERT INTO `abpauditlogs` VALUES ('3a179a44-b423-6cc5-bc76-c1c3b48eb80b', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-21 17:00:51.561841', 1075, '::1', NULL, NULL, '3828f1e52cfd4de8ab7a354cada1ef17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'POST', '/Account/Login', NULL, '', 302, '{}', '2a2090d9696e45f78fb17c932496d9b9');
INSERT INTO `abpauditlogs` VALUES ('3a17a323-4cd1-e1c2-f9c7-2d8bf8d64924', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-23 10:20:56.410172', 2025, '::1', NULL, NULL, '713db8f1e1c2409cb02911c7f0495b87', 'Apifox/1.0.0 (https://apifox.com)', 'POST', '/connect/token', '[\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"An internal error occurred during your request!\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  },\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"The data you have submitted has already been changed by another user. Discard your changes and try again.\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  }\r\n]', '', 409, '{}', 'c84151967791410abfb7ac85cf3553a8');
INSERT INTO `abpauditlogs` VALUES ('3a17a323-4e9c-15f0-8921-379d6e3b5cdb', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-23 10:20:58.744497', 164, '::1', NULL, NULL, '713db8f1e1c2409cb02911c7f0495b87', 'Apifox/1.0.0 (https://apifox.com)', 'POST', '/Error', '[\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"An internal error occurred during your request!\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  }\r\n]', '', 500, '{}', '58ae96d01ccc43aba8393a344d4824b2');
INSERT INTO `abpauditlogs` VALUES ('3a17a32a-2a1c-9523-7ca5-11423a505da1', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-23 10:27:40.538771', 47746, '::1', NULL, NULL, '993edd1834b64dd996bb88dbb791a51b', 'Apifox/1.0.0 (https://apifox.com)', 'POST', '/connect/token', '[\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"An internal error occurred during your request!\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  },\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"The data you have submitted has already been changed by another user. Discard your changes and try again.\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  }\r\n]', '', 409, '{}', 'e2ddab17cfc346cca4f3c9c99dd62c7d');
INSERT INTO `abpauditlogs` VALUES ('3a17a32f-0bd6-bc21-0b7d-bfc37593acff', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-23 10:33:43.357038', 4872, '::1', NULL, NULL, 'fd4db6cf331843fca1032b51a82976de', 'Apifox/1.0.0 (https://apifox.com)', 'POST', '/connect/token', '[\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"An internal error occurred during your request!\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  },\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"The data you have submitted has already been changed by another user. Discard your changes and try again.\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  }\r\n]', '', 409, '{}', 'ff059f12a3e2423fa6b190a8cb322b55');
INSERT INTO `abpauditlogs` VALUES ('3a17a335-0639-60bc-bdb7-38c6c4026dcb', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-23 10:40:19.281236', 744, '::1', NULL, NULL, 'ef53dd9af50245f281f88ae16d87be9b', 'Apifox/1.0.0 (https://apifox.com)', 'POST', '/connect/token', '[\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"An internal error occurred during your request!\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  },\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"The data you have submitted has already been changed by another user. Discard your changes and try again.\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  }\r\n]', '', 409, '{}', '3c1292c003eb4bbb93ffb62ba045a0a2');
INSERT INTO `abpauditlogs` VALUES ('3a17a338-f355-553c-b91a-cdf959c71b83', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-23 10:44:36.586807', 746, '::1', NULL, NULL, '38d0aff6fdce48d2b13f9ed166f6fa52', 'Apifox/1.0.0 (https://apifox.com)', 'POST', '/connect/token', '[\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"An internal error occurred during your request!\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  },\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"The data you have submitted has already been changed by another user. Discard your changes and try again.\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  }\r\n]', '', 409, '{}', 'adf02c41962d4b1eaece24f22f0638e7');
INSERT INTO `abpauditlogs` VALUES ('3a17a33a-277e-2fe7-6864-3604798944c8', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-23 10:45:14.369239', 41853, '::1', NULL, NULL, '52544de0f6ce449abf069089525f18d2', 'Apifox/1.0.0 (https://apifox.com)', 'POST', '/connect/token', '[\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"An internal error occurred during your request!\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  },\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"The data you have submitted has already been changed by another user. Discard your changes and try again.\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  }\r\n]', '', 409, '{}', '5084f77df8864574948cc71346bcaf04');
INSERT INTO `abpauditlogs` VALUES ('3a17a33a-5fa4-306d-ca71-f7e9463cb882', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-23 10:46:09.813744', 782, '::1', NULL, NULL, '7de806e3ded94852a4d68fececfde6e9', 'Apifox/1.0.0 (https://apifox.com)', 'POST', '/connect/token', '[\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"An internal error occurred during your request!\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  },\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"The data you have submitted has already been changed by another user. Discard your changes and try again.\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  }\r\n]', '', 409, '{}', '608eb83cca054fbd88e0ee367703cbd1');
INSERT INTO `abpauditlogs` VALUES ('3a17a33a-6fbf-0c05-3c19-c0fa64f88b28', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-23 10:46:13.650582', 1068, '::1', NULL, NULL, 'ff3a1c45bd5049bf9fb74d88804e5c60', 'Apifox/1.0.0 (https://apifox.com)', 'POST', '/connect/token', '[\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"An internal error occurred during your request!\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  },\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"The data you have submitted has already been changed by another user. Discard your changes and try again.\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  }\r\n]', '', 409, '{}', '5201217872c34796bf36a63b3f71dc56');
INSERT INTO `abpauditlogs` VALUES ('3a17a33d-1d63-9276-5e2a-e3e9ea0fc334', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-23 10:46:27.806851', 162436, '::1', NULL, NULL, '3b0c1bbda2d3475cb24481bd1a61dbbe', 'Apifox/1.0.0 (https://apifox.com)', 'POST', '/connect/token', '[\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"An internal error occurred during your request!\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  },\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"The data you have submitted has already been changed by another user. Discard your changes and try again.\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  }\r\n]', '', 409, '{}', 'ed9e6ebab704494281adc661129603d4');
INSERT INTO `abpauditlogs` VALUES ('3a17a33d-49f2-607a-99cc-fbd52ca75dd5', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-23 10:49:14.715967', 6934, '::1', NULL, NULL, 'efefb31a2dd84feaa49bb2a64ebc5e91', 'Apifox/1.0.0 (https://apifox.com)', 'POST', '/connect/token', '[\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"An internal error occurred during your request!\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  },\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"The data you have submitted has already been changed by another user. Discard your changes and try again.\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  }\r\n]', '', 409, '{}', '0e8359111a894baaa9e4b5b50ee2c117');
INSERT INTO `abpauditlogs` VALUES ('3a17a341-5841-4e38-c339-44981c59cf77', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-23 10:53:21.381195', 26062, '::1', NULL, NULL, '73f4b5ec280748659026bb742abecef2', 'Apifox/1.0.0 (https://apifox.com)', 'POST', '/connect/token', '[\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"An internal error occurred during your request!\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  },\r\n  {\r\n    \"code\": null,\r\n    \"message\": \"The data you have submitted has already been changed by another user. Discard your changes and try again.\",\r\n    \"details\": null,\r\n    \"data\": null,\r\n    \"validationErrors\": null\r\n  }\r\n]', '', 409, '{}', '50383bd87a434757b214222e116f5155');
INSERT INTO `abpauditlogs` VALUES ('3a17a354-a8b7-4a45-f2ab-d4a3044d8969', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-23 11:14:51.307374', 1926, '::1', NULL, NULL, '51ca307eab73453e8ef8d9a62615224e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'POST', '/Account/Login', NULL, '', 302, '{}', 'd7a76b7a78ed40b18d882c548c13aaba');
INSERT INTO `abpauditlogs` VALUES ('3a17a354-d0b9-ba9a-12b3-29e2475662ed', 'AuthServer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-23 11:15:00.061615', 3419, '::1', NULL, NULL, '1168b048135247febee951ee7e0d9b5d', 'Apifox/1.0.0 (https://apifox.com)', 'POST', '/connect/token', NULL, '', 200, '{}', 'f5f8e8298d4b42c2a4bee6735905ebbd');

-- ----------------------------
-- Table structure for abpbackgroundjobs
-- ----------------------------
DROP TABLE IF EXISTS `abpbackgroundjobs`;
CREATE TABLE `abpbackgroundjobs`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `JobName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `JobArgs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TryCount` smallint NOT NULL DEFAULT 0,
  `CreationTime` datetime(6) NOT NULL,
  `NextTryTime` datetime(6) NOT NULL,
  `LastTryTime` datetime(6) NULL DEFAULT NULL,
  `IsAbandoned` tinyint(1) NOT NULL DEFAULT 0,
  `Priority` tinyint UNSIGNED NOT NULL DEFAULT 15,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AbpBackgroundJobs_IsAbandoned_NextTryTime`(`IsAbandoned` ASC, `NextTryTime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpbackgroundjobs
-- ----------------------------

-- ----------------------------
-- Table structure for abpblobcontainers
-- ----------------------------
DROP TABLE IF EXISTS `abpblobcontainers`;
CREATE TABLE `abpblobcontainers`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AbpBlobContainers_TenantId_Name`(`TenantId` ASC, `Name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of abpblobcontainers
-- ----------------------------

-- ----------------------------
-- Table structure for abpblobs
-- ----------------------------
DROP TABLE IF EXISTS `abpblobs`;
CREATE TABLE `abpblobs`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ContainerId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Content` longblob NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AbpBlobs_ContainerId`(`ContainerId` ASC) USING BTREE,
  INDEX `IX_AbpBlobs_TenantId_ContainerId_Name`(`TenantId` ASC, `ContainerId` ASC, `Name` ASC) USING BTREE,
  CONSTRAINT `FK_AbpBlobs_AbpBlobContainers_ContainerId` FOREIGN KEY (`ContainerId`) REFERENCES `abpblobcontainers` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of abpblobs
-- ----------------------------

-- ----------------------------
-- Table structure for abpclaimtypes
-- ----------------------------
DROP TABLE IF EXISTS `abpclaimtypes`;
CREATE TABLE `abpclaimtypes`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Required` tinyint(1) NOT NULL,
  `IsStatic` tinyint(1) NOT NULL,
  `Regex` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `RegexDescription` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ValueType` int NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpclaimtypes
-- ----------------------------

-- ----------------------------
-- Table structure for abpdepartment
-- ----------------------------
DROP TABLE IF EXISTS `abpdepartment`;
CREATE TABLE `abpdepartment`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ShortName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `DepartmentTypeId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `HospitalZone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Building` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Floor` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `RoomNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Capacity` int NOT NULL,
  `Phone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `HeadOfDepartment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `HeadOfDepartmentPhone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `HeadOfDepartmentEmail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Website` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ServicesOffered` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `EmergencyContact` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `EmergencyPhone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `DeletionTime` datetime(6) NULL DEFAULT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Pinyin` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PinyinFirstLetters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Status` int NOT NULL,
  `Sort` int NOT NULL,
  `CreatorName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ModificationName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `DeletionName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Describe` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `OrganizationId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AbpDepartment_DepartmentTypeId`(`DepartmentTypeId` ASC) USING BTREE,
  CONSTRAINT `FK_AbpDepartment_DepartmentType_DepartmentTypeId` FOREIGN KEY (`DepartmentTypeId`) REFERENCES `departmenttype` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpdepartment
-- ----------------------------

-- ----------------------------
-- Table structure for abpdoctor
-- ----------------------------
DROP TABLE IF EXISTS `abpdoctor`;
CREATE TABLE `abpdoctor`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `AccountNo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Education` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `MedicalSchool` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Major` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `GraduationDate` datetime(6) NULL DEFAULT NULL,
  `Avatar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `PracticeLicenseNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `PracticeScope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `PracticeValidityDate` datetime(6) NULL DEFAULT NULL,
  `PracticeExperience` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `WorkAgeLimit` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Specialization` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ResearchResult` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ProfessionalClassify` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `EvaluateClassify` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `WorkClassify` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `PracticeClassify` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `PeculiarityClassify` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ScopeClassify` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `OccupationClassify` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `DeletionTime` datetime(6) NULL DEFAULT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Pinyin` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PinyinFirstLetters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Status` int NOT NULL,
  `Sort` int NOT NULL,
  `CreatorName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ModificationName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `DeletionName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Describe` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `OrganizationId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `NationCode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ProvinceCode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `CityCode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `DistrictCode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Street` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `AddressLine` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Year` int NULL DEFAULT NULL,
  `Month` int NULL DEFAULT NULL,
  `Day` int NULL DEFAULT NULL,
  `IdCardType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `IdCardNo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Gender` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Birthday` datetime(6) NULL DEFAULT NULL,
  `Phone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Doctor' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpdoctor
-- ----------------------------

-- ----------------------------
-- Table structure for abpentitychanges
-- ----------------------------
DROP TABLE IF EXISTS `abpentitychanges`;
CREATE TABLE `abpentitychanges`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `AuditLogId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `ChangeTime` datetime(6) NOT NULL,
  `ChangeType` tinyint UNSIGNED NOT NULL,
  `EntityTenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `EntityId` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `EntityTypeFullName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AbpEntityChanges_AuditLogId`(`AuditLogId` ASC) USING BTREE,
  INDEX `IX_AbpEntityChanges_TenantId_EntityTypeFullName_EntityId`(`TenantId` ASC, `EntityTypeFullName` ASC, `EntityId` ASC) USING BTREE,
  CONSTRAINT `FK_AbpEntityChanges_AbpAuditLogs_AuditLogId` FOREIGN KEY (`AuditLogId`) REFERENCES `abpauditlogs` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpentitychanges
-- ----------------------------

-- ----------------------------
-- Table structure for abpentitypropertychanges
-- ----------------------------
DROP TABLE IF EXISTS `abpentitypropertychanges`;
CREATE TABLE `abpentitypropertychanges`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `EntityChangeId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `NewValue` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `OriginalValue` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `PropertyName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PropertyTypeFullName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AbpEntityPropertyChanges_EntityChangeId`(`EntityChangeId` ASC) USING BTREE,
  CONSTRAINT `FK_AbpEntityPropertyChanges_AbpEntityChanges_EntityChangeId` FOREIGN KEY (`EntityChangeId`) REFERENCES `abpentitychanges` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpentitypropertychanges
-- ----------------------------

-- ----------------------------
-- Table structure for abpfeaturegroups
-- ----------------------------
DROP TABLE IF EXISTS `abpfeaturegroups`;
CREATE TABLE `abpfeaturegroups`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DisplayName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_AbpFeatureGroups_Name`(`Name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpfeaturegroups
-- ----------------------------
INSERT INTO `abpfeaturegroups` VALUES ('3a14d1e4-896c-8768-0794-09cda504c2f4', 'SettingManagement', 'L:AbpSettingManagement,Feature:SettingManagementGroup', '{}');

-- ----------------------------
-- Table structure for abpfeatures
-- ----------------------------
DROP TABLE IF EXISTS `abpfeatures`;
CREATE TABLE `abpfeatures`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `GroupName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ParentName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DisplayName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DefaultValue` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `IsVisibleToClients` tinyint(1) NOT NULL,
  `IsAvailableToHost` tinyint(1) NOT NULL,
  `AllowedProviders` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ValueType` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_AbpFeatures_Name`(`Name` ASC) USING BTREE,
  INDEX `IX_AbpFeatures_GroupName`(`GroupName` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpfeatures
-- ----------------------------
INSERT INTO `abpfeatures` VALUES ('3a14d1e4-8970-6da2-86b6-4d091abd5fed', 'SettingManagement', 'SettingManagement.Enable', NULL, 'L:AbpSettingManagement,Feature:SettingManagementEnable', 'L:AbpSettingManagement,Feature:SettingManagementEnableDescription', 'true', 1, 0, NULL, '{\"name\":\"ToggleStringValueType\",\"properties\":{},\"validator\":{\"name\":\"BOOLEAN\",\"properties\":{}}}', '{}');
INSERT INTO `abpfeatures` VALUES ('3a14d1e4-8983-82c1-f11f-e61f7f35397e', 'SettingManagement', 'SettingManagement.AllowChangingEmailSettings', 'SettingManagement.Enable', 'L:AbpSettingManagement,Feature:AllowChangingEmailSettings', NULL, 'false', 1, 0, NULL, '{\"name\":\"ToggleStringValueType\",\"properties\":{},\"validator\":{\"name\":\"BOOLEAN\",\"properties\":{}}}', '{}');

-- ----------------------------
-- Table structure for abpfeaturevalues
-- ----------------------------
DROP TABLE IF EXISTS `abpfeaturevalues`;
CREATE TABLE `abpfeaturevalues`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ProviderKey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_AbpFeatureValues_Name_ProviderName_ProviderKey`(`Name` ASC, `ProviderName` ASC, `ProviderKey` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpfeaturevalues
-- ----------------------------

-- ----------------------------
-- Table structure for abpfiles
-- ----------------------------
DROP TABLE IF EXISTS `abpfiles`;
CREATE TABLE `abpfiles`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Md5` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Extension` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Size` bigint NOT NULL,
  `Path` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProjectName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `EntityVersion` int NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `DeletionTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_Abpfiles_Md5`(`Md5` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpfiles
-- ----------------------------

-- ----------------------------
-- Table structure for abpfilesprojectname
-- ----------------------------
DROP TABLE IF EXISTS `abpfilesprojectname`;
CREATE TABLE `abpfilesprojectname`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ProjectName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `EntityVersion` int NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `DeletionTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AbpFilesProjectName_ProjectName`(`ProjectName` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpfilesprojectname
-- ----------------------------
INSERT INTO `abpfilesprojectname` VALUES ('3a14d1eb-3177-fb1f-a227-39939d6d72e3', 'omg', NULL, 0, '{}', '36068534aa8f425f9a1bb8e8153b42da', '2024-09-05 09:13:28.719323', NULL, NULL, NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for abpfileswhitelist
-- ----------------------------
DROP TABLE IF EXISTS `abpfileswhitelist`;
CREATE TABLE `abpfileswhitelist`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Extension` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `EntityVersion` int NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `DeletionTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AbpFilesWhiteList_Extension`(`Extension` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpfileswhitelist
-- ----------------------------
INSERT INTO `abpfileswhitelist` VALUES ('3a14d1eb-3155-fb49-c016-923d056e3901', '.png', NULL, 0, '{}', '247327a7daa740d68047699f77ff86ed', '2024-09-05 09:13:28.685538', NULL, NULL, NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for abplinkusers
-- ----------------------------
DROP TABLE IF EXISTS `abplinkusers`;
CREATE TABLE `abplinkusers`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `SourceUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `SourceTenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `TargetUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TargetTenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_AbpLinkUsers_SourceUserId_SourceTenantId_TargetUserId_Target~`(`SourceUserId` ASC, `SourceTenantId` ASC, `TargetUserId` ASC, `TargetTenantId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abplinkusers
-- ----------------------------

-- ----------------------------
-- Table structure for abporganizationunitroles
-- ----------------------------
DROP TABLE IF EXISTS `abporganizationunitroles`;
CREATE TABLE `abporganizationunitroles`  (
  `RoleId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `OrganizationUnitId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`OrganizationUnitId`, `RoleId`) USING BTREE,
  INDEX `IX_AbpOrganizationUnitRoles_RoleId_OrganizationUnitId`(`RoleId` ASC, `OrganizationUnitId` ASC) USING BTREE,
  CONSTRAINT `FK_AbpOrganizationUnitRoles_AbpOrganizationUnits_OrganizationUn~` FOREIGN KEY (`OrganizationUnitId`) REFERENCES `abporganizationunits` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_AbpOrganizationUnitRoles_AbpRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `abproles` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abporganizationunitroles
-- ----------------------------

-- ----------------------------
-- Table structure for abporganizationunits
-- ----------------------------
DROP TABLE IF EXISTS `abporganizationunits`;
CREATE TABLE `abporganizationunits`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `ParentId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `Code` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DisplayName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `EntityVersion` int NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `DeletionTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AbpOrganizationUnits_Code`(`Code` ASC) USING BTREE,
  INDEX `IX_AbpOrganizationUnits_ParentId`(`ParentId` ASC) USING BTREE,
  CONSTRAINT `FK_AbpOrganizationUnits_AbpOrganizationUnits_ParentId` FOREIGN KEY (`ParentId`) REFERENCES `abporganizationunits` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abporganizationunits
-- ----------------------------

-- ----------------------------
-- Table structure for abppermissiongrants
-- ----------------------------
DROP TABLE IF EXISTS `abppermissiongrants`;
CREATE TABLE `abppermissiongrants`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderKey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_AbpPermissionGrants_TenantId_Name_ProviderName_ProviderKey`(`TenantId` ASC, `Name` ASC, `ProviderName` ASC, `ProviderKey` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abppermissiongrants
-- ----------------------------
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2973-a576-e3e6-0b51626971b1', NULL, 'AbpIdentity.Roles', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-297f-1720-4083-42333a727eae', NULL, 'AbpIdentity.Roles.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2980-9652-88db-95e90ef38604', NULL, 'AbpIdentity.Roles.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2980-f22f-247e-0a69c9716ca1', NULL, 'AbpIdentity.Roles.ManagePermissions', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2980-6fee-1e67-073b224a8905', NULL, 'AbpIdentity.Roles.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2980-d3ee-3100-c7537718bc0d', NULL, 'AbpIdentity.Users', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2980-266f-fe83-1ad18d5c3cc6', NULL, 'AbpIdentity.Users.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2981-2024-9f5f-3b9eff5d27e6', NULL, 'AbpIdentity.Users.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2981-0ef1-d8b2-e164555dbddf', NULL, 'AbpIdentity.Users.ManagePermissions', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2981-430c-a5bd-cfaead02641a', NULL, 'AbpIdentity.Users.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2981-2f72-1722-252ca9fb1a85', NULL, 'AbpIdentity.Users.Update.ManageRoles', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2982-9f1d-63db-dd19c5b4df75', NULL, 'AbpTenantManagement.Tenants', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2982-a26b-3d84-96726c79c006', NULL, 'AbpTenantManagement.Tenants.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2982-73d5-253b-ecbee5e0eb2a', NULL, 'AbpTenantManagement.Tenants.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2982-992e-fda3-ca2509e930df', NULL, 'AbpTenantManagement.Tenants.ManageConnectionStrings', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2982-0657-368b-94b6d8578d01', NULL, 'AbpTenantManagement.Tenants.ManageFeatures', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2982-d4ca-f393-8b6e2337af4c', NULL, 'AbpTenantManagement.Tenants.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2981-cba4-779d-956757631268', NULL, 'FeatureManagement.ManageHostFeatures', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2987-c079-4dd9-09687c141e84', NULL, 'Panda.Net.Basic.AllAgent', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2988-051b-40b3-f0ae203085d3', NULL, 'Panda.Net.Basic.AllMerchant', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2986-d85a-e2d0-30fb1bbb4d09', NULL, 'Panda.Net.Basic.Announcements', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2986-82e9-7187-58e23c2fa028', NULL, 'Panda.Net.Basic.Announcements.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2986-6eb1-361d-9e38dae3fa19', NULL, 'Panda.Net.Basic.Announcements.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2986-1afa-9ba1-6d51b6652d66', NULL, 'Panda.Net.Basic.Announcements.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2984-1656-95be-64a41d327660', NULL, 'Panda.Net.Basic.Menus', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2984-7fe7-e9ef-523be766e0ea', NULL, 'Panda.Net.Basic.Menus.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2984-6b71-a7f5-586286c8eeff', NULL, 'Panda.Net.Basic.Menus.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2984-f98c-29f7-19183a32f4e9', NULL, 'Panda.Net.Basic.Menus.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2985-5110-1cf1-ac40c932c67f', NULL, 'Panda.Net.Basic.Organizations', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2985-150c-3427-57f8876a2541', NULL, 'Panda.Net.Basic.Organizations.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2985-a19a-64d5-fe5887a81900', NULL, 'Panda.Net.Basic.Organizations.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2985-2864-8a8f-d41f0e6e85d8', NULL, 'Panda.Net.Basic.Organizations.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2983-cec6-ff79-98d69c7f99d8', NULL, 'Panda.Net.Basic.Roles', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2983-180a-2b84-74314b6d3f68', NULL, 'Panda.Net.Basic.Roles.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2983-f0be-81d4-dbd0289cab50', NULL, 'Panda.Net.Basic.Roles.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2983-0907-28c9-b91d1c36a0ae', NULL, 'Panda.Net.Basic.Roles.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2985-a24f-50a2-053b454f31fe', NULL, 'Panda.Net.Basic.Tenants', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2985-003e-22a4-f489444233f3', NULL, 'Panda.Net.Basic.Tenants.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2986-f102-2e31-ada9601a444c', NULL, 'Panda.Net.Basic.Tenants.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2985-5c33-c561-0c7cdc9a3d64', NULL, 'Panda.Net.Basic.Tenants.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2983-870b-4622-06489ab8761b', NULL, 'Panda.Net.Basic.Users', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2983-9e96-5cff-1cd82f4abcc3', NULL, 'Panda.Net.Basic.Users.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2984-786b-5664-f584585de667', NULL, 'Panda.Net.Basic.Users.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2983-f30b-293d-8328fbd8745e', NULL, 'Panda.Net.Basic.Users.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2987-a193-2c79-1222b85aa43f', NULL, 'Panda.Net.Basic.WorkFlowCreates', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2986-ecdd-9e21-9873de583198', NULL, 'Panda.Net.Basic.WorkFlowList', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2987-47b5-0634-ef0830d1db7d', NULL, 'Panda.Net.Basic.WorkFlowList.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2987-e8e2-4aa7-2a47a37e949d', NULL, 'Panda.Net.Basic.WorkFlowList.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2987-4709-3cf3-69a209f8bc54', NULL, 'Panda.Net.Basic.WorkFlowList.Start', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2987-1f51-2f79-e3e8b9d8b4ed', NULL, 'Panda.Net.Basic.WorkFlowList.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2981-125c-59f8-90dd4f3b965f', NULL, 'SettingManagement.Emailing', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2981-9a86-5f39-b50a9da320b7', NULL, 'SettingManagement.Emailing.Test', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a14d1eb-2982-216b-162e-a5a3b6a483af', NULL, 'SettingManagement.TimeZone', 'R', 'admin');

-- ----------------------------
-- Table structure for abppermissiongroups
-- ----------------------------
DROP TABLE IF EXISTS `abppermissiongroups`;
CREATE TABLE `abppermissiongroups`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DisplayName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_AbpPermissionGroups_Name`(`Name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abppermissiongroups
-- ----------------------------
INSERT INTO `abppermissiongroups` VALUES ('3a14d1e4-86c4-fa6b-54b4-560aeabb9c25', 'AbpIdentity', 'L:AbpIdentity,Permission:IdentityManagement', '{}');
INSERT INTO `abppermissiongroups` VALUES ('3a14d1e4-86e3-b703-dadc-b8bfa672c651', 'FeatureManagement', 'L:AbpFeatureManagement,Permission:FeatureManagement', '{}');
INSERT INTO `abppermissiongroups` VALUES ('3a14d1e4-86e3-d402-dc08-bff46652faba', 'SettingManagement', 'L:AbpSettingManagement,Permission:SettingManagement', '{}');
INSERT INTO `abppermissiongroups` VALUES ('3a14d1e4-86ed-8ff6-f842-7663c16f67e7', 'AbpTenantManagement', 'L:AbpTenantManagement,Permission:TenantManagement', '{}');
INSERT INTO `abppermissiongroups` VALUES ('3a14d1e4-86ed-b820-7dd2-a5ac5449aaba', 'Panda.Net.Basic', 'L:Net,DisplayName:Basic', '{\"type\":0,\"path\":\"/basic\",\"icon\":\"basic\"}');

-- ----------------------------
-- Table structure for abppermissions
-- ----------------------------
DROP TABLE IF EXISTS `abppermissions`;
CREATE TABLE `abppermissions`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `GroupName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ParentName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DisplayName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `IsEnabled` tinyint(1) NOT NULL,
  `MultiTenancySide` tinyint UNSIGNED NOT NULL,
  `Providers` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `StateCheckers` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_AbpPermissions_Name`(`Name` ASC) USING BTREE,
  INDEX `IX_AbpPermissions_GroupName`(`GroupName` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abppermissions
-- ----------------------------
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86d9-35bf-10b0-2b8bf2b08279', 'AbpIdentity', 'AbpIdentity.Roles', NULL, 'L:AbpIdentity,Permission:RoleManagement', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86e3-05df-efe3-72b31e482ac2', 'SettingManagement', 'SettingManagement.Emailing', NULL, 'L:AbpSettingManagement,Permission:Emailing', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86e3-2b98-88ba-3ea48d148f95', 'AbpIdentity', 'AbpIdentity.Users.Create', 'AbpIdentity.Users', 'L:AbpIdentity,Permission:Create', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86e3-35ad-cb24-9f1a893b95a1', 'AbpIdentity', 'AbpIdentity.Users.Delete', 'AbpIdentity.Users', 'L:AbpIdentity,Permission:Delete', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86e3-36bf-e62c-163e63e9ac04', 'AbpIdentity', 'AbpIdentity.Roles.Update', 'AbpIdentity.Roles', 'L:AbpIdentity,Permission:Edit', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86e3-5234-3043-f2b475434c49', 'AbpIdentity', 'AbpIdentity.Users.ManagePermissions', 'AbpIdentity.Users', 'L:AbpIdentity,Permission:ChangePermissions', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86e3-618b-2271-6198d5591304', 'AbpIdentity', 'AbpIdentity.Roles.Delete', 'AbpIdentity.Roles', 'L:AbpIdentity,Permission:Delete', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86e3-657a-d0c5-16550bef8e3f', 'FeatureManagement', 'FeatureManagement.ManageHostFeatures', NULL, 'L:AbpFeatureManagement,Permission:FeatureManagement.ManageHostFeatures', 1, 2, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86e3-a324-c76e-ff831d897297', 'AbpIdentity', 'AbpIdentity.Roles.Create', 'AbpIdentity.Roles', 'L:AbpIdentity,Permission:Create', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86e3-b244-532e-20560067ce03', 'AbpIdentity', 'AbpIdentity.Roles.ManagePermissions', 'AbpIdentity.Roles', 'L:AbpIdentity,Permission:ChangePermissions', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86e3-bb23-5f3f-f381713c524e', 'AbpIdentity', 'AbpIdentity.UserLookup', NULL, 'L:AbpIdentity,Permission:UserLookup', 1, 3, 'C', NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86e3-c09d-d2c0-dbb600f4ba77', 'AbpIdentity', 'AbpIdentity.Users', NULL, 'L:AbpIdentity,Permission:UserManagement', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86e3-f275-9a69-c6ab37176448', 'AbpIdentity', 'AbpIdentity.Users.Update', 'AbpIdentity.Users', 'L:AbpIdentity,Permission:Edit', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86e3-fee1-110c-7268d2d71d52', 'AbpIdentity', 'AbpIdentity.Users.Update.ManageRoles', 'AbpIdentity.Users.Update', 'L:AbpIdentity,Permission:ManageRoles', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86ed-174f-a8b2-ce1f318cbee9', 'SettingManagement', 'SettingManagement.TimeZone', NULL, 'L:AbpSettingManagement,Permission:TimeZone', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86ed-2660-581d-68d994793f43', 'AbpTenantManagement', 'AbpTenantManagement.Tenants.ManageFeatures', 'AbpTenantManagement.Tenants', 'L:AbpTenantManagement,Permission:ManageFeatures', 1, 2, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86ed-4587-37d1-d8a1a6a53f63', 'SettingManagement', 'SettingManagement.Emailing.Test', 'SettingManagement.Emailing', 'L:AbpSettingManagement,Permission:EmailingTest', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86ed-4fbb-9c7b-ee99ea6167f6', 'AbpTenantManagement', 'AbpTenantManagement.Tenants', NULL, 'L:AbpTenantManagement,Permission:TenantManagement', 1, 2, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86ed-8f8b-5134-1966df3912df', 'AbpTenantManagement', 'AbpTenantManagement.Tenants.ManageConnectionStrings', 'AbpTenantManagement.Tenants', 'L:AbpTenantManagement,Permission:ManageConnectionStrings', 1, 2, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86ed-a7ec-8696-37c187fc253b', 'AbpTenantManagement', 'AbpTenantManagement.Tenants.Create', 'AbpTenantManagement.Tenants', 'L:AbpTenantManagement,Permission:Create', 1, 2, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86ed-d723-6f4b-10c66d9aee5c', 'AbpTenantManagement', 'AbpTenantManagement.Tenants.Update', 'AbpTenantManagement.Tenants', 'L:AbpTenantManagement,Permission:Edit', 1, 2, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86ed-e25e-d79c-fd0e685bf14b', 'AbpTenantManagement', 'AbpTenantManagement.Tenants.Delete', 'AbpTenantManagement.Tenants', 'L:AbpTenantManagement,Permission:Delete', 1, 2, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f2-473e-e6b8-78fb7e432f0f', 'Panda.Net.Basic', 'Panda.Net.Basic.Roles', NULL, 'L:Net,DisplayName:RoleManagement', 1, 3, 'R', NULL, '{\"type\":1,\"path\":\"/role\",\"icon\":\"role\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-011c-cdba-6e7fda341af6', 'Panda.Net.Basic', 'Panda.Net.Basic.WorkFlowList.Delete', 'Panda.Net.Basic.WorkFlowList', 'L:Net,DisplayName:Delete', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"delete\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-0850-eb73-8d842ee2a503', 'Panda.Net.Basic', 'Panda.Net.Basic.Organizations.Update', 'Panda.Net.Basic.Organizations', 'L:Net,DisplayName:Edit', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"edit\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-0a09-e8e9-24742553f1a3', 'Panda.Net.Basic', 'Panda.Net.Basic.Menus', NULL, 'L:Net,DisplayName:MenuManagement', 1, 3, 'R', NULL, '{\"type\":1,\"path\":\"/user\",\"icon\":\"user\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-45e3-4d85-7c4b32f3fbbc', 'Panda.Net.Basic', 'Panda.Net.Basic.Users.Update', 'Panda.Net.Basic.Users', 'L:Net,DisplayName:Edit', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"edit\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-4c3c-8d85-243fb790a062', 'Panda.Net.Basic', 'Panda.Net.Basic.Roles.Create', 'Panda.Net.Basic.Roles', 'L:Net,DisplayName:Create', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"create\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-4d4f-e7f3-d88b48e08100', 'Panda.Net.Basic', 'Panda.Net.Basic.Roles.Delete', 'Panda.Net.Basic.Roles', 'L:Net,DisplayName:Delete', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"delete\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-5ebc-95d6-97e6b3500a60', 'Panda.Net.Basic', 'Panda.Net.Basic.Organizations.Create', 'Panda.Net.Basic.Organizations', 'L:Net,DisplayName:Create', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"create\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-604d-bb58-11b5630fca7b', 'Panda.Net.Basic', 'Panda.Net.Basic.Users', NULL, 'L:Net,DisplayName:UserManagement', 1, 3, 'R', NULL, '{\"type\":1,\"path\":\"/user\",\"icon\":\"user\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-65a4-ed37-73a27356ea5d', 'Panda.Net.Basic', 'Panda.Net.Basic.WorkFlowList', NULL, 'L:Net,DisplayName:WorkFlowListManagement', 1, 3, 'R', NULL, '{\"type\":1,\"path\":\"workflow-list\",\"icon\":\"workflow\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-6dad-b91c-37e4ded9af0c', 'Panda.Net.Basic', 'Panda.Net.Basic.Organizations', NULL, 'L:Net,DisplayName:OrganizationManagement', 1, 3, 'R', NULL, '{\"type\":1,\"path\":\"/user\",\"icon\":\"user\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-6dd1-c178-e95dabc29dda', 'Panda.Net.Basic', 'Panda.Net.Basic.WorkFlowList.Update', 'Panda.Net.Basic.WorkFlowList', 'L:Net,DisplayName:Edit', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"edit\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-6fe1-5af6-3704b79ec92d', 'Panda.Net.Basic', 'Panda.Net.Basic.AllAgent', NULL, 'L:Net,DisplayName:AgentManagement', 1, 3, 'R', NULL, '{\"type\":1,\"path\":\"agent-all\",\"icon\":\"agent-all\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-701f-86f5-8d864345a4d7', 'Panda.Net.Basic', 'Panda.Net.Basic.Tenants', NULL, 'L:Net,DisplayName:TenantManagement', 1, 3, 'R', NULL, '{\"type\":1,\"path\":\"/user\",\"icon\":\"user\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-7296-b835-40053a59e621', 'Panda.Net.Basic', 'Panda.Net.Basic.Roles.Update', 'Panda.Net.Basic.Roles', 'L:Net,DisplayName:Edit', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"edit\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-7307-1508-75679225c313', 'Panda.Net.Basic', 'Panda.Net.Basic.Organizations.Delete', 'Panda.Net.Basic.Organizations', 'L:Net,DisplayName:Delete', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"delete\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-7315-3bde-2aacb58193f7', 'Panda.Net.Basic', 'Panda.Net.Basic.Menus.Delete', 'Panda.Net.Basic.Menus', 'L:Net,DisplayName:Delete', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"delete\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-7574-f59d-ff5fd179cd4f', 'Panda.Net.Basic', 'Panda.Net.Basic.Tenants.Update', 'Panda.Net.Basic.Tenants', 'L:Net,DisplayName:Edit', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"edit\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-78ab-ed71-ed69d121b891', 'Panda.Net.Basic', 'Panda.Net.Basic.AllMerchant', NULL, 'L:Net,DisplayName:MerchantManagement', 1, 3, 'R', NULL, '{\"type\":1,\"path\":\"merchant-all\",\"icon\":\"merchant-all\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-7a44-ab28-95ef895201b2', 'Panda.Net.Basic', 'Panda.Net.Basic.Menus.Update', 'Panda.Net.Basic.Menus', 'L:Net,DisplayName:Edit', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"edit\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-8e15-2077-0a2c561b6481', 'Panda.Net.Basic', 'Panda.Net.Basic.WorkFlowList.Create', 'Panda.Net.Basic.WorkFlowList', 'L:Net,DisplayName:Create', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"create\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-901d-7814-9b5c72a9750d', 'Panda.Net.Basic', 'Panda.Net.Basic.Announcements.Delete', 'Panda.Net.Basic.Announcements', 'L:Net,DisplayName:Delete', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"delete\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-9da2-b2b3-a21dfffef0b0', 'Panda.Net.Basic', 'Panda.Net.Basic.Users.Create', 'Panda.Net.Basic.Users', 'L:Net,DisplayName:Create', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"create\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-b23b-197d-c4d79ceff698', 'Panda.Net.Basic', 'Panda.Net.Basic.WorkFlowCreates', NULL, 'L:Net,DisplayName:WorkFlowCreateManagement', 1, 3, 'R', NULL, '{\"type\":1,\"path\":\"workflow-create\",\"icon\":\"workflow\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-b2e5-4b84-7017849c59f8', 'Panda.Net.Basic', 'Panda.Net.Basic.Menus.Create', 'Panda.Net.Basic.Menus', 'L:Net,DisplayName:Create', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"create\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-ba00-fe2d-a93ccba348ba', 'Panda.Net.Basic', 'Panda.Net.Basic.Users.Delete', 'Panda.Net.Basic.Users', 'L:Net,DisplayName:Delete', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"delete\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-bc11-d763-bcd203c81e76', 'Panda.Net.Basic', 'Panda.Net.Basic.Announcements.Update', 'Panda.Net.Basic.Announcements', 'L:Net,DisplayName:Edit', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"edit\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-c7b1-340f-c93455067054', 'Panda.Net.Basic', 'Panda.Net.Basic.Tenants.Delete', 'Panda.Net.Basic.Tenants', 'L:Net,DisplayName:Delete', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"delete\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-d096-f056-1bc5a9c2cae1', 'Panda.Net.Basic', 'Panda.Net.Basic.Announcements.Create', 'Panda.Net.Basic.Announcements', 'L:Net,DisplayName:Create', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"create\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-de91-578a-f0ebfc9ed395', 'Panda.Net.Basic', 'Panda.Net.Basic.Announcements', NULL, 'L:Net,DisplayName:AnnouncementManagement', 1, 3, 'R', NULL, '{\"type\":1,\"path\":\"announcement\",\"icon\":\"user\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-ed0f-ec0b-14b101c5e643', 'Panda.Net.Basic', 'Panda.Net.Basic.WorkFlowList.Start', 'Panda.Net.Basic.WorkFlowList', 'L:Net,DisplayName:Start', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"start\"}');
INSERT INTO `abppermissions` VALUES ('3a14d1e4-86f3-ee35-8eaf-0d8757b35df3', 'Panda.Net.Basic', 'Panda.Net.Basic.Tenants.Create', 'Panda.Net.Basic.Tenants', 'L:Net,DisplayName:Create', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"create\"}');

-- ----------------------------
-- Table structure for abproleclaims
-- ----------------------------
DROP TABLE IF EXISTS `abproleclaims`;
CREATE TABLE `abproleclaims`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `RoleId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `ClaimType` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimValue` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AbpRoleClaims_RoleId`(`RoleId` ASC) USING BTREE,
  CONSTRAINT `FK_AbpRoleClaims_AbpRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `abproles` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abproleclaims
-- ----------------------------

-- ----------------------------
-- Table structure for abproles
-- ----------------------------
DROP TABLE IF EXISTS `abproles`;
CREATE TABLE `abproles`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NormalizedName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `IsDefault` tinyint(1) NOT NULL,
  `IsStatic` tinyint(1) NOT NULL,
  `IsPublic` tinyint(1) NOT NULL,
  `EntityVersion` int NOT NULL,
  `CustomDataPermission` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `DataPermission` int NOT NULL DEFAULT 0,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AbpRoles_NormalizedName`(`NormalizedName` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abproles
-- ----------------------------
INSERT INTO `abproles` VALUES ('3a14d1eb-26ed-d2b5-f9cb-02560e49e2c5', NULL, 'admin', 'ADMIN', 0, 1, 1, 0, '', 0, '{}', 'c6a0d2ff73ad4c8e8a6fbe7b65ee23a4');

-- ----------------------------
-- Table structure for abpsecuritylogs
-- ----------------------------
DROP TABLE IF EXISTS `abpsecuritylogs`;
CREATE TABLE `abpsecuritylogs`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `ApplicationName` varchar(96) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Identity` varchar(96) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Action` varchar(96) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `TenantName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ClientId` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CorrelationId` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ClientIpAddress` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `BrowserInfo` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AbpSecurityLogs_TenantId_Action`(`TenantId` ASC, `Action` ASC) USING BTREE,
  INDEX `IX_AbpSecurityLogs_TenantId_ApplicationName`(`TenantId` ASC, `ApplicationName` ASC) USING BTREE,
  INDEX `IX_AbpSecurityLogs_TenantId_Identity`(`TenantId` ASC, `Identity` ASC) USING BTREE,
  INDEX `IX_AbpSecurityLogs_TenantId_UserId`(`TenantId` ASC, `UserId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpsecuritylogs
-- ----------------------------
INSERT INTO `abpsecuritylogs` VALUES ('3a1631ac-5711-460c-ce37-5efd3c090fd4', NULL, 'Panda.Net.AuthServer', 'Identity', 'LoginSucceeded', '3a14d1eb-2496-a30a-7efc-fa75cd5b9ee2', 'admin', NULL, NULL, '189341a46e7445c0a537f08156aae84b', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', '2024-11-12 16:31:09.581007', '{}', '289ddd32ecda491fb198c68cf1ef482b');
INSERT INTO `abpsecuritylogs` VALUES ('3a179a2d-262a-2196-10ab-f6a9da3a2baf', NULL, 'Panda.Net.AuthServer', 'Identity', 'LoginSucceeded', '3a14d1eb-2496-a30a-7efc-fa75cd5b9ee2', 'admin', NULL, NULL, 'ea0bfda4e7f5478983ef99758c44a07f', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-21 16:35:08.964746', '{}', '8cd8669c252943b185ac16b0a96b70bb');
INSERT INTO `abpsecuritylogs` VALUES ('3a179a44-9fca-287c-a751-a545d054e970', NULL, 'Panda.Net.AuthServer', 'Identity', 'Logout', '3a14d1eb-2496-a30a-7efc-fa75cd5b9ee2', 'admin', NULL, NULL, '723dde7410d5451e877a690a478f8020', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-21 17:00:47.430540', '{}', '18a991c40a1744cea2b35b371d5fe3fe');
INSERT INTO `abpsecuritylogs` VALUES ('3a179a44-b371-7001-2597-57ad8ecf73d6', NULL, 'Panda.Net.AuthServer', 'Identity', 'LoginSucceeded', '3a14d1eb-2496-a30a-7efc-fa75cd5b9ee2', 'admin', NULL, NULL, '3828f1e52cfd4de8ab7a354cada1ef17', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-21 17:00:52.464869', '{}', 'e0cf9fcd2fb64dc3b56da3488d8c0a42');
INSERT INTO `abpsecuritylogs` VALUES ('3a17a323-4af7-786a-6846-4d1c2c9d4630', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a14d1eb-2496-a30a-7efc-fa75cd5b9ee2', 'admin', NULL, 'Net_Web', '713db8f1e1c2409cb02911c7f0495b87', '::1', 'Apifox/1.0.0 (https://apifox.com)', '2025-01-23 10:20:57.973681', '{}', 'eaa1a82a391048f6a0a232b800c66d9b');
INSERT INTO `abpsecuritylogs` VALUES ('3a17a329-e005-a6fc-1289-4aad4e2dde2b', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a14d1eb-2496-a30a-7efc-fa75cd5b9ee2', 'admin', NULL, 'Net_Web', '993edd1834b64dd996bb88dbb791a51b', '::1', 'Apifox/1.0.0 (https://apifox.com)', '2025-01-23 10:28:09.338430', '{}', '222ff0c6a93a4371a55aaf02ca23ea37');
INSERT INTO `abpsecuritylogs` VALUES ('3a17a32f-05ad-2527-dcf3-c34fd611e82f', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a14d1eb-2496-a30a-7efc-fa75cd5b9ee2', 'admin', NULL, 'Net_Web', 'fd4db6cf331843fca1032b51a82976de', '::1', 'Apifox/1.0.0 (https://apifox.com)', '2025-01-23 10:33:46.658021', '{}', 'fe7e27b4d5904603978ba75dab9de15b');
INSERT INTO `abpsecuritylogs` VALUES ('3a17a335-0491-f72c-f68a-3adf17cd60b9', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a14d1eb-2496-a30a-7efc-fa75cd5b9ee2', 'admin', NULL, 'Net_Web', 'ef53dd9af50245f281f88ae16d87be9b', '::1', 'Apifox/1.0.0 (https://apifox.com)', '2025-01-23 10:40:19.601437', '{}', 'c931c6f38f4346d4b3505bab149e1456');
INSERT INTO `abpsecuritylogs` VALUES ('3a17a338-f14f-7374-116f-efe9f8c8aabb', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a14d1eb-2496-a30a-7efc-fa75cd5b9ee2', 'admin', NULL, 'Net_Web', '38d0aff6fdce48d2b13f9ed166f6fa52', '::1', 'Apifox/1.0.0 (https://apifox.com)', '2025-01-23 10:44:36.815395', '{}', '663dfd0313c34f60862f2a3c11449127');
INSERT INTO `abpsecuritylogs` VALUES ('3a17a33a-235c-154e-22fe-2ff771983f98', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a14d1eb-2496-a30a-7efc-fa75cd5b9ee2', 'admin', NULL, 'Net_Web', '52544de0f6ce449abf069089525f18d2', '::1', 'Apifox/1.0.0 (https://apifox.com)', '2025-01-23 10:45:55.163880', '{}', 'd5cd2e2103f14bf4827f6fcce34ee4fb');
INSERT INTO `abpsecuritylogs` VALUES ('3a17a33a-5db9-630b-4445-4f5433bf0882', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a14d1eb-2496-a30a-7efc-fa75cd5b9ee2', 'admin', NULL, 'Net_Web', '7de806e3ded94852a4d68fececfde6e9', '::1', 'Apifox/1.0.0 (https://apifox.com)', '2025-01-23 10:46:10.105099', '{}', '7cbffc8d417447f1b79961164e5c5084');
INSERT INTO `abpsecuritylogs` VALUES ('3a17a33a-6ca1-0e05-8bfb-1b0b59b84ed0', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a14d1eb-2496-a30a-7efc-fa75cd5b9ee2', 'admin', NULL, 'Net_Web', 'ff3a1c45bd5049bf9fb74d88804e5c60', '::1', 'Apifox/1.0.0 (https://apifox.com)', '2025-01-23 10:46:13.921554', '{}', 'efe22176334f4a318a1766406649c1ae');
INSERT INTO `abpsecuritylogs` VALUES ('3a17a33c-3e56-9339-a809-d6da64da7229', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a14d1eb-2496-a30a-7efc-fa75cd5b9ee2', 'admin', NULL, 'Net_Web', '3b0c1bbda2d3475cb24481bd1a61dbbe', '::1', 'Apifox/1.0.0 (https://apifox.com)', '2025-01-23 10:48:13.142405', '{}', '6e92ded6f9ef434aa3e64ab693d58481');
INSERT INTO `abpsecuritylogs` VALUES ('3a17a33d-3e90-fbd6-c56e-e16cfa0aa05d', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a14d1eb-2496-a30a-7efc-fa75cd5b9ee2', 'admin', NULL, 'Net_Web', 'efefb31a2dd84feaa49bb2a64ebc5e91', '::1', 'Apifox/1.0.0 (https://apifox.com)', '2025-01-23 10:49:18.736550', '{}', '43369d54adfa4a4fa85c55a5c41b01c6');
INSERT INTO `abpsecuritylogs` VALUES ('3a17a341-5533-eece-9375-c99b55b06a6c', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a14d1eb-2496-a30a-7efc-fa75cd5b9ee2', 'admin', NULL, 'Net_Web', '73f4b5ec280748659026bb742abecef2', '::1', 'Apifox/1.0.0 (https://apifox.com)', '2025-01-23 10:53:46.670840', '{}', 'e77acd29ab344ae2aadac2474ed7d9dc');
INSERT INTO `abpsecuritylogs` VALUES ('3a17a354-a77a-1ed3-60ca-484a7981412a', NULL, 'Panda.Net.AuthServer', 'Identity', 'LoginSucceeded', '3a14d1eb-2496-a30a-7efc-fa75cd5b9ee2', 'admin', NULL, NULL, '51ca307eab73453e8ef8d9a62615224e', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-23 11:14:52.918388', '{}', '596a4ff13cfe4f448a36babf07223cee');
INSERT INTO `abpsecuritylogs` VALUES ('3a17a354-c5a4-8e4f-4981-a0ce93e5c445', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a14d1eb-2496-a30a-7efc-fa75cd5b9ee2', 'admin', NULL, 'Net_Web', '1168b048135247febee951ee7e0d9b5d', '::1', 'Apifox/1.0.0 (https://apifox.com)', '2025-01-23 11:15:00.643643', '{}', '84a0615310104f2fbefab5d47744f14d');

-- ----------------------------
-- Table structure for abpsessions
-- ----------------------------
DROP TABLE IF EXISTS `abpsessions`;
CREATE TABLE `abpsessions`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `SessionId` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Device` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DeviceInfo` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ClientId` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `IpAddresses` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `SignedIn` datetime(6) NOT NULL,
  `LastAccessed` datetime(6) NULL DEFAULT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AbpSessions_Device`(`Device` ASC) USING BTREE,
  INDEX `IX_AbpSessions_SessionId`(`SessionId` ASC) USING BTREE,
  INDEX `IX_AbpSessions_TenantId_UserId`(`TenantId` ASC, `UserId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpsessions
-- ----------------------------

-- ----------------------------
-- Table structure for abpsettingdefinitions
-- ----------------------------
DROP TABLE IF EXISTS `abpsettingdefinitions`;
CREATE TABLE `abpsettingdefinitions`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DisplayName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DefaultValue` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `IsVisibleToClients` tinyint(1) NOT NULL,
  `Providers` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `IsInherited` tinyint(1) NOT NULL,
  `IsEncrypted` tinyint(1) NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_AbpSettingDefinitions_Name`(`Name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpsettingdefinitions
-- ----------------------------
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8960-c36f-ba57-1f0aff10e45f', 'Abp.Localization.DefaultLanguage', 'L:AbpLocalization,DisplayName:Abp.Localization.DefaultLanguage', 'L:AbpLocalization,Description:Abp.Localization.DefaultLanguage', 'en', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8965-01d0-bdb3-648524ba1ee5', 'Abp.Identity.Password.RequireUppercase', 'L:AbpIdentity,DisplayName:Abp.Identity.Password.RequireUppercase', 'L:AbpIdentity,Description:Abp.Identity.Password.RequireUppercase', 'True', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8965-2004-2193-8aa4d3e19473', 'Abp.Identity.Password.RequiredLength', 'L:AbpIdentity,DisplayName:Abp.Identity.Password.RequiredLength', 'L:AbpIdentity,Description:Abp.Identity.Password.RequiredLength', '6', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8965-25b2-e56d-b6542a65c523', 'Abp.Identity.SignIn.RequireConfirmedPhoneNumber', 'L:AbpIdentity,DisplayName:Abp.Identity.SignIn.RequireConfirmedPhoneNumber', 'L:AbpIdentity,Description:Abp.Identity.SignIn.RequireConfirmedPhoneNumber', 'False', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8965-2b27-ebe3-fd3e38e0fec5', 'Abp.Timing.TimeZone', 'L:AbpTiming,DisplayName:Abp.Timing.Timezone', 'L:AbpTiming,Description:Abp.Timing.Timezone', 'UTC', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8965-4733-3244-dda36900da4d', 'Abp.Identity.Password.RequiredUniqueChars', 'L:AbpIdentity,DisplayName:Abp.Identity.Password.RequiredUniqueChars', 'L:AbpIdentity,Description:Abp.Identity.Password.RequiredUniqueChars', '1', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8965-4823-c4f7-3548352edfc7', 'Abp.Identity.Password.RequireLowercase', 'L:AbpIdentity,DisplayName:Abp.Identity.Password.RequireLowercase', 'L:AbpIdentity,Description:Abp.Identity.Password.RequireLowercase', 'True', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8965-529e-c9d5-65cd23058441', 'Abp.Identity.SignIn.EnablePhoneNumberConfirmation', 'L:AbpIdentity,DisplayName:Abp.Identity.SignIn.EnablePhoneNumberConfirmation', 'L:AbpIdentity,Description:Abp.Identity.SignIn.EnablePhoneNumberConfirmation', 'True', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8965-5f36-5560-6be913419978', 'Abp.Identity.Password.RequireDigit', 'L:AbpIdentity,DisplayName:Abp.Identity.Password.RequireDigit', 'L:AbpIdentity,Description:Abp.Identity.Password.RequireDigit', 'True', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8965-6971-402a-a270dd832b4e', 'Abp.Identity.Lockout.AllowedForNewUsers', 'L:AbpIdentity,DisplayName:Abp.Identity.Lockout.AllowedForNewUsers', 'L:AbpIdentity,Description:Abp.Identity.Lockout.AllowedForNewUsers', 'True', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8965-7eb9-04b6-cba6899acede', 'Abp.Identity.Lockout.LockoutDuration', 'L:AbpIdentity,DisplayName:Abp.Identity.Lockout.LockoutDuration', 'L:AbpIdentity,Description:Abp.Identity.Lockout.LockoutDuration', '300', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8965-a4b0-123e-c36f31cde8cb', 'Abp.Identity.Password.PasswordChangePeriodDays', 'L:AbpIdentity,DisplayName:Abp.Identity.Password.PasswordChangePeriodDays', 'L:AbpIdentity,Description:Abp.Identity.Password.PasswordChangePeriodDays', '0', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8965-adf7-d72b-99b057fc28e2', 'Abp.Identity.SignIn.RequireConfirmedEmail', 'L:AbpIdentity,DisplayName:Abp.Identity.SignIn.RequireConfirmedEmail', 'L:AbpIdentity,Description:Abp.Identity.SignIn.RequireConfirmedEmail', 'False', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8965-dc61-7d82-53aa758d9f46', 'Abp.Identity.Lockout.MaxFailedAccessAttempts', 'L:AbpIdentity,DisplayName:Abp.Identity.Lockout.MaxFailedAccessAttempts', 'L:AbpIdentity,Description:Abp.Identity.Lockout.MaxFailedAccessAttempts', '5', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8965-e90f-2712-f6380a1e322e', 'Abp.Identity.Password.ForceUsersToPeriodicallyChangePassword', 'L:AbpIdentity,DisplayName:Abp.Identity.Password.ForceUsersToPeriodicallyChangePassword', 'L:AbpIdentity,Description:Abp.Identity.Password.ForceUsersToPeriodicallyChangePassword', 'False', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8965-f835-d978-7f77a4de588b', 'Abp.Identity.Password.RequireNonAlphanumeric', 'L:AbpIdentity,DisplayName:Abp.Identity.Password.RequireNonAlphanumeric', 'L:AbpIdentity,Description:Abp.Identity.Password.RequireNonAlphanumeric', 'True', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8966-0ac7-c67b-d963fb46a97d', 'Abp.Mailing.Smtp.UseDefaultCredentials', 'L:AbpEmailing,DisplayName:Abp.Mailing.Smtp.UseDefaultCredentials', 'L:AbpEmailing,Description:Abp.Mailing.Smtp.UseDefaultCredentials', 'true', 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8966-17c4-ab26-5e45d6b11cee', 'Abp.Mailing.Smtp.Domain', 'L:AbpEmailing,DisplayName:Abp.Mailing.Smtp.Domain', 'L:AbpEmailing,Description:Abp.Mailing.Smtp.Domain', NULL, 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8966-1bc1-564d-a767841f1376', 'Abp.Mailing.Smtp.UserName', 'L:AbpEmailing,DisplayName:Abp.Mailing.Smtp.UserName', 'L:AbpEmailing,Description:Abp.Mailing.Smtp.UserName', NULL, 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8966-543d-a925-5c048d6e912d', 'Smtp.UserName', 'F:Smtp.UserName', NULL, NULL, 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8966-5dd5-0883-d8fc28f26f25', 'Abp.Mailing.Smtp.EnableSsl', 'L:AbpEmailing,DisplayName:Abp.Mailing.Smtp.EnableSsl', 'L:AbpEmailing,Description:Abp.Mailing.Smtp.EnableSsl', 'false', 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8966-7096-e015-12eb9055cd11', 'Abp.Mailing.DefaultFromAddress', 'L:AbpEmailing,DisplayName:Abp.Mailing.DefaultFromAddress', 'L:AbpEmailing,Description:Abp.Mailing.DefaultFromAddress', 'noreply@abp.io', 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8966-8a29-60fa-0427161f9b88', 'Abp.Mailing.Smtp.Port', 'L:AbpEmailing,DisplayName:Abp.Mailing.Smtp.Port', 'L:AbpEmailing,Description:Abp.Mailing.Smtp.Port', '25', 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8966-9a0a-b927-37f3e704d259', 'Abp.Identity.User.IsUserNameUpdateEnabled', 'L:AbpIdentity,DisplayName:Abp.Identity.User.IsUserNameUpdateEnabled', 'L:AbpIdentity,Description:Abp.Identity.User.IsUserNameUpdateEnabled', 'True', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8966-a0d5-568b-30446f06a0eb', 'Smtp.Password', 'F:Smtp.Password', NULL, NULL, 0, NULL, 1, 1, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8966-a102-5790-fedc3e5de6b7', 'Abp.Identity.User.IsEmailUpdateEnabled', 'L:AbpIdentity,DisplayName:Abp.Identity.User.IsEmailUpdateEnabled', 'L:AbpIdentity,Description:Abp.Identity.User.IsEmailUpdateEnabled', 'True', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8966-ab75-53cb-9255881855fd', 'Abp.Identity.OrganizationUnit.MaxUserMembershipCount', 'L:AbpIdentity,Identity.OrganizationUnit.MaxUserMembershipCount', 'L:AbpIdentity,Identity.OrganizationUnit.MaxUserMembershipCount', '2147483647', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8966-b32f-d66a-c99863fdbe08', 'Smtp.Host', 'F:Smtp.Host', NULL, '127.0.0.1', 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8966-b557-0ac9-9acce710c8ac', 'Smtp.EnableSsl', 'F:Smtp.EnableSsl', NULL, NULL, 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8966-c01c-9acb-35d762f231b0', 'Abp.Account.EnableLocalLogin', 'L:AbpAccount,DisplayName:Abp.Account.EnableLocalLogin', 'L:AbpAccount,Description:Abp.Account.EnableLocalLogin', 'true', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8966-d582-8e00-f0a968b353cf', 'Smtp.Port', 'F:Smtp.Port', NULL, '25', 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8966-d730-4ce4-850053540fc4', 'Abp.Mailing.Smtp.Password', 'L:AbpEmailing,DisplayName:Abp.Mailing.Smtp.Password', 'L:AbpEmailing,Description:Abp.Mailing.Smtp.Password', NULL, 0, NULL, 1, 1, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8966-d7f3-ed91-ef6833d31713', 'Abp.Mailing.DefaultFromDisplayName', 'L:AbpEmailing,DisplayName:Abp.Mailing.DefaultFromDisplayName', 'L:AbpEmailing,Description:Abp.Mailing.DefaultFromDisplayName', 'ABP application', 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8966-ef2d-1138-a5da34b0e341', 'Abp.Mailing.Smtp.Host', 'L:AbpEmailing,DisplayName:Abp.Mailing.Smtp.Host', 'L:AbpEmailing,Description:Abp.Mailing.Smtp.Host', '127.0.0.1', 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a14d1e4-8966-fbe0-9f40-e83ecb5963dd', 'Abp.Account.IsSelfRegistrationEnabled', 'L:AbpAccount,DisplayName:Abp.Account.IsSelfRegistrationEnabled', 'L:AbpAccount,Description:Abp.Account.IsSelfRegistrationEnabled', 'true', 1, NULL, 1, 0, '{}');

-- ----------------------------
-- Table structure for abpsettings
-- ----------------------------
DROP TABLE IF EXISTS `abpsettings`;
CREATE TABLE `abpsettings`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Value` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ProviderKey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_AbpSettings_Name_ProviderName_ProviderKey`(`Name` ASC, `ProviderName` ASC, `ProviderKey` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpsettings
-- ----------------------------

-- ----------------------------
-- Table structure for abptenantconnectionstrings
-- ----------------------------
DROP TABLE IF EXISTS `abptenantconnectionstrings`;
CREATE TABLE `abptenantconnectionstrings`  (
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Value` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`TenantId`, `Name`) USING BTREE,
  CONSTRAINT `FK_AbpTenantConnectionStrings_AbpTenants_TenantId` FOREIGN KEY (`TenantId`) REFERENCES `abptenants` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abptenantconnectionstrings
-- ----------------------------

-- ----------------------------
-- Table structure for abptenants
-- ----------------------------
DROP TABLE IF EXISTS `abptenants`;
CREATE TABLE `abptenants`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NormalizedName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `EntityVersion` int NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `DeletionTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AbpTenants_Name`(`Name` ASC) USING BTREE,
  INDEX `IX_AbpTenants_NormalizedName`(`NormalizedName` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abptenants
-- ----------------------------

-- ----------------------------
-- Table structure for abpuserclaims
-- ----------------------------
DROP TABLE IF EXISTS `abpuserclaims`;
CREATE TABLE `abpuserclaims`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `ClaimType` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimValue` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AbpUserClaims_UserId`(`UserId` ASC) USING BTREE,
  CONSTRAINT `FK_AbpUserClaims_AbpUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `abpusers` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpuserclaims
-- ----------------------------

-- ----------------------------
-- Table structure for abpuserdelegations
-- ----------------------------
DROP TABLE IF EXISTS `abpuserdelegations`;
CREATE TABLE `abpuserdelegations`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `SourceUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TargetUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `StartTime` datetime(6) NOT NULL,
  `EndTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpuserdelegations
-- ----------------------------

-- ----------------------------
-- Table structure for abpuserlogins
-- ----------------------------
DROP TABLE IF EXISTS `abpuserlogins`;
CREATE TABLE `abpuserlogins`  (
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LoginProvider` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `ProviderKey` varchar(196) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderDisplayName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`UserId`, `LoginProvider`) USING BTREE,
  INDEX `IX_AbpUserLogins_LoginProvider_ProviderKey`(`LoginProvider` ASC, `ProviderKey` ASC) USING BTREE,
  CONSTRAINT `FK_AbpUserLogins_AbpUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `abpusers` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpuserlogins
-- ----------------------------

-- ----------------------------
-- Table structure for abpuserorganizationunits
-- ----------------------------
DROP TABLE IF EXISTS `abpuserorganizationunits`;
CREATE TABLE `abpuserorganizationunits`  (
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `OrganizationUnitId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`OrganizationUnitId`, `UserId`) USING BTREE,
  INDEX `IX_AbpUserOrganizationUnits_UserId_OrganizationUnitId`(`UserId` ASC, `OrganizationUnitId` ASC) USING BTREE,
  CONSTRAINT `FK_AbpUserOrganizationUnits_AbpOrganizationUnits_OrganizationUn~` FOREIGN KEY (`OrganizationUnitId`) REFERENCES `abporganizationunits` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_AbpUserOrganizationUnits_AbpUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `abpusers` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpuserorganizationunits
-- ----------------------------

-- ----------------------------
-- Table structure for abpuserroles
-- ----------------------------
DROP TABLE IF EXISTS `abpuserroles`;
CREATE TABLE `abpuserroles`  (
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `RoleId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`UserId`, `RoleId`) USING BTREE,
  INDEX `IX_AbpUserRoles_RoleId_UserId`(`RoleId` ASC, `UserId` ASC) USING BTREE,
  CONSTRAINT `FK_AbpUserRoles_AbpRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `abproles` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_AbpUserRoles_AbpUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `abpusers` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpuserroles
-- ----------------------------
INSERT INTO `abpuserroles` VALUES ('3a14d1eb-2496-a30a-7efc-fa75cd5b9ee2', '3a14d1eb-26ed-d2b5-f9cb-02560e49e2c5', NULL);

-- ----------------------------
-- Table structure for abpusers
-- ----------------------------
DROP TABLE IF EXISTS `abpusers`;
CREATE TABLE `abpusers`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Surname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL DEFAULT 0,
  `PasswordHash` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `SecurityStamp` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `IsExternal` tinyint(1) NOT NULL DEFAULT 0,
  `PhoneNumber` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL DEFAULT 0,
  `IsActive` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL DEFAULT 0,
  `LockoutEnd` datetime(6) NULL DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL DEFAULT 0,
  `AccessFailedCount` int NOT NULL DEFAULT 0,
  `ShouldChangePasswordOnNextLogin` tinyint(1) NOT NULL,
  `EntityVersion` int NOT NULL,
  `LastPasswordChangeTime` datetime(6) NULL DEFAULT NULL,
  `Avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `OpenId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `DeletionTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AbpUsers_Email`(`Email` ASC) USING BTREE,
  INDEX `IX_AbpUsers_NormalizedEmail`(`NormalizedEmail` ASC) USING BTREE,
  INDEX `IX_AbpUsers_NormalizedUserName`(`NormalizedUserName` ASC) USING BTREE,
  INDEX `IX_AbpUsers_UserName`(`UserName` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpusers
-- ----------------------------
INSERT INTO `abpusers` VALUES ('3a14d1eb-2496-a30a-7efc-fa75cd5b9ee2', NULL, 'admin', 'ADMIN', 'admin', NULL, 'admin@abp.io', 'ADMIN@ABP.IO', 0, 'AQAAAAIAAYagAAAAEBAhqX3IJQ2ebyJH8H53/pRkW1axz6pJNzmFvShapwlrrBH7pUAVsiNH1+JgchUhvg==', 'ABSDSNEG3WR4DZL4X2RWN74A7CYNIEBS', 0, NULL, 0, 1, 0, NULL, 1, 0, 0, 0, '2024-09-05 01:13:25.499921', '', '', '{}', '07af3e68da524235a700e1c26aab0790', '2024-09-05 09:13:25.683995', NULL, NULL, NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for abpusertokens
-- ----------------------------
DROP TABLE IF EXISTS `abpusertokens`;
CREATE TABLE `abpusertokens`  (
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LoginProvider` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`UserId`, `LoginProvider`, `Name`) USING BTREE,
  CONSTRAINT `FK_AbpUserTokens_AbpUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `abpusers` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpusertokens
-- ----------------------------

-- ----------------------------
-- Table structure for departmenttype
-- ----------------------------
DROP TABLE IF EXISTS `departmenttype`;
CREATE TABLE `departmenttype`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `DeletionTime` datetime(6) NULL DEFAULT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Pinyin` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PinyinFirstLetters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Status` int NOT NULL,
  `Sort` int NOT NULL,
  `CreatorName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ModificationName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `DeletionName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Describe` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `OrganizationId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departmenttype
-- ----------------------------

-- ----------------------------
-- Table structure for openiddictapplications
-- ----------------------------
DROP TABLE IF EXISTS `openiddictapplications`;
CREATE TABLE `openiddictapplications`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ApplicationType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ClientId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ClientSecret` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ClientType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ConsentType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `DisplayNames` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `JsonWebKeySet` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `PostLogoutRedirectUris` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `RedirectUris` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ClientUri` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `LogoUri` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `DeletionTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_OpenIddictApplications_ClientId`(`ClientId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of openiddictapplications
-- ----------------------------
INSERT INTO `openiddictapplications` VALUES ('3a14d1eb-2e5c-e116-05ab-c2404d6f4a39', NULL, 'Net_Web', 'AQAAAAEAACcQAAAAEMrds+Ia2sVwGNzhRW8BpyZkDTqGesQbl1u+9dtvdMeBKtqg+xCUTHikgeQAXUb/3g==', 'confidential', 'explicit', 'Net Web Application', NULL, NULL, '[\"rst:code id_token\",\"ept:logout\",\"gt:authorization_code\",\"rst:code\",\"ept:authorization\",\"ept:token\",\"ept:revocation\",\"ept:introspection\",\"gt:implicit\",\"rst:id_token\",\"gt:password\",\"gt:client_credentials\",\"gt:refresh_token\",\"gt:urn:ietf:params:oauth:grant-type:device_code\",\"ept:device\",\"gt:net\",\"scp:address\",\"scp:email\",\"scp:phone\",\"scp:profile\",\"scp:roles\",\"scp:openId\",\"scp:Net\"]', '[\"https://localhost:44392/signout-callback-oidc\"]', NULL, '[\"https://localhost:44392/signin-oidc\",\"https://www.baidu.com\"]', NULL, NULL, 'https://localhost:44392/', NULL, '{}', 'c23e9f063892430b8be47f770a71474d', '2024-09-05 09:13:28.012112', NULL, '2025-01-23 11:15:01.095701', NULL, 0, NULL, NULL);
INSERT INTO `openiddictapplications` VALUES ('3a14d1eb-2f28-74b2-711d-427b253ed130', NULL, 'Ad_Web', 'AQAAAAEAACcQAAAAEKbiLfm01+q5NzU3Faj1WesTJPPr9L/Av8WHaC3HE7lyPgMVH+toOrhfEZmy2hPavg==', 'confidential', 'implicit', 'Ad Web Application', NULL, NULL, '[\"rst:code id_token\",\"ept:logout\",\"gt:authorization_code\",\"rst:code\",\"ept:authorization\",\"ept:token\",\"ept:revocation\",\"ept:introspection\",\"gt:implicit\",\"rst:id_token\",\"gt:password\",\"gt:client_credentials\",\"gt:refresh_token\",\"scp:address\",\"scp:email\",\"scp:phone\",\"scp:profile\",\"scp:roles\",\"scp:openId\",\"scp:Ad\"]', '[\"https://localhost:44392/signout-callback-oidc\"]', NULL, '[\"https://localhost:44392/signin-oidc\",\"https://www.baidu.com\"]', NULL, NULL, 'https://localhost:44392/', NULL, '{}', 'f6312e9ec0d341e596adff00e82f7146', '2024-09-05 09:13:28.112849', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddictapplications` VALUES ('3a14d1eb-2f44-065e-4cc2-8e577705f492', NULL, 'Net_App', NULL, 'public', 'implicit', 'Console Test / Angular Application', NULL, NULL, '[\"ept:logout\",\"gt:authorization_code\",\"rst:code\",\"ept:authorization\",\"ept:token\",\"ept:revocation\",\"ept:introspection\",\"gt:password\",\"gt:client_credentials\",\"gt:refresh_token\",\"scp:address\",\"scp:email\",\"scp:phone\",\"scp:profile\",\"scp:roles\",\"scp:openId\"]', '[\"http://localhost:4200\"]', NULL, '[\"http://localhost:4200\",\"https://www.baidu.com\"]', NULL, NULL, 'http://localhost:4200', NULL, '{}', 'a948da58507046719b1cf75530930d50', '2024-09-05 09:13:28.136837', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddictapplications` VALUES ('3a14d1eb-2f5a-064e-002e-abf560f5d4b2', NULL, 'Net_BlazorServerTiered', 'AQAAAAEAACcQAAAAEFMMJfdfHlE424Hst58p9VxPCY4qEsbb0NT08OvXTALqFyvDacv64dJ6d2aSawHsFQ==', 'confidential', 'implicit', 'Blazor Server Application', NULL, NULL, '[\"rst:code id_token\",\"ept:logout\",\"gt:authorization_code\",\"rst:code\",\"ept:authorization\",\"ept:token\",\"ept:revocation\",\"ept:introspection\",\"gt:implicit\",\"rst:id_token\",\"scp:address\",\"scp:email\",\"scp:phone\",\"scp:profile\",\"scp:roles\",\"scp:openId\"]', '[\"https://localhost:44393/signout-callback-oidc\"]', NULL, '[\"https://localhost:44393/signin-oidc\",\"https://www.baidu.com\"]', NULL, NULL, 'https://localhost:44393/', NULL, '{}', 'b398735a1f1a48ff81c9a73a4481b887', '2024-09-05 09:13:28.162639', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddictapplications` VALUES ('3a14d1eb-2f74-e493-04e2-23580fa3cf74', NULL, 'Net_Swagger', NULL, 'public', 'implicit', 'Swagger Application', NULL, NULL, '[\"ept:logout\",\"gt:authorization_code\",\"rst:code\",\"ept:authorization\",\"ept:token\",\"ept:revocation\",\"ept:introspection\",\"scp:address\",\"scp:email\",\"scp:phone\",\"scp:profile\",\"scp:roles\",\"scp:openId\"]', NULL, NULL, '[\"https://localhost:44360/swagger/oauth2-redirect.html\",\"https://www.baidu.com\"]', NULL, NULL, 'https://localhost:44360', NULL, '{}', 'eddb4bda6a4841408fedd1b8953d6091', '2024-09-05 09:13:28.184528', NULL, NULL, NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for openiddictauthorizations
-- ----------------------------
DROP TABLE IF EXISTS `openiddictauthorizations`;
CREATE TABLE `openiddictauthorizations`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ApplicationId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationDate` datetime(6) NULL DEFAULT NULL,
  `Properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Scopes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Subject` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_OpenIddictAuthorizations_ApplicationId_Status_Subject_Type`(`ApplicationId` ASC, `Status` ASC, `Subject` ASC, `Type` ASC) USING BTREE,
  CONSTRAINT `FK_OpenIddictAuthorizations_OpenIddictApplications_ApplicationId` FOREIGN KEY (`ApplicationId`) REFERENCES `openiddictapplications` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of openiddictauthorizations
-- ----------------------------
INSERT INTO `openiddictauthorizations` VALUES ('3a17a354-c6f5-62be-019d-54fd0d3f0373', '3a14d1eb-2e5c-e116-05ab-c2404d6f4a39', '2025-01-23 03:15:00.972260', NULL, '[\"Net\",\"offline_access\"]', 'valid', '3a14d1eb-2496-a30a-7efc-fa75cd5b9ee2', 'ad-hoc', '{}', '39f36995c8f04583b221f973ddf64ed2');

-- ----------------------------
-- Table structure for openiddictscopes
-- ----------------------------
DROP TABLE IF EXISTS `openiddictscopes`;
CREATE TABLE `openiddictscopes`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Descriptions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `DisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `DisplayNames` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Resources` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `DeletionTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_OpenIddictScopes_Name`(`Name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of openiddictscopes
-- ----------------------------
INSERT INTO `openiddictscopes` VALUES ('3a14d1eb-2d11-2372-8a68-6cc9b2625801', NULL, NULL, 'Net API', NULL, 'Net', NULL, '[\"Net\"]', '{}', 'dcfd87ba80df4ae1b1c96d8b0ef3e852', '2024-09-05 09:13:27.699892', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddictscopes` VALUES ('3a14d1eb-2e02-b638-46db-6b923a68d7e7', NULL, NULL, 'Ad API', NULL, 'Ad', NULL, '[\"Ad\"]', '{}', 'a10f6d3f81634956b3f82c2d73526d29', '2024-09-05 09:13:27.816147', NULL, NULL, NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for openiddicttokens
-- ----------------------------
DROP TABLE IF EXISTS `openiddicttokens`;
CREATE TABLE `openiddicttokens`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ApplicationId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `AuthorizationId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationDate` datetime(6) NULL DEFAULT NULL,
  `ExpirationDate` datetime(6) NULL DEFAULT NULL,
  `Payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `RedemptionDate` datetime(6) NULL DEFAULT NULL,
  `ReferenceId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Subject` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_OpenIddictTokens_ApplicationId_Status_Subject_Type`(`ApplicationId` ASC, `Status` ASC, `Subject` ASC, `Type` ASC) USING BTREE,
  INDEX `IX_OpenIddictTokens_AuthorizationId`(`AuthorizationId` ASC) USING BTREE,
  INDEX `IX_OpenIddictTokens_ReferenceId`(`ReferenceId` ASC) USING BTREE,
  CONSTRAINT `FK_OpenIddictTokens_OpenIddictApplications_ApplicationId` FOREIGN KEY (`ApplicationId`) REFERENCES `openiddictapplications` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_OpenIddictTokens_OpenIddictAuthorizations_AuthorizationId` FOREIGN KEY (`AuthorizationId`) REFERENCES `openiddictauthorizations` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of openiddicttokens
-- ----------------------------
INSERT INTO `openiddicttokens` VALUES ('3a17a354-ced9-bb4e-5b5c-2abcee5c34e4', '3a14d1eb-2e5c-e116-05ab-c2404d6f4a39', '3a17a354-c6f5-62be-019d-54fd0d3f0373', '2025-01-23 03:15:02.000000', '2025-01-23 04:15:02.000000', NULL, NULL, NULL, NULL, 'valid', '3a14d1eb-2496-a30a-7efc-fa75cd5b9ee2', 'access_token', '{}', 'cc1269c0364641019b9c66b875561d5f');
INSERT INTO `openiddicttokens` VALUES ('3a17a354-d05f-e11e-9c6f-cb7c63f48656', '3a14d1eb-2e5c-e116-05ab-c2404d6f4a39', '3a17a354-c6f5-62be-019d-54fd0d3f0373', '2025-01-23 03:15:02.000000', '2025-02-06 03:15:02.000000', NULL, NULL, NULL, NULL, 'valid', '3a14d1eb-2496-a30a-7efc-fa75cd5b9ee2', 'refresh_token', '{}', '9ee3480907894633831029aa64d9718e');

SET FOREIGN_KEY_CHECKS = 1;
