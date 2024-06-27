/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : 127.0.0.1:3306
 Source Schema         : panda

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 27/06/2024 11:01:21
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
INSERT INTO `__efmigrationshistory` VALUES ('20231012011348_Initial', '8.0.0');
INSERT INTO `__efmigrationshistory` VALUES ('20231012013419_init', '8.0.0');
INSERT INTO `__efmigrationshistory` VALUES ('20231013094710_avatar', '8.0.0');
INSERT INTO `__efmigrationshistory` VALUES ('20240204092929_net8.0.2', '8.0.0');
INSERT INTO `__efmigrationshistory` VALUES ('20240329063119_filestore', '8.0.0');
INSERT INTO `__efmigrationshistory` VALUES ('20240329102615_file1', '8.0.0');
INSERT INTO `__efmigrationshistory` VALUES ('20240407023717_msg', '8.0.0');
INSERT INTO `__efmigrationshistory` VALUES ('20240407024306_msg', '8.0.0');
INSERT INTO `__efmigrationshistory` VALUES ('20240408082719_announcement', '8.0.0');
INSERT INTO `__efmigrationshistory` VALUES ('20240417082854_init', '8.0.0');
INSERT INTO `__efmigrationshistory` VALUES ('20240418063153_init', '8.0.0');
INSERT INTO `__efmigrationshistory` VALUES ('20240418075731_dotnet8.1', '8.0.0');
INSERT INTO `__efmigrationshistory` VALUES ('20240425022804_init1', '8.0.0');
INSERT INTO `__efmigrationshistory` VALUES ('20240625063244_dataPermission', '8.0.0');
INSERT INTO `__efmigrationshistory` VALUES ('20240627011329_announcementCode', '8.0.0');

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
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `DeletionTime` datetime(6) NULL DEFAULT NULL,
  `Code` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpannouncements
-- ----------------------------
INSERT INTO `abpannouncements` VALUES ('3a11d2a8-914d-05b9-b7c5-bd11ea232ffa', NULL, '333', '2024-04-09 09:31:57.638923', 0, '333', '{}', '786cd00698ef4a56aaa7f9ed015e952b', '2024-04-09 09:31:57.687317', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2a9-5eb2-1c06-a2ac-8fef40d91d7a', NULL, '333', '2024-04-09 09:32:50.226378', 0, '333', '{}', 'a4347f601bc44927b0fe78f05f604c56', '2024-04-09 09:32:50.239723', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '00003');
INSERT INTO `abpannouncements` VALUES ('3a11d2a9-8041-b18b-4e92-9cbad3cc12ef', NULL, '333', '2024-04-09 09:32:58.817233', 0, '333', '{}', 'ae4f015456dd47229373742f3f351d24', '2024-04-09 09:32:58.823747', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2ab-464a-0d85-8cd1-9265c2a82bb8', NULL, '333', '2024-04-09 09:34:55.040758', 0, '333', '{}', '5acbcd1a892f40f2bb51c915d186e0f1', '2024-04-09 09:34:55.422267', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2af-0275-f739-2ca0-4a87ea99e81d', NULL, '333', '2024-04-09 09:38:59.821080', 0, '333', '{}', 'c3c51891c7e44e83a4ea8638f8daa935', '2024-04-09 09:39:00.215388', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2af-4e9f-a5e7-a335-462b6f9fa652', NULL, '333', '2024-04-09 09:39:19.327661', 0, '333', '{}', '1b1af2731a494623a93b09f437262efb', '2024-04-09 09:39:19.383760', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2bd-1170-f0e2-af99-49be5fa0cad6', NULL, '333', '2024-04-09 09:54:21.156872', 0, '333', '{}', '01cbe408d4b3400fb2415ddc425dc5f0', '2024-04-09 09:54:21.547280', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2bd-4e57-1a79-06f3-d66e62f59c59', NULL, '333', '2024-04-09 09:54:36.759273', 0, '333', '{}', '30b9eb13d714458c82e59aa936a38f8e', '2024-04-09 09:54:36.829300', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2be-945a-92db-e8bc-6590eedd8d4f', NULL, '333', '2024-04-09 09:56:00.209637', 0, '333', '{}', 'd70effbea0dd454c83e0ec20fe8b7d0b', '2024-04-09 09:56:00.602695', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2bf-8a68-a206-93db-c4f562e02083', NULL, '333', '2024-04-09 09:57:03.201034', 0, '333', '{}', '4c254e1681654152a7792c8c0da391e0', '2024-04-09 09:57:03.605054', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2c0-d2db-e06b-05aa-8a704977e1bf', NULL, '333', '2024-04-09 09:58:27.291585', 0, '333', '{}', 'c26c8fa6d7bc4f9eaee1155c7d212685', '2024-04-09 09:58:27.351339', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2c1-db8a-83f3-4999-18db4fda5ecb', NULL, '333', '2024-04-09 09:59:35.050532', 0, '333', '{}', '9b4e4a6e3a7e445c9c5de8ccadf1036f', '2024-04-09 09:59:35.061920', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2c5-7ad0-4980-a5af-c608bf9d0e0a', NULL, '333', '2024-04-09 10:03:32.416646', 0, '333', '{}', 'cba4ef8b864d4825b7bee588effac0d7', '2024-04-09 10:03:33.052671', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2c5-c3a2-841c-f14d-4cecc7111232', NULL, '333', '2024-04-09 10:03:51.074383', 0, '333', '{}', '925f870a7cc14db6949847a514e70dad', '2024-04-09 10:03:51.139636', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2c7-6973-2277-5cf5-ed803b80529f', NULL, '333', '2024-04-09 10:05:39.050351', 0, '333', '{}', 'f31626100b464a8087dbb8859ee49120', '2024-04-09 10:05:39.439481', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2c7-875b-c6b6-1ce3-71f3042ba2e1', NULL, '333', '2024-04-09 10:05:46.715439', 0, '333', '{}', 'cc286ffa19ed4d8aba5efc7e3f91d1b7', '2024-04-09 10:05:46.772722', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2cb-7fdc-d693-c1f8-ebbed474e395', NULL, '333', '2024-04-09 10:10:06.933152', 0, '333', '{}', '466b98e5e5d04269b8cc3fecea3a3060', '2024-04-09 10:10:07.317698', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2cb-a5e5-3320-3b7c-42e4d02ca513', NULL, '333', '2024-04-09 10:10:16.676947', 0, '333', '{}', 'd5b0c9d016d944f1a5f463e58dc7780a', '2024-04-09 10:10:16.736085', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2cd-40cb-da1e-1189-0e3f8be0746f', NULL, '333', '2024-04-09 10:12:01.860092', 0, '333', '{}', '69426d0fb77945e4982a343ffbbc0b01', '2024-04-09 10:12:02.247175', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2cd-a118-4b5d-d962-9048cb1f6ad0', NULL, '333', '2024-04-09 10:12:26.505517', 0, '333', '{}', '6ddcf9fe39ca4d99942a8edc88d313c7', '2024-04-09 10:12:26.913720', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2cd-c6a3-e12d-270e-c61eebc0d9fb', NULL, '333', '2024-04-09 10:12:36.131163', 0, '333', '{}', '19bbd529b53443fab2725361df112a3a', '2024-04-09 10:12:36.188238', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2cd-db61-5440-dac2-f3bc39e0a968', NULL, '333', '2024-04-09 10:12:41.441428', 0, '333', '{}', '004df5b95d914642ba4d8b932d086900', '2024-04-09 10:12:41.455887', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2cd-f286-d69b-6ae7-55c33c394c5f', NULL, '333', '2024-04-09 10:12:47.366790', 0, '333', '{}', '7ef022d98fea4818ae71d8382e535736', '2024-04-09 10:12:47.371571', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2d0-0cc0-a04e-8999-4b33f1490f7c', NULL, '333', '2024-04-09 10:15:05.143801', 0, '333', '{}', '46fb46270c084077abeb68ad3b892e22', '2024-04-09 10:15:05.596773', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-10 11:39:07.883931', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 1, '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-10 11:39:07.877763', '');
INSERT INTO `abpannouncements` VALUES ('3a11d2d0-2a29-7851-737b-7b2ed34733b5', NULL, '333', '2024-04-09 10:15:12.681390', 0, '333', '{}', '7b67530c0e3940c083c84d85cae33a08', '2024-04-09 10:15:12.752989', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2d8-cb16-b289-2d05-5a1a58f1f7c0', NULL, '333', '2024-04-09 10:24:38.155161', 0, '333', '{}', '24bbac6839bc451e8c8ec59eba042c91', '2024-04-09 10:24:38.531691', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2d9-1c3b-2d46-e054-f7aa28ff6bdc', NULL, '333', '2024-04-09 10:24:58.939397', 0, '333', '{}', '6850014ba00447489b34e4867d4f24df', '2024-04-09 10:24:59.000434', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2d9-7359-7579-df05-b3aafe50bb08', NULL, '333', '2024-04-09 10:25:21.241458', 0, '333', '{}', '5cb64a1e3e404e1689d1c1dba16a1a2f', '2024-04-09 10:25:21.247925', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2dc-17af-a73d-8178-5b2f41d9593b', NULL, '333', '2024-04-09 10:28:14.374745', 0, '333', '{}', 'e0efe5152a4c4a8a8f90122502ef4458', '2024-04-09 10:28:14.750983', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2dc-6065-d75e-8e61-8b4cd56de2d6', NULL, '333', '2024-04-09 10:28:32.997570', 0, '333', '{}', '192ef84103534fccb4597a3b5aa5b548', '2024-04-09 10:28:33.053049', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2dc-dba9-538b-195a-b4cecb3c0426', NULL, '333', '2024-04-09 10:29:04.553277', 0, '333', '{}', '998980225a84413a8acb1b60d896e9f0', '2024-04-09 10:29:04.559235', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d2e0-6c75-0022-a72a-06d5b01fc285', NULL, '333', '2024-04-09 10:32:58.219553', 0, '333', '{}', '6beb1af8dcfa42dab29b89d80ef7a99f', '2024-04-09 10:32:58.615137', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d307-b0be-a484-3c28-4eb8637b11dc', NULL, '4444', '2024-04-09 11:15:51.606800', 0, '343', '{}', '61e9ff6c40404288ac885b37af9ca534', '2024-04-09 11:15:51.642092', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d308-3e5c-d204-9c0a-5146a9c07a62', NULL, '777', '2024-04-09 11:16:27.868182', 0, '7777', '{}', '456e4c5898634e55861b2d705aa37c77', '2024-04-09 11:16:27.874745', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d308-edf2-3907-82cd-69ead7665fa4', NULL, '56756', '2024-04-09 11:17:12.818101', 0, '56756', '{}', '2660542066ca4585bfc1132dd1c0d1c2', '2024-04-09 11:17:12.824941', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d30a-e46e-9b02-2c45-9b65fe77607e', NULL, '4442423', '2024-04-09 11:19:21.446139', 0, '42242423', '{}', 'daf41c96861040cdac62582727e7fb07', '2024-04-09 11:19:21.500663', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d30c-c8b6-5549-3fb4-620e4b2e9ebe', NULL, '3434', '2024-04-09 11:21:25.419506', 0, '3434', '{}', '203c217ca1974b4c93cadf5a7e0256ca', '2024-04-09 11:21:25.699266', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d30d-2913-f94c-980d-82453146ad3a', NULL, '我发布了', '2024-04-09 11:21:50.099373', 0, '34534534', '{}', '6f221654ca294a3cbb4507624cd4861d', '2024-04-09 11:21:50.111750', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d450-5135-c0a6-0efd-67f3353e70e1', NULL, 'rtrtrt', '2024-04-09 17:14:48.486491', 0, '<blockquote>ytyty<strong>rtryrtyr</strong></blockquote>', '{}', '065d828a98b9460a994ce624986ebc22', '2024-04-09 17:14:48.516819', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d835-1f5f-8d1c-c441-999f4eb66432', NULL, '3333', '2024-04-10 11:23:35.121361', 0, '<p><img src=\"https://localhost:44368/api/basics/files/1177eee81a79652c3a017fe58b3e23e4\" alt=\"1\" data-href=\"https://localhost:44368/api/basics/files/1177eee81a79652c3a017fe58b3e23e4\" style=\"width: 176.14px;height: 87.91px;\"/></p>', '{}', '068ebe1c69294d2a87490ac5cbcefbbe', '2024-04-10 11:23:35.149630', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d836-c508-7c39-c9b1-e0da53ff1127', NULL, '3332222', '2024-04-10 11:25:23.079880', 0, '<p><img src=\"https://localhost:44368/api/basics/files/8ed289da8701ac44426ea354e29d449c\" alt=\"image\" data-href=\"https://localhost:44368/api/basics/files/8ed289da8701ac44426ea354e29d449c\" style=\"\"/></p>', '{}', 'f60f9d42a70c45b6a37c6f54005500bd', '2024-04-10 11:25:23.086560', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d838-57db-2fa3-cce9-ead511bcec8a', NULL, '333', '2024-04-10 03:26:55.727000', 0, '<p><br></p>', '{}', '604db39066c2460c803695f9ee63e7d8', '2024-04-10 11:27:06.208884', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d83a-19c1-647e-15a9-6c890b1e3b57', NULL, '444', '2024-04-10 11:29:01.376957', 0, '<p>rrrtter</p>', '{}', '8c6d6d5536064d93b3cb3d2e9b22e411', '2024-04-10 11:29:01.388498', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-10 11:40:10.534543', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d83c-3028-57d9-bd7a-0d2adb7aca22', NULL, '333', '2024-04-10 11:31:18.184115', 0, '<p><br></p>', '{}', '2129cb6e73404533b67b789681fc140e', '2024-04-10 11:31:18.189373', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-10 11:39:10.750072', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 1, '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-10 11:39:10.748732', '');
INSERT INTO `abpannouncements` VALUES ('3a11d90e-b1a3-3ed1-23d9-977d4bd6fd40', NULL, 'ee', '2024-04-10 15:21:13.887680', 0, '<p>rer</p>', '{}', '310f8909d57c43e89bdffe0f30246523', '2024-04-10 15:21:13.901271', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d90f-a216-63db-5913-70f81a26a2c4', NULL, '4', '2024-04-10 15:22:15.446378', 0, '<p>4</p>', '{}', '70d48462cbb5467abe8d57afad0115bd', '2024-04-10 15:22:15.451757', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d924-c3be-175a-1f79-c37aa9362fb2', NULL, '656', '2024-04-10 15:45:20.313146', 0, '<p>566</p>', '{}', 'ecdf27b4e86b407a863d729ed97536c4', '2024-04-10 15:45:20.336703', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d924-f866-5eec-2d2c-18b7954cbf18', NULL, '454', '2024-04-10 15:45:33.798225', 0, '<p>4545</p>', '{}', 'ecbbd60b34f544fc9ca7309004bb6d07', '2024-04-10 15:45:33.812095', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d934-bf88-56a7-5eeb-483b56065efa', NULL, '444', '2024-04-10 16:02:47.816294', 0, '<p>555</p>', '{}', '1cc755a8c69e459eaef3ef2ed62d9beb', '2024-04-10 16:02:47.821867', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d943-7541-199d-310b-a6907c57edf0', NULL, 'tuty', '2024-04-10 16:18:51.841748', 0, '<p>tytuty</p>', '{}', '7863a8be0a3c4ef99e14355f6337db4b', '2024-04-10 16:18:51.849159', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d943-ab92-3edd-448e-2402141d2daa', NULL, '67', '2024-04-10 16:19:05.746587', 0, '<p>6767</p>', '{}', 'e825831a86c54833b9a695feb2fb0427', '2024-04-10 16:19:05.753213', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d943-dbc6-4150-bbd7-aa639bf3fd1d', NULL, '676776', '2024-04-10 16:19:18.086873', 0, '<p>6767</p>', '{}', '37316be7f01f47d9be4282969d5d5e4f', '2024-04-10 16:19:18.093531', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11d96d-bc00-3d99-80cc-eab6a0c0fb48', NULL, '67', '2024-04-10 17:05:02.458536', 0, '<p>6776</p>', '{}', 'bc95db05106c4bef9014b6bf8dccbe56', '2024-04-10 17:05:02.483028', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a11def7-e6ca-7127-f3a3-5d92c21aa24a', NULL, 'erere', '2024-04-11 18:54:03.458541', 0, '<p>erreerrerrrrrrrr<img src=\"https://localhost:44368/api/basics/files/1177eee81a79652c3a017fe58b3e23e4\" alt=\"1\" data-href=\"https://localhost:44368/api/basics/files/1177eee81a79652c3a017fe58b3e23e4\" style=\"\"/></p>', '{}', '623a919b176b4279b3b42bfdd27098ee', '2024-04-11 18:54:03.480171', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-11 18:54:29.333964', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a121c61-e648-756e-64ff-5aaec67d5ed9', NULL, '```122', '2024-04-23 17:06:40.320032', 0, '<blockquote>454455</blockquote>', '{}', 'f9f11ab75e9e4d1b9a98c6dd13354bfb', '2024-04-23 17:06:40.338248', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-23 17:06:46.631933', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 1, '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-23 17:06:46.629689', '');
INSERT INTO `abpannouncements` VALUES ('3a121c62-4c1e-cc74-8a93-c1ace8a814c3', NULL, '``2`', '2024-04-23 17:07:06.398272', 0, '<blockquote>3444334</blockquote>', '{}', 'bbf2cf005f464eb5af28091b445ca8d2', '2024-04-23 17:07:06.407326', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpannouncements` VALUES ('3a1221ae-d208-fc49-1276-dac0ab38fd69', NULL, '4', '2024-04-24 17:48:47.495369', 0, '<p>454</p>', '{}', 'dc6223d3b5f54a3e9f89492f5d004526', '2024-04-24 17:48:47.522761', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL, '');

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
INSERT INTO `abpfeatures` VALUES ('3a114eb9-0b5a-bc82-60d5-2ad9ab758639', 'SettingManagement', 'SettingManagement.Enable', NULL, 'L:AbpSettingManagement,Feature:SettingManagementEnable', 'L:AbpSettingManagement,Feature:SettingManagementEnableDescription', 'true', 1, 0, NULL, '{\"name\":\"ToggleStringValueType\",\"properties\":{},\"validator\":{\"name\":\"BOOLEAN\",\"properties\":{}}}', '{}');
INSERT INTO `abpfeatures` VALUES ('3a114eb9-0b6b-51a3-feda-eccb54629d69', 'SettingManagement', 'SettingManagement.AllowChangingEmailSettings', 'SettingManagement.Enable', 'L:AbpSettingManagement,Feature:AllowChangingEmailSettings', NULL, 'false', 1, 0, NULL, '{\"name\":\"ToggleStringValueType\",\"properties\":{},\"validator\":{\"name\":\"BOOLEAN\",\"properties\":{}}}', '{}');

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
INSERT INTO `abpfiles` VALUES ('3a119baa-f4ec-7fff-396c-c204dd900847', '1177eee81a79652c3a017fe58b3e23e4', '1', '.png', 519844, 'omg\\png\\1177eee81a79652c3a017fe58b3e23e4.png', 'omg', NULL, 0, '{}', '8159efed370b409594c2023b8a3988bb', '2024-03-29 17:15:27.362057', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abpfiles` VALUES ('3a11d836-aa1d-a4c2-7ae7-0f34d4b42647', '8ed289da8701ac44426ea354e29d449c', 'image', '.png', 4062, 'omg\\png\\8ed289da8701ac44426ea354e29d449c.png', 'omg', NULL, 0, '{}', '3ffca2ec662249ba908dd546e790ae96', '2024-04-10 11:25:16.190216', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);

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
INSERT INTO `abpfilesprojectname` VALUES ('3a119bec-0e37-e398-9d14-8b45f265c8e4', 'omg', NULL, 0, '{}', 'a32e4abb4406427b953e86c7cd233d09', '2024-03-29 18:26:33.669660', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abpfilesprojectname` VALUES ('3a119bec-244a-eeff-fd85-a6ecf0addb1a', 'omg', '3a118a9c-64ff-5afe-05f0-acc345b00377', 0, '{}', 'e0915caf380746d7801b402fcec5dc46', '2024-03-29 18:26:39.307491', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abpfilesprojectname` VALUES ('3a119bec-2cac-b8f3-9566-1eabb86268dd', 'omg', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 0, '{}', '0365fe1fe2ae4f489ced8358b3a00594', '2024-03-29 18:26:41.453265', NULL, NULL, NULL, 0, NULL, NULL);

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
INSERT INTO `abpfileswhitelist` VALUES ('3a119bec-0c88-fc14-0e8a-3936b3fc218f', '.png', NULL, 0, '{}', '9715583d32134d82bd2dffd840df70e3', '2024-03-29 18:26:33.251916', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abpfileswhitelist` VALUES ('3a119bec-2442-655d-c6ff-7f8a22d5bac1', '.png', '3a118a9c-64ff-5afe-05f0-acc345b00377', 0, '{}', 'd76e87c3e3fb4e2ea32e75c02086c08b', '2024-03-29 18:26:39.302406', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abpfileswhitelist` VALUES ('3a119bec-2ca7-1816-9871-6875e985d1a1', '.png', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 0, '{}', '5709914702974e4591e9c075df2ceb1d', '2024-03-29 18:26:41.449470', NULL, NULL, NULL, 0, NULL, NULL);

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
  `CreationTime` datetime(6) NOT NULL,
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
INSERT INTO `abporganizationunits` VALUES ('038ca515-91d4-4f08-b7ac-596abd382754', NULL, '2db5f3f9-fef2-43c1-8b48-16373bbe825f', '00011.00001', '市中区', 0, '{}', 'f5dbd0c4eae24012bcb019d4c5e2baee', '2024-03-15 17:41:39.790547', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('0688b5be-6ed7-4fbe-beaa-20d5505958e5', NULL, 'e689e0d5-fdc3-4f5a-85e5-ba0ade731028', '00001.00003', '金牛区', 0, '{}', '782a98de55cb49a89812ef5cf1de65b4', '2024-03-15 17:41:39.476199', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('1503c7e7-8b84-4180-935b-d5fcdea2fc46', NULL, NULL, '00004', '攀枝花市', 0, '{}', '68153e65aa8e483da38add00ba7083b5', '2024-03-15 17:41:39.606576', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('1777a356-91a0-4c24-9314-8ce3a2e79843', NULL, NULL, '00008', '广元市', 0, '{}', 'fb5cbdba306942c39afa9cb5206f2daf', '2024-03-15 17:41:39.693367', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('1f4c3fec-4e1c-480b-bdeb-e7a15b54ff7e', NULL, 'd3bc671d-9550-4fc0-9fbf-bd1d3c8ea3bd', '00001.00001.00004', '春熙路街道', 0, '{}', '791ec57105634012b3a2a2db0ddc36c8', '2024-03-15 17:41:39.436260', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('2db5f3f9-fef2-43c1-8b48-16373bbe825f', NULL, NULL, '00011', '乐山市', 0, '{}', 'e7a1627373a04b5e9f86a3265569a318', '2024-03-15 17:41:39.757786', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('3a116801-5746-e13f-4707-8d81cb6b5a0e', NULL, '91e529ed-1067-4d74-8843-b4f663f00b28', '00002.00001', '长林县', 0, '{}', '1196cee2a03540c697906459801c37b6', '2024-03-19 16:29:33.719765', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('3a116802-48a6-3771-584e-62425b95341d', NULL, NULL, '00013', '资阳', 2, '{}', '4b1123b4956342e79eed95544c27044c', '2024-03-19 16:30:35.200316', NULL, '2024-03-20 10:50:46.994451', NULL, 1, NULL, '2024-03-20 10:44:53.264391');
INSERT INTO `abporganizationunits` VALUES ('3a116810-a55c-43d4-b9be-5d4b6fba9b73', NULL, NULL, '00014', '资阳市', 0, '{}', 'f97536c889234854afd1fd7118b0def6', '2024-03-19 16:46:16.460318', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('3a118698-f50f-4a06-38c4-32f60cce37b1', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', NULL, '00001', 'ces', 0, '{}', 'ce90f8a1efa04bfda080adf80f0729cd', '2024-03-25 15:03:46.262752', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('3a1186a2-6b86-e69d-23c6-d292576063b9', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', '3a118698-f50f-4a06-38c4-32f60cce37b1', '00001.00001', 'ces1', 0, '{}', '7fd74e4f06564eb18f5087d64188ff01', '2024-03-25 15:14:06.443360', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('3a1186a7-5c51-6fac-f64b-414c6d716849', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', '3a118698-f50f-4a06-38c4-32f60cce37b1', '00001.00002', 'ces2', 0, '{}', '1efefcfba59249568f21d999e0894b33', '2024-03-25 15:19:30.168322', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('41dd202e-0c01-4a15-aec0-bf7b92d0753f', NULL, '038ca515-91d4-4f08-b7ac-596abd382754', '00011.00001.00003', '上河街街道', 0, '{}', '009af00c49ce4b3f9f028f9624819fee', '2024-03-15 17:41:39.876868', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('5690d271-2b5a-432c-9129-6602ae5b2903', NULL, NULL, '00012', '南充市', 0, '{}', '5659ec9975574d9fb2e969d7247a4013', '2024-03-15 17:41:39.940190', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('5e6c4401-78f6-4b0b-82cf-ea17b8d99f71', NULL, '038ca515-91d4-4f08-b7ac-596abd382754', '00011.00001.00002', '大佛街道', 0, '{}', '72c3a066490b46dcb2e20874308ccff8', '2024-03-15 17:41:39.857563', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('770ab941-1504-4a30-8342-496c2978cd2a', NULL, NULL, '00007', '绵阳市', 0, '{}', '33cdbf6f1aef42cd99a160964b1e9168', '2024-03-15 17:41:39.671853', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('91e529ed-1067-4d74-8843-b4f663f00b28', NULL, NULL, '00002', '宜宾市', 0, '{}', 'c5e59278aee7420ab64c570a02054b27', '2024-03-15 17:41:39.563997', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('9b12f138-66e4-47aa-a58a-24fff74c2783', NULL, NULL, '00009', '遂宁市', 0, '{}', '10e2355482d34ab09c9f4f0028d6008b', '2024-03-15 17:41:39.714159', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('a60769a0-5ac2-4a3a-9c3c-07d1c5e67041', NULL, '2db5f3f9-fef2-43c1-8b48-16373bbe825f', '00011.00003', '五通桥区', 0, '{}', 'bd7076bc51d6440eaec9b0cdd86db5be', '2024-03-15 17:41:39.915661', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('a6976499-4006-4891-96cf-6eeb60691ca8', NULL, 'e689e0d5-fdc3-4f5a-85e5-ba0ade731028', '00001.00004', '武侯区', 0, '{}', 'c9fc3bd073874aa7b2da9ea887fb43ae', '2024-03-15 17:41:39.496486', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('ad8a6979-e587-4ea2-9beb-36b8808becdc', NULL, 'e689e0d5-fdc3-4f5a-85e5-ba0ade731028', '00001.00005', '成华区', 0, '{}', '90859e4b11cd40439278e047bc3e2d14', '2024-03-15 17:41:39.516095', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('b90e064b-db56-49f3-9b03-04f30b150ae4', NULL, '2db5f3f9-fef2-43c1-8b48-16373bbe825f', '00011.00002', '沙湾区', 0, '{}', 'c6695434439a43f8ac01a12fc1e6d506', '2024-03-15 17:41:39.896015', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('bd47fa81-e96c-4b24-9703-cdc97a27bb24', NULL, '038ca515-91d4-4f08-b7ac-596abd382754', '00011.00001.00001', '牟子镇', 0, '{}', '658c614aa10749e8901b80f4018ec5b8', '2024-03-15 17:41:39.833135', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('d13fe02a-d044-460c-a9fa-cb9566eb9f04', NULL, NULL, '00010', '内江市', 0, '{}', 'd648f3de91ca4d6d825ca5cc8ae2ff03', '2024-03-15 17:41:39.736077', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('d208cb9f-e141-4c74-969b-f24bb859f0ba', NULL, NULL, '00003', '自贡市', 0, '{}', '8435111429bc46faad968af089edfdf1', '2024-03-15 17:41:39.583652', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('d3bc671d-9550-4fc0-9fbf-bd1d3c8ea3bd', NULL, 'e689e0d5-fdc3-4f5a-85e5-ba0ade731028', '00001.00001', '锦江区', 0, '{}', '340df23bcb734dda8394032619e83530', '2024-03-15 17:41:39.339114', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('de4822d3-3d04-4a6a-8ab7-ec1bfa722b61', NULL, 'd3bc671d-9550-4fc0-9fbf-bd1d3c8ea3bd', '00001.00001.00001', '盐市口街道', 0, '{}', '45e969ef06894bbc8bbde96490fc70c4', '2024-03-15 17:41:39.369830', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('e689e0d5-fdc3-4f5a-85e5-ba0ade731028', NULL, NULL, '00001', '成都市', 0, '{}', '9b9d4541bd4e4484aeaef54613f89274', '2024-03-15 17:41:39.154644', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('eba3ca4d-c842-44ca-bbd4-1dfea833d6a8', NULL, 'e689e0d5-fdc3-4f5a-85e5-ba0ade731028', '00001.00002', '青羊区', 0, '{}', '8ea0070123d34b259bbcc52d34be4473', '2024-03-15 17:41:39.457203', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('f443936e-c2a4-426e-9492-581935c1335f', NULL, 'd3bc671d-9550-4fc0-9fbf-bd1d3c8ea3bd', '00001.00001.00003', '督院街街道', 0, '{}', '9a908951e55e44e5a49fd1b76530fa52', '2024-03-15 17:41:39.415435', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('f785d3c1-856c-4f48-9eaf-0ec2ad8bf70b', NULL, 'd3bc671d-9550-4fc0-9fbf-bd1d3c8ea3bd', '00001.00001.00002', '太升路街道', 0, '{}', '409c360b46a54b5fbfc65677e39c8bf2', '2024-03-15 17:41:39.393815', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('f98fc1bb-a37f-4229-8adc-013df20eed51', NULL, NULL, '00006', '德阳市', 0, '{}', '5d7050d172744683969001016e74b1d9', '2024-03-15 17:41:39.646707', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('fdf733c4-0054-4f43-acac-4e844dfc5a86', NULL, NULL, '00005', '泸州市', 0, '{}', '87312453d0fc4edc9064818672ffcbe2', '2024-03-15 17:41:39.627764', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `abporganizationunits` VALUES ('ff148518-b41c-47cc-9a0b-5a52f39c81dc', NULL, 'e689e0d5-fdc3-4f5a-85e5-ba0ade731028', '00001.00006', '高新区', 0, '{}', 'f2586984dbe94e77bd10168becb6b571', '2024-03-15 17:41:39.536873', NULL, NULL, NULL, 0, NULL, NULL);

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
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9079-4a4f-3dae-c329b5328be0', NULL, 'AbpIdentity.Roles', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9080-7471-9335-44b96c70e21a', NULL, 'AbpIdentity.Roles.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9081-4e57-b35f-7810b0afefdb', NULL, 'AbpIdentity.Roles.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9082-b05a-494c-7eb974a1469f', NULL, 'AbpIdentity.Roles.ManagePermissions', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9081-ad04-35d7-c1f8dd70f19a', NULL, 'AbpIdentity.Roles.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9082-c35b-fe5c-a808aa1db861', NULL, 'AbpIdentity.Users', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9082-ff26-9e85-5828b206ef8b', NULL, 'AbpIdentity.Users.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9082-43f2-1e11-49b170824aaf', NULL, 'AbpIdentity.Users.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9082-ba31-d48c-9cc35ccd3b0d', NULL, 'AbpIdentity.Users.ManagePermissions', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9082-a242-9356-7522ebf7e005', NULL, 'AbpIdentity.Users.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a12025e-3ae1-35a3-9dd8-9376f86a6a01', NULL, 'AbpIdentity.Users.Update.ManageRoles', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9082-0254-5bce-ce1026e9c5fc', NULL, 'AbpTenantManagement.Tenants', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9082-bd23-8f10-4d133940dae8', NULL, 'AbpTenantManagement.Tenants.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9082-7e3f-c216-adfa391c7f9f', NULL, 'AbpTenantManagement.Tenants.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9082-7ac1-29c1-ab02b8ddfe2a', NULL, 'AbpTenantManagement.Tenants.ManageConnectionStrings', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9082-9dc5-807d-715351f686b3', NULL, 'AbpTenantManagement.Tenants.ManageFeatures', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9082-c795-15d4-f470109fbac2', NULL, 'AbpTenantManagement.Tenants.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9082-7376-cdbd-7692234b2e45', NULL, 'FeatureManagement.ManageHostFeatures', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a136582-d79c-170f-117b-058c0beb421b', NULL, 'Panda.Net.Basic', 'R', '6t6');
INSERT INTO `abppermissiongrants` VALUES ('3a11afe8-6024-04b6-326a-859434dacafd', NULL, 'Panda.Net.Basic', 'R', 'rrr');
INSERT INTO `abppermissiongrants` VALUES ('3a11668e-b2b4-c545-1798-d34681ccd5db', NULL, 'Panda.Net.Basic', 'R', '测试角色');
INSERT INTO `abppermissiongrants` VALUES ('3a133616-306a-d1a9-a980-b77c53a47084', NULL, 'Panda.Net.Basic.AllAgent', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a136582-d7a7-a418-4b0d-104559dce402', NULL, 'Panda.Net.Basic.AllMerchant', 'R', '6t6');
INSERT INTO `abppermissiongrants` VALUES ('3a133616-3071-93a9-bffb-cc48d0f22895', NULL, 'Panda.Net.Basic.AllMerchant', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11c97e-f359-4de7-aac5-e8f072f74526', NULL, 'Panda.Net.Basic.Announcements', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11c97e-f35e-f338-64d9-dfd62333de50', NULL, 'Panda.Net.Basic.Announcements.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11c97e-f35f-cf58-87a6-7cde981c3328', NULL, 'Panda.Net.Basic.Announcements.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11c97e-f35f-8c0e-0c11-31eb531a898e', NULL, 'Panda.Net.Basic.Announcements.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb8-98b5-2b50-fed3-78a5980f6af6', NULL, 'Panda.Net.Basic.Menus', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11afe8-6031-83f4-f07a-fea8f0498019', NULL, 'Panda.Net.Basic.Menus', 'R', 'rrr');
INSERT INTO `abppermissiongrants` VALUES ('3a11668e-b2c9-6819-607e-26a2f6b5a8c0', NULL, 'Panda.Net.Basic.Menus', 'R', '测试角色');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb8-98b9-024a-4d22-e85c96cc6310', NULL, 'Panda.Net.Basic.Menus.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11afe8-6033-3402-1989-14ebc0c00cf9', NULL, 'Panda.Net.Basic.Menus.Create', 'R', 'rrr');
INSERT INTO `abppermissiongrants` VALUES ('3a11668e-b2cb-9624-583c-f57b021b1ee2', NULL, 'Panda.Net.Basic.Menus.Create', 'R', '测试角色');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb8-98ba-6413-c494-bcefe730dec9', NULL, 'Panda.Net.Basic.Menus.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11afe8-6036-b491-7d19-6d22808523d8', NULL, 'Panda.Net.Basic.Menus.Delete', 'R', 'rrr');
INSERT INTO `abppermissiongrants` VALUES ('3a11668e-b2ce-b38d-5004-2499feced2e6', NULL, 'Panda.Net.Basic.Menus.Delete', 'R', '测试角色');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb8-98ba-68a9-4023-da8f235bc2dc', NULL, 'Panda.Net.Basic.Menus.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11afe8-6035-9514-587d-f87ff421d878', NULL, 'Panda.Net.Basic.Menus.Update', 'R', 'rrr');
INSERT INTO `abppermissiongrants` VALUES ('3a11668e-b2cc-e1f4-91ef-28b393553c80', NULL, 'Panda.Net.Basic.Menus.Update', 'R', '测试角色');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb8-98ba-ec18-04e4-3d11587d7535', NULL, 'Panda.Net.Basic.Organizations', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11afe8-603c-0d9c-d82d-2993f50d49a6', NULL, 'Panda.Net.Basic.Organizations', 'R', 'rrr');
INSERT INTO `abppermissiongrants` VALUES ('3a11668e-b2d6-d723-ca11-8bcb3e500fba', NULL, 'Panda.Net.Basic.Organizations', 'R', '测试角色');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb8-98ba-fe3b-0f66-2471f4699688', NULL, 'Panda.Net.Basic.Organizations.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11afe8-6040-82d6-a190-8ea348762870', NULL, 'Panda.Net.Basic.Organizations.Create', 'R', 'rrr');
INSERT INTO `abppermissiongrants` VALUES ('3a11668e-b2da-0a5b-aee4-5c8e9aa4da85', NULL, 'Panda.Net.Basic.Organizations.Create', 'R', '测试角色');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb8-98ba-1e3d-d7fa-48785328ffde', NULL, 'Panda.Net.Basic.Organizations.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11afe8-603f-a92f-f4e9-f76dcc9fe865', NULL, 'Panda.Net.Basic.Organizations.Delete', 'R', 'rrr');
INSERT INTO `abppermissiongrants` VALUES ('3a11668e-b2d9-d2ec-6871-ebcc6fb797fa', NULL, 'Panda.Net.Basic.Organizations.Delete', 'R', '测试角色');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb8-98ba-2b44-f9d6-e228138c9036', NULL, 'Panda.Net.Basic.Organizations.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11afe8-603d-8874-e6b8-24b7ab2c88d0', NULL, 'Panda.Net.Basic.Organizations.Update', 'R', 'rrr');
INSERT INTO `abppermissiongrants` VALUES ('3a11668e-b2d7-a0ad-a014-41020f881b3a', NULL, 'Panda.Net.Basic.Organizations.Update', 'R', '测试角色');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9082-26ff-4bcf-e04e38388c0b', NULL, 'Panda.Net.Basic.Roles', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11afe8-602d-fa66-c561-17a24f7ae235', NULL, 'Panda.Net.Basic.Roles', 'R', 'rrr');
INSERT INTO `abppermissiongrants` VALUES ('3a11668e-b2c1-d44a-3834-a1eea913f53c', NULL, 'Panda.Net.Basic.Roles', 'R', '测试角色');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9083-7815-1d29-b5a2deb6b965', NULL, 'Panda.Net.Basic.Roles.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11afe8-6030-07ce-1f2b-c9c1e2b71d97', NULL, 'Panda.Net.Basic.Roles.Create', 'R', 'rrr');
INSERT INTO `abppermissiongrants` VALUES ('3a11668e-b2c7-b695-cb2a-b3b071bdb1f3', NULL, 'Panda.Net.Basic.Roles.Create', 'R', '测试角色');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9083-7739-7bd3-7128d19e5c80', NULL, 'Panda.Net.Basic.Roles.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11afe8-602e-4406-b2a6-96f38c37cc98', NULL, 'Panda.Net.Basic.Roles.Delete', 'R', 'rrr');
INSERT INTO `abppermissiongrants` VALUES ('3a11668e-b2c3-a511-f107-eb488615948d', NULL, 'Panda.Net.Basic.Roles.Delete', 'R', '测试角色');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9083-9ef4-8326-1b7940048bf2', NULL, 'Panda.Net.Basic.Roles.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11afe8-602f-4d2a-8e25-59fe277f47dd', NULL, 'Panda.Net.Basic.Roles.Update', 'R', 'rrr');
INSERT INTO `abppermissiongrants` VALUES ('3a11668e-b2c5-7cf0-4afe-b2fa5f070ce0', NULL, 'Panda.Net.Basic.Roles.Update', 'R', '测试角色');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb8-98ba-7bb8-7d9f-2f49a6e066bb', NULL, 'Panda.Net.Basic.Tenants', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11afe8-6038-399e-1876-e4d75a0138b7', NULL, 'Panda.Net.Basic.Tenants', 'R', 'rrr');
INSERT INTO `abppermissiongrants` VALUES ('3a11668e-b2cf-d591-2949-4c055f399882', NULL, 'Panda.Net.Basic.Tenants', 'R', '测试角色');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb8-98ba-8fd8-30a8-b2ae8d56175a', NULL, 'Panda.Net.Basic.Tenants.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11afe8-603b-95c1-ae63-a8ac5b055080', NULL, 'Panda.Net.Basic.Tenants.Create', 'R', 'rrr');
INSERT INTO `abppermissiongrants` VALUES ('3a11668e-b2d4-de87-4035-43ba5dcee7c4', NULL, 'Panda.Net.Basic.Tenants.Create', 'R', '测试角色');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb8-98ba-bffc-66cb-7557a4d7cd43', NULL, 'Panda.Net.Basic.Tenants.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11afe8-603a-741c-9877-e56e9f1baa69', NULL, 'Panda.Net.Basic.Tenants.Delete', 'R', 'rrr');
INSERT INTO `abppermissiongrants` VALUES ('3a11668e-b2d3-1b18-9d1e-5caff9092027', NULL, 'Panda.Net.Basic.Tenants.Delete', 'R', '测试角色');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb8-98ba-0939-494b-f02be22b0e28', NULL, 'Panda.Net.Basic.Tenants.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11afe8-6039-7aea-9413-1e1d0770cb21', NULL, 'Panda.Net.Basic.Tenants.Update', 'R', 'rrr');
INSERT INTO `abppermissiongrants` VALUES ('3a11668e-b2d1-6db1-d672-8bdf8bb08a5a', NULL, 'Panda.Net.Basic.Tenants.Update', 'R', '测试角色');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9083-2f43-9c23-4e3687e0092e', NULL, 'Panda.Net.Basic.Users', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11afe8-6027-1133-fd98-ec2c29539728', NULL, 'Panda.Net.Basic.Users', 'R', 'rrr');
INSERT INTO `abppermissiongrants` VALUES ('3a11668e-b2b8-d0ff-329f-37f82a566b43', NULL, 'Panda.Net.Basic.Users', 'R', '测试角色');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9083-ccd5-4c6b-53cd7e7ab989', NULL, 'Panda.Net.Basic.Users.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11afe8-6029-d832-76b8-1782a9f993e2', NULL, 'Panda.Net.Basic.Users.Create', 'R', 'rrr');
INSERT INTO `abppermissiongrants` VALUES ('3a11668e-b2bb-a063-c2e0-c1ab1295becf', NULL, 'Panda.Net.Basic.Users.Create', 'R', '测试角色');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9083-7767-fbb4-e3134aea22b2', NULL, 'Panda.Net.Basic.Users.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11afe8-602a-227d-b2c7-abd5ebf1f4bc', NULL, 'Panda.Net.Basic.Users.Delete', 'R', 'rrr');
INSERT INTO `abppermissiongrants` VALUES ('3a11668e-b2bd-7586-979f-6bf6f375ae70', NULL, 'Panda.Net.Basic.Users.Delete', 'R', '测试角色');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9083-d7b1-1893-0cda31687e0a', NULL, 'Panda.Net.Basic.Users.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11afe8-602b-934b-b964-f3bbc69de573', NULL, 'Panda.Net.Basic.Users.Update', 'R', 'rrr');
INSERT INTO `abppermissiongrants` VALUES ('3a11668e-b2be-cd81-eff6-30546312b3a0', NULL, 'Panda.Net.Basic.Users.Update', 'R', '测试角色');
INSERT INTO `abppermissiongrants` VALUES ('3a12025e-3ae9-acdb-f4e8-da900ce11050', NULL, 'Panda.Net.Basic.WorkFlowCreates', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a12025e-3ae6-2a03-1051-d3ca2958399b', NULL, 'Panda.Net.Basic.WorkFlowList', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a12025e-3ae7-2b45-79e1-e46c8978f203', NULL, 'Panda.Net.Basic.WorkFlowList.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a12025e-3ae9-cab4-a361-8b1b0d48a4fa', NULL, 'Panda.Net.Basic.WorkFlowList.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a12025e-3ae9-d293-0f11-d3681c7439e2', NULL, 'Panda.Net.Basic.WorkFlowList.Start', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a12025e-3ae8-eef3-0e14-8e8e199b7123', NULL, 'Panda.Net.Basic.WorkFlowList.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9082-c46b-4e13-6071eb53aac1', NULL, 'SettingManagement.Emailing', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9082-ff44-b0fe-9269b2df6a7b', NULL, 'SettingManagement.Emailing.Test', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a114eb4-9082-b441-5a7f-640e73918444', NULL, 'SettingManagement.TimeZone', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27b7-fb71-932c-12f3864508f0', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'AbpIdentity.Roles', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27b9-a4b7-ca2a-3379e13b6db4', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'AbpIdentity.Roles.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27bd-eea8-f85f-e8d7943b838e', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'AbpIdentity.Roles.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27be-9f5e-a632-c6a7cfb5cc14', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'AbpIdentity.Roles.ManagePermissions', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27ba-5dfa-c303-5454decaddbd', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'AbpIdentity.Roles.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27be-7572-e319-fa627d5e1fa6', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'AbpIdentity.Users', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27bf-8815-a683-60885201b040', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'AbpIdentity.Users.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27bf-4590-5012-6d42b632a420', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'AbpIdentity.Users.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27bf-7d1f-69d6-e0fbcef426e0', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'AbpIdentity.Users.ManagePermissions', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27bf-5a8b-d1d3-0c8f4265ffdb', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'AbpIdentity.Users.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a120265-de9e-0464-ca78-c20a5f39e45d', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'AbpIdentity.Users.Update.ManageRoles', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118683-f4e7-a3b5-3726-fdf9bdfca3f3', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic', 'R', '超级角色');
INSERT INTO `abppermissiongrants` VALUES ('3a133616-3aff-528d-39be-fa34985db6bf', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.AllAgent', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a133616-3b00-681c-3b37-ebb54cdace30', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.AllMerchant', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11c97e-f959-4ec7-6cec-804caf78475e', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Announcements', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11c97e-f95a-1401-85c8-95faafa59c8a', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Announcements.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11c97e-f95b-cdca-e329-d2b37f8d4914', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Announcements.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11c97e-f95a-866f-b702-a2aa5c2f82f6', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Announcements.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27c3-0c1c-cd9c-d10e7b2c1976', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Menus', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118683-f4f2-037f-8c0a-cc49183ae71d', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Menus', 'R', '超级角色');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27c3-4cce-52cc-93755c8ded03', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Menus.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118683-f4f3-3535-0a33-16343ee5bb5b', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Menus.Create', 'R', '超级角色');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27c4-645b-8516-443b551bbcd5', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Menus.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118683-f4f5-d44f-8bee-293518653236', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Menus.Delete', 'R', '超级角色');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27c3-8f70-b681-c9dcd9a6af84', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Menus.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118683-f4f4-e3d9-fe02-5979fb0bd8cc', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Menus.Update', 'R', '超级角色');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27c4-a8ba-9247-18dba1cb1ca9', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Organizations', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118683-f4fa-46f1-52c6-117a2103c588', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Organizations', 'R', '超级角色');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27c4-1694-f616-dd5220dff2c4', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Organizations.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118683-f4fd-7d7e-aeb3-ed926e56e992', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Organizations.Create', 'R', '超级角色');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27c5-01c8-55e4-0df810c0f417', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Organizations.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118683-f4fc-5d5d-857f-8a8701ab4fa0', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Organizations.Delete', 'R', '超级角色');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27c4-97f9-5a39-176841534a1f', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Organizations.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118683-f4fb-217c-59e5-a4062edaef18', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Organizations.Update', 'R', '超级角色');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27c1-4a0f-0384-ae0f76be28da', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Roles', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118683-f4ee-cf37-e02d-26d362d73ba1', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Roles', 'R', '超级角色');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27c1-4d05-e2ff-48f969585c4f', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Roles.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118683-f4f1-6cb6-12dc-281f03e00f47', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Roles.Create', 'R', '超级角色');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27c1-15a5-209d-ac8205260261', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Roles.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118683-f4ee-7e57-1407-a0300ea92bbf', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Roles.Delete', 'R', '超级角色');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27c1-a243-3085-effb9b2382ae', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Roles.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118683-f4f0-d387-68e0-b5c372543e1c', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Roles.Update', 'R', '超级角色');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27c5-e758-96a2-c2240678e3ec', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Tenants', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118683-f4f6-0e0b-db7a-b419d4027087', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Tenants', 'R', '超级角色');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27c5-5e93-385a-4fc56426ec5a', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Tenants.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118683-f4f9-006e-4331-0e259525e319', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Tenants.Create', 'R', '超级角色');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27c6-a746-cd40-d54f970b8297', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Tenants.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118683-f4f8-4886-edf8-886f29308b0d', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Tenants.Delete', 'R', '超级角色');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27c6-f5f2-b121-e9e7366789ed', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Tenants.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118683-f4f7-0301-20ac-b0e5c88569f6', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Tenants.Update', 'R', '超级角色');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27c2-dd28-15bd-a2f09f21036d', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Users', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118683-f4e9-4eee-d6c0-fdccf541d016', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Users', 'R', '超级角色');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27c2-28c4-6632-6fd32678a496', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Users.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118683-f4ea-f079-2ee3-87646faa5264', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Users.Create', 'R', '超级角色');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27c3-c306-15ce-863da7f5a96f', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Users.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118683-f4eb-735e-a354-2b8852378074', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Users.Delete', 'R', '超级角色');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27c2-6cbe-789c-271fb5e0f2bb', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Users.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118683-f4ed-2a04-19ac-0ff48b743778', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.Users.Update', 'R', '超级角色');
INSERT INTO `abppermissiongrants` VALUES ('3a120265-dea2-d83a-4c42-6797ce5c9d05', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.WorkFlowCreates', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a120265-de9f-efa3-af0e-5756535c4053', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.WorkFlowList', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a120265-dea0-f64b-9f9f-dc10f6d076ae', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.WorkFlowList.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a120265-dea0-4630-d8ec-a4a4d430931d', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.WorkFlowList.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a120265-dea1-e953-f030-bd156072abf1', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.WorkFlowList.Start', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a120265-dea0-8b28-2afc-cac55a026772', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.Basic.WorkFlowList.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27c0-8dde-26b7-9c4d6de0c66d', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'SettingManagement.Emailing', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27c0-a646-8deb-84ff6e207679', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'SettingManagement.Emailing.Test', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118b8b-27c0-174f-0b5b-2aa27b8ce2ca', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'SettingManagement.TimeZone', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-669c-081e-e0c3-03a32d788d47', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'AbpIdentity.Roles', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-669e-e4ae-f794-efe9ef50b45e', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'AbpIdentity.Roles.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-669f-29c9-fdd0-36775065ebb2', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'AbpIdentity.Roles.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-669f-88b5-0d5e-ed7a02ef9d31', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'AbpIdentity.Roles.ManagePermissions', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-669f-1651-f7ef-fd5985fb46a1', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'AbpIdentity.Roles.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-669f-231d-6c8e-b634c3699d8a', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'AbpIdentity.Users', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-669f-6efd-dc81-68abd52625d5', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'AbpIdentity.Users.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-669f-d226-c46e-af6fe2b283c2', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'AbpIdentity.Users.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-669f-417c-b181-eeaa2e1a1fc7', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'AbpIdentity.Users.ManagePermissions', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-669f-424f-f432-525efc48efae', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'AbpIdentity.Users.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a120265-ddae-0746-d6ee-113fea9c25e4', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'AbpIdentity.Users.Update.ManageRoles', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a133616-3aa2-18c0-515c-f24d2fcc98fb', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.AllAgent', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a133616-3aa3-4836-dc2f-94ddaf487a3d', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.AllMerchant', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11c97e-f8d1-e338-dcf9-5105f988f7cd', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Announcements', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11c97e-f8d2-052b-577e-ec51ce07577e', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Announcements.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11c97e-f8d3-a7a8-4612-9bb19d020de7', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Announcements.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a11c97e-f8d2-32e9-592d-2c249a83eab3', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Announcements.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-66a1-f68c-acda-3d7c0f1184c6', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Menus', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-66a1-9cdc-2ee7-e7fbfffb4d0a', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Menus.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-66a1-f4f3-0f67-95bb38ab3dbe', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Menus.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-66a1-a77e-c99a-a1857a333f3a', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Menus.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-66a1-f235-27c9-b9d2df082f2f', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Organizations', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-66a1-985e-fa8b-bb2240b73813', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Organizations.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-66a2-b146-553b-3a4251ef947c', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Organizations.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-66a1-5689-4b75-cfc5491b6015', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Organizations.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-66a0-5cbc-e2b9-18a434b7aacc', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Roles', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-66a0-97a4-a9ae-46d96f2e5391', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Roles.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-66a0-ca50-c8bc-3c5fb83bdf78', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Roles.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-66a0-2292-b9f4-c663f19514b5', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Roles.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-66a2-a1ab-e2b6-9e129036c632', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Tenants', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-66a2-93b1-c141-c1a511dc7285', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Tenants.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-66a2-59b5-9d71-ccd3318e6d7a', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Tenants.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-66a2-5e62-370b-b48ae23ffb36', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Tenants.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-66a0-e2b1-2549-1d1bb093339e', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Users', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-66a0-a0a2-49ad-665d5e45e1b6', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Users.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-66a1-46c9-faf2-10314f1281e8', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Users.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-66a0-c636-effb-ee30b8418ba6', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.Users.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a120265-ddd0-dc23-fd0f-7a0426b55648', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.WorkFlowCreates', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a120265-ddcb-49d0-775e-546c59527426', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.WorkFlowList', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a120265-ddcd-a372-43b7-1a013dcfcf4b', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.WorkFlowList.Create', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a120265-ddcf-3ca5-41a2-8ff47116dc0a', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.WorkFlowList.Delete', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a120265-ddcf-ca3e-0c91-58c193ae2adb', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.WorkFlowList.Start', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a120265-ddce-87f2-b981-ea99de7eceaf', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'Panda.Net.Basic.WorkFlowList.Update', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-66a0-4ada-dbf7-ddbb0b80accd', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'SettingManagement.Emailing', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-66a0-39fc-d295-22987fdf35c3', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'SettingManagement.Emailing.Test', 'R', 'admin');
INSERT INTO `abppermissiongrants` VALUES ('3a118a9c-66a0-9016-646f-a64c47c74ca0', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'SettingManagement.TimeZone', 'R', 'admin');

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
INSERT INTO `abppermissiongroups` VALUES ('3a114eb4-a1cb-8d92-6fef-52758fc1e13a', 'AbpIdentity', '用户模块管理', '{}');
INSERT INTO `abppermissiongroups` VALUES ('3a114eb4-a1cf-2d56-4e8a-91784997664b', 'SettingManagement', '配置模块管理', '{}');
INSERT INTO `abppermissiongroups` VALUES ('3a114eb4-a1cf-38f9-aa95-9e46af62ca23', 'FeatureManagement', '功能模块管理', '{}');
INSERT INTO `abppermissiongroups` VALUES ('3a114eb4-a1d0-9453-9a27-c5030f9e57cb', 'Panda.Net.Basic', '基础信息管理', '{\"type\":0,\"path\":\"/basic\",\"icon\":\"basic\"}');
INSERT INTO `abppermissiongroups` VALUES ('3a114eb4-a1d0-f580-7c94-6acfe934f1c4', 'AbpTenantManagement', '租户模块管理', '{}');
INSERT INTO `abppermissiongroups` VALUES ('3a12a781-b0ae-70cc-3fd5-6fb4566f99c4', 'BookStore', 'F:BookStore', '{}');
INSERT INTO `abppermissiongroups` VALUES ('3a12a7aa-76c7-0a9f-34f4-9ccf10a02f1d', 'adkd', 'F:adkd', '{}');

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
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1ce-24d6-fc62-ec5760d4a9dd', 'AbpIdentity', 'AbpIdentity.Roles', NULL, 'Permission:RoleManagement', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1cf-00bf-1a37-3e8c9fbecb6b', 'FeatureManagement', 'FeatureManagement.ManageHostFeatures', NULL, 'L:AbpFeatureManagement,Permission:FeatureManagement.ManageHostFeatures', 1, 2, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1cf-27c4-10ab-f19b6b95b3e7', 'AbpIdentity', 'AbpIdentity.Users', NULL, 'Permission:UserManagement', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1cf-4472-d9ce-ae8a53e3172f', 'AbpIdentity', 'AbpIdentity.Users.Create', 'AbpIdentity.Users', 'Permission:Create', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1cf-4926-b0ca-c558de1299c7', 'AbpIdentity', 'AbpIdentity.Users.Delete', 'AbpIdentity.Users', 'Permission:Delete', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1cf-4a12-669e-0937784e0254', 'AbpIdentity', 'AbpIdentity.Roles.Update', 'AbpIdentity.Roles', 'Permission:Edit', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1cf-63e1-7d78-cc8874f52540', 'AbpIdentity', 'AbpIdentity.Roles.Delete', 'AbpIdentity.Roles', 'Permission:Delete', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1cf-7632-1088-e1f81af8f554', 'AbpIdentity', 'AbpIdentity.Users.Update', 'AbpIdentity.Users', 'Permission:Edit', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1cf-7d94-d6e1-112cc67afc77', 'AbpIdentity', 'AbpIdentity.UserLookup', NULL, 'Permission:UserLookup', 1, 3, 'C', NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1cf-a511-d4ed-ddaf8de9ccf6', 'SettingManagement', 'SettingManagement.Emailing', NULL, 'Permission:Emailing', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1cf-a702-61c5-bd2cbfbc1f5e', 'AbpIdentity', 'AbpIdentity.Roles.ManagePermissions', 'AbpIdentity.Roles', 'Permission:ChangePermissions', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1cf-bdec-ceff-065c09cb42c4', 'AbpIdentity', 'AbpIdentity.Roles.Create', 'AbpIdentity.Roles', 'Permission:Create', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1cf-c080-b8ef-70e79eed245d', 'AbpIdentity', 'AbpIdentity.Users.ManagePermissions', 'AbpIdentity.Users', 'Permission:ChangePermissions', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1d0-1c63-9690-d6f6908c040a', 'AbpTenantManagement', 'AbpTenantManagement.Tenants', NULL, 'L:AbpTenantManagement,Permission:TenantManagement', 1, 2, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1d0-2454-396c-5cc70283c9e8', 'AbpTenantManagement', 'AbpTenantManagement.Tenants.Update', 'AbpTenantManagement.Tenants', 'L:AbpTenantManagement,Permission:Edit', 1, 2, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1d0-58d6-90a8-c695a79028c9', 'AbpTenantManagement', 'AbpTenantManagement.Tenants.Delete', 'AbpTenantManagement.Tenants', 'L:AbpTenantManagement,Permission:Delete', 1, 2, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1d0-5f9e-7f4e-00bf99916a60', 'AbpTenantManagement', 'AbpTenantManagement.Tenants.ManageFeatures', 'AbpTenantManagement.Tenants', 'L:AbpTenantManagement,Permission:ManageFeatures', 1, 2, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1d0-9fbc-42f5-32713bdf1fad', 'SettingManagement', 'SettingManagement.Emailing.Test', 'SettingManagement.Emailing', 'Permission:EmailingTest', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1d0-a665-aefd-dcbc0ba8fe33', 'AbpTenantManagement', 'AbpTenantManagement.Tenants.Create', 'AbpTenantManagement.Tenants', 'L:AbpTenantManagement,Permission:Create', 1, 2, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1d0-abb6-3acf-d3d3fba2818b', 'SettingManagement', 'SettingManagement.TimeZone', NULL, 'Permission:TimeZone', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1d0-d845-af9d-c1ae217f3882', 'AbpTenantManagement', 'AbpTenantManagement.Tenants.ManageConnectionStrings', 'AbpTenantManagement.Tenants', 'L:AbpTenantManagement,Permission:ManageConnectionStrings', 1, 2, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1d1-2a17-90aa-fa6179c50712', 'Panda.Net.Basic', 'Panda.Net.Basic.Roles.Delete', 'Panda.Net.Basic.Roles', 'L:Net,DisplayName:Delete', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"delete\"}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1d1-386a-0799-12773213e6a2', 'Panda.Net.Basic', 'Panda.Net.Basic.Users', NULL, 'L:Net,DisplayName:UserManagement', 1, 3, 'R', NULL, '{\"type\":1,\"path\":\"/user\",\"icon\":\"user\"}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1d1-44b2-fb7b-aa49fd652cf8', 'Panda.Net.Basic', 'Panda.Net.Basic.Users.Create', 'Panda.Net.Basic.Users', 'L:Net,DisplayName:Create', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"create\"}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1d1-6d54-024b-b58d74e50f90', 'Panda.Net.Basic', 'Panda.Net.Basic.Roles.Update', 'Panda.Net.Basic.Roles', 'L:Net,DisplayName:Edit', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"edit\"}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1d1-7ebd-31f6-93a1692949c5', 'Panda.Net.Basic', 'Panda.Net.Basic.Roles.Create', 'Panda.Net.Basic.Roles', 'L:Net,DisplayName:Create', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"create\"}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1d1-89e3-c0ea-1d6a0d7d8078', 'Panda.Net.Basic', 'Panda.Net.Basic.Users.Delete', 'Panda.Net.Basic.Users', 'L:Net,DisplayName:Delete', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"delete\"}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1d1-96d6-76c5-bb5f7fa9454c', 'Panda.Net.Basic', 'Panda.Net.Basic.Roles', NULL, 'L:Net,DisplayName:RoleManagement', 1, 3, 'R', NULL, '{\"type\":1,\"path\":\"/role\",\"icon\":\"role\"}');
INSERT INTO `abppermissions` VALUES ('3a114eb4-a1d1-b3c3-3e3f-fca0431b832b', 'Panda.Net.Basic', 'Panda.Net.Basic.Users.Update', 'Panda.Net.Basic.Users', 'L:Net,DisplayName:Edit', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"edit\"}');
INSERT INTO `abppermissions` VALUES ('3a114eb8-9086-0761-904e-f47063eac857', 'Panda.Net.Basic', 'Panda.Net.Basic.Organizations.Update', 'Panda.Net.Basic.Organizations', 'L:Net,DisplayName:Edit', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"edit\"}');
INSERT INTO `abppermissions` VALUES ('3a114eb8-9086-3c41-70d2-10657e95760a', 'Panda.Net.Basic', 'Panda.Net.Basic.Menus', NULL, 'L:Net,DisplayName:MenuManagement', 1, 3, 'R', NULL, '{\"type\":1,\"path\":\"/user\",\"icon\":\"user\"}');
INSERT INTO `abppermissions` VALUES ('3a114eb8-9086-401d-809d-c49155bfb30c', 'Panda.Net.Basic', 'Panda.Net.Basic.Organizations.Delete', 'Panda.Net.Basic.Organizations', 'L:Net,DisplayName:Delete', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"delete\"}');
INSERT INTO `abppermissions` VALUES ('3a114eb8-9086-464d-89c9-48c58526473c', 'Panda.Net.Basic', 'Panda.Net.Basic.Tenants.Update', 'Panda.Net.Basic.Tenants', 'L:Net,DisplayName:Edit', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"edit\"}');
INSERT INTO `abppermissions` VALUES ('3a114eb8-9086-502a-af60-c7e43d2f7e36', 'Panda.Net.Basic', 'Panda.Net.Basic.Tenants.Delete', 'Panda.Net.Basic.Tenants', 'L:Net,DisplayName:Delete', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"delete\"}');
INSERT INTO `abppermissions` VALUES ('3a114eb8-9086-5f73-17d3-eb31e98c680d', 'Panda.Net.Basic', 'Panda.Net.Basic.Tenants', NULL, 'L:Net,DisplayName:TenantManagement', 1, 3, 'R', NULL, '{\"type\":1,\"path\":\"/user\",\"icon\":\"user\"}');
INSERT INTO `abppermissions` VALUES ('3a114eb8-9086-77a4-f8e4-12c2bd3fcac8', 'Panda.Net.Basic', 'Panda.Net.Basic.Menus.Create', 'Panda.Net.Basic.Menus', 'L:Net,DisplayName:Create', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"create\"}');
INSERT INTO `abppermissions` VALUES ('3a114eb8-9086-782a-99fa-9a76c9a1148c', 'Panda.Net.Basic', 'Panda.Net.Basic.Organizations', NULL, 'L:Net,DisplayName:OrganizationManagement', 1, 3, 'R', NULL, '{\"type\":1,\"path\":\"/user\",\"icon\":\"user\"}');
INSERT INTO `abppermissions` VALUES ('3a114eb8-9086-af92-00e8-bde7156352b1', 'Panda.Net.Basic', 'Panda.Net.Basic.Tenants.Create', 'Panda.Net.Basic.Tenants', 'L:Net,DisplayName:Create', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"create\"}');
INSERT INTO `abppermissions` VALUES ('3a114eb8-9086-b8b9-6f39-b6133ffca3dd', 'Panda.Net.Basic', 'Panda.Net.Basic.Menus.Update', 'Panda.Net.Basic.Menus', 'L:Net,DisplayName:Edit', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"edit\"}');
INSERT INTO `abppermissions` VALUES ('3a114eb8-9086-d4e7-535f-4f9375ae6ff7', 'Panda.Net.Basic', 'Panda.Net.Basic.Organizations.Create', 'Panda.Net.Basic.Organizations', 'L:Net,DisplayName:Create', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"create\"}');
INSERT INTO `abppermissions` VALUES ('3a114eb8-9086-ea74-69c3-e7a1dff35496', 'Panda.Net.Basic', 'Panda.Net.Basic.Menus.Delete', 'Panda.Net.Basic.Menus', 'L:Net,DisplayName:Delete', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"delete\"}');
INSERT INTO `abppermissions` VALUES ('3a11c97e-eabb-2930-2fff-02db35da73bb', 'Panda.Net.Basic', 'Panda.Net.Basic.Announcements.Delete', 'Panda.Net.Basic.Announcements', 'L:Net,DisplayName:Delete', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"delete\"}');
INSERT INTO `abppermissions` VALUES ('3a11c97e-eabb-5079-99a8-54dd1c1d0093', 'Panda.Net.Basic', 'Panda.Net.Basic.Announcements', NULL, 'L:Net,DisplayName:AnnouncementManagement', 1, 3, 'R', NULL, '{\"type\":1,\"path\":\"announcement\",\"icon\":\"user\"}');
INSERT INTO `abppermissions` VALUES ('3a11c97e-eabb-97d8-1b17-6d3daeff831b', 'Panda.Net.Basic', 'Panda.Net.Basic.Announcements.Create', 'Panda.Net.Basic.Announcements', 'L:Net,DisplayName:Create', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"create\"}');
INSERT INTO `abppermissions` VALUES ('3a11c97e-eabb-ba4d-0c5d-09fdc4395a85', 'Panda.Net.Basic', 'Panda.Net.Basic.Announcements.Update', 'Panda.Net.Basic.Announcements', 'L:Net,DisplayName:Edit', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"edit\"}');
INSERT INTO `abppermissions` VALUES ('3a11d99f-a762-498d-5024-e1eabc38a0a0', 'AbpIdentity', 'AbpIdentity.Users.Update.ManageRoles', 'AbpIdentity.Users', 'Permission:ManageRoles', 1, 3, NULL, NULL, '{}');
INSERT INTO `abppermissions` VALUES ('3a12025e-3142-128e-9056-c6273472d0f3', 'Panda.Net.Basic', 'Panda.Net.Basic.WorkFlowList.Create', 'Panda.Net.Basic.WorkFlowList', 'L:Net,DisplayName:Create', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"create\"}');
INSERT INTO `abppermissions` VALUES ('3a12025e-3142-3dff-9cc8-30135cf1ecf9', 'Panda.Net.Basic', 'Panda.Net.Basic.WorkFlowCreates', NULL, 'L:Net,DisplayName:WorkFlowCreateManagement', 1, 3, 'R', NULL, '{\"type\":1,\"path\":\"workflow-create\",\"icon\":\"workflow\"}');
INSERT INTO `abppermissions` VALUES ('3a12025e-3142-6550-467a-4e4b6fa844d9', 'Panda.Net.Basic', 'Panda.Net.Basic.WorkFlowList.Update', 'Panda.Net.Basic.WorkFlowList', 'L:Net,DisplayName:Edit', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"edit\"}');
INSERT INTO `abppermissions` VALUES ('3a12025e-3142-769b-e28f-d2956a4731fd', 'Panda.Net.Basic', 'Panda.Net.Basic.WorkFlowList.Delete', 'Panda.Net.Basic.WorkFlowList', 'L:Net,DisplayName:Delete', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"delete\"}');
INSERT INTO `abppermissions` VALUES ('3a12025e-3142-f113-3389-ed93338c1960', 'Panda.Net.Basic', 'Panda.Net.Basic.WorkFlowList', NULL, 'L:Net,DisplayName:WorkFlowListManagement', 1, 3, 'R', NULL, '{\"type\":1,\"path\":\"workflow-list\",\"icon\":\"workflow\"}');
INSERT INTO `abppermissions` VALUES ('3a12025e-3142-ff5c-1234-a7a0da1a7d32', 'Panda.Net.Basic', 'Panda.Net.Basic.WorkFlowList.Start', 'Panda.Net.Basic.WorkFlowList', 'L:Net,DisplayName:Start', 1, 3, 'R', NULL, '{\"type\":2,\"path\":\"start\"}');
INSERT INTO `abppermissions` VALUES ('3a133614-0fe1-0152-05b1-0b10414e526d', 'Panda.Net.Basic', 'Panda.Net.Basic.AllAgent', NULL, 'L:Net,DisplayName:AgentManagement', 1, 3, 'R', NULL, '{\"type\":1,\"path\":\"agent-all\",\"icon\":\"agent-all\"}');
INSERT INTO `abppermissions` VALUES ('3a133616-2050-42d3-5366-2e4f75a45d6d', 'Panda.Net.Basic', 'Panda.Net.Basic.AllMerchant', NULL, 'L:Net,DisplayName:MerchantManagement', 1, 3, 'R', NULL, '{\"type\":1,\"path\":\"merchant-all\",\"icon\":\"merchant-all\"}');

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
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CustomDataPermission` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `DataPermission` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AbpRoles_NormalizedName`(`NormalizedName` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abproles
-- ----------------------------
INSERT INTO `abproles` VALUES ('3a114eb4-8f2b-216a-f234-064df47eb27d', NULL, 'admin', 'ADMIN', 0, 1, 1, 5, '{}', '08def20bc1af43cbbd0de9a840c766e7', '00003,00001', 4);
INSERT INTO `abproles` VALUES ('3a11668e-b269-6e7f-1195-86d2de3d68b4', NULL, '测试角色', '测试角色', 0, 0, 0, 0, '{}', '6f07a1f624bf488085876be592b76a69', '', 0);
INSERT INTO `abproles` VALUES ('3a118683-f49e-9140-cd4d-30671885b6f5', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', '超级角色', '超级角色', 0, 0, 0, 0, '{}', '606595810b7d47afa5eef23933033d02', '', 0);
INSERT INTO `abproles` VALUES ('3a118a9c-660a-95d5-5e28-5af6cc8f257c', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'admin', 'ADMIN', 0, 1, 1, 0, '{}', 'd66f15e0a2754cf3a5089617d5923569', '', 0);
INSERT INTO `abproles` VALUES ('3a118b8b-26fb-7e7e-02f0-8965c053c0f0', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'admin', 'ADMIN', 0, 1, 1, 0, '{}', 'caa7fb5b7f854b5e8a4481a535a327df', '', 0);
INSERT INTO `abproles` VALUES ('3a11afe8-5fa8-caba-8454-d72c23ad09b1', NULL, 'rrr', 'RRR', 0, 0, 0, 0, '{}', 'abe4948fefa24f1fa8b1d7b973b38818', '', 0);
INSERT INTO `abproles` VALUES ('3a136582-bee9-923a-b6de-ffe57a578f8d', NULL, '6t6', '6T6', 0, 0, 0, 3, '{}', 'd1cd51e64e3a429eb054e361236bc6c5', 'f98fc1bb-a37f-4229-8adc-013df20eed51,fdf733c4-0054-4f43-acac-4e844dfc5a86,3a116801-5746-e13f-4707-8d81cb6b5a0e', 4);

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
  `CreationTime` datetime(6) NOT NULL,
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
INSERT INTO `abpsecuritylogs` VALUES ('3a114eb9-a54b-ad1d-8391-ddf3aee7f3c1', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'c865b52606ee4cefa85b4745daa9b30f', '::1', NULL, '2024-03-14 18:40:44.360914', '{}', '0324a07c4ed54c989ff28492126a41bb');
INSERT INTO `abpsecuritylogs` VALUES ('3a114ebc-a9b9-71f8-071e-93f22f822fed', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '2b04f4a50a4d4e6bb70c4886de7a4e3c', '::1', NULL, '2024-03-14 18:44:02.103480', '{}', 'ec0658d6c74e4aae821ce1f0aa913d3f');
INSERT INTO `abpsecuritylogs` VALUES ('3a115247-0595-6ab8-e74f-420cf97b6f5a', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '98356a000fe6416bb67a62d2931d5b2e', '::1', NULL, '2024-03-15 11:14:01.236302', '{}', '8250e3ceb663466a81d1d27c7c3d2445');
INSERT INTO `abpsecuritylogs` VALUES ('3a11530d-c933-361c-7e66-6b52a1f155be', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '160d370e93fd4e97919e9b952a17aff2', '::1', NULL, '2024-03-15 14:51:07.442922', '{}', '666c31325aa64ea089a288fe5340efe7');
INSERT INTO `abpsecuritylogs` VALUES ('3a115384-2b6e-9147-d6f4-9d476f6096ea', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '17d3816d1bbb402fb9b072b2b8591794', '::1', NULL, '2024-03-15 17:00:25.838186', '{}', '4114e485043545c68435bf59dc17293f');
INSERT INTO `abpsecuritylogs` VALUES ('3a115385-537f-8360-c110-bc83d4885961', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '1d4b1b3ebe264aaa834f578154937e80', '::1', NULL, '2024-03-15 17:01:41.631051', '{}', 'beb92c326d464206a94c080266048f04');
INSERT INTO `abpsecuritylogs` VALUES ('3a11667a-a55c-f52f-0e78-d5784ec87eb8', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '3f4028a249624283a4fec6517319f7ab', '::1', 'PostmanRuntime/7.36.3', '2024-03-19 09:22:48.795699', '{}', '6deb122f2bd748eda2e86230586f6d20');
INSERT INTO `abpsecuritylogs` VALUES ('3a11667a-b6a4-b543-02e1-959f30ea5ca2', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'da02834e8ade423280da3ac09f2a1ef2', '::1', 'PostmanRuntime/7.36.3', '2024-03-19 09:22:53.220814', '{}', '775a00ff0093449683fa37d38a85ac04');
INSERT INTO `abpsecuritylogs` VALUES ('3a11667a-b9b0-8199-7c85-160857cc11ed', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '0cdb2b6f20474af08a70ea7e34ab4b5b', '::1', 'PostmanRuntime/7.36.3', '2024-03-19 09:22:54.000637', '{}', '2dd938a20832433d805ea2dbbf225455');
INSERT INTO `abpsecuritylogs` VALUES ('3a1166f0-4568-3c53-34d2-bb5c02870faf', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '1e91f2123fcf43f5bc498d82fd0b81df', '::1', NULL, '2024-03-19 11:31:17.480596', '{}', '7ee264f232934920839679173ce3e9bf');
INSERT INTO `abpsecuritylogs` VALUES ('3a1166f2-312c-3da6-3ac9-ada2c89a84ea', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'b103b206129f4066930635ce76ac7ee2', '::1', NULL, '2024-03-19 11:33:23.372876', '{}', '235cfd17f1284ef1bfe855c6d02e8193');
INSERT INTO `abpsecuritylogs` VALUES ('3a1166f6-a7b5-f54c-d76c-6b3e8d28d26f', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '93dda98ae4944a4faabdc417fd19d729', '::1', NULL, '2024-03-19 11:38:15.861618', '{}', '8463f58c0d1742b08f5e3f07c7e5be74');
INSERT INTO `abpsecuritylogs` VALUES ('3a116bd9-aac7-8b12-da95-00359db97de1', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '47f3ea6ab9c44341a558c6353050af23', '::1', NULL, '2024-03-20 10:24:42.182176', '{}', '97116f92c1a14bf7b3555267b4d426ae');
INSERT INTO `abpsecuritylogs` VALUES ('3a116d1a-d2d3-ab68-83b4-663e17d0295a', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '870bcf11df7e4831b15207897e671de1', '::1', NULL, '2024-03-20 16:15:29.490986', '{}', '88ba7bfa1bba441e968b4356256c268f');
INSERT INTO `abpsecuritylogs` VALUES ('3a116d5f-077a-5dfb-67e9-71b733c8ec87', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'aa0504db93484ddf91eb7cfb1278dfb4', '::1', NULL, '2024-03-20 17:29:59.418706', '{}', '8103618e6e844f0b9de27281048d6b38');
INSERT INTO `abpsecuritylogs` VALUES ('3a116d87-5fff-b3ac-cf5f-fd1ebaa94803', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'c4df63663573443588b0e14e16e5f998', '::1', NULL, '2024-03-20 18:14:03.518891', '{}', '3da0a0e6b92b463e9d9c02b7a275a291');
INSERT INTO `abpsecuritylogs` VALUES ('3a116d9f-ac3a-fb46-b833-aa4b17bdb856', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'b331c626a099485b82b9e3c18f0e6042', '::1', NULL, '2024-03-20 18:40:35.898508', '{}', 'ccc3598d5f1f46228f422542c7b5d576');
INSERT INTO `abpsecuritylogs` VALUES ('3a116da3-34a6-bef2-72b8-f5b171edd5d5', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '534c7707e00a4516a4de77216145dac9', '::1', NULL, '2024-03-20 18:44:27.430652', '{}', 'cd15a384ff764abf84d44dcec2f6ed56');
INSERT INTO `abpsecuritylogs` VALUES ('3a1185d9-4b54-9070-d4e8-6fa5a31a3eb5', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'admin', NULL, 'Net_Web', '59c0a046589d4b748a785dbdcdbc2e14', '::1', NULL, '2024-03-25 11:34:25.363020', '{}', 'cc4427f4fcae448688031f44750f9ab6');
INSERT INTO `abpsecuritylogs` VALUES ('3a1185d9-9f53-5349-9f7d-d79c81679673', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'admin', NULL, 'Net_Web', '98842145edd343cea5003b7e1cdf3da3', '::1', NULL, '2024-03-25 11:34:46.867650', '{}', 'd1af845eef9743ad8b9ecad5899f5d76');
INSERT INTO `abpsecuritylogs` VALUES ('3a1185da-376d-691f-7c4c-bfd8027d9130', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'admin', NULL, 'Net_Web', '3eed7ff576764086a5a35a41de705787', '::1', NULL, '2024-03-25 11:35:25.805884', '{}', 'f3af0bc4f7cb4734b935d5c09c1c8fa9');
INSERT INTO `abpsecuritylogs` VALUES ('3a1185db-c60a-bf95-7435-5822a7745e40', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'admin', NULL, 'Net_Web', 'd1fd1228ab1c4ba0a420215fb6f9a692', '::1', NULL, '2024-03-25 11:37:07.849712', '{}', '6f5e9b957a0d4ab08b4991091f53693b');
INSERT INTO `abpsecuritylogs` VALUES ('3a1185dc-3a9d-4e7e-0909-d70f9f785b59', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'adminy', NULL, 'Net_Web', 'e55581824ce6478585266ed50b159ac6', '::1', NULL, '2024-03-25 11:37:37.693104', '{}', '967dbe73ada444b3bb2c233f39e13952');
INSERT INTO `abpsecuritylogs` VALUES ('3a1185e2-2880-a6bf-f2ee-8efe1d16c98c', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'adminy', NULL, 'Net_Web', 'd046a7898d784d32a295edb13cc14ecb', '::1', NULL, '2024-03-25 11:44:06.269138', '{}', 'c081d87dcd864414b4d79308584b6de2');
INSERT INTO `abpsecuritylogs` VALUES ('3a118652-9bc2-9e38-cc2f-e092ea025e0f', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', 'a9bc0f52c8694111a16703429347cc54', '::1', NULL, '2024-03-25 13:46:55.807780', '{}', '1b1634cf865e4158bbdffe3876e17518');
INSERT INTO `abpsecuritylogs` VALUES ('3a118654-389c-7d5e-3c04-405c73ac366c', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', '69ff9b5965f34a8d933d3b1157676029', '::1', NULL, '2024-03-25 13:48:41.498875', '{}', 'ffaa8aa06b0f4e25acfda3c895cc7b0c');
INSERT INTO `abpsecuritylogs` VALUES ('3a118654-dead-3326-cf1b-63b8219a0786', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'adminy', NULL, 'Net_Web', '164b1ecceee841c98d49d8c4851f21c8', '::1', NULL, '2024-03-25 13:49:24.013466', '{}', 'd0f667fef4af46a39828e8206412809d');
INSERT INTO `abpsecuritylogs` VALUES ('3a118657-8a45-d0c2-9bfe-124414b96769', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', 'fb7e30a1ebb04ff3913a8b94f6fb0e5b', '::1', NULL, '2024-03-25 13:52:19.013124', '{}', 'dfcfa1d614d4467aa9ad31e0320a9b7c');
INSERT INTO `abpsecuritylogs` VALUES ('3a118658-f8de-600e-fb55-7899e6754c1d', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'adminy', NULL, 'Net_Web', 'bee3a4b2da1d435f9e0ba70c33715ac2', '::1', 'PostmanRuntime/7.36.3', '2024-03-25 13:53:52.862656', '{}', 'b9288de252f1477a9d8d4e65dbb4ba57');
INSERT INTO `abpsecuritylogs` VALUES ('3a118659-9dce-004d-a176-71a81c7e1677', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'adminy', NULL, 'Net_Web', '06c97d5b3d274a3b830acb87fb2533ea', '::1', 'PostmanRuntime/7.36.3', '2024-03-25 13:54:35.084656', '{}', '2ac92612b7864ed79185c6dc4a4e5e5e');
INSERT INTO `abpsecuritylogs` VALUES ('3a118659-a49d-1b15-0675-f75cb2ca0fcf', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'adminy', NULL, 'Net_Web', 'b5f7358e4d424ea3bc404ad419bbf6e1', '::1', 'PostmanRuntime/7.36.3', '2024-03-25 13:54:36.829712', '{}', 'f928bc128df04d479290d9f12afa064a');
INSERT INTO `abpsecuritylogs` VALUES ('3a118659-c0c9-4e49-5fb9-d339683a1a50', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'd4d24e0c054f4e05913398b2194d2f6f', '::1', 'PostmanRuntime/7.36.3', '2024-03-25 13:54:44.041266', '{}', 'f87e098d4e1b4687bc0860cccdc73935');
INSERT INTO `abpsecuritylogs` VALUES ('3a118659-e303-a87e-5e8e-0a19bef30314', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'adminy', NULL, 'Net_Web', '378f8b132ba846dcb75a330f439864d7', '::1', 'PostmanRuntime/7.36.3', '2024-03-25 13:54:52.803687', '{}', '40e0e103928a4edcbb75b1fb6b130260');
INSERT INTO `abpsecuritylogs` VALUES ('3a11865a-1723-e602-27db-80bffe451cce', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', '5bce7ad249014b96807df1a26476e962', '::1', 'PostmanRuntime/7.36.3', '2024-03-25 13:55:06.147178', '{}', 'c3077b2a0029496a84d2b78ecfc4199e');
INSERT INTO `abpsecuritylogs` VALUES ('3a11865a-ecad-6ad5-f56a-44ab33aeca8e', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', 'b3208efd157a4305a6ac1dc7ae8fa335', '::1', 'PostmanRuntime/7.36.3', '2024-03-25 13:56:00.813575', '{}', '0b7ef888da9e4f30a4f57edca16454be');
INSERT INTO `abpsecuritylogs` VALUES ('3a11865a-f324-9819-51ab-351479a14aec', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '1aeacee789c848fa815e832522d67f67', '::1', 'PostmanRuntime/7.36.3', '2024-03-25 13:56:02.467956', '{}', '2d64a21a254047fa87bb88b8f6483ed3');
INSERT INTO `abpsecuritylogs` VALUES ('3a11865b-22ff-8885-95b6-6a8b599b65b2', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '3bca94a3996942608711cc760ec90fe5', '::1', 'PostmanRuntime/7.36.3', '2024-03-25 13:56:14.719038', '{}', '95751c7b3a0e4c3eadff61e4603344d4');
INSERT INTO `abpsecuritylogs` VALUES ('3a11865b-49ed-d871-a542-07221e9d9ef4', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '8b331ecdd6f549d098f68c99e1f2d668', '::1', 'PostmanRuntime/7.36.3', '2024-03-25 13:56:24.685146', '{}', '21de92be7e23468b9d9ca2112bd7bb6d');
INSERT INTO `abpsecuritylogs` VALUES ('3a11865b-b248-7507-7c3e-0cd4a2b2741e', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '9acd8006d14e4685990252ffd923411a', '::1', 'PostmanRuntime/7.36.3', '2024-03-25 13:56:51.398577', '{}', '86fd7c04645c45f0aef2024773affa8d');
INSERT INTO `abpsecuritylogs` VALUES ('3a11865b-de6b-f66d-5eca-286f3268ba2c', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '0e0dbf8ff33b4e95a3aff65aca81e89a', '::1', 'PostmanRuntime/7.36.3', '2024-03-25 13:57:02.699544', '{}', '1dd8084a6358433a9bd169da38168bfd');
INSERT INTO `abpsecuritylogs` VALUES ('3a11865c-4945-fce1-d44d-e3424767ce05', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '4dcf644d8cbe44b389c5583754ad1085', '::1', 'PostmanRuntime/7.36.3', '2024-03-25 13:57:30.053097', '{}', '30ba45c5ff214504b7c63b0d24acb50b');
INSERT INTO `abpsecuritylogs` VALUES ('3a11866f-484f-912f-81dd-1f5268561b54', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'db5677a21fe843b4a9c6dea47c11960c', '::1', NULL, '2024-03-25 14:18:14.990398', '{}', '8b54ec80b007420c9bc549f029d9dc64');
INSERT INTO `abpsecuritylogs` VALUES ('3a11866f-7da7-c483-cb02-5926da0e55da', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', 'e3e49d26800242f6b39051bb68ace7fb', '::1', NULL, '2024-03-25 14:18:28.647341', '{}', '3023252876174e4babb281e2252113cc');
INSERT INTO `abpsecuritylogs` VALUES ('3a11866f-8e23-b29d-6b08-1309fa7fabcb', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '11fb9a15938747f2a0f2853eec0398de', '::1', NULL, '2024-03-25 14:18:32.867521', '{}', '2420074cab4e4bc2890937fede29106e');
INSERT INTO `abpsecuritylogs` VALUES ('3a11866f-a200-3cc8-e723-21ea493154aa', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '6774b6b2ca004104b484ff5cf24caf75', '::1', NULL, '2024-03-25 14:18:37.952740', '{}', 'ca35b69e48414f7abae4fa67a34651e9');
INSERT INTO `abpsecuritylogs` VALUES ('3a11866f-b688-cf58-e33e-1a861b7dd0ef', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '6713e082e6a248bfb2fc5c191ce428f6', '::1', NULL, '2024-03-25 14:18:43.208925', '{}', '601ef9f0ede24ab8ba29537915a813ba');
INSERT INTO `abpsecuritylogs` VALUES ('3a11866f-cf21-7c8f-8541-7f6f5db4b7d2', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '088fbc4d7f9c41aeb652d13c37686656', '::1', NULL, '2024-03-25 14:18:49.505812', '{}', '11162ad7950840bbbc77e8e8f55c5040');
INSERT INTO `abpsecuritylogs` VALUES ('3a118672-bb0e-0670-cc15-267d55ce158c', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '74e6f626b07c48a4a14b7f7184dbaf3b', '::1', NULL, '2024-03-25 14:22:00.974391', '{}', '6be8c2ca977146a4acc1493135d86bf4');
INSERT INTO `abpsecuritylogs` VALUES ('3a118672-f835-e98e-3a3c-980a5027de9f', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '539f3e0f87bf450ea09071a2dab4177d', '::1', NULL, '2024-03-25 14:22:16.629236', '{}', '8a7c82d06b7e49c7bd5186da7ab30340');
INSERT INTO `abpsecuritylogs` VALUES ('3a118673-21df-f638-1612-c6ce5f629eaa', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'adminy', NULL, 'Net_Web', 'f8ec06e61512414c99ddc139e7bf061a', '::1', NULL, '2024-03-25 14:22:27.295654', '{}', '786a0f659d2d4e50af6a92502ed41a9b');
INSERT INTO `abpsecuritylogs` VALUES ('3a118673-4b12-52a3-d783-7219cff1441a', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', 'd7836c5f35334c4c827118e2a85ba195', '::1', NULL, '2024-03-25 14:22:37.842873', '{}', '49483b6b441f4009af9da7a138657ca1');
INSERT INTO `abpsecuritylogs` VALUES ('3a118673-618a-38ea-8cea-f662200eaadd', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', '69537919159645d6a844bef994613d16', '::1', NULL, '2024-03-25 14:22:43.594843', '{}', '56880d9953664ae880fe79f16ca7e3a8');
INSERT INTO `abpsecuritylogs` VALUES ('3a118673-88b1-b2a6-816d-ceae49bbd473', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', 'be0f8fdb72e845bc8167f9a5d6622756', '::1', NULL, '2024-03-25 14:22:53.617814', '{}', 'f5b1a7a62feb49eeb309f6a2c2af4dff');
INSERT INTO `abpsecuritylogs` VALUES ('3a118673-ea79-e606-5dd3-62590bb6c3fc', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', '39c917146d78465a91145ebcb4306536', '::1', NULL, '2024-03-25 14:23:18.649642', '{}', '960c72aa938f461fb0803efd45c618bf');
INSERT INTO `abpsecuritylogs` VALUES ('3a118674-0ed0-53f5-c876-51ecf175e9bb', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', 'e73af5c801914af488d1434fe701ec38', '::1', NULL, '2024-03-25 14:23:27.952663', '{}', 'dab9544eec9a485d92455da44c8c3e5b');
INSERT INTO `abpsecuritylogs` VALUES ('3a118674-5515-a98a-8338-f9052661479a', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'adminf', NULL, 'Net_Web', '0a088e102b46432ca3e71fccb545e8aa', '::1', NULL, '2024-03-25 14:23:45.941238', '{}', '4fa66868094a4494987be95c244fa53f');
INSERT INTO `abpsecuritylogs` VALUES ('3a118675-a6c9-8a84-4a7f-66e6fd76003a', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '44de12354e044ebb92774c97bc55f436', '::1', NULL, '2024-03-25 14:25:12.393638', '{}', 'f42eccbf4321438187e4eeef142812bb');
INSERT INTO `abpsecuritylogs` VALUES ('3a118675-c6ef-1268-3b4f-574478b1c6f8', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'adminy', NULL, 'Net_Web', '6e47bda517d94644a328232111cc3dae', '::1', NULL, '2024-03-25 14:25:20.623327', '{}', 'bdd73aaa34e24b52ae99d3f7dd41bef1');
INSERT INTO `abpsecuritylogs` VALUES ('3a118675-d082-b3f2-6dec-782aa81bae94', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'adminy', NULL, 'Net_Web', 'fb48278d140a46578cc7b23751605df0', '::1', NULL, '2024-03-25 14:25:23.074669', '{}', '2f7f177feba641f5aedb665311cb72bf');
INSERT INTO `abpsecuritylogs` VALUES ('3a118675-e15b-7044-6fab-e2a64b813d6e', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', 'ab969a375532450cb3e936e9775d5477', '::1', NULL, '2024-03-25 14:25:27.387126', '{}', 'f6ff80b4b8b84fdbaf1a8cc57f9224cd');
INSERT INTO `abpsecuritylogs` VALUES ('3a118675-f686-6842-a7c1-6623f8b35551', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', '217207de017648608d1010fdeecc4d9a', '::1', NULL, '2024-03-25 14:25:32.806800', '{}', '17e2ec9845814995904a3f8bfe8133fc');
INSERT INTO `abpsecuritylogs` VALUES ('3a118676-b4a0-ded9-eb0f-8880b01b8ba8', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', 'a7c56b251fd744808c59acecf92a9781', '::1', NULL, '2024-03-25 14:26:21.472493', '{}', '3376c5f0a21f4cf6905e3d5e9ad0ac80');
INSERT INTO `abpsecuritylogs` VALUES ('3a118677-9b86-39bc-850e-72d6ca4ff301', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', '1861d79f001943659ca10bcf2999c505', '::1', NULL, '2024-03-25 14:27:20.582652', '{}', '05d5169d1c51495980644c2c7267652a');
INSERT INTO `abpsecuritylogs` VALUES ('3a118677-c2f3-e125-e14c-67538b25792b', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', 'c443860938ee4fb69f590abbcc131ddc', '::1', NULL, '2024-03-25 14:27:30.675887', '{}', '930ed998f55b4150a889ee280fe0ea29');
INSERT INTO `abpsecuritylogs` VALUES ('3a118677-ddbc-18c9-7a96-724ba82edab1', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', '99c68923a42f45a89d0d1c1ca1c26376', '::1', NULL, '2024-03-25 14:27:37.532660', '{}', '2ef0ff0bfe594f9d87ed2e0ab31f1079');
INSERT INTO `abpsecuritylogs` VALUES ('3a118679-2f2b-e156-456c-fca51ce4a08d', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', 'a03840fb3f84467ab4b75a62d894255a', '::1', NULL, '2024-03-25 14:29:03.915116', '{}', 'c03b958f7a804213aa507babe837a364');
INSERT INTO `abpsecuritylogs` VALUES ('3a11867a-c5bb-02bc-0f71-4ef4a2fcd867', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '95ee33c720864ebe96c69d6d6c493fe4', '::1', NULL, '2024-03-25 14:30:47.995799', '{}', 'da368b9410a7444aafb71d31724e4e62');
INSERT INTO `abpsecuritylogs` VALUES ('3a11867b-02f6-1b2d-6b2b-a2c0b9388bc2', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'adminy', NULL, 'Net_Web', '85796c45be3845d8b2206e1ff43e650a', '::1', NULL, '2024-03-25 14:31:03.670177', '{}', '24f36f87299646df9d532a471ae08494');
INSERT INTO `abpsecuritylogs` VALUES ('3a11867b-1045-6e7b-c654-1339d7e00d44', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', 'aa2b3906be2c44618431e8890a8350aa', '::1', NULL, '2024-03-25 14:31:07.077557', '{}', '32e9ce1a52954c0591d0897f5a859e5f');
INSERT INTO `abpsecuritylogs` VALUES ('3a11867b-1c24-8e4d-0112-52c0167fbeef', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', '2af5b5cf635340fdb453ab84dad8727c', '::1', NULL, '2024-03-25 14:31:10.116284', '{}', 'c0c3f02313024f7ea9043a9a0e07fcea');
INSERT INTO `abpsecuritylogs` VALUES ('3a11867b-205a-560d-859e-93945151045e', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', '4aaec91b65184786bf537635dc7d2100', '::1', NULL, '2024-03-25 14:31:11.194406', '{}', '1921eb0b58884292acffc10a0d91cbca');
INSERT INTO `abpsecuritylogs` VALUES ('3a11867b-7e3c-c7ea-58e7-1ecaec5d4c92', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '379b7e6b0d4e451080203672feee91f3', '::1', NULL, '2024-03-25 14:31:35.228839', '{}', '4cc44897f2f943f6b023e072cb43cee4');
INSERT INTO `abpsecuritylogs` VALUES ('3a11867b-9156-c4a2-c590-4cd668ca1b5a', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '04ee87f18d9340c6b4139aac513b2db9', '::1', NULL, '2024-03-25 14:31:40.118748', '{}', '8fad868b237a4ca9b16f66cabd4ffe57');
INSERT INTO `abpsecuritylogs` VALUES ('3a11867b-aa4c-3e92-0b43-b171274bd16b', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '919886dd33de471b92bbe0f1a7601ab7', '::1', NULL, '2024-03-25 14:31:46.508854', '{}', 'abab06a44c1642388f5b497bbcaf56f2');
INSERT INTO `abpsecuritylogs` VALUES ('3a11867b-b655-695f-71f4-0ae232308d6e', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', 'd1ed3499b3e641969af24af2741e5821', '::1', NULL, '2024-03-25 14:31:49.589319', '{}', '48131aea7a424a1386a4d00123e4479a');
INSERT INTO `abpsecuritylogs` VALUES ('3a11867c-052f-55f6-b338-85228bb0452a', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '1600cbe1cfb84d8d867e7a74f54f59d2', '::1', NULL, '2024-03-25 14:32:09.775007', '{}', 'a2b64edcc2d1484891346a297dc70537');
INSERT INTO `abpsecuritylogs` VALUES ('3a11867c-2887-a1ab-9eea-0543f8f319a4', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', 'a8031391c46e4ad3a902c71b950b8dd5', '::1', NULL, '2024-03-25 14:32:18.823242', '{}', '6a31b8ced2cf4bcc8f61b3eab229d958');
INSERT INTO `abpsecuritylogs` VALUES ('3a11867c-5d83-60ca-7221-830fd98a6131', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', 'a95a3b2f83ae4aca81e9733fe256780f', '::1', NULL, '2024-03-25 14:32:32.387256', '{}', '8fe3f28524594f948a7326b3f669cdc3');
INSERT INTO `abpsecuritylogs` VALUES ('3a11867c-7cef-8386-4e8c-3242dcf486fe', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '1e1c3628f9094035b789d017a8fa16ff', '::1', NULL, '2024-03-25 14:32:40.431767', '{}', '9f22a7243183471581362a2866355bc2');
INSERT INTO `abpsecuritylogs` VALUES ('3a11867c-921c-4578-5a6a-7399a54d08e0', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '02cc7baefa14464f956e7970ed61b6ba', '::1', NULL, '2024-03-25 14:32:45.852955', '{}', '1d8d8caf048341e49f4978a45866e6da');
INSERT INTO `abpsecuritylogs` VALUES ('3a11867c-e3ed-8a72-1d0c-27c29aa9dcb5', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginNotAllowed', '3a116d37-cd8b-233d-d3e0-677eba44ade3', 'admin1', NULL, 'Net_Web', '2cb3cbf38cc745dcab9543e3eab6cd1b', '::1', NULL, '2024-03-25 14:33:06.797567', '{}', '87fddc1e950a4971ab581b4e5610907e');
INSERT INTO `abpsecuritylogs` VALUES ('3a11867d-3d5a-ad71-8dbe-824d0bf2ad8b', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', '6a110ed78b8a4fd59b18339629c6b885', '::1', NULL, '2024-03-25 14:33:29.690570', '{}', 'bf4a3314057742a08506853e5a54de2d');
INSERT INTO `abpsecuritylogs` VALUES ('3a11867d-4ee7-f27a-6133-92117ed14fbc', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '6c6310d577674921826ef9f945d40b47', '::1', NULL, '2024-03-25 14:33:34.183310', '{}', 'b753039be99a4aec8b21d411f440211f');
INSERT INTO `abpsecuritylogs` VALUES ('3a11867e-1b1b-705a-b185-4d85f81f432f', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '4bfccc1674cd46de80f51452f5cd5790', '::1', NULL, '2024-03-25 14:34:26.459880', '{}', 'fc03163ec37f440a9d91d99d0092148c');
INSERT INTO `abpsecuritylogs` VALUES ('3a11867e-c55e-0c96-0f82-95f4927ce2cc', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'acdf2ad65d3b4a1f95f5abb5af7b3382', '::1', 'PostmanRuntime/7.36.3', '2024-03-25 14:35:10.046361', '{}', '7de1b45856df497b83eceb6acc184ce6');
INSERT INTO `abpsecuritylogs` VALUES ('3a11867e-ddf4-a06a-906e-2b65cd9f0f6e', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '89efb5d9689b4cdc844361d5808a6675', '::1', 'PostmanRuntime/7.36.3', '2024-03-25 14:35:16.340561', '{}', 'e06efe90428940b4877462e6a70e8d9b');
INSERT INTO `abpsecuritylogs` VALUES ('3a11867e-e112-db1a-d214-97e7fc2259ff', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '368b1961a3094494abdb45f15e8809e6', '::1', 'PostmanRuntime/7.36.3', '2024-03-25 14:35:17.138380', '{}', '26a0ed4d85ae400a958d6a7eef726d95');
INSERT INTO `abpsecuritylogs` VALUES ('3a11867f-443e-b55a-ae69-86b9a788f198', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'cefe0592a552435ba0b46a96272b8279', '::1', NULL, '2024-03-25 14:35:42.526071', '{}', 'dafe16f6eff741f39390c29f8d851262');
INSERT INTO `abpsecuritylogs` VALUES ('3a118681-3d18-f551-eeab-4900d1e2a16a', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', '208266e677ec4a7eaf5224dc2179f41c', '::1', NULL, '2024-03-25 14:37:51.768802', '{}', '55fdf6012fab4c14b42df8d37be1b09b');
INSERT INTO `abpsecuritylogs` VALUES ('3a118681-5dd1-65e1-f28f-aed9d72a6c92', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', '8509e6ab4676444886f6d1073be0732a', '::1', NULL, '2024-03-25 14:38:00.145044', '{}', '802d2b998e8c462ebe81a5fb9c54cb11');
INSERT INTO `abpsecuritylogs` VALUES ('3a118681-a3fe-9b72-9d92-1d0a98241632', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', 'ae99a661cd42450db59c5fc7cbcbce93', '::1', NULL, '2024-03-25 14:38:18.110611', '{}', '46cea93024424c70a3be15d675f01aa8');
INSERT INTO `abpsecuritylogs` VALUES ('3a118682-f97a-3fa8-e4ce-f2e06b58686d', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '6b7990f3993b4251bc36ac195164de7e', '::1', NULL, '2024-03-25 14:39:45.530855', '{}', '11a49f814b2d422499e6b1d18fe113eb');
INSERT INTO `abpsecuritylogs` VALUES ('3a118683-3c9a-c5cc-3ed2-7aab1c000035', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '128db3ab42eb4943b17d392af24a7d5f', '::1', 'PostmanRuntime/7.36.3', '2024-03-25 14:40:02.714204', '{}', 'f7101ed23126479c82045577c43fca2f');
INSERT INTO `abpsecuritylogs` VALUES ('3a118683-4096-bc32-ea7e-435dd4fa1800', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'e414944fe57e48b59c51f55ac3689221', '::1', 'PostmanRuntime/7.36.3', '2024-03-25 14:40:03.734571', '{}', '8427a6e242c242dd827d8e3cebdc98c7');
INSERT INTO `abpsecuritylogs` VALUES ('3a118683-66a9-c82d-1e6a-b98dfee5ea59', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '75405346add548bea57ec3e62312768e', '::1', NULL, '2024-03-25 14:40:13.481315', '{}', '15ebb3444c8d4d259c8e2f59527d34f3');
INSERT INTO `abpsecuritylogs` VALUES ('3a118684-c8e9-579a-6ad3-75fd12055e6f', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', 'a15e95b88be442af8d44a51444019324', '::1', NULL, '2024-03-25 14:41:44.169350', '{}', '5f133d11034349239a1cdb3da465082f');
INSERT INTO `abpsecuritylogs` VALUES ('3a118686-bf0c-5405-a625-b728189cbf99', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'd39571e321a745919681ee9359a5981e', '::1', NULL, '2024-03-25 14:43:52.716566', '{}', 'f828d785aef8454a933e64348b686288');
INSERT INTO `abpsecuritylogs` VALUES ('3a118686-eb4e-eed4-78b4-03692e9513dd', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', '96f0aac8e0f0494b886d01f1ff454ef6', '::1', NULL, '2024-03-25 14:44:04.046699', '{}', '7c1e0399a4654bf4adaf8f6c19aa2224');
INSERT INTO `abpsecuritylogs` VALUES ('3a118688-d49a-9f3e-4b66-4e3c020aa250', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', 'fa059bdca2114e0399aa2faa2f054fea', '::1', NULL, '2024-03-25 14:46:09.306148', '{}', '19bc5500b207468daf2a017d55c9993c');
INSERT INTO `abpsecuritylogs` VALUES ('3a1186a0-c74e-24f3-2db4-f69bf6994ba5', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '0102228e4a054048bb05513ddc10b68d', '::1', 'PostmanRuntime/7.36.3', '2024-03-25 15:12:18.766747', '{}', 'bea4b5ac03264c41badeaa4c6ac9819c');
INSERT INTO `abpsecuritylogs` VALUES ('3a1186fb-4c4e-c9de-603e-c43311d219c7', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', 'bc217b7322304f139c5783c3dfa3687f', '::1', NULL, '2024-03-25 16:51:11.054344', '{}', '7c078ca1a149443081d5e64e0be270e1');
INSERT INTO `abpsecuritylogs` VALUES ('3a1186fb-7e62-0941-8daa-c1f4bdd12849', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '8ce64a4c646443758c34e6645b3f8454', '::1', NULL, '2024-03-25 16:51:23.874006', '{}', '816ce205b8184258822377fe3c90019a');
INSERT INTO `abpsecuritylogs` VALUES ('3a1186fb-942b-9920-14e8-b491258ffc83', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '0380c7b6a0da42bd9331bef75865e340', '::1', NULL, '2024-03-25 16:51:29.451824', '{}', '636c0cf67e174519a1f812b05f27b549');
INSERT INTO `abpsecuritylogs` VALUES ('3a1186fe-73dc-3f51-1ccf-f2b51427671a', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'aebdde0f599c4f31bf45828ba911dd4d', '::1', NULL, '2024-03-25 16:54:37.788430', '{}', 'b51b638713464157af7d90e09cb3bf74');
INSERT INTO `abpsecuritylogs` VALUES ('3a1186fe-8525-7b76-6e80-e5278bef6707', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '7ba4949592644bf082ff8388da6e480d', '::1', NULL, '2024-03-25 16:54:42.213818', '{}', '53c287c6e0f94266828c9a3ccc18f747');
INSERT INTO `abpsecuritylogs` VALUES ('3a1186fe-9931-c152-b3a8-804000c4b7ce', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', 'cd3d8b1c152c4717bf7cd081f5d411cf', '::1', NULL, '2024-03-25 16:54:47.345598', '{}', '7d11c973b0a1455d8f15908a7af7642b');
INSERT INTO `abpsecuritylogs` VALUES ('3a1186fe-ac9a-47a4-a840-eace427e7a07', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '333e83a7a3be42c3877ec16dca160886', '::1', NULL, '2024-03-25 16:54:52.314901', '{}', '385d2874018a495cbf0f0b5e3cec64b3');
INSERT INTO `abpsecuritylogs` VALUES ('3a1186fe-c15d-bf4d-a967-768fa0a95e71', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '50f63710583b40f5b36b6583f92de35e', '::1', NULL, '2024-03-25 16:54:57.629613', '{}', 'e10c8eea6bd84a20aaf9bca5ad796239');
INSERT INTO `abpsecuritylogs` VALUES ('3a1186ff-58ef-3558-ebbf-a7e764ff046c', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', 'a20893edd4d14f0e9741ce9c0651ae20', '::1', NULL, '2024-03-25 16:55:36.430993', '{}', '90a7b0b3bb1b4c4283e42f3ff1f3ce14');
INSERT INTO `abpsecuritylogs` VALUES ('3a118700-cd78-db08-969f-69b7bfed1e48', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '5e9e3508112d489fa6e93b57e9fc2982', '::1', NULL, '2024-03-25 16:57:11.798509', '{}', '1340b256fb3e4648b795eda7910de183');
INSERT INTO `abpsecuritylogs` VALUES ('3a118701-14ca-1b26-bd83-c5899a8c2674', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', '6a327097b5224911a3d0a39cb5626f60', '::1', NULL, '2024-03-25 16:57:30.058325', '{}', '160a52230e214290b6f7dcf8b1617311');
INSERT INTO `abpsecuritylogs` VALUES ('3a118701-551b-f199-4e8e-983278a4ca51', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '8c3db9eaa424484ca6127d0e43c9b0ff', '::1', NULL, '2024-03-25 16:57:46.523296', '{}', '4145d6c7127147cb8463630edfd5c09c');
INSERT INTO `abpsecuritylogs` VALUES ('3a118702-62f4-5b06-6c3c-7932d5a5330f', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', 'b925a8083f3340e0adb32e7e5b51304b', '::1', NULL, '2024-03-25 16:58:55.604064', '{}', 'bc4df43ab39340be8c17f84f6d76d63c');
INSERT INTO `abpsecuritylogs` VALUES ('3a118706-13b5-048d-ab4b-2c02901ec5b1', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'db58d0453312485381efb61e27db8650', '::1', NULL, '2024-03-25 17:02:57.458771', '{}', 'b09e7f2275b4409eb87b9f3002b7ac94');
INSERT INTO `abpsecuritylogs` VALUES ('3a118706-9643-7994-2afe-f58b10f831c0', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', '32cee38dfc3f4ca1948b45e1093aa0e3', '::1', NULL, '2024-03-25 17:03:30.883096', '{}', 'e37adba5f3224705963c9f267fc427c1');
INSERT INTO `abpsecuritylogs` VALUES ('3a118706-dbf5-987c-f8d4-fa9277cf0f16', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '0073479aebfa435da68da2e903df1d23', '::1', NULL, '2024-03-25 17:03:48.725245', '{}', '74ddf957fbe643eb9c5a6c46f5efd595');
INSERT INTO `abpsecuritylogs` VALUES ('3a11870f-0859-e7b5-ad8a-e1269f772026', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '1e94442e27b94d0dbee9fe658a3a9fbb', '::1', NULL, '2024-03-25 17:12:44.374117', '{}', '80ec633a0c3545e4b47112ff28ed4fbc');
INSERT INTO `abpsecuritylogs` VALUES ('3a11870f-4b62-3c28-35f9-1a1b6e0bc7a6', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', '6a77d3883ec64f9994a667a30b670ba3', '::1', NULL, '2024-03-25 17:13:01.538446', '{}', '2f37e8cc892748778b94ac7fba4d15d0');
INSERT INTO `abpsecuritylogs` VALUES ('3a118713-65bd-7e07-aff0-a7d09cafb7f1', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', '4e3cb55ce9434d4a905eac2f670eb176', '::1', NULL, '2024-03-25 17:17:30.427412', '{}', 'a48975e42d014a2f8ce4ebc91c434636');
INSERT INTO `abpsecuritylogs` VALUES ('3a118716-a08e-d1c0-83dc-1c9e26c238b4', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', '87d93463b84a4f79870bae60eb52d8fd', '::1', NULL, '2024-03-25 17:21:02.093087', '{}', '4b659522a5574e7da91d967dbd2e1ce1');
INSERT INTO `abpsecuritylogs` VALUES ('3a118716-dffe-2104-094c-6205af646c3a', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '1dbfd61093fc496aac5653bb609cedc2', '::1', NULL, '2024-03-25 17:21:18.334258', '{}', 'afae408a5e974a8995f06e0c051d92c4');
INSERT INTO `abpsecuritylogs` VALUES ('3a118718-3ef0-b6cf-cd3f-eac627f4a732', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '7e533d567ab24461ad4c1ba7275fa5f7', '::1', NULL, '2024-03-25 17:22:48.176733', '{}', '80de6e9d55194cbba524589fbcf797a6');
INSERT INTO `abpsecuritylogs` VALUES ('3a11871d-bf96-ce88-b059-24e91d182268', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '449de228e8ff499bb974078563fa7c4c', '::1', NULL, '2024-03-25 17:28:41.087366', '{}', '526fc22d83ea4635868acd9c972f145a');
INSERT INTO `abpsecuritylogs` VALUES ('3a11871f-27a7-9f68-7b28-25ffe21801d9', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '802fb706ee064db593f2028e3c4e56c8', '::1', NULL, '2024-03-25 17:30:20.967112', '{}', '4d41f5b1fd4f4150969b50983990b301');
INSERT INTO `abpsecuritylogs` VALUES ('3a118721-5988-1b3a-62c8-d11e7de00ef4', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'e3302364c0a8401e8414e176622f007a', '::1', NULL, '2024-03-25 17:32:44.808544', '{}', 'bca27ffecbde42fc9c23e4f2c2ef6002');
INSERT INTO `abpsecuritylogs` VALUES ('3a118723-c580-49e1-648c-3b63289e038c', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', 'e258bdf3f6424ae794b79fd9f3e672c1', '::1', NULL, '2024-03-25 17:35:23.520167', '{}', '0c8ef1a238cb40d8b0542be9a861dff0');
INSERT INTO `abpsecuritylogs` VALUES ('3a118724-6786-7f91-9b14-e619c700a066', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', 'e64adfae54444779914b1c1999644bc4', '::1', NULL, '2024-03-25 17:36:04.998102', '{}', '1f84455992534bfbb7bea25312234ece');
INSERT INTO `abpsecuritylogs` VALUES ('3a118725-5099-05d0-743b-a574402a7889', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginInvalidUserName', NULL, 'admin', NULL, 'Net_Web', '01e24f102eb542a09e72f25e54e2102e', '::1', NULL, '2024-03-25 17:37:04.665438', '{}', 'd8a600fee7ee4a379d00196650eb39d4');
INSERT INTO `abpsecuritylogs` VALUES ('3a118727-1fb4-fcfd-b42d-b545087f3383', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '396ebd2f6182441ebe547c0e8a44ad8c', '::1', NULL, '2024-03-25 17:39:03.220350', '{}', 'c8f857f1aff84cf8a479e0715687fb9c');
INSERT INTO `abpsecuritylogs` VALUES ('3a118731-6c07-ecb3-83a6-30375435400e', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '8c0f2545a78147998384067f751f1546', '::1', NULL, '2024-03-25 17:50:18.116714', '{}', '7c9ec05f20a64096b2b2069bf12d2b07');
INSERT INTO `abpsecuritylogs` VALUES ('3a118731-8b72-6896-f3c6-24d854eec8fb', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', 'cdf81251f5194b91a19bcd47ecf02771', '::1', NULL, '2024-03-25 17:50:26.162529', '{}', '030bdb664c7f4ee297b0ae77c1d88a2f');
INSERT INTO `abpsecuritylogs` VALUES ('3a118731-999e-9706-87a3-a8685bd4a324', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '8641b3188eaf40babdc37c06ac1f9a1c', '::1', NULL, '2024-03-25 17:50:29.790895', '{}', 'efbc2574aa144ee48211c469d25ef466');
INSERT INTO `abpsecuritylogs` VALUES ('3a118731-abe8-5c52-ccd9-2db9dbb6c540', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '5b4595964c334de8a459c501c5011449', '::1', NULL, '2024-03-25 17:50:34.472706', '{}', '4fa7f281945646cfa3f2dc5b9c26e1e4');
INSERT INTO `abpsecuritylogs` VALUES ('3a118731-d3a4-79f8-8143-4da436a0e7e7', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', '5f54982135d24f26934498de16ccfcc3', '::1', NULL, '2024-03-25 17:50:44.644578', '{}', '644fda5ed4cf4acdbf4cf24d37e4f8ae');
INSERT INTO `abpsecuritylogs` VALUES ('3a118a94-3540-f22d-4af2-ac0454563632', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '99e8d4b02a1248e59e2f0916831a9f3b', '::1', NULL, '2024-03-26 09:37:03.807675', '{}', '2936a983b7764c9580a1cb9ee3d6d514');
INSERT INTO `abpsecuritylogs` VALUES ('3a118abd-6493-7f11-3c34-4ede5b57a790', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'a06a26d5523a40ff9bfc31f776fdde86', '::1', NULL, '2024-03-26 10:22:02.899125', '{}', '22dc743fa12f4a0cb92874b011d7a814');
INSERT INTO `abpsecuritylogs` VALUES ('3a118b8c-5ec3-a45d-5af9-2659e0f911ff', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '99718f8d16ed44d585834458a0a087bc', '::1', NULL, '2024-03-26 14:08:07.360945', '{}', '0cd5ccf4877d49fb8642c22931c54af9');
INSERT INTO `abpsecuritylogs` VALUES ('3a118b8d-67f6-d3ca-136a-d9fa9f98f24e', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '23a44c890b304312b9401f11ccd82b1f', '::1', NULL, '2024-03-26 14:09:15.254375', '{}', 'cd0fc33540f04e779fe5ca2b5797f9b0');
INSERT INTO `abpsecuritylogs` VALUES ('3a118b8f-62e8-0f9f-818b-6fd8c9a69c59', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '515f78bd9ce34e8ea402194ee7db99fa', '::1', NULL, '2024-03-26 14:11:25.032925', '{}', '328047842cc64b49a1dadb6ab7c7fb6d');
INSERT INTO `abpsecuritylogs` VALUES ('3a118b99-fdd2-bb2f-83ac-57c55aabaed4', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', NULL, 'Net_Web', '58946349ce864ff89260a992bcfcab28', '::1', NULL, '2024-03-26 14:23:00.048310', '{}', '666cf047d9a141ed8bc02a2295553c73');
INSERT INTO `abpsecuritylogs` VALUES ('3a118b9a-7b47-e1bf-5fb7-9a9e13576652', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '22022077e13945d0b465352cc2721574', '::1', NULL, '2024-03-26 14:23:32.167401', '{}', '0ba10e100c1147cb9fadfc19fb4fe44e');
INSERT INTO `abpsecuritylogs` VALUES ('3a118fb1-adea-8edf-a22c-be564adec1f8', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'cd70ef02327d4f1da2236819d128bb24', '::1', NULL, '2024-03-27 09:27:21.320902', '{}', 'ca8e83664a7640f68fd6aa0813d24790');
INSERT INTO `abpsecuritylogs` VALUES ('3a1194fc-d344-4832-6aa6-a7204f92ecbe', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '9a9976c060b9482dae01a56d948d13e8', '::1', NULL, '2024-03-28 10:07:32.163592', '{}', 'ed08cb36d4e0459a8209cf21c25da9d6');
INSERT INTO `abpsecuritylogs` VALUES ('3a11966c-2d7b-8fee-ed13-b781c97d0c02', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '35f6c1209b1b455aa1185d8f7f295196', '::1', NULL, '2024-03-28 16:48:46.971357', '{}', '8ac757e5a4ad4965976f77b59cc9ef67');
INSERT INTO `abpsecuritylogs` VALUES ('3a1196a7-04c3-b191-9ec4-bffc132e74ac', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'a4a0b56f359347e9beee7a455ced8a14', '::1', NULL, '2024-03-28 17:53:03.170647', '{}', 'a9e8a83360da4734a21ad07741eb97ca');
INSERT INTO `abpsecuritylogs` VALUES ('3a119a0e-2453-2f3a-1a47-271ab30afdc7', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '723b7d4349bb4b13b38f3d9f6b9396ee', '::1', NULL, '2024-03-29 09:44:33.104124', '{}', 'a8cae28b3ad0428f844e2756762f2c97');
INSERT INTO `abpsecuritylogs` VALUES ('3a119a30-e5b3-5710-e67a-104b17ec12f9', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '88420a0dbd9c4f8e9266b9c540ee00d6', '::1', NULL, '2024-03-29 10:22:30.835132', '{}', '96e6b625726842849f9b88da5b9be486');
INSERT INTO `abpsecuritylogs` VALUES ('3a119a41-2fe0-77d5-6c87-7e07282ee2a3', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '1a94a07e738b44bfaf46fd558d09065c', '::1', NULL, '2024-03-29 10:40:18.400170', '{}', 'a698449f828a46cab53bbdafe3d1fd5d');
INSERT INTO `abpsecuritylogs` VALUES ('3a119a6c-2840-cd08-4aae-03f7572392f1', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '9a72e71f32e04ccb90a6f2066121e23d', '::1', NULL, '2024-03-29 11:27:14.496509', '{}', '5dadb910b97148a898e4bba870b2a59b');
INSERT INTO `abpsecuritylogs` VALUES ('3a119a6c-51aa-e5dd-02c8-3ed8498b4d50', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '199026d85b7e4d4a815683823beb0375', '::1', NULL, '2024-03-29 11:27:25.098734', '{}', 'c533fc4c58be4bae9770d35f13cb3340');
INSERT INTO `abpsecuritylogs` VALUES ('3a119a6c-6591-04b4-362a-f399667179c1', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '8fd71483011049fcbc6153c9b1a65e4d', '::1', NULL, '2024-03-29 11:27:30.193177', '{}', '99ca149d66194b0c9ed0feea3296dbdf');
INSERT INTO `abpsecuritylogs` VALUES ('3a119a6c-939d-250d-138d-fe79969b1385', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'cbce89f768004f6693be445c7573f422', '::1', NULL, '2024-03-29 11:27:41.981312', '{}', '2e88197aa9e744d8877d920af81575fa');
INSERT INTO `abpsecuritylogs` VALUES ('3a119a6c-f588-574d-cc7b-b32f96feeefc', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '3e634cdcfe824beaa7d6937a91873ee6', '::1', NULL, '2024-03-29 11:28:07.048883', '{}', 'dd7ffd7c267e4dbcabad1c6da256cee3');
INSERT INTO `abpsecuritylogs` VALUES ('3a119a6e-2cdb-1249-4de0-6bb36cff7d1b', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '305e7550f281462f8b25380a568a23f2', '::1', NULL, '2024-03-29 11:29:26.746958', '{}', '5ca3c25f55384f0da18bd5a63dd80dcb');
INSERT INTO `abpsecuritylogs` VALUES ('3a119a71-b9c9-8cf7-b759-663f0fc0e5aa', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'bf7251d41a85472a8c100d949db27928', '::1', NULL, '2024-03-29 11:33:19.432971', '{}', '8cea09b2664c489f851035368d89247a');
INSERT INTO `abpsecuritylogs` VALUES ('3a119a72-df95-cc40-f8c9-fab8cd363960', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'f9dc1236ee374b1fabf3ed5c715b949e', '::1', NULL, '2024-03-29 11:34:34.645837', '{}', 'fba0af5f336d4669a2175b3e106d7e6b');
INSERT INTO `abpsecuritylogs` VALUES ('3a11aadd-22e1-bf04-a9cb-f4921396c850', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '10a7dfa112ba4d23851dae55f8d89bf4', '::1', NULL, '2024-04-01 16:04:34.143105', '{}', '6f5eecb5369a4bfbb6932f49dbfe0060');
INSERT INTO `abpsecuritylogs` VALUES ('3a11aade-c73e-7488-592f-d0c57d4874a8', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'afe8647162eb409a8528670cbf70534a', '::1', NULL, '2024-04-01 16:06:21.758715', '{}', '09951c14313a45e99135b6425574c48f');
INSERT INTO `abpsecuritylogs` VALUES ('3a11afbf-571c-023a-4365-06fb8134f26b', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '7642e79179604201a12068c57ecaece6', '::1', NULL, '2024-04-02 14:50:07.516305', '{}', '4f7bf8fc481742dfa3c497c78bb7397f');
INSERT INTO `abpsecuritylogs` VALUES ('3a11b027-9b22-3571-996a-f1bd8df9d73d', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '6cf356d835264422a259dc9f73452946', '::1', NULL, '2024-04-02 16:44:00.674861', '{}', 'cb1de62234524ba08569837e9b68d23f');
INSERT INTO `abpsecuritylogs` VALUES ('3a11c8c7-556b-fdef-19d6-7d0ea105e145', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'e8694e46e7f7485b9bde1567086994af', '::1', 'PostmanRuntime/7.37.0', '2024-04-07 11:29:21.770052', '{}', '11b343816ec343d699e2c12cd45c0a61');
INSERT INTO `abpsecuritylogs` VALUES ('3a11c98a-019e-5e96-5e31-d813fd6a9c1d', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '5d1043feabb842ad958cfbe1195e4cb6', '::1', NULL, '2024-04-07 15:01:59.836909', '{}', '4a294037b49242d89148e48b3a9a042f');
INSERT INTO `abpsecuritylogs` VALUES ('3a11ca0d-c482-5f11-73b4-7f6e46420209', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'fe252f7de67645148711beb2059945a4', '::1', NULL, '2024-04-07 17:25:54.946279', '{}', '49fe0e147ea04bccbcb9c7a1128628e7');
INSERT INTO `abpsecuritylogs` VALUES ('3a11ca69-2b97-f84e-e4b2-6e31a0335c44', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'a95a5f031c6f494e99efb876e5256370', '::1', NULL, '2024-04-07 19:05:45.110949', '{}', '3fc1b6f112ee4eb88c66de66ab50ba9e');
INSERT INTO `abpsecuritylogs` VALUES ('3a11cdea-6d12-4a6e-672a-14c225284905', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '6eb6204078384a74929e1971c29ac97c', '::1', NULL, '2024-04-08 11:25:47.665194', '{}', 'c06bbcf207944b62b3e9600ef501e5d5');
INSERT INTO `abpsecuritylogs` VALUES ('3a11cf70-84ba-ec4d-569d-1fcf2fbe9e65', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'f6d1dfc239be4f35b8b1aac9966eb165', '::1', NULL, '2024-04-08 18:31:52.762467', '{}', '76853ebd32de46c6b4377053e2f95c5f');
INSERT INTO `abpsecuritylogs` VALUES ('3a11d99f-c500-c93d-cd6e-b03e4e544619', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '94d53b4e5fb74f4599a9f980edc9b828', '::1', NULL, '2024-04-10 17:59:41.568429', '{}', '1e28d3ad099245cab9067198e65fc305');
INSERT INTO `abpsecuritylogs` VALUES ('3a11defb-e2f8-cba6-08ca-102b42b6290e', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'e9ce0bd667ae47829bbc6071d0d107b8', '::1', NULL, '2024-04-11 18:58:24.625301', '{}', '64535fca08764e18990c2b0ee3b7293a');
INSERT INTO `abpsecuritylogs` VALUES ('3a120268-d150-629f-c4df-7816262ea014', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '5d5278a596f8488ba90b5254c62e9b83', '::1', NULL, '2024-04-18 16:04:06.094175', '{}', '086a776414d0428cbd5bf175e1dcdd37');
INSERT INTO `abpsecuritylogs` VALUES ('3a122110-f99e-4c8f-adad-78c072373697', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '9b44f88877654b198636952b49f40423', '::1', NULL, '2024-04-24 14:56:22.939457', '{}', 'b8ce5b904722492680c1586bbb9c0f71');
INSERT INTO `abpsecuritylogs` VALUES ('3a122bad-01b4-2dc0-4840-4d3345fda064', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '00f65be9a6aa4d93beb6b92378a59311', '::1', NULL, '2024-04-26 16:23:00.785326', '{}', 'a2818db49e144f9c97e5b9340eb638d4');
INSERT INTO `abpsecuritylogs` VALUES ('3a12b6c6-8788-8c41-9e96-bffe429dcf21', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'c8b52b2b107f4a5295b2cdd27b0bd850', '::1', 'PostmanRuntime/7.38.0', '2024-05-23 16:38:06.469891', '{}', '14a6ccf691b349e6a2ca5e41f7d76608');
INSERT INTO `abpsecuritylogs` VALUES ('3a12b6c6-9f5d-4303-2c82-45dd0d1e2cc9', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '44b2aebc1c1e4361ae8bd969dd3fe7c5', '::1', 'PostmanRuntime/7.38.0', '2024-05-23 16:38:12.573152', '{}', '705bbeccd238498baa687c0b5d09cfcb');
INSERT INTO `abpsecuritylogs` VALUES ('3a12b6c6-da85-9113-3358-ac4364886de6', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '8702560c118840d494dc096d4980a42d', '::1', 'PostmanRuntime/7.38.0', '2024-05-23 16:38:27.717439', '{}', 'e76eaf35763846f582f852df25e9b44a');
INSERT INTO `abpsecuritylogs` VALUES ('3a12b707-75ab-9afb-aa59-ec3e69389c00', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '9656d2a5e6a04daa900a7765f878119f', '::1', 'PostmanRuntime/7.38.0', '2024-05-23 17:49:01.735828', '{}', '3754e45928934eb4a2118f340c6f8bdc');
INSERT INTO `abpsecuritylogs` VALUES ('3a12b70f-4e44-8513-9b1c-1383fbc0a331', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'de1d561ef8434067a4faa366025bcf3e', '::1', 'PostmanRuntime/7.38.0', '2024-05-23 17:57:35.937894', '{}', '17dd90f2a6da44fcbfa8d92c2046714e');
INSERT INTO `abpsecuritylogs` VALUES ('3a12ba5f-859f-1c85-7e28-4fb024d7fc98', NULL, 'Panda.Net.AuthServer', 'Identity', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, '5878e28242344cf18b6d1b528626b173', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-24 09:24:04.637522', '{}', 'fdeb38d0f22d48829f90ec5319c092a3');
INSERT INTO `abpsecuritylogs` VALUES ('3a12ba62-c7ba-71cf-4e62-46ad887dcacb', NULL, 'Panda.Net.AuthServer', 'Identity', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, 'd80252861b9240c99fa9ffc34d6db03f', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-24 09:27:38.169085', '{}', 'e7b072a9c65a4df38178848c8f61aeab');
INSERT INTO `abpsecuritylogs` VALUES ('3a12ba63-c130-6998-0e7e-e0209b67401a', NULL, 'Panda.Net.AuthServer', 'Identity', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, '408255ed7872480ea58d05496dfbb60e', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-24 09:28:42.030401', '{}', '5c112ce213d34ef3ab7f2ef3834a9dcb');
INSERT INTO `abpsecuritylogs` VALUES ('3a12ba66-9037-0aaf-1a86-d199f2c9afe6', NULL, 'Panda.Net.AuthServer', 'Identity', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, '336961bdc9224fea8a29401fe586bd9d', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-24 09:31:46.101281', '{}', '671f88106a2e480eb799946d084be4ee');
INSERT INTO `abpsecuritylogs` VALUES ('3a12ba68-af24-7fae-27d4-2ff0f8a70c40', NULL, 'Panda.Net.AuthServer', 'Identity', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, '0a39dcd994db4739850d1eb41192b319', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-24 09:34:05.090563', '{}', 'aabbd9fa4bcb4e20a16e53a7d0146329');
INSERT INTO `abpsecuritylogs` VALUES ('3a12ba73-e14f-108d-0357-3a8078c5f71a', NULL, 'Panda.Net.AuthServer', 'Identity', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, '149e057254024eb09086378dd52f1c47', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-24 09:46:18.830041', '{}', '3ad478a182804b21ab0bcdff8e58525e');
INSERT INTO `abpsecuritylogs` VALUES ('3a12ba75-e3b0-01ae-3e49-5570aa4d017f', NULL, 'Panda.Net.AuthServer', 'Identity', 'Logout', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, 'ee9593040113444aa679720d5c4d78b0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-24 09:48:30.512656', '{}', '050245c54caf4bfa8cb738c2b043aa5a');
INSERT INTO `abpsecuritylogs` VALUES ('3a12ba7c-983e-70c4-bd83-b3e84a71d40a', NULL, 'Panda.Net.AuthServer', 'Identity', 'LoginFailed', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, '00ae225502884588a2b6d3329f7e8ba0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-24 09:55:49.947696', '{}', '03cb01ec71f8466b832b46815905a1fc');
INSERT INTO `abpsecuritylogs` VALUES ('3a12ba7c-b139-c907-33f1-614f568033c2', NULL, 'Panda.Net.AuthServer', 'Identity', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, 'd75e1bd65d6d43b98f9b043a73ce39fb', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-24 09:55:56.345219', '{}', '64fe631a4cc34983bb39190e1de2431c');
INSERT INTO `abpsecuritylogs` VALUES ('3a12ba83-1347-5770-285d-1cc660a03569', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '4f16689bf6a0417f831258959a538bc9', '::1', 'PostmanRuntime/7.38.0', '2024-05-24 10:02:54.661563', '{}', 'ccff8bb93e694c669d71549bc984b324');
INSERT INTO `abpsecuritylogs` VALUES ('3a12ba9a-85f4-11ba-b9fa-b0ba6342700e', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'd20d881d2da443419d73f9d81eadb41d', '::1', 'PostmanRuntime/7.38.0', '2024-05-24 10:28:31.344714', '{}', '011d87b33c1d4e9385a186479980a06b');
INSERT INTO `abpsecuritylogs` VALUES ('3a12ba9d-83fd-446a-c1bf-4da49554ca5b', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'e16c1ee26b6d40af97dd4398ebfdce21', '::1', 'PostmanRuntime/7.38.0', '2024-05-24 10:31:47.451551', '{}', '14926269b5194213985c000b9b361f86');
INSERT INTO `abpsecuritylogs` VALUES ('3a12bbef-2c6d-a8b3-931a-76c2fe0f8366', NULL, 'Panda.Net.AuthServer', 'Identity', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, '8ff0183bfc2446acbc506197813c327c', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-24 16:40:36.203991', '{}', '824bb0b59b41477fb3ead175b404facd');
INSERT INTO `abpsecuritylogs` VALUES ('3a12bc04-b6ab-38a7-7325-1c969aa59c9f', NULL, 'Panda.Net.AuthServer', 'Identity', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, 'c62f44aaace34a28ac71fd1abf5ead38', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-24 17:04:07.850003', '{}', '8a307966fe434c178002b8937bb5420a');
INSERT INTO `abpsecuritylogs` VALUES ('3a12bc05-d45b-8aa8-cb95-17a33aae3457', NULL, 'Panda.Net.AuthServer', 'Identity', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, '0cf03b70f53e4722909c075669f125a8', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-24 17:05:20.985238', '{}', '97e8d0d1c10944838315b481e8b98c9f');
INSERT INTO `abpsecuritylogs` VALUES ('3a12bc28-b2d7-2b59-7e03-4d58efb70104', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '29cf2022878d40dc85acbf9953033f19', '::1', NULL, '2024-05-24 17:43:26.164554', '{}', 'bed40c3abf894bf2b68bb04d84b439ee');
INSERT INTO `abpsecuritylogs` VALUES ('3a132676-040b-bcc8-9eff-77f5a9ecc50d', NULL, 'Panda.Net.AuthServer', 'Identity', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, '7223a589089942b2897a81d9a67fda5a', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-14 09:07:38.122102', '{}', '2766317aaa504f63a74acdd88d2623e3');
INSERT INTO `abpsecuritylogs` VALUES ('3a133617-bb55-a08c-c3d5-672550c776f4', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '4cec95d846f34ee08436c005d75afc52', '::1', NULL, '2024-06-17 09:58:34.580029', '{}', '07169148c1cb4952af6d644b3cacb483');
INSERT INTO `abpsecuritylogs` VALUES ('3a133617-d5d2-ce45-9e56-5c66be5d3067', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'd30f1aa854ad4f6f95f45a83a3a965f2', '::1', NULL, '2024-06-17 09:58:41.362607', '{}', 'b50067923ae340eeb15326368ffc99f5');
INSERT INTO `abpsecuritylogs` VALUES ('3a1336f5-aa01-17f3-b000-5e1f68753238', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '6e5f01e746714ae7bf9425198088657c', '::1', NULL, '2024-06-17 14:00:59.137801', '{}', 'f28b9b5ddac040d3a2c69e8dac968fc1');
INSERT INTO `abpsecuritylogs` VALUES ('3a133b35-fdf1-179d-2156-56678bf15212', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'e03fc2538f7f4289a95b976aba9868e0', '::1', NULL, '2024-06-18 09:49:43.792749', '{}', '3637857340d642a1a79c5dc2bd1be4b3');
INSERT INTO `abpsecuritylogs` VALUES ('3a13406f-18c3-f598-767c-04466e0e82c6', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '626285cc70094ca0948fee08b26c77bf', '::1', NULL, '2024-06-19 10:10:12.291155', '{}', 'b2fbbc2539de4ed3920c0681d6988581');
INSERT INTO `abpsecuritylogs` VALUES ('3a136543-ca78-16d5-2d9a-98abce331278', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', 'b20545def6ac438a8b5218b91bc009da', '::1', NULL, '2024-06-26 13:48:51.190600', '{}', 'ae9105e5953948b2bf58b1c4b31bafa1');
INSERT INTO `abpsecuritylogs` VALUES ('3a1369a5-0fb6-9a53-45c3-e89657a807da', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '004e0a919d454c9a9d51976eb69af618', '::1', NULL, '2024-06-27 10:13:34.773691', '{}', '7122fd3c9b1e4fd48d70ca513621f7e9');
INSERT INTO `abpsecuritylogs` VALUES ('3a1369b4-cd23-6a07-1504-8c580d932122', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a118b8b-2643-bc6e-d08a-8c4239ff9117', 'admin', NULL, 'Net_Web', 'f3b84807f2fd461db7f6269b8d94c3c5', '::1', NULL, '2024-06-27 10:30:46.307715', '{}', '11fddd0ae197400fbb08d54c383ee3c6');
INSERT INTO `abpsecuritylogs` VALUES ('3a1369bf-3155-cac1-1e70-756cb120617a', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a118b8b-2643-bc6e-d08a-8c4239ff9117', 'admin', NULL, 'Net_Web', '8e5b17b2813d4f34bb5dadb2708f966f', '::1', NULL, '2024-06-27 10:42:07.317393', '{}', '4939bd84bb0c40bab79fd699aae34a6c');
INSERT INTO `abpsecuritylogs` VALUES ('3a1369bf-58cd-8cd6-1b0b-23d98c438977', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '355f911927c34923abf365bfa031af9e', '::1', NULL, '2024-06-27 10:42:17.421594', '{}', '61a67406915c4c53b34e99b65b15719c');
INSERT INTO `abpsecuritylogs` VALUES ('3a1369c0-b885-c6ee-bc6f-956508809e6e', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '9cfa4df7571343cc927b2db8b946d56d', '::1', NULL, '2024-06-27 10:43:47.461195', '{}', 'eef93fcd9f2143b69eaec8250492a7a9');
INSERT INTO `abpsecuritylogs` VALUES ('3a1369c9-60f0-5929-eaa0-891e940d54be', NULL, 'Panda.Net.AuthServer', 'OpenIddict', 'LoginSucceeded', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, 'Net_Web', '9696576cd14e455e9ad56bf4058aa8b8', '::1', NULL, '2024-06-27 10:53:14.863942', '{}', '0af4039b2c62484eaf2f440bf0aaac7e');

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
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b55-6754-3dee-4d4da99e7a0b', 'Abp.Localization.DefaultLanguage', 'L:AbpLocalization,DisplayName:Abp.Localization.DefaultLanguage', 'L:AbpLocalization,Description:Abp.Localization.DefaultLanguage', 'en', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-040e-6064-df581bb8ba37', 'Abp.Identity.SignIn.EnablePhoneNumberConfirmation', 'L:AbpIdentity,DisplayName:Abp.Identity.SignIn.EnablePhoneNumberConfirmation', 'L:AbpIdentity,Description:Abp.Identity.SignIn.EnablePhoneNumberConfirmation', 'True', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-065c-8be5-22ee346af6b1', 'Abp.Mailing.Smtp.UseDefaultCredentials', 'L:AbpEmailing,DisplayName:Abp.Mailing.Smtp.UseDefaultCredentials', 'L:AbpEmailing,Description:Abp.Mailing.Smtp.UseDefaultCredentials', 'true', 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-181a-3604-a4f493fa57a7', 'Abp.Mailing.Smtp.EnableSsl', 'L:AbpEmailing,DisplayName:Abp.Mailing.Smtp.EnableSsl', 'L:AbpEmailing,Description:Abp.Mailing.Smtp.EnableSsl', 'false', 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-2444-209d-3af3047eb511', 'Abp.Mailing.Smtp.UserName', 'L:AbpEmailing,DisplayName:Abp.Mailing.Smtp.UserName', 'L:AbpEmailing,Description:Abp.Mailing.Smtp.UserName', NULL, 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-2734-4755-96ab4f198214', 'Abp.Mailing.Smtp.Host', 'L:AbpEmailing,DisplayName:Abp.Mailing.Smtp.Host', 'L:AbpEmailing,Description:Abp.Mailing.Smtp.Host', '127.0.0.1', 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-275b-5821-60640374e69c', 'Abp.Identity.User.IsUserNameUpdateEnabled', 'L:AbpIdentity,DisplayName:Abp.Identity.User.IsUserNameUpdateEnabled', 'L:AbpIdentity,Description:Abp.Identity.User.IsUserNameUpdateEnabled', 'True', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-2ec8-d375-08dfacd4cc4b', 'Abp.Identity.User.IsEmailUpdateEnabled', 'L:AbpIdentity,DisplayName:Abp.Identity.User.IsEmailUpdateEnabled', 'L:AbpIdentity,Description:Abp.Identity.User.IsEmailUpdateEnabled', 'True', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-357b-2b27-3c0c56c96c02', 'Smtp.Password', 'F:Smtp.Password', NULL, NULL, 0, NULL, 1, 1, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-38af-c098-d227698aa96a', 'Abp.Identity.Lockout.AllowedForNewUsers', 'L:AbpIdentity,DisplayName:Abp.Identity.Lockout.AllowedForNewUsers', 'L:AbpIdentity,Description:Abp.Identity.Lockout.AllowedForNewUsers', 'True', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-3b73-32fe-a9cb40bc38f4', 'Abp.Mailing.Smtp.Password', 'L:AbpEmailing,DisplayName:Abp.Mailing.Smtp.Password', 'L:AbpEmailing,Description:Abp.Mailing.Smtp.Password', NULL, 0, NULL, 1, 1, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-48f5-0b0b-d3b8c80f7281', 'Abp.Timing.TimeZone', 'L:AbpTiming,DisplayName:Abp.Timing.Timezone', 'L:AbpTiming,Description:Abp.Timing.Timezone', 'UTC', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-4fc1-4fe8-9030023ca4b0', 'Abp.Identity.OrganizationUnit.MaxUserMembershipCount', 'L:AbpIdentity,Identity.OrganizationUnit.MaxUserMembershipCount', 'L:AbpIdentity,Identity.OrganizationUnit.MaxUserMembershipCount', '2147483647', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-5338-bbdf-d91f5a8c5d64', 'Abp.Identity.Password.RequireDigit', 'L:AbpIdentity,DisplayName:Abp.Identity.Password.RequireDigit', 'L:AbpIdentity,Description:Abp.Identity.Password.RequireDigit', 'True', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-57c5-a0c9-c96c5ee0a4dc', 'Abp.Identity.Password.RequiredUniqueChars', 'L:AbpIdentity,DisplayName:Abp.Identity.Password.RequiredUniqueChars', 'L:AbpIdentity,Description:Abp.Identity.Password.RequiredUniqueChars', '1', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-6562-8eb0-3fcd6197cf56', 'Abp.Mailing.Smtp.Domain', 'L:AbpEmailing,DisplayName:Abp.Mailing.Smtp.Domain', 'L:AbpEmailing,Description:Abp.Mailing.Smtp.Domain', NULL, 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-661f-d5a9-1d94a9e3ee55', 'Abp.Mailing.Smtp.Port', 'L:AbpEmailing,DisplayName:Abp.Mailing.Smtp.Port', 'L:AbpEmailing,Description:Abp.Mailing.Smtp.Port', '25', 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-6dc8-dc2b-4a652cc51a4e', 'Abp.Identity.Password.RequireNonAlphanumeric', 'L:AbpIdentity,DisplayName:Abp.Identity.Password.RequireNonAlphanumeric', 'L:AbpIdentity,Description:Abp.Identity.Password.RequireNonAlphanumeric', 'True', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-720c-7293-fc9742e69cd3', 'Smtp.Port', 'F:Smtp.Port', NULL, '25', 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-7c35-837d-73569628bd43', 'Abp.Identity.Lockout.MaxFailedAccessAttempts', 'L:AbpIdentity,DisplayName:Abp.Identity.Lockout.MaxFailedAccessAttempts', 'L:AbpIdentity,Description:Abp.Identity.Lockout.MaxFailedAccessAttempts', '5', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-8fc8-9755-3a9f5cfbba97', 'Abp.Mailing.DefaultFromAddress', 'L:AbpEmailing,DisplayName:Abp.Mailing.DefaultFromAddress', 'L:AbpEmailing,Description:Abp.Mailing.DefaultFromAddress', 'noreply@abp.io', 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-9057-1b20-1b70a68332f9', 'Abp.Identity.Password.ForceUsersToPeriodicallyChangePassword', 'L:AbpIdentity,DisplayName:Abp.Identity.Password.ForceUsersToPeriodicallyChangePassword', 'L:AbpIdentity,Description:Abp.Identity.Password.ForceUsersToPeriodicallyChangePassword', 'False', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-a4e2-b6ad-e3786c2d36f6', 'Abp.Identity.Password.RequireUppercase', 'L:AbpIdentity,DisplayName:Abp.Identity.Password.RequireUppercase', 'L:AbpIdentity,Description:Abp.Identity.Password.RequireUppercase', 'True', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-b224-1a30-0e336262954e', 'Abp.Identity.SignIn.RequireConfirmedEmail', 'L:AbpIdentity,DisplayName:Abp.Identity.SignIn.RequireConfirmedEmail', 'L:AbpIdentity,Description:Abp.Identity.SignIn.RequireConfirmedEmail', 'False', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-b3f3-1898-2259b6a58a72', 'Abp.Account.IsSelfRegistrationEnabled', 'L:AbpAccount,DisplayName:Abp.Account.IsSelfRegistrationEnabled', 'L:AbpAccount,Description:Abp.Account.IsSelfRegistrationEnabled', 'true', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-c61f-d19d-0d7e5cf0f142', 'Abp.Identity.Password.RequiredLength', 'L:AbpIdentity,DisplayName:Abp.Identity.Password.RequiredLength', 'L:AbpIdentity,Description:Abp.Identity.Password.RequiredLength', '6', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-cb13-f8fe-3d51285bc46a', 'Abp.Identity.Lockout.LockoutDuration', 'L:AbpIdentity,DisplayName:Abp.Identity.Lockout.LockoutDuration', 'L:AbpIdentity,Description:Abp.Identity.Lockout.LockoutDuration', '300', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-cc6c-1915-e8f972d07d08', 'Smtp.Host', 'F:Smtp.Host', NULL, '127.0.0.1', 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-cde1-07a8-d37d483a9747', 'Abp.Identity.Password.RequireLowercase', 'L:AbpIdentity,DisplayName:Abp.Identity.Password.RequireLowercase', 'L:AbpIdentity,Description:Abp.Identity.Password.RequireLowercase', 'True', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-d87a-fb58-7563a7b8f785', 'Abp.Identity.SignIn.RequireConfirmedPhoneNumber', 'L:AbpIdentity,DisplayName:Abp.Identity.SignIn.RequireConfirmedPhoneNumber', 'L:AbpIdentity,Description:Abp.Identity.SignIn.RequireConfirmedPhoneNumber', 'False', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-dbb5-5ce7-647439cbf7d7', 'Smtp.EnableSsl', 'F:Smtp.EnableSsl', NULL, NULL, 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-e062-0107-54cd2b524f1a', 'Abp.Account.EnableLocalLogin', 'L:AbpAccount,DisplayName:Abp.Account.EnableLocalLogin', 'L:AbpAccount,Description:Abp.Account.EnableLocalLogin', 'true', 1, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-e1f8-78b0-44aa0f744bee', 'Abp.Mailing.DefaultFromDisplayName', 'L:AbpEmailing,DisplayName:Abp.Mailing.DefaultFromDisplayName', 'L:AbpEmailing,Description:Abp.Mailing.DefaultFromDisplayName', 'ABP application', 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-ec51-a477-4134c9a65d2b', 'Smtp.UserName', 'F:Smtp.UserName', NULL, NULL, 0, NULL, 1, 0, '{}');
INSERT INTO `abpsettingdefinitions` VALUES ('3a114eb9-0b56-f61d-6cf4-3c69468123c2', 'Abp.Identity.Password.PasswordChangePeriodDays', 'L:AbpIdentity,DisplayName:Abp.Identity.Password.PasswordChangePeriodDays', 'L:AbpIdentity,Description:Abp.Identity.Password.PasswordChangePeriodDays', '0', 1, NULL, 1, 0, '{}');

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
  `NormalizedName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AbpTenants_Name`(`Name` ASC) USING BTREE,
  INDEX `IX_AbpTenants_NormalizedName`(`NormalizedName` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abptenants
-- ----------------------------
INSERT INTO `abptenants` VALUES ('1cc37ea8-ea58-11ee-8c19-08bfb83e8436', '超级租户', 1, '{}', '1cc37ea8ea5811ee8c1908bfb83e8436', '2024-03-25 11:31:22.000000', NULL, NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abptenants` VALUES ('3a118a9c-64ff-5afe-05f0-acc345b00377', '第二租户1', 2, '{}', 'b7ab00e853e34231ac038763525baa12', '2024-03-26 09:46:00.323202', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-03-26 09:56:37.296459', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-03-26 09:56:37.294093', '');

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
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`OrganizationUnitId`, `UserId`) USING BTREE,
  INDEX `IX_AbpUserOrganizationUnits_UserId_OrganizationUnitId`(`UserId` ASC, `OrganizationUnitId` ASC) USING BTREE,
  CONSTRAINT `FK_AbpUserOrganizationUnits_AbpOrganizationUnits_OrganizationUn~` FOREIGN KEY (`OrganizationUnitId`) REFERENCES `abporganizationunits` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_AbpUserOrganizationUnits_AbpUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `abpusers` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpuserorganizationunits
-- ----------------------------
INSERT INTO `abpuserorganizationunits` VALUES ('3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'e689e0d5-fdc3-4f5a-85e5-ba0ade731028', NULL, '2024-03-20 17:38:16.408268', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45');
INSERT INTO `abpuserorganizationunits` VALUES ('3a116d37-cd8b-233d-d3e0-677eba44ade3', 'e689e0d5-fdc3-4f5a-85e5-ba0ade731028', NULL, '2024-03-20 16:47:08.950763', NULL);

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
INSERT INTO `abpuserroles` VALUES ('1cc37ea8-ea58-11ee-8c19-08bfb83e8436', '3a118683-f49e-9140-cd4d-30671885b6f5', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436');
INSERT INTO `abpuserroles` VALUES ('3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '3a114eb4-8f2b-216a-f234-064df47eb27d', NULL);
INSERT INTO `abpuserroles` VALUES ('3a116d37-cd8b-233d-d3e0-677eba44ade3', '3a114eb4-8f2b-216a-f234-064df47eb27d', NULL);
INSERT INTO `abpuserroles` VALUES ('3a116d37-cd8b-233d-d3e0-677eba44ade3', '3a11668e-b269-6e7f-1195-86d2de3d68b4', NULL);
INSERT INTO `abpuserroles` VALUES ('3a118a9c-657a-3f1b-f6ff-bc47d0c474e7', '3a118a9c-660a-95d5-5e28-5af6cc8f257c', '3a118a9c-64ff-5afe-05f0-acc345b00377');
INSERT INTO `abpuserroles` VALUES ('3a118b8b-2643-bc6e-d08a-8c4239ff9117', '3a118b8b-26fb-7e7e-02f0-8965c053c0f0', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436');

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
  `Avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AbpUsers_Email`(`Email` ASC) USING BTREE,
  INDEX `IX_AbpUsers_NormalizedEmail`(`NormalizedEmail` ASC) USING BTREE,
  INDEX `IX_AbpUsers_NormalizedUserName`(`NormalizedUserName` ASC) USING BTREE,
  INDEX `IX_AbpUsers_UserName`(`UserName` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of abpusers
-- ----------------------------
INSERT INTO `abpusers` VALUES ('1cc37ea8-ea58-11ee-8c19-08bfb83e8436', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'adminy', 'ADMINY', 'adminy', 'adminy', 'adminy@abp.io', 'ADMINY@ABP.IO', 0, 'AQAAAAIAAYagAAAAEApYmftwkDO28c8Oq++DQIXh3R4idbJSa0Xot14S9o8gVSnJp9x/VitvMiHkSDvlPQ==', 'IIFMGXJZ6NP6BHJV5ZYKJEKDLJTA7NZP', 0, '13544556', 0, 1, 0, NULL, 1, 0, 0, 4, '2024-03-14 10:35:10.618567', '', '{}', 'acded14e0312469d9e4ab141b5dc01b5', '2024-03-14 18:35:10.749371', NULL, '2024-03-20 17:38:26.580176', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL, '');
INSERT INTO `abpusers` VALUES ('3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, 'admin', 'ADMIN', 'admin', 'admin', 'admin@abp.io', 'ADMIN@ABP.IO', 0, 'AQAAAAIAAYagAAAAEApYmftwkDO28c8Oq++DQIXh3R4idbJSa0Xot14S9o8gVSnJp9x/VitvMiHkSDvlPQ==', 'C7G5M475CXNDLWEH22P4WZDBBOVXVATD', 0, '1354455', 0, 1, 0, NULL, 1, 0, 0, 16, '2024-03-14 10:35:10.618567', '', '{}', '1161e709d76646509aa3134265bb68f9', '2024-03-14 18:35:10.749371', NULL, '2024-06-27 10:43:26.057235', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL, '1177eee81a79652c3a017fe58b3e23e4');
INSERT INTO `abpusers` VALUES ('3a116d37-cd8b-233d-d3e0-677eba44ade3', NULL, 'admin1', 'ADMIN1', 'xiaoxiao', 'zhang', 'admin1@abp.io', 'ADMIN1@ABP.IO', 0, 'AQAAAAIAAYagAAAAEJpSkghYhbc7mk7t7BQtfWsa6SJYQnPO7RAJWGhyNjN2b3TEHI/f0EtFFDEzF19xfQ==', '6STRNK7AJWFXGTZEW6MNLEWI2T2WXTTZ', 0, '135518741', 0, 0, 0, NULL, 0, 0, 0, 11, '2024-03-20 08:47:08.732296', '', '{}', '71f2d1f585274d6181d1f83f679b5776', '2024-03-20 16:47:08.741932', NULL, '2024-03-29 11:14:12.848859', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL, '');
INSERT INTO `abpusers` VALUES ('3a116d3a-3a9e-8273-62ba-0c6cfefc0eee', NULL, 'admin2', 'ADMIN2', '小东', '刘', 'admin2@qbp.io', 'ADMIN2@QBP.IO', 0, 'AQAAAAIAAYagAAAAEAAftKl/pnXnWBP+7TJaCol9kJIfYoS1EFshMwtuDPpxSCOp4fm5tfQdbNn96dKCCQ==', 'IA3BTA7XQLEALAYWDVTEYRNADBIWNQMN', 0, '16589544545', 0, 0, 0, NULL, 0, 0, 0, 5, '2024-03-20 08:49:47.727797', '', '{}', '476ed72fb0904e9ebc39589cc894daec', '2024-03-20 16:49:47.739588', NULL, '2024-03-20 18:41:42.345198', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 1, '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-03-20 18:41:42.343901', '');
INSERT INTO `abpusers` VALUES ('3a118a9c-657a-3f1b-f6ff-bc47d0c474e7', '3a118a9c-64ff-5afe-05f0-acc345b00377', 'admin', 'ADMIN', 'admin', NULL, 'adminy2@qq.com', 'ADMINY2@QQ.COM', 0, 'AQAAAAIAAYagAAAAEBjpbLLvErRSCRSoZB8lSeuU+F9MFmHWi9fuf62PBVyjlxDODsh+ri0tgSqeExqRKw==', '6JUWVMLETGKCZCSWAIP3ZGIDVAML4EDU', 0, NULL, 0, 1, 0, NULL, 1, 0, 0, 0, '2024-03-26 01:46:00.510526', '', '{}', 'e76c87d813584c7a8a5e72aaf17e2f8b', '2024-03-26 09:46:00.552044', NULL, NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `abpusers` VALUES ('3a118b8b-2643-bc6e-d08a-8c4239ff9117', '1cc37ea8-ea58-11ee-8c19-08bfb83e8436', 'admin', 'ADMIN', 'admin', NULL, 'admin@abp.io', 'ADMIN@ABP.IO', 0, 'AQAAAAIAAYagAAAAEK3ZexfskuVZQ9NTrDtKnkzfxcCDy4d5z6mlTaGZAKe926LwxPI/OE47I5Ke4VKZ/g==', 'IW2KCQPLRLGBZNEBCWT7H5NLMAJ7C5SY', 0, NULL, 0, 1, 0, NULL, 1, 0, 0, 0, '2024-03-26 06:06:47.419361', '', '{}', 'c4e5991d9ddb47128cb01283667d68eb', '2024-03-26 14:06:47.491742', NULL, NULL, NULL, 0, NULL, NULL, '');

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
-- Table structure for openiddictapplications
-- ----------------------------
DROP TABLE IF EXISTS `openiddictapplications`;
CREATE TABLE `openiddictapplications`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ClientId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ClientSecret` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ConsentType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `DisplayNames` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `PostLogoutRedirectUris` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `RedirectUris` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ClientType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
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
  `ApplicationType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `JsonWebKeySet` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_OpenIddictApplications_ClientId`(`ClientId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of openiddictapplications
-- ----------------------------
INSERT INTO `openiddictapplications` VALUES ('3a114eb4-927c-6f34-c323-a5ed9c1da131', 'Net_Web', 'AQAAAAEAACcQAAAAEJXrc6gJ21jOUciBAcBW0LBL4ZOhBCGPt3fT6i1Y0j/4TCRz+qor+C8S0D3dScYU/Q==', 'explicit', 'Net Web Application', NULL, '[\"rst:code id_token\",\"ept:logout\",\"gt:authorization_code\",\"rst:code\",\"ept:authorization\",\"ept:token\",\"ept:revocation\",\"ept:introspection\",\"gt:implicit\",\"rst:id_token\",\"gt:password\",\"gt:client_credentials\",\"gt:refresh_token\",\"gt:urn:ietf:params:oauth:grant-type:device_code\",\"ept:device\",\"gt:net\",\"scp:address\",\"scp:email\",\"scp:phone\",\"scp:profile\",\"scp:roles\",\"scp:openId\",\"scp:Net\"]', '[\"https://localhost:44392/signout-callback-oidc\"]', NULL, '[\"https://localhost:44392/signin-oidc\",\"https://www.baidu.com\"]', NULL, 'confidential', 'https://localhost:44392/', NULL, '{}', 'ab4c2f8ef93e4887bcf310e0c3c5f82a', '2024-03-14 18:35:11.920582', NULL, '2024-05-23 16:50:22.597069', NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `openiddictapplications` VALUES ('3a114eb4-92d6-e058-b79a-bba239b208c2', 'Ad_Web', 'AQAAAAEAACcQAAAAEIqI+Xx6hgqIEqAkJBHd850wzPZ50QVL+NELKSqLiZtoHGzcP82zNLFDe+N3zGC1Ig==', 'implicit', 'Ad Web Application', NULL, '[\"rst:code id_token\",\"ept:logout\",\"gt:authorization_code\",\"rst:code\",\"ept:authorization\",\"ept:token\",\"ept:revocation\",\"ept:introspection\",\"gt:implicit\",\"rst:id_token\",\"gt:password\",\"gt:client_credentials\",\"gt:refresh_token\",\"scp:address\",\"scp:email\",\"scp:phone\",\"scp:profile\",\"scp:roles\",\"scp:openId\",\"scp:Ad\"]', '[\"https://localhost:44392/signout-callback-oidc\"]', NULL, '[\"https://localhost:44392/signin-oidc\",\"https://www.baidu.com\"]', NULL, 'confidential', 'https://localhost:44392/', NULL, '{}', '4275a202b18b425ca571a39637296af4', '2024-03-14 18:35:11.963550', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `openiddictapplications` VALUES ('3a114eb4-92e6-27df-2bb0-3a8c8219e2d1', 'Net_App', NULL, 'implicit', 'Console Test / Angular Application', NULL, '[\"ept:logout\",\"gt:authorization_code\",\"rst:code\",\"ept:authorization\",\"ept:token\",\"ept:revocation\",\"ept:introspection\",\"gt:password\",\"gt:client_credentials\",\"gt:refresh_token\",\"scp:address\",\"scp:email\",\"scp:phone\",\"scp:profile\",\"scp:roles\",\"scp:openId\"]', '[\"http://localhost:4200\"]', NULL, '[\"http://localhost:4200\",\"https://www.baidu.com\"]', NULL, 'public', 'http://localhost:4200', NULL, '{}', '55c8d1b1a9fe42b9992f80a043871588', '2024-03-14 18:35:11.976481', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `openiddictapplications` VALUES ('3a114eb4-92f1-9368-c998-997fde19223a', 'Net_BlazorServerTiered', 'AQAAAAEAACcQAAAAEIkmiQ07Ic7nyFRXNgoddazRT34Hrq6DToi2YfzWRcZJ/w9Ei7ts3LvnpAQRxbbNgQ==', 'implicit', 'Blazor Server Application', NULL, '[\"rst:code id_token\",\"ept:logout\",\"gt:authorization_code\",\"rst:code\",\"ept:authorization\",\"ept:token\",\"ept:revocation\",\"ept:introspection\",\"gt:implicit\",\"rst:id_token\",\"scp:address\",\"scp:email\",\"scp:phone\",\"scp:profile\",\"scp:roles\",\"scp:openId\"]', '[\"https://localhost:44393/signout-callback-oidc\"]', NULL, '[\"https://localhost:44393/signin-oidc\",\"https://www.baidu.com\"]', NULL, 'confidential', 'https://localhost:44393/', NULL, '{}', '4500b44f8d874f3393b639d9b998ad74', '2024-03-14 18:35:11.993160', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `openiddictapplications` VALUES ('3a114eb4-9300-dddc-8c38-dc81ddcc83dc', 'Net_Swagger', NULL, 'implicit', 'Swagger Application', NULL, '[\"ept:logout\",\"gt:authorization_code\",\"rst:code\",\"ept:authorization\",\"ept:token\",\"ept:revocation\",\"ept:introspection\",\"scp:address\",\"scp:email\",\"scp:phone\",\"scp:profile\",\"scp:roles\",\"scp:openId\"]', NULL, NULL, '[\"https://localhost:44360/swagger/oauth2-redirect.html\",\"https://www.baidu.com\"]', NULL, 'public', 'https://localhost:44360', NULL, '{}', 'b01ce8e3679a488d811a0474242e949c', '2024-03-14 18:35:12.001732', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);

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
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `DeletionTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_OpenIddictAuthorizations_ApplicationId_Status_Subject_Type`(`ApplicationId` ASC, `Status` ASC, `Subject` ASC, `Type` ASC) USING BTREE,
  CONSTRAINT `FK_OpenIddictAuthorizations_OpenIddictApplications_ApplicationId` FOREIGN KEY (`ApplicationId`) REFERENCES `openiddictapplications` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of openiddictauthorizations
-- ----------------------------
INSERT INTO `openiddictauthorizations` VALUES ('3a12bbfb-2b48-c1e4-3304-ca2e13207e03', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '2024-05-24 08:53:42.343360', NULL, '[\"offline_access\",\"Net\"]', 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'permanent', '{}', '1d9e3617f78f4e26ae2746fcafbc1ac1', '2024-05-24 16:53:42.410677', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddictauthorizations` VALUES ('3a133617-bc4a-26ed-226f-117180ebf300', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '2024-06-17 01:58:34.816641', NULL, '[\"Net\",\"offline_access\"]', 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'ad-hoc', '{}', '6a0d82b9c50649ff8c1ec8d5f4bc430f', '2024-06-17 09:58:34.875949', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddictauthorizations` VALUES ('3a133617-d5e4-7641-de76-df563504d9d8', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '2024-06-17 01:58:41.379948', NULL, '[\"Net\",\"offline_access\"]', 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'ad-hoc', '{}', '4d852d974f5346dba29f98b6494ef288', '2024-06-17 09:58:41.383755', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddictauthorizations` VALUES ('3a1336f5-aa40-9fc2-dc57-6f7263a3475d', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '2024-06-17 06:00:59.198233', NULL, '[\"Net\",\"offline_access\"]', 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'ad-hoc', '{}', '9eda3834354e435395211650e775c5b9', '2024-06-17 14:00:59.208974', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddictauthorizations` VALUES ('3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '2024-06-18 01:49:43.988626', NULL, '[\"Net\",\"offline_access\"]', 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'ad-hoc', '{}', '30425165b4ec4e149e4e02053fb94dd9', '2024-06-18 09:49:44.035681', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddictauthorizations` VALUES ('3a13406f-18e7-31c1-bcad-de3dc31faa7e', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '2024-06-19 02:10:12.326333', NULL, '[\"Net\",\"offline_access\"]', 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'ad-hoc', '{}', 'd7695f2222314f4f93256b0629f96fea', '2024-06-19 10:10:12.330983', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddictauthorizations` VALUES ('3a136543-cbbc-dd95-0d13-61aa3f6c54a6', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '2024-06-26 05:48:51.509442', NULL, '[\"Net\",\"offline_access\"]', 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'ad-hoc', '{}', 'db4d75390c1648f9a7f6bc310701a52e', '2024-06-26 13:48:51.563221', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddictauthorizations` VALUES ('3a1369a5-10e0-af2a-b927-33860ac3345f', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '2024-06-27 02:13:35.068769', NULL, '[\"Net\",\"offline_access\"]', 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'ad-hoc', '{}', 'b42a61c7119f43f1ba09c3080c125528', '2024-06-27 10:13:35.133699', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddictauthorizations` VALUES ('3a1369b4-cd36-4ab8-beec-7de69277dffd', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '2024-06-27 02:30:46.325512', NULL, '[\"Net\",\"offline_access\"]', 'valid', '3a118b8b-2643-bc6e-d08a-8c4239ff9117', 'ad-hoc', '{}', '34ee732354a1467bbda68ff7b549d15e', '2024-06-27 10:30:46.328792', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddictauthorizations` VALUES ('3a1369bf-3168-29fe-9445-d957e2773923', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '2024-06-27 02:42:07.335774', NULL, '[\"Net\",\"offline_access\"]', 'valid', '3a118b8b-2643-bc6e-d08a-8c4239ff9117', 'ad-hoc', '{}', '7fb9ac94f6264e619c23812e65eba4dd', '2024-06-27 10:42:07.338167', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddictauthorizations` VALUES ('3a1369bf-58d9-c5ec-97a8-818fb9310093', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '2024-06-27 02:42:17.433236', NULL, '[\"Net\",\"offline_access\"]', 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'ad-hoc', '{}', 'a10bac229b814b4b9ddfda2118c842fc', '2024-06-27 10:42:17.434980', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddictauthorizations` VALUES ('3a1369c0-b88d-1840-a06d-65c2f3c2a7d6', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '2024-06-27 02:43:47.468692', NULL, '[\"Net\",\"offline_access\"]', 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'ad-hoc', '{}', '071709be8a044f01a0f2e981ad6560fd', '2024-06-27 10:43:47.470377', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddictauthorizations` VALUES ('3a1369c9-6103-351e-a243-6220089a706b', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '2024-06-27 02:53:14.883105', NULL, '[\"Net\",\"offline_access\"]', 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'ad-hoc', '{}', 'ef01478c075c4d57a178f5c92fa456e4', '2024-06-27 10:53:14.886392', NULL, NULL, NULL, 0, NULL, NULL);

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
INSERT INTO `openiddictscopes` VALUES ('3a114eb4-91ed-d6f2-f251-28a41bed2cd5', NULL, NULL, 'Net API', NULL, 'Net', NULL, '[\"Net\"]', '{}', '76545372279a4bb8b84a0621af91262b', '2024-03-14 18:35:11.761058', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddictscopes` VALUES ('3a114eb4-925b-c482-ad65-c30d3d951720', NULL, NULL, 'Ad API', NULL, 'Ad', NULL, '[\"Ad\"]', '{}', 'd862c7e21bbc4ec8ae326e99f3639645', '2024-03-14 18:35:11.837617', NULL, NULL, NULL, 0, NULL, NULL);

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
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `DeletionTime` datetime(6) NULL DEFAULT NULL,
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
INSERT INTO `openiddicttokens` VALUES ('3a133617-bcda-8bf1-3b8b-565c0c25332c', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133617-bc4a-26ed-226f-117180ebf300', '2024-06-17 01:58:34.000000', '2024-06-17 02:58:34.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', 'aa4f451bc4d841ffbfcf54956f22fd93', '2024-06-17 09:58:35.016301', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a133617-bd42-b5bf-7665-f00e4fe84b78', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133617-bc4a-26ed-226f-117180ebf300', '2024-06-17 01:58:34.000000', '2024-07-01 01:58:34.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', 'e085a9c7b6c148b0b4d6d63e0584ba29', '2024-06-17 09:58:35.076908', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a133617-d5f4-c4a5-c73f-8eb83d626cbc', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133617-d5e4-7641-de76-df563504d9d8', '2024-06-17 01:58:41.000000', '2024-06-17 02:58:41.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', '5f87a3ca947f4267b13eda4bf8ca1a93', '2024-06-17 09:58:41.399165', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a133617-d600-5f1f-deb2-c6b1f1c328b0', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133617-d5e4-7641-de76-df563504d9d8', '2024-06-17 01:58:41.000000', '2024-07-01 01:58:41.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', '784797e56f614be8889a26e1aa716239', '2024-06-17 09:58:41.411770', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1336f5-aa5c-223f-10dd-6070ef3468ba', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a1336f5-aa40-9fc2-dc57-6f7263a3475d', '2024-06-17 06:00:59.000000', '2024-06-17 07:00:59.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', '494f418ff1d240f7a32d6b71de676ea2', '2024-06-17 14:00:59.232637', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1336f5-aa6c-a8b1-0768-3ee990566065', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a1336f5-aa40-9fc2-dc57-6f7263a3475d', '2024-06-17 06:00:59.000000', '2024-07-01 06:00:59.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', 'e07539dad0264be1b03ba999d2a0c5b7', '2024-06-17 14:00:59.246445', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a133b35-ff25-5678-dd17-2b4afdd402b2', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-18 01:49:44.000000', '2024-06-18 02:49:44.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', '9c598468bba1480da3d125d143cc6d06', '2024-06-18 09:49:44.133453', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a133b35-ff80-0d10-b828-cb5c921d8529', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-18 01:49:44.000000', '2024-07-02 01:49:44.000000', NULL, NULL, '2024-06-18 02:54:45.197240', NULL, 'redeemed', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', '103a7a16dddf414ba4000448bd11c137', '2024-06-18 09:49:44.194420', NULL, '2024-06-18 10:54:45.211813', NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a133b71-85f1-c773-3810-4123c1e74c0c', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-18 02:54:45.000000', '2024-06-18 03:54:45.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', '19038db7be994f1f873f4c3e07bd1bfe', '2024-06-18 10:54:45.236974', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a133b71-85fa-061b-d209-3ea9743fc6d0', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-18 02:54:45.000000', '2024-07-02 02:54:45.000000', NULL, NULL, '2024-06-18 05:42:04.412742', NULL, 'redeemed', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', 'bfc5ac7c7eba4e9b8af02c3042296f23', '2024-06-18 10:54:45.243453', NULL, '2024-06-18 13:42:04.416443', NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a133c0a-b587-5bbe-869a-aaaeb24700e3', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-18 05:42:04.000000', '2024-06-18 06:42:04.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', '02b96895423248be8110d210db26387f', '2024-06-18 13:42:04.425741', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a133c0a-b58f-a51f-c324-2359b43187c9', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-18 05:42:04.000000', '2024-07-02 05:42:04.000000', NULL, NULL, '2024-06-19 01:39:24.451593', NULL, 'redeemed', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', '529da3deb55e4afe94e7683617fc65cf', '2024-06-18 13:42:04.433551', NULL, '2024-06-19 09:39:24.457522', NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a134052-e6bd-6366-1341-d9ff8042c397', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-19 01:39:24.000000', '2024-06-19 02:39:24.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', 'f171eeaba8474c3dbd201a922325fe3e', '2024-06-19 09:39:24.480757', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a134052-e6ca-d5ce-a16c-98c12aa3789f', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-19 01:39:24.000000', '2024-07-03 01:39:24.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', 'c1bd7002d2bc4fb9a0b6dc899cbc9366', '2024-06-19 09:39:24.491738', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a134052-e72d-51f6-f745-1afcedfc9101', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-19 01:39:24.000000', '2024-06-19 02:39:24.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', '821ea7acecf3474f87b60fb976f70cfa', '2024-06-19 09:39:24.593337', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a134052-e73a-2dae-0bae-8987148ea66f', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-19 01:39:24.000000', '2024-07-03 01:39:24.000000', NULL, NULL, '2024-06-19 07:53:45.286097', NULL, 'redeemed', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', '7df1a58c504a40228ab6831eb2193773', '2024-06-19 09:39:24.604031', NULL, '2024-06-19 15:53:45.291923', NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a13406f-18f2-c529-a60d-0dfd3dcdd682', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a13406f-18e7-31c1-bcad-de3dc31faa7e', '2024-06-19 02:10:12.000000', '2024-06-19 03:10:12.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', '9f4a11286fe947a599412ca32afeb7e4', '2024-06-19 10:10:12.340574', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a13406f-18fa-52e3-fadd-b9b48311880a', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a13406f-18e7-31c1-bcad-de3dc31faa7e', '2024-06-19 02:10:12.000000', '2024-07-03 02:10:12.000000', NULL, NULL, '2024-06-19 06:50:46.706074', NULL, 'redeemed', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', '4667d61f77854f5b901b6bac8110b95d', '2024-06-19 10:10:12.348381', NULL, '2024-06-19 14:50:46.712419', NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a13416f-f84a-8223-2601-6080149c3271', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a13406f-18e7-31c1-bcad-de3dc31faa7e', '2024-06-19 06:50:46.000000', '2024-06-19 07:50:46.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', 'c87c9700875849eda5ae5bfde6db07d4', '2024-06-19 14:50:46.734568', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a13416f-f857-d907-d1b0-2049792bd2c6', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a13406f-18e7-31c1-bcad-de3dc31faa7e', '2024-06-19 06:50:46.000000', '2024-07-03 06:50:46.000000', NULL, NULL, '2024-06-25 07:19:22.168331', NULL, 'redeemed', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', '625d8c353fc64ec9a44342b5fe3574be', '2024-06-19 14:50:46.745697', NULL, '2024-06-25 15:19:22.179956', NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1341a9-a05c-8b4f-baa3-5eb7f9dedb71', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-19 07:53:45.000000', '2024-06-19 08:53:45.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', '524181d82b51437db83e679dead78c3f', '2024-06-19 15:53:45.312496', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1341a9-a067-4fb8-42b5-17c0bbd7c315', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-19 07:53:45.000000', '2024-07-03 07:53:45.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', '14998d98939a481281575b6b1b895c95', '2024-06-19 15:53:45.321678', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1341a9-a0a8-2a1d-84ef-a612ba805799', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-19 07:53:45.000000', '2024-06-19 08:53:45.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', 'c3b4c97988314aeb8461da2f0a6e7afd', '2024-06-19 15:53:45.388998', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1341a9-a0b4-d786-731c-7707ef4b96a0', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-19 07:53:45.000000', '2024-07-03 07:53:45.000000', NULL, NULL, '2024-06-19 09:22:38.256360', NULL, 'redeemed', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', '46977c8297634570b17b3817968b51b8', '2024-06-19 15:53:45.397990', NULL, '2024-06-19 17:22:38.266713', NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1341fb-0050-1e2b-9b5f-65a4874eeedc', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-19 09:22:38.000000', '2024-06-19 10:22:38.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', '0b0e12a511cc49b4b15346b6709fcd3d', '2024-06-19 17:22:38.295603', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1341fb-0062-dc94-c3ff-5673e61599b3', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-19 09:22:38.000000', '2024-07-03 09:22:38.000000', NULL, NULL, '2024-06-20 02:27:20.492042', NULL, 'redeemed', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', '9e53f90c33e9450b88ed7935b25fcf43', '2024-06-19 17:22:38.308826', NULL, '2024-06-20 10:27:20.500082', NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1345a5-2556-00d3-4e7c-96c5897ae980', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-20 02:27:20.000000', '2024-06-20 03:27:20.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', '866f169f20af4039b7c075638ae07007', '2024-06-20 10:27:20.540377', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1345a5-2568-fce3-9078-edb9faf342ff', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-20 02:27:20.000000', '2024-07-04 02:27:20.000000', NULL, NULL, '2024-06-20 05:57:35.384983', NULL, 'redeemed', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', 'bb0423b4c715409fa6c6edd9a38ced45', '2024-06-20 10:27:20.554381', NULL, '2024-06-20 13:57:35.389952', NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a134665-a22a-9742-af54-d8f29f4ca3ce', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-20 05:57:35.000000', '2024-06-20 06:57:35.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', '737321e1e6634e729c71f648f5fc30c5', '2024-06-20 13:57:35.404577', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a134665-a233-f951-0daf-132bb7262d97', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-20 05:57:35.000000', '2024-07-04 05:57:35.000000', NULL, NULL, '2024-06-21 05:50:48.221693', NULL, 'redeemed', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', '151e2da9009c460b888ce65d39a55635', '2024-06-20 13:57:35.415816', NULL, '2024-06-21 13:50:48.229335', NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a134b85-c7c4-3cf8-e9e3-0a7eaf7991fb', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-21 05:50:48.000000', '2024-06-21 06:50:48.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', 'c46f4499956f472580f6c20e2722b88d', '2024-06-21 13:50:48.268659', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a134b85-c7d9-987a-c23c-d2e2408aaf43', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-21 05:50:48.000000', '2024-07-05 05:50:48.000000', NULL, NULL, '2024-06-25 06:42:41.645374', NULL, 'redeemed', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', 'b95d2927c61147a486f0c067994adff5', '2024-06-21 13:50:48.285355', NULL, '2024-06-25 14:42:41.684062', NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a13604e-b9e3-25cb-02a0-c23686e1d332', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-25 06:42:41.000000', '2024-06-25 07:42:41.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', '7d9a7e8bce2245318c36db7eac652ef5', '2024-06-25 14:42:41.802884', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a13604e-ba36-258c-2d8c-bbfcd3b51f2c', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-25 06:42:41.000000', '2024-07-09 06:42:41.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', 'a7101e17c1bc4c628452d4b5799f0246', '2024-06-25 14:42:41.848570', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a13604e-bb00-4748-1365-e6d2dc9bfd79', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-25 06:42:42.000000', '2024-06-25 07:42:42.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', '51e4a31db91946dfa47cc0dd103e5e2a', '2024-06-25 14:42:42.051443', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a13604e-bb0c-6eb3-94aa-a8574768e908', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-25 06:42:42.000000', '2024-07-09 06:42:42.000000', NULL, NULL, '2024-06-25 08:07:33.655498', NULL, 'redeemed', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', 'cfb485ac72514e0fba19d6c90fc324b8', '2024-06-25 14:42:42.063351', NULL, '2024-06-25 16:07:33.660403', NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a136070-4d4c-d1c4-631c-665510e5a726', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a13406f-18e7-31c1-bcad-de3dc31faa7e', '2024-06-25 07:19:22.000000', '2024-06-25 08:19:22.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', '9cfbad9af14a44d3ad74621bbd95b750', '2024-06-25 15:19:22.191895', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a136070-4d54-0eac-72f4-e7e9c58ecc1b', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a13406f-18e7-31c1-bcad-de3dc31faa7e', '2024-06-25 07:19:22.000000', '2024-07-09 07:19:22.000000', NULL, NULL, '2024-06-26 06:14:41.926826', NULL, 'redeemed', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', 'e8ef76bd629542f8912924c2d98c5fec', '2024-06-25 15:19:22.200223', NULL, '2024-06-26 14:14:41.942129', NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a13609c-6c24-d72b-275f-de034cb85520', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-25 08:07:33.000000', '2024-06-25 09:07:33.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', '09413a6a757547e285135fc19d1f9892', '2024-06-25 16:07:33.671529', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a13609c-6c2e-143b-8e20-5cbeb9e24b6d', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a133b35-feb7-a6e6-aacb-3ffee023b9a8', '2024-06-25 08:07:33.000000', '2024-07-09 08:07:33.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', 'c251c70a1cc544998bc325d2272f89aa', '2024-06-25 16:07:33.680682', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a136543-cc37-7019-0946-c626574852a7', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a136543-cbbc-dd95-0d13-61aa3f6c54a6', '2024-06-26 05:48:51.000000', '2024-06-26 06:48:51.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', '4e4a37307d744584916d4b767df028c9', '2024-06-26 13:48:51.672651', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a136543-ccae-1618-c59f-015dec341f62', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a136543-cbbc-dd95-0d13-61aa3f6c54a6', '2024-06-26 05:48:51.000000', '2024-07-10 05:48:51.000000', NULL, NULL, '2024-06-26 08:37:19.272021', NULL, 'redeemed', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', 'febd6bed37de4f6590b81ff47b4cdc4d', '2024-06-26 13:48:51.760780', NULL, '2024-06-26 16:37:19.332284', NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a13655b-7430-b287-3f6f-a63abfeaef31', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a13406f-18e7-31c1-bcad-de3dc31faa7e', '2024-06-26 06:14:41.000000', '2024-06-26 07:14:41.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', 'ea63f1ce410049b18b706e486fee7f9c', '2024-06-26 14:14:41.981917', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a13655b-7447-f90e-1361-bf8dafa46218', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a13406f-18e7-31c1-bcad-de3dc31faa7e', '2024-06-26 06:14:41.000000', '2024-07-10 06:14:41.000000', NULL, NULL, '2024-06-26 08:37:19.272021', NULL, 'redeemed', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', '09c1e7defcc84c6ca24905606cf53589', '2024-06-26 14:14:41.995034', NULL, '2024-06-26 16:37:19.332284', NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1365de-07ef-0188-93bc-05dd163752d6', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a136543-cbbc-dd95-0d13-61aa3f6c54a6', '2024-06-26 08:37:19.000000', '2024-06-26 09:37:19.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', '445a75df5fb7451ca4759e200b77e93d', '2024-06-26 16:37:19.487351', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1365de-07ef-93e2-1f6e-9fc280e4c30f', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a13406f-18e7-31c1-bcad-de3dc31faa7e', '2024-06-26 08:37:19.000000', '2024-06-26 09:37:19.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', '0def46d430384d0cafc3c8c8b9c364b7', '2024-06-26 16:37:19.487351', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1365de-081a-17c0-9643-309235e0f3e6', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a13406f-18e7-31c1-bcad-de3dc31faa7e', '2024-06-26 08:37:19.000000', '2024-07-10 08:37:19.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', 'adf5c8646f4547aa9f76358ebf244ea5', '2024-06-26 16:37:19.517680', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1365de-081b-13a4-942f-599a1f145604', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a136543-cbbc-dd95-0d13-61aa3f6c54a6', '2024-06-26 08:37:19.000000', '2024-07-10 08:37:19.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', 'c37599343ee74481ba57c12414cc9d4c', '2024-06-26 16:37:19.517908', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1369a5-1183-223f-bdb8-f39b9f379f24', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a1369a5-10e0-af2a-b927-33860ac3345f', '2024-06-27 02:13:35.000000', '2024-06-27 03:13:35.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', '0a0d834fc52d4a17a93b11887c58a1ba', '2024-06-27 10:13:35.287909', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1369a5-1208-f35b-655c-db31868ddcf4', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a1369a5-10e0-af2a-b927-33860ac3345f', '2024-06-27 02:13:35.000000', '2024-07-11 02:13:35.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', '3b1c79c7420d4b33a1522a7a0a50d38d', '2024-06-27 10:13:35.371161', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1369b4-cd42-414b-398b-c1e57124b8e1', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a1369b4-cd36-4ab8-beec-7de69277dffd', '2024-06-27 02:30:46.000000', '2024-06-27 03:30:46.000000', NULL, NULL, NULL, NULL, 'valid', '3a118b8b-2643-bc6e-d08a-8c4239ff9117', 'access_token', '{}', '8a967471dcf34575b103c1a42295a5ae', '2024-06-27 10:30:46.340137', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1369b4-cd4d-d356-7f08-eaeaaec3cbf9', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a1369b4-cd36-4ab8-beec-7de69277dffd', '2024-06-27 02:30:46.000000', '2024-07-11 02:30:46.000000', NULL, NULL, NULL, NULL, 'valid', '3a118b8b-2643-bc6e-d08a-8c4239ff9117', 'refresh_token', '{}', 'c0a481e7f96548d8973ef9d29a9e1c6c', '2024-06-27 10:30:46.351769', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1369bf-3171-b80d-bdd9-1a43ceb9f4e6', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a1369bf-3168-29fe-9445-d957e2773923', '2024-06-27 02:42:07.000000', '2024-06-27 03:42:07.000000', NULL, NULL, NULL, NULL, 'valid', '3a118b8b-2643-bc6e-d08a-8c4239ff9117', 'access_token', '{}', '0dee34dcbe264a93bc2471d333d8d99a', '2024-06-27 10:42:07.348501', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1369bf-317b-0408-053d-286aaa683fed', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a1369bf-3168-29fe-9445-d957e2773923', '2024-06-27 02:42:07.000000', '2024-07-11 02:42:07.000000', NULL, NULL, NULL, NULL, 'valid', '3a118b8b-2643-bc6e-d08a-8c4239ff9117', 'refresh_token', '{}', '08f6bee16b8144999ef042f69db8ee22', '2024-06-27 10:42:07.357180', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1369bf-58df-0e6d-c772-71de46961514', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a1369bf-58d9-c5ec-97a8-818fb9310093', '2024-06-27 02:42:17.000000', '2024-06-27 03:42:17.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', '011b6cb7d18e44a6ad50db9435278df9', '2024-06-27 10:42:17.440774', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1369bf-58e4-fe5f-155f-4a718ccd28ad', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a1369bf-58d9-c5ec-97a8-818fb9310093', '2024-06-27 02:42:17.000000', '2024-07-11 02:42:17.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', 'd32a47ff09744c1eb1f9ce25ff37990c', '2024-06-27 10:42:17.444922', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1369c0-b894-1ec4-bdaa-42334a8aeef8', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a1369c0-b88d-1840-a06d-65c2f3c2a7d6', '2024-06-27 02:43:47.000000', '2024-06-27 03:43:47.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', 'e8315f2b7bfc492d8548a2db9ad2fc3c', '2024-06-27 10:43:47.478354', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1369c0-b89c-bcd3-bc90-e97f6b2c6680', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a1369c0-b88d-1840-a06d-65c2f3c2a7d6', '2024-06-27 02:43:47.000000', '2024-07-11 02:43:47.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', '4c661a685c6a4e1784b959dcb01fcd52', '2024-06-27 10:43:47.485715', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1369c9-610e-b312-b2cf-6cfb721df85f', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a1369c9-6103-351e-a243-6220089a706b', '2024-06-27 02:53:14.000000', '2024-06-27 03:53:14.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'access_token', '{}', '06cce1dded58426c835e7468e70c9820', '2024-06-27 10:53:14.895402', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `openiddicttokens` VALUES ('3a1369c9-6115-5b3b-6a2e-6ee074019b97', '3a114eb4-927c-6f34-c323-a5ed9c1da131', '3a1369c9-6103-351e-a243-6220089a706b', '2024-06-27 02:53:14.000000', '2024-07-11 02:53:14.000000', NULL, NULL, NULL, NULL, 'valid', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'refresh_token', '{}', '5740e1a924d041359c505a7fbbee19a4', '2024-06-27 10:53:14.902521', NULL, NULL, NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for workflowauditors
-- ----------------------------
DROP TABLE IF EXISTS `workflowauditors`;
CREATE TABLE `workflowauditors`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `WorkflowId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ExecutionPointerId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Status` int NOT NULL,
  `AuditTime` datetime(6) NULL DEFAULT NULL,
  `Remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `UserIdentityName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `UserHeadPhoto` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_WorkflowAuditors_ExecutionPointerId`(`ExecutionPointerId` ASC) USING BTREE,
  INDEX `IX_WorkflowAuditors_WorkflowId`(`WorkflowId` ASC) USING BTREE,
  CONSTRAINT `FK_WorkflowAuditors_WorkflowExecutionPointers_ExecutionPointerId` FOREIGN KEY (`ExecutionPointerId`) REFERENCES `workflowexecutionpointers` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_WorkflowAuditors_Workflows_WorkflowId` FOREIGN KEY (`WorkflowId`) REFERENCES `workflows` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflowauditors
-- ----------------------------
INSERT INTO `workflowauditors` VALUES ('3a122aaa-70ba-845c-4ca0-b9e20216b939', '3a122aaa-7053-6f4c-5ef2-83cbaaa0dea5', '36541c80-2951-420e-99a0-74b65e9dc214', 0, NULL, NULL, '3a116d37-cd8b-233d-d3e0-677eba44ade3', 'xiaoxiao', NULL, NULL, '2024-04-26 11:40:35.386537', NULL);
INSERT INTO `workflowauditors` VALUES ('3a122aaa-70d3-11de-639b-f26dc1e77a75', '3a122aaa-7053-6f4c-5ef2-83cbaaa0dea5', 'aa0a6569-8825-4350-88d6-5d3919de88a8', 1, '2024-04-26 11:41:23.741511', 'OK', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, '2024-04-26 11:40:35.411185', NULL);
INSERT INTO `workflowauditors` VALUES ('3a122b19-285d-9792-53f9-7a45f94f9667', '3a122b19-2681-7b44-71b8-1d99a0efc6df', 'a3a28c19-f4ad-4c34-b3ce-a86000b74bd6', 1, '2024-04-26 13:41:37.590340', '嗯嗯嗯', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, '2024-04-26 13:41:31.358646', NULL);
INSERT INTO `workflowauditors` VALUES ('3a122b19-419b-87ce-126b-0a68e9338336', '3a122b19-2681-7b44-71b8-1d99a0efc6df', '058c9fb9-cd08-432c-859f-44bb649d81a9', 1, '2024-04-26 13:41:49.712877', '让444', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, '2024-04-26 13:41:37.820188', NULL);
INSERT INTO `workflowauditors` VALUES ('3a122b19-41af-7b78-48ef-665abc9a2aca', '3a122b19-2681-7b44-71b8-1d99a0efc6df', '92ce0aa6-b6c2-4dda-aef3-7a15a90267ce', 0, NULL, NULL, '3a116d37-cd8b-233d-d3e0-677eba44ade3', 'xiaoxiao', NULL, NULL, '2024-04-26 13:41:37.840265', NULL);
INSERT INTO `workflowauditors` VALUES ('3a122b1b-5481-6619-f6db-7adeb232fd4d', '3a122b1b-5442-4028-5f14-fb56cdbe3aae', 'c36fd124-3690-4595-9ae1-383d70cc33ca', 1, '2024-04-26 13:43:59.692834', '44', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, '2024-04-26 13:43:53.730012', NULL);
INSERT INTO `workflowauditors` VALUES ('3a122b1b-7ea5-2aa7-4f30-9f25a03b0a5a', '3a122b1b-5442-4028-5f14-fb56cdbe3aae', '94c327c9-7117-49c7-8171-7db7d02e24ac', 0, NULL, NULL, '3a116d37-cd8b-233d-d3e0-677eba44ade3', 'xiaoxiao', NULL, NULL, '2024-04-26 13:44:04.517305', NULL);
INSERT INTO `workflowauditors` VALUES ('3a122b1b-7ebd-0507-ffc2-0eff82ae2dcb', '3a122b1b-5442-4028-5f14-fb56cdbe3aae', '95ef2e13-b31f-4b64-91a4-27dfa9da3cf2', 1, '2024-04-26 13:44:11.776614', '5555', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, '2024-04-26 13:44:04.541548', NULL);
INSERT INTO `workflowauditors` VALUES ('3a122b1c-f861-38df-1d33-c645b1af2681', '3a122b1c-5f7f-a547-e47b-e42b17f76c5e', '2acc0db9-7409-4e4a-8684-bef1d21207cc', 1, '2024-04-26 13:45:51.531640', '欧拉', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, '2024-04-26 13:45:41.219098', NULL);
INSERT INTO `workflowauditors` VALUES ('3a122b1e-e63b-4641-08d1-ec5be1ff63e9', '3a122b1c-5f7f-a547-e47b-e42b17f76c5e', '08056575-c2ae-48d6-a1d6-2f52d0bbf9ac', 2, '2024-04-26 18:25:53.334992', '', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, '2024-04-26 13:47:47.643967', NULL);
INSERT INTO `workflowauditors` VALUES ('3a122b1e-ed86-e6c6-a808-3554450c9ad0', '3a122b1c-5f7f-a547-e47b-e42b17f76c5e', 'e012edfb-8d93-4951-a532-2b3247044a04', 0, NULL, NULL, '3a116d37-cd8b-233d-d3e0-677eba44ade3', 'xiaoxiao', NULL, NULL, '2024-04-26 13:47:49.510802', NULL);
INSERT INTO `workflowauditors` VALUES ('3a122c10-e6d9-c690-0834-3a963833bf01', '3a122c10-e1db-61dc-bb9b-f6a18cc9ce20', 'af25b762-21f3-406e-84fc-6a97a63c022a', 1, '2024-04-26 18:12:15.603790', '444', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, '2024-04-26 18:12:07.537328', NULL);
INSERT INTO `workflowauditors` VALUES ('3a122c11-0761-1e24-b9c3-2b1ef06999d0', '3a122c10-e1db-61dc-bb9b-f6a18cc9ce20', '03b64008-b8ba-406e-b0fe-068b9d0ff981', 1, '2024-04-26 18:14:40.220799', 'qqqq', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, '2024-04-26 18:12:15.842450', NULL);
INSERT INTO `workflowauditors` VALUES ('3a131dcf-8d17-f0a3-1854-618f8c19eb98', '3a131dcf-8ac5-254b-f1b9-3f01e77db05e', 'f6f723c2-4cc8-4f4a-9730-db328c392223', 1, '2024-06-12 16:49:01.212363', '44334', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, '2024-06-12 16:48:50.968047', NULL);
INSERT INTO `workflowauditors` VALUES ('3a131dcf-b60f-3353-06e2-4ed03cafb8f2', '3a131dcf-8ac5-254b-f1b9-3f01e77db05e', '6dec8b3d-cdc6-462a-8a61-0c9f838aa497', 0, NULL, NULL, '3a116d37-cd8b-233d-d3e0-677eba44ade3', 'xiaoxiao', NULL, NULL, '2024-06-12 16:49:01.456372', NULL);
INSERT INTO `workflowauditors` VALUES ('3a131dd1-7d79-6ee3-41ed-95d257f691e0', '3a131dd1-648a-61f1-e080-1f4cc672d146', '00d3e6c0-bb5e-42ad-bc7f-a22d2f4e86b6', 1, '2024-06-12 16:51:11.777347', '434343', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, '2024-06-12 16:50:58.041864', NULL);
INSERT INTO `workflowauditors` VALUES ('3a131dd1-cbcc-119e-bcf1-7a2f6a6c466d', '3a131dd1-648a-61f1-e080-1f4cc672d146', '08677673-c4f7-41bf-bd86-2bae27b2b4a7', 1, '2024-06-12 16:51:21.967257', '34343', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, '2024-06-12 16:51:18.093048', NULL);

-- ----------------------------
-- Table structure for workflowdefinitions
-- ----------------------------
DROP TABLE IF EXISTS `workflowdefinitions`;
CREATE TABLE `workflowdefinitions`  (
  `Id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Version` int NOT NULL DEFAULT 1,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `Title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Group` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Inputs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Nodes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `DeletionTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`, `Version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflowdefinitions
-- ----------------------------
INSERT INTO `workflowdefinitions` VALUES ('3a122aaa-23cb-541f-ac8e-2cb49de5f5b7', 1, NULL, '请求申请', '备注', 'Avatar', 'rgba(108, 84, 75, 0.68)', '请假', '[[[{\"id\":\"1714102562468y68xliq9a6\",\"name\":\"Day\",\"label\":\"\\u8BF7\\u5047\\u5929\\u6570\",\"type\":\"text\",\"value\":\"\",\"styles\":[],\"maxLength\":1,\"minLength\":8,\"items\":[],\"rules\":[\"required\",\"number\"]}],[{\"id\":\"17141025872861d09sfcus9w\",\"name\":\"Content\",\"label\":\"\\u8BF7\\u5047\\u7406\\u7531\",\"type\":\"textarea\",\"value\":\"\",\"styles\":[],\"maxLength\":null,\"minLength\":null,\"items\":[],\"rules\":[\"required\"]}]]]', '[{\"key\":\"start_1714102610363n4jwj9dc7xp\",\"title\":\"\\u5F00\\u59CB\\u8BF7\\u5047\",\"position\":[235,0],\"type\":\"success\",\"stepBody\":{\"name\":null,\"inputs\":{}},\"parentNodes\":[],\"nextNodes\":[{\"label\":\"\",\"nodeId\":\"step_17141026121154giwrg4wpvm\",\"conditions\":[]}]},{\"key\":\"step_17141026121154giwrg4wpvm\",\"title\":\"\\u7EC4\\u957F\\u5BA1\\u6838\",\"position\":[223,92],\"type\":\"primary\",\"stepBody\":{\"name\":\"FixedUserAudit\",\"inputs\":{\"UserId\":{\"name\":\"UserId\",\"value\":\"3a114eb4-8d58-ab1d-4971-f5ab5f615d45\"}}},\"parentNodes\":[\"start_1714102610363n4jwj9dc7xp\"],\"nextNodes\":[{\"label\":\"\\u5C0F\\u4E8E\\u4E09\\u5929\",\"nodeId\":\"step_171410262752222fmm0a18xwi\",\"conditions\":[{\"field\":\"Day\",\"operator\":\"\\u003C\",\"value\":\"3\"}]},{\"label\":\"\\u5927\\u4E8E\\u7B49\\u4E8E3\\u5929\",\"nodeId\":\"step_1714102629883udnl6jyro8h\",\"conditions\":[{\"field\":\"Day\",\"operator\":\"\\u003E=\",\"value\":\"3\"}]}]},{\"key\":\"end_1714102613283jo0sn0ljkn\",\"title\":\"\\u6D41\\u7A0B\\u7ED3\\u675F\",\"position\":[242,502],\"type\":\"danger\",\"stepBody\":{\"name\":null,\"inputs\":{}},\"parentNodes\":[\"step_17141026121154giwrg4wpvm\",\"step_171410262752222fmm0a18xwi\",\"step_1714102629883udnl6jyro8h\"],\"nextNodes\":[]},{\"key\":\"step_171410262752222fmm0a18xwi\",\"title\":\"\\u7ECF\\u7406\\u5BA1\\u6838\",\"position\":[14,203],\"type\":\"primary\",\"stepBody\":{\"name\":\"FixedUserAudit\",\"inputs\":{\"UserId\":{\"name\":\"UserId\",\"value\":\"3a114eb4-8d58-ab1d-4971-f5ab5f615d45\"}}},\"parentNodes\":[\"step_17141026121154giwrg4wpvm\"],\"nextNodes\":[{\"label\":\"\",\"nodeId\":\"end_1714102613283jo0sn0ljkn\",\"conditions\":[]}]},{\"key\":\"step_1714102629883udnl6jyro8h\",\"title\":\"\\u603B\\u76D1\\u5BA1\\u6838\",\"position\":[426,204],\"type\":\"primary\",\"stepBody\":{\"name\":\"FixedUserAudit\",\"inputs\":{\"UserId\":{\"name\":\"UserId\",\"value\":\"3a116d37-cd8b-233d-d3e0-677eba44ade3\"}}},\"parentNodes\":[\"step_17141026121154giwrg4wpvm\"],\"nextNodes\":[{\"label\":\"\",\"nodeId\":\"end_1714102613283jo0sn0ljkn\",\"conditions\":[]}]}]', '0001-01-01 00:00:00.000000', NULL, '2024-04-26 18:11:45.340903', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `workflowdefinitions` VALUES ('3a122b3a-5d8c-19c6-2264-e1b0cb731785', 1, NULL, '123', '', 'Promotion', 'rgba(255, 69, 0, 0.68)', '请假', '[[[{\"id\":\"17141121932957xvu8yng1n6\",\"name\":\"D\",\"label\":\"\\u5355\\u884C\\u6587\\u672C\",\"type\":\"text\",\"value\":\"\",\"styles\":[],\"maxLength\":1,\"minLength\":36,\"items\":[],\"rules\":[\"required\",\"number\"]}]]]', '[{\"key\":\"start_1714112210861c6hhncpary8\",\"title\":\"\\u6D41\\u7A0B\\u5F00\\u59CB\",\"position\":[152,0],\"type\":\"success\",\"stepBody\":{\"name\":null,\"inputs\":{}},\"parentNodes\":[],\"nextNodes\":[{\"label\":\"3\",\"nodeId\":\"step_17141122136367r2ij8o22qu\"}]},{\"key\":\"step_17141122136367r2ij8o22qu\",\"title\":\"\\u4EFB\\u52A1\\u8282\\u70B9\",\"position\":[116,147],\"type\":\"primary\",\"stepBody\":{\"name\":null,\"inputs\":{}},\"parentNodes\":[\"start_1714112210861c6hhncpary8\"],\"nextNodes\":[{\"label\":\"\",\"nodeId\":\"end_1714112216132pssxmk45o0h\"}]},{\"key\":\"end_1714112216132pssxmk45o0h\",\"title\":\"\\u6D41\\u7A0B\\u7ED3\\u675F\",\"position\":[105,245],\"type\":\"danger\",\"stepBody\":{\"name\":null,\"inputs\":{}},\"parentNodes\":[\"step_17141122136367r2ij8o22qu\"],\"nextNodes\":[]}]', '0001-01-01 00:00:00.000000', NULL, '2024-04-26 18:11:20.000091', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 1, '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-26 18:11:19.999832');
INSERT INTO `workflowdefinitions` VALUES ('3a122bad-96d4-ed16-e82b-9b7bfcb663ab', 1, NULL, '222', '', 'Plus', 'rgba(255, 69, 0, 0.68)', '请假', '[[[{\"id\":\"1714119798260zze2mi47p4c\",\"name\":\"W\",\"label\":\"\\u5355\\u884C\\u6587\\u672C\",\"type\":\"text\",\"value\":\"\",\"styles\":[],\"maxLength\":null,\"minLength\":null,\"items\":[],\"rules\":[]}]]]', '[{\"key\":\"start_17141198044743q1vb7atgzy\",\"title\":\"\\u6D41\\u7A0B\\u5F00\\u59CB111\",\"position\":[11,11],\"type\":\"success\",\"stepBody\":{\"name\":null,\"inputs\":{}},\"parentNodes\":[],\"nextNodes\":[{\"label\":\"WWqqwwqwqqw\",\"nodeId\":\"end_1714119805505btr9tinf0qo\",\"conditions\":[{\"field\":\"W\",\"operator\":\"\\u003E=\",\"value\":\"6\"}]}]},{\"key\":\"end_1714119805505btr9tinf0qo\",\"title\":\"\\u6D41\\u7A0B\\u7ED3\\u675F2222\",\"position\":[192,118],\"type\":\"danger\",\"stepBody\":{\"name\":null,\"inputs\":{}},\"parentNodes\":[\"start_17141198044743q1vb7atgzy\"],\"nextNodes\":[]}]', '0001-01-01 00:00:00.000000', NULL, '2024-04-26 18:11:17.421597', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 1, '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-26 18:11:17.420135');

-- ----------------------------
-- Table structure for workflowevents
-- ----------------------------
DROP TABLE IF EXISTS `workflowevents`;
CREATE TABLE `workflowevents`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `EventName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `EventKey` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `EventData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `EventTime` datetime(6) NOT NULL,
  `IsProcessed` tinyint(1) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflowevents
-- ----------------------------
INSERT INTO `workflowevents` VALUES ('3a1227fd-4ca7-8b46-caf3-83e8435de57e', NULL, 'AuditEvent', '48d582cb-3a37-4478-b909-52eead0572f5', 'null', '2024-04-25 15:12:13.988098', 1, '2024-04-25 23:12:14.011766', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45');
INSERT INTO `workflowevents` VALUES ('3a1227fd-524d-e632-e369-9418d4a39798', NULL, 'AuditEvent', '48d582cb-3a37-4478-b909-52eead0572f5', 'null', '2024-04-25 15:12:15.437012', 1, '2024-04-25 23:12:15.438082', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45');
INSERT INTO `workflowevents` VALUES ('3a1227fd-56c7-e07e-da4a-b30ae3978911', NULL, 'AuditEvent', '48d582cb-3a37-4478-b909-52eead0572f5', 'null', '2024-04-25 15:12:16.583837', 1, '2024-04-25 23:12:16.584576', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45');
INSERT INTO `workflowevents` VALUES ('3a1227fd-5929-c69a-c836-82bb1ab091f5', NULL, 'AuditEvent', '48d582cb-3a37-4478-b909-52eead0572f5', 'null', '2024-04-25 15:12:17.193134', 1, '2024-04-25 23:12:17.193588', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45');
INSERT INTO `workflowevents` VALUES ('3a1227fd-594c-307d-bcc6-a89443f81dc2', NULL, 'AuditEvent', '48d582cb-3a37-4478-b909-52eead0572f5', 'null', '2024-04-25 15:12:17.227155', 1, '2024-04-25 23:12:17.244797', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45');
INSERT INTO `workflowevents` VALUES ('3a1227fd-59a3-46c4-c44e-0b483a89eae0', NULL, 'AuditEvent', '48d582cb-3a37-4478-b909-52eead0572f5', 'null', '2024-04-25 15:12:17.314709', 1, '2024-04-25 23:12:17.315444', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45');
INSERT INTO `workflowevents` VALUES ('3a1227fd-6420-56c0-5f4a-f8e3cfd8aa94', NULL, 'AuditEvent', '48d582cb-3a37-4478-b909-52eead0572f5', 'null', '2024-04-25 15:12:20.000269', 1, '2024-04-25 23:12:20.001215', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45');
INSERT INTO `workflowevents` VALUES ('3a1227fe-6bbb-71d1-eb34-9463e7bb4d62', NULL, 'AuditEvent', 'b0264013-1ec8-4491-af30-7f58757c31e1', 'null', '2024-04-25 15:13:27.483479', 1, '2024-04-25 23:13:27.484768', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45');
INSERT INTO `workflowevents` VALUES ('3a122803-ac51-7a56-efd2-8bfc1d9ca7e7', NULL, 'AuditEvent', 'eeea9c78-efd2-4e76-9e1a-d87e2452559b', 'null', '2024-04-25 15:19:11.697367', 1, '2024-04-25 23:19:11.697702', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45');
INSERT INTO `workflowevents` VALUES ('3a122a8f-b1c2-61d8-5f57-a27fabd68e0b', NULL, 'AuditEvent', 'dd19f9d0-4469-4d7a-8ba1-c84f66d1fbc2', 'null', '2024-04-26 03:11:22.561098', 1, '2024-04-26 11:11:22.577355', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45');
INSERT INTO `workflowevents` VALUES ('3a122a95-547f-579a-217d-b41fa49ab183', NULL, 'AuditEvent', 'a9bd68f1-6c09-4b09-bcce-5b0ddb9c6614', 'null', '2024-04-26 03:17:31.903698', 1, '2024-04-26 11:17:31.904546', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45');
INSERT INTO `workflowevents` VALUES ('3a122aab-2da3-14e2-39d6-51d756b3df3f', NULL, 'AuditEvent', '11bbd755-5fa9-49f9-989c-0fb07d4031e0', 'null', '2024-04-26 03:41:23.747731', 1, '2024-04-26 11:41:23.748283', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45');
INSERT INTO `workflowevents` VALUES ('3a122b19-40cb-204f-a619-73c528c73f17', NULL, 'AuditEvent', '34f38249-6ad6-4f5c-ba1d-436ba25ec6b5', 'null', '2024-04-26 05:41:37.610563', 1, '2024-04-26 13:41:37.623896', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45');
INSERT INTO `workflowevents` VALUES ('3a122b19-7019-b1c9-fe26-c9155edc9339', NULL, 'AuditEvent', 'e755a94a-a82c-4d75-ac43-8a12fc84337d', 'null', '2024-04-26 05:41:49.721338', 1, '2024-04-26 13:41:49.722188', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45');
INSERT INTO `workflowevents` VALUES ('3a122b1b-6bd4-45d2-5b6b-45c749283715', NULL, 'AuditEvent', '922f11c7-9894-4d5f-85b0-01ac87fb5b10', 'null', '2024-04-26 05:43:59.700148', 1, '2024-04-26 13:43:59.700777', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45');
INSERT INTO `workflowevents` VALUES ('3a122b1b-9b06-8850-7ebf-fd249d5e17f4', NULL, 'AuditEvent', '4f0919eb-32e1-45b7-be46-eb560db573a2', 'null', '2024-04-26 05:44:11.782767', 1, '2024-04-26 13:44:11.783057', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45');
INSERT INTO `workflowevents` VALUES ('3a122b1d-20b3-9161-4b16-6367f42e8673', NULL, 'AuditEvent', '2ec40261-13e8-4e51-96a4-584bf006e3c5', 'null', '2024-04-26 05:45:51.539809', 1, '2024-04-26 13:45:51.540119', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45');
INSERT INTO `workflowevents` VALUES ('3a122c11-068f-27fa-a90b-83e4366ac9a2', NULL, 'AuditEvent', 'f4949daf-bb0a-474b-9bd2-d87f8cdf846a', 'null', '2024-04-26 10:12:15.629165', 1, '2024-04-26 18:12:15.647996', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45');
INSERT INTO `workflowevents` VALUES ('3a122c13-3b66-b66a-62b6-5595dc975a1a', NULL, 'AuditEvent', '1093be9a-33c4-4574-9043-10c1068c45d4', 'null', '2024-04-26 10:14:40.230610', 1, '2024-04-26 18:14:40.231296', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45');
INSERT INTO `workflowevents` VALUES ('3a131dcf-b53a-3163-334b-457dd7d33d62', NULL, 'AuditEvent', '8c91e9d1-f8f3-4f7d-ab2c-eb03665f63a2', 'null', '2024-06-12 08:49:01.240660', 1, '2024-06-12 16:49:01.254116', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45');
INSERT INTO `workflowevents` VALUES ('3a131dd1-b328-25c1-3654-512b6a76810d', NULL, 'AuditEvent', '97b68e83-b6a5-4898-8beb-da24fd7bfa4d', 'null', '2024-06-12 08:51:11.784708', 1, '2024-06-12 16:51:11.785550', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45');
INSERT INTO `workflowevents` VALUES ('3a131dd1-daf9-48c8-693b-44234f5f38d7', NULL, 'AuditEvent', '936eb1bf-7e62-4129-990e-868a82e3497a', 'null', '2024-06-12 08:51:21.977614', 1, '2024-06-12 16:51:21.978329', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45');

-- ----------------------------
-- Table structure for workflowexecutionerrors
-- ----------------------------
DROP TABLE IF EXISTS `workflowexecutionerrors`;
CREATE TABLE `workflowexecutionerrors`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `WorkflowId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ExecutionPointerId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ErrorTime` datetime(6) NOT NULL,
  `Message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflowexecutionerrors
-- ----------------------------

-- ----------------------------
-- Table structure for workflowexecutionpointers
-- ----------------------------
DROP TABLE IF EXISTS `workflowexecutionpointers`;
CREATE TABLE `workflowexecutionpointers`  (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `WorkflowId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `StepId` int NOT NULL,
  `StepName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Active` tinyint(1) NOT NULL,
  `SleepUntil` datetime(6) NULL DEFAULT NULL,
  `PersistenceData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `StartTime` datetime(6) NULL DEFAULT NULL,
  `EndTime` datetime(6) NULL DEFAULT NULL,
  `EventName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `EventKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `EventPublished` tinyint(1) NOT NULL,
  `EventData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `RetryCount` int NOT NULL,
  `Children` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ContextItem` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `PredecessorId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Outcome` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Status` int NOT NULL,
  `Scope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_WorkflowExecutionPointers_WorkflowId`(`WorkflowId` ASC) USING BTREE,
  CONSTRAINT `FK_WorkflowExecutionPointers_Workflows_WorkflowId` FOREIGN KEY (`WorkflowId`) REFERENCES `workflows` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflowexecutionpointers
-- ----------------------------
INSERT INTO `workflowexecutionpointers` VALUES ('00d3e6c0-bb5e-42ad-bc7f-a22d2f4e86b6', '3a131dd1-648a-61f1-e080-1f4cc672d146', 1, 'step_17141026121154giwrg4wpvm', 0, NULL, 'null', '2024-06-12 08:50:58.027992', '2024-06-12 08:51:18.063150', 'AuditEvent', '97b68e83-b6a5-4898-8beb-da24fd7bfa4d', 1, 'null', 0, '', 'null', '41a0d06d-99e6-4c92-aaa0-96827f289c45', 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('03b64008-b8ba-406e-b0fe-068b9d0ff981', '3a122c10-e1db-61dc-bb9b-f6a18cc9ce20', 2, 'step_171410262752222fmm0a18xwi', 0, NULL, 'null', '2024-04-26 10:12:15.786560', '2024-04-26 10:14:42.833654', 'AuditEvent', '1093be9a-33c4-4574-9043-10c1068c45d4', 1, 'null', 0, '', 'null', 'af25b762-21f3-406e-84fc-6a97a63c022a', 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('058c9fb9-cd08-432c-859f-44bb649d81a9', '3a122b19-2681-7b44-71b8-1d99a0efc6df', 2, 'step_171410262752222fmm0a18xwi', 0, NULL, 'null', '2024-04-26 05:41:37.762388', '2024-04-26 05:41:54.473119', 'AuditEvent', 'e755a94a-a82c-4d75-ac43-8a12fc84337d', 1, 'null', 0, '', 'null', 'a3a28c19-f4ad-4c34-b3ce-a86000b74bd6', 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('077613ed-04c5-416c-9210-e56992f6966a', '3a122b19-2681-7b44-71b8-1d99a0efc6df', 3, 'end_1714102613283jo0sn0ljkn', 0, NULL, 'null', '2024-04-26 05:41:54.502881', '2024-04-26 05:41:54.503030', NULL, NULL, 0, 'null', 0, '', 'null', '058c9fb9-cd08-432c-859f-44bb649d81a9', 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('08056575-c2ae-48d6-a1d6-2f52d0bbf9ac', '3a122b1c-5f7f-a547-e47b-e42b17f76c5e', 2, 'step_171410262752222fmm0a18xwi', 0, NULL, 'null', '2024-04-26 05:47:45.445610', NULL, 'AuditEvent', 'cce5472f-ab93-46a2-8059-1288e605c24f', 0, 'null', 0, '', 'null', '2acc0db9-7409-4e4a-8684-bef1d21207cc', 'null', 5, '');
INSERT INTO `workflowexecutionpointers` VALUES ('08677673-c4f7-41bf-bd86-2bae27b2b4a7', '3a131dd1-648a-61f1-e080-1f4cc672d146', 2, 'step_171410262752222fmm0a18xwi', 0, NULL, 'null', '2024-06-12 08:51:18.078924', '2024-06-12 08:51:28.070439', 'AuditEvent', '936eb1bf-7e62-4129-990e-868a82e3497a', 1, 'null', 0, '', 'null', '00d3e6c0-bb5e-42ad-bc7f-a22d2f4e86b6', 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('18fab010-1f33-4719-90fc-9a824902a3e2', '3a122b19-2681-7b44-71b8-1d99a0efc6df', 0, 'start_1714102610363n4jwj9dc7xp', 0, NULL, 'null', '2024-04-26 05:41:31.004652', '2024-04-26 05:41:31.008546', NULL, NULL, 0, 'null', 0, '', 'null', NULL, 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('19274dfc-4c88-4acc-985c-c10624c6cf26', '3a122b1b-5442-4028-5f14-fb56cdbe3aae', 0, 'start_1714102610363n4jwj9dc7xp', 0, NULL, 'null', '2024-04-26 05:43:53.697803', '2024-04-26 05:43:53.697862', NULL, NULL, 0, 'null', 0, '', 'null', NULL, 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('2acc0db9-7409-4e4a-8684-bef1d21207cc', '3a122b1c-5f7f-a547-e47b-e42b17f76c5e', 1, 'step_17141026121154giwrg4wpvm', 0, NULL, 'null', '2024-04-26 05:45:04.414041', '2024-04-26 05:47:45.361404', 'AuditEvent', '2ec40261-13e8-4e51-96a4-584bf006e3c5', 1, 'null', 0, '', 'null', '7d8bbc66-5a89-4419-bca9-c57775cf3c4e', 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('36541c80-2951-420e-99a0-74b65e9dc214', '3a122aaa-7053-6f4c-5ef2-83cbaaa0dea5', 4, 'step_1714102629883udnl6jyro8h', 0, NULL, 'null', '2024-04-26 03:40:35.365412', NULL, 'AuditEvent', '7a150c94-89b6-4392-b98b-7e4edea309d4', 0, 'null', 0, '', 'null', '8912b72b-b8ae-4c68-ad0a-484f587994bb', 'null', 5, '');
INSERT INTO `workflowexecutionpointers` VALUES ('3b74a378-1ebe-497f-bcb6-6bcfdd4af552', '3a122aaa-7053-6f4c-5ef2-83cbaaa0dea5', 3, 'end_1714102613283jo0sn0ljkn', 0, NULL, 'null', '2024-04-26 03:41:31.019108', '2024-04-26 03:41:31.019162', NULL, NULL, 0, 'null', 0, '', 'null', 'aa0a6569-8825-4350-88d6-5d3919de88a8', 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('41a0d06d-99e6-4c92-aaa0-96827f289c45', '3a131dd1-648a-61f1-e080-1f4cc672d146', 0, 'start_1714102610363n4jwj9dc7xp', 0, NULL, 'null', '2024-06-12 08:50:58.007064', '2024-06-12 08:50:58.007249', NULL, NULL, 0, 'null', 0, '', 'null', NULL, 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('48f1342b-da56-4dc2-b976-d1ec2cca58c8', '3a122aaa-7053-6f4c-5ef2-83cbaaa0dea5', 0, 'start_1714102610363n4jwj9dc7xp', 0, NULL, 'null', '2024-04-26 03:40:35.331212', '2024-04-26 03:40:35.331279', NULL, NULL, 0, 'null', 0, '', 'null', NULL, 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('49a429d9-c7ec-493f-b238-debde5e77b19', '3a122b1b-5442-4028-5f14-fb56cdbe3aae', 4, 'end_1714110199697vukhk8o0m0g', 0, NULL, 'null', '2024-04-26 05:44:14.468375', '2024-04-26 05:44:14.468427', NULL, NULL, 0, 'null', 0, '', 'null', '95ef2e13-b31f-4b64-91a4-27dfa9da3cf2', 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('5a549117-cb63-4a10-ba21-e5dd5a0bbaf8', '3a122c10-e1db-61dc-bb9b-f6a18cc9ce20', 0, 'start_1714102610363n4jwj9dc7xp', 0, NULL, 'null', '2024-04-26 10:12:06.438077', '2024-04-26 10:12:06.440522', NULL, NULL, 0, 'null', 0, '', 'null', NULL, 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('61cd87ac-c338-4959-8385-0416aeb222ad', '3a122b1b-5442-4028-5f14-fb56cdbe3aae', 3, 'end_1714102613283jo0sn0ljkn', 0, NULL, 'null', '2024-04-26 05:44:14.468432', '2024-04-26 05:44:14.468440', NULL, NULL, 0, 'null', 0, '', 'null', '95ef2e13-b31f-4b64-91a4-27dfa9da3cf2', 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('6dec8b3d-cdc6-462a-8a61-0c9f838aa497', '3a131dcf-8ac5-254b-f1b9-3f01e77db05e', 4, 'step_1714102629883udnl6jyro8h', 0, NULL, 'null', '2024-06-12 08:49:01.395548', NULL, 'AuditEvent', 'd55293a7-18f1-4a12-baf1-3ac4976d24e2', 0, 'null', 0, '', 'null', 'f6f723c2-4cc8-4f4a-9730-db328c392223', 'null', 5, '');
INSERT INTO `workflowexecutionpointers` VALUES ('7d8bbc66-5a89-4419-bca9-c57775cf3c4e', '3a122b1c-5f7f-a547-e47b-e42b17f76c5e', 0, 'start_1714102610363n4jwj9dc7xp', 0, NULL, 'null', '2024-04-26 05:45:04.391786', '2024-04-26 05:45:04.391845', NULL, NULL, 0, 'null', 0, '', 'null', NULL, 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('8912b72b-b8ae-4c68-ad0a-484f587994bb', '3a122aaa-7053-6f4c-5ef2-83cbaaa0dea5', 1, 'step_17141026121154giwrg4wpvm', 0, NULL, 'null', '2024-04-26 03:40:35.347631', '2024-04-26 03:40:35.347675', NULL, NULL, 0, 'null', 0, '', 'null', '48f1342b-da56-4dc2-b976-d1ec2cca58c8', 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('92ce0aa6-b6c2-4dda-aef3-7a15a90267ce', '3a122b19-2681-7b44-71b8-1d99a0efc6df', 4, 'step_1714102629883udnl6jyro8h', 0, NULL, 'null', '2024-04-26 05:41:37.826317', NULL, 'AuditEvent', 'c46e3f61-0e5e-40e4-a24c-e2b415c63cd6', 0, 'null', 0, '', 'null', 'a3a28c19-f4ad-4c34-b3ce-a86000b74bd6', 'null', 5, '');
INSERT INTO `workflowexecutionpointers` VALUES ('94c327c9-7117-49c7-8171-7db7d02e24ac', '3a122b1b-5442-4028-5f14-fb56cdbe3aae', 5, 'step_1714102629883udnl6jyro8h', 0, NULL, 'null', '2024-04-26 05:44:04.463541', NULL, 'AuditEvent', '3d4ae8da-9629-4a58-a2df-55c6fde1b126', 0, 'null', 0, '', 'null', 'c36fd124-3690-4595-9ae1-383d70cc33ca', 'null', 5, '');
INSERT INTO `workflowexecutionpointers` VALUES ('95ef2e13-b31f-4b64-91a4-27dfa9da3cf2', '3a122b1b-5442-4028-5f14-fb56cdbe3aae', 2, 'step_171410262752222fmm0a18xwi', 0, NULL, 'null', '2024-04-26 05:44:04.527929', '2024-04-26 05:44:14.451369', 'AuditEvent', '4f0919eb-32e1-45b7-be46-eb560db573a2', 1, 'null', 0, '', 'null', 'c36fd124-3690-4595-9ae1-383d70cc33ca', 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('9dc4d77f-9c27-47c6-8b3d-d26dec594566', '3a131dd1-648a-61f1-e080-1f4cc672d146', 3, 'end_1714102613283jo0sn0ljkn', 0, NULL, 'null', '2024-06-12 08:51:28.086676', '2024-06-12 08:51:28.086728', NULL, NULL, 0, 'null', 0, '', 'null', '08677673-c4f7-41bf-bd86-2bae27b2b4a7', 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('9ff798b6-7a01-4bbe-85a8-4a61f786ff5a', '3a131dcf-8ac5-254b-f1b9-3f01e77db05e', 0, 'start_1714102610363n4jwj9dc7xp', 0, NULL, 'null', '2024-06-12 08:48:50.576919', '2024-06-12 08:48:50.580016', NULL, NULL, 0, 'null', 0, '', 'null', NULL, 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('a3a28c19-f4ad-4c34-b3ce-a86000b74bd6', '3a122b19-2681-7b44-71b8-1d99a0efc6df', 1, 'step_17141026121154giwrg4wpvm', 0, NULL, 'null', '2024-04-26 05:41:31.059484', '2024-04-26 05:41:37.745739', 'AuditEvent', '34f38249-6ad6-4f5c-ba1d-436ba25ec6b5', 1, 'null', 0, '', 'null', '18fab010-1f33-4719-90fc-9a824902a3e2', 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('aa0a6569-8825-4350-88d6-5d3919de88a8', '3a122aaa-7053-6f4c-5ef2-83cbaaa0dea5', 2, 'step_171410262752222fmm0a18xwi', 0, NULL, 'null', '2024-04-26 03:40:35.392221', '2024-04-26 03:41:31.002014', 'AuditEvent', '11bbd755-5fa9-49f9-989c-0fb07d4031e0', 1, 'null', 0, '', 'null', '8912b72b-b8ae-4c68-ad0a-484f587994bb', 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('af25b762-21f3-406e-84fc-6a97a63c022a', '3a122c10-e1db-61dc-bb9b-f6a18cc9ce20', 1, 'step_17141026121154giwrg4wpvm', 0, NULL, 'null', '2024-04-26 10:12:06.481895', '2024-04-26 10:12:15.769253', 'AuditEvent', 'f4949daf-bb0a-474b-9bd2-d87f8cdf846a', 1, 'null', 0, '', 'null', '5a549117-cb63-4a10-ba21-e5dd5a0bbaf8', 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('c36fd124-3690-4595-9ae1-383d70cc33ca', '3a122b1b-5442-4028-5f14-fb56cdbe3aae', 1, 'step_17141026121154giwrg4wpvm', 0, NULL, 'null', '2024-04-26 05:43:53.716704', '2024-04-26 05:44:04.440812', 'AuditEvent', '922f11c7-9894-4d5f-85b0-01ac87fb5b10', 1, 'null', 0, '', 'null', '19274dfc-4c88-4acc-985c-c10624c6cf26', 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('e012edfb-8d93-4951-a532-2b3247044a04', '3a122b1c-5f7f-a547-e47b-e42b17f76c5e', 5, 'step_1714102629883udnl6jyro8h', 0, NULL, 'null', '2024-04-26 05:47:47.652035', NULL, 'AuditEvent', '21ed2c58-4451-4096-92f2-46faec309cb1', 0, 'null', 0, '', 'null', '2acc0db9-7409-4e4a-8684-bef1d21207cc', 'null', 5, '');
INSERT INTO `workflowexecutionpointers` VALUES ('e92cccba-0f30-4c71-91b9-eb6118cd93ec', '3a122c10-e1db-61dc-bb9b-f6a18cc9ce20', 3, 'end_1714102613283jo0sn0ljkn', 0, NULL, 'null', '2024-04-26 10:14:42.849519', '2024-04-26 10:14:42.849683', NULL, NULL, 0, 'null', 0, '', 'null', '03b64008-b8ba-406e-b0fe-068b9d0ff981', 'null', 3, '');
INSERT INTO `workflowexecutionpointers` VALUES ('f6f723c2-4cc8-4f4a-9730-db328c392223', '3a131dcf-8ac5-254b-f1b9-3f01e77db05e', 1, 'step_17141026121154giwrg4wpvm', 0, NULL, 'null', '2024-06-12 08:48:50.632549', '2024-06-12 08:49:01.375922', 'AuditEvent', '8c91e9d1-f8f3-4f7d-ab2c-eb03665f63a2', 1, 'null', 0, '', 'null', '9ff798b6-7a01-4bbe-85a8-4a61f786ff5a', 'null', 3, '');

-- ----------------------------
-- Table structure for workflowextensionattributes
-- ----------------------------
DROP TABLE IF EXISTS `workflowextensionattributes`;
CREATE TABLE `workflowextensionattributes`  (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `ExecutionPointerId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `AttributeKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `AttributeValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_WorkflowExtensionAttributes_ExecutionPointerId`(`ExecutionPointerId` ASC) USING BTREE,
  CONSTRAINT `FK_WorkflowExtensionAttributes_WorkflowExecutionPointers_Execut~` FOREIGN KEY (`ExecutionPointerId`) REFERENCES `workflowexecutionpointers` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflowextensionattributes
-- ----------------------------

-- ----------------------------
-- Table structure for workflows
-- ----------------------------
DROP TABLE IF EXISTS `workflows`;
CREATE TABLE `workflows`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `WorkflowDefinitionId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Version` int NOT NULL,
  `Description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Reference` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NextExecution` bigint NULL DEFAULT NULL,
  `Data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreateTime` datetime(6) NOT NULL,
  `CompleteTime` datetime(6) NULL DEFAULT NULL,
  `Status` int NOT NULL,
  `CreateUserIdentityName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `DeletionTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_Workflows_WorkflowDefinitionId_Version`(`WorkflowDefinitionId` ASC, `Version` ASC) USING BTREE,
  CONSTRAINT `FK_Workflows_WorkflowDefinitions_WorkflowDefinitionId_Version` FOREIGN KEY (`WorkflowDefinitionId`, `Version`) REFERENCES `workflowdefinitions` (`Id`, `Version`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflows
-- ----------------------------
INSERT INTO `workflows` VALUES ('3a122aaa-7053-6f4c-5ef2-83cbaaa0dea5', '3a122aaa-23cb-541f-ac8e-2cb49de5f5b7', 1, '请求申请', '', NULL, '{\"$type\":\"System.Collections.Generic.Dictionary`2[[System.String, System.Private.CoreLib],[System.Object, System.Private.CoreLib]], System.Private.CoreLib\",\"Day\":\"2\",\"Content\":\"结婚\"}', '2024-04-26 03:40:35.283148', NULL, 0, 'admin', NULL, '2024-04-26 11:40:35.303861', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-26 11:41:31.024585', NULL, 0, NULL, NULL);
INSERT INTO `workflows` VALUES ('3a122b19-2681-7b44-71b8-1d99a0efc6df', '3a122aaa-23cb-541f-ac8e-2cb49de5f5b7', 1, '请求申请', '', NULL, '{\"$type\":\"System.Collections.Generic.Dictionary`2[[System.String, System.Private.CoreLib],[System.Object, System.Private.CoreLib]], System.Private.CoreLib\",\"Day\":\"1\",\"Content\":\"得分得分放电饭锅\"}', '2024-04-26 05:41:30.878962', NULL, 0, 'admin', NULL, '2024-04-26 13:41:30.917174', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-26 13:41:54.509163', NULL, 0, NULL, NULL);
INSERT INTO `workflows` VALUES ('3a122b1b-5442-4028-5f14-fb56cdbe3aae', '3a122aaa-23cb-541f-ac8e-2cb49de5f5b7', 1, '请求申请', '', NULL, '{\"$type\":\"System.Collections.Generic.Dictionary`2[[System.String, System.Private.CoreLib],[System.Object, System.Private.CoreLib]], System.Private.CoreLib\",\"Day\":\"2\",\"Content\":\"人任他任他\"}', '2024-04-26 05:43:53.666006', NULL, 0, 'admin', NULL, '2024-04-26 13:43:53.676183', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-26 13:44:14.473969', NULL, 0, NULL, NULL);
INSERT INTO `workflows` VALUES ('3a122b1c-5f7f-a547-e47b-e42b17f76c5e', '3a122aaa-23cb-541f-ac8e-2cb49de5f5b7', 1, '请求申请', '', NULL, '{\"$type\":\"System.Collections.Generic.Dictionary`2[[System.String, System.Private.CoreLib],[System.Object, System.Private.CoreLib]], System.Private.CoreLib\",\"Day\":\"1\",\"Content\":\"嗯嗯\"}', '2024-04-26 05:45:02.079302', NULL, 3, 'admin', NULL, '2024-04-26 13:45:02.086484', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-26 18:25:53.472899', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `workflows` VALUES ('3a122c10-e1db-61dc-bb9b-f6a18cc9ce20', '3a122aaa-23cb-541f-ac8e-2cb49de5f5b7', 1, '请求申请', '', NULL, '{\"$type\":\"System.Collections.Generic.Dictionary`2[[System.String, System.Private.CoreLib],[System.Object, System.Private.CoreLib]], System.Private.CoreLib\",\"Day\":\"1\",\"Content\":\"到店\"}', '2024-04-26 10:12:06.233521', '2024-04-26 10:14:42.849699', 2, 'admin', NULL, '2024-04-26 18:12:06.291958', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-26 18:14:42.854974', NULL, 0, NULL, NULL);
INSERT INTO `workflows` VALUES ('3a131dcf-8ac5-254b-f1b9-3f01e77db05e', '3a122aaa-23cb-541f-ac8e-2cb49de5f5b7', 1, '请求申请', '', NULL, '{\"$type\":\"System.Collections.Generic.Dictionary`2[[System.String, System.Private.CoreLib],[System.Object, System.Private.CoreLib]], System.Private.CoreLib\",\"Day\":\"445\",\"Content\":\"34343443\"}', '2024-06-12 08:48:50.370015', NULL, 0, 'admin', NULL, '2024-06-12 16:48:50.433969', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-06-12 16:49:01.468132', NULL, 0, NULL, NULL);
INSERT INTO `workflows` VALUES ('3a131dd1-648a-61f1-e080-1f4cc672d146', '3a122aaa-23cb-541f-ac8e-2cb49de5f5b7', 1, '请求申请', '', NULL, '{\"$type\":\"System.Collections.Generic.Dictionary`2[[System.String, System.Private.CoreLib],[System.Object, System.Private.CoreLib]], System.Private.CoreLib\",\"Day\":\"2\",\"Content\":\"3344\"}', '2024-06-12 08:50:51.658370', '2024-06-12 08:51:28.086739', 2, 'admin', NULL, '2024-06-12 16:50:51.664980', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-06-12 16:51:28.093281', NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for workflowsubscriptions
-- ----------------------------
DROP TABLE IF EXISTS `workflowsubscriptions`;
CREATE TABLE `workflowsubscriptions`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `WorkflowId` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `StepId` int NOT NULL,
  `ExecutionPointerId` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `EventName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `EventKey` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `SubscribeAsOf` datetime(6) NOT NULL,
  `SubscriptionData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ExternalToken` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ExternalWorkerId` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ExternalTokenExpiry` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflowsubscriptions
-- ----------------------------
INSERT INTO `workflowsubscriptions` VALUES ('3a122804-e3ca-68c4-a3e7-eb8c31deee25', '3a122804-c54b-1d38-a7a8-d4a76d1638f0', 1, 'aaa3d78e-afe2-470f-94d2-6cf0069c343b', 'AuditEvent', '82a47298-58f8-45b7-a980-155d8d02bc4d', '0001-01-01 00:00:00.000000', 'null', NULL, NULL, NULL);
INSERT INTO `workflowsubscriptions` VALUES ('3a122807-069d-3a32-772a-0659c4bb3a9b', '3a122806-ed58-7531-ce07-e51ab484ee9a', 1, '68c059e6-c89d-4b9b-956f-0acb977d2f4a', 'AuditEvent', '2e1e6bd2-100a-4079-8d37-65b2ff9dbbb3', '0001-01-01 00:00:00.000000', 'null', NULL, NULL, NULL);
INSERT INTO `workflowsubscriptions` VALUES ('3a122aaa-70e4-74df-a3db-a1c01e974ae2', '3a122aaa-7053-6f4c-5ef2-83cbaaa0dea5', 4, '36541c80-2951-420e-99a0-74b65e9dc214', 'AuditEvent', '7a150c94-89b6-4392-b98b-7e4edea309d4', '0001-01-01 00:00:00.000000', 'null', NULL, NULL, NULL);
INSERT INTO `workflowsubscriptions` VALUES ('3a122b19-41cf-3b19-a6d4-011459d7d7db', '3a122b19-2681-7b44-71b8-1d99a0efc6df', 4, '92ce0aa6-b6c2-4dda-aef3-7a15a90267ce', 'AuditEvent', 'c46e3f61-0e5e-40e4-a24c-e2b415c63cd6', '0001-01-01 00:00:00.000000', 'null', NULL, NULL, NULL);
INSERT INTO `workflowsubscriptions` VALUES ('3a122b1b-7ecf-d19f-31d8-ed10f1d855eb', '3a122b1b-5442-4028-5f14-fb56cdbe3aae', 5, '94c327c9-7117-49c7-8171-7db7d02e24ac', 'AuditEvent', '3d4ae8da-9629-4a58-a2df-55c6fde1b126', '0001-01-01 00:00:00.000000', 'null', NULL, NULL, NULL);
INSERT INTO `workflowsubscriptions` VALUES ('3a122b1e-ed99-8c9f-3a77-97cf965a4f34', '3a122b1c-5f7f-a547-e47b-e42b17f76c5e', 2, '08056575-c2ae-48d6-a1d6-2f52d0bbf9ac', 'AuditEvent', 'cce5472f-ab93-46a2-8059-1288e605c24f', '0001-01-01 00:00:00.000000', 'null', NULL, NULL, NULL);
INSERT INTO `workflowsubscriptions` VALUES ('3a122b1e-eda9-1abd-71e4-1e73867e9372', '3a122b1c-5f7f-a547-e47b-e42b17f76c5e', 5, 'e012edfb-8d93-4951-a532-2b3247044a04', 'AuditEvent', '21ed2c58-4451-4096-92f2-46faec309cb1', '0001-01-01 00:00:00.000000', 'null', NULL, NULL, NULL);
INSERT INTO `workflowsubscriptions` VALUES ('3a131dcf-b622-da8c-6e43-578969576c5b', '3a131dcf-8ac5-254b-f1b9-3f01e77db05e', 4, '6dec8b3d-cdc6-462a-8a61-0c9f838aa497', 'AuditEvent', 'd55293a7-18f1-4a12-baf1-3ac4976d24e2', '0001-01-01 00:00:00.000000', 'null', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for yadeamessagenotifications
-- ----------------------------
DROP TABLE IF EXISTS `yadeamessagenotifications`;
CREATE TABLE `yadeamessagenotifications`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT '用户Id',
  `MessageId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT '消息Id',
  `MessageScopingId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT '消息范围Id',
  `IsRead` tinyint(1) NOT NULL DEFAULT 0 COMMENT '已读状态 0：未读，1：已读',
  `ReadTime` datetime(6) NULL DEFAULT NULL COMMENT '查阅时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_YaDeaMessageNotifications_MessageId`(`MessageId` ASC) USING BTREE,
  INDEX `IX_YaDeaMessageNotifications_MessageScopingId`(`MessageScopingId` ASC) USING BTREE,
  INDEX `IX_YaDeaMessageNotifications_UserId_MessageScopingId_MessageId_~`(`UserId` ASC, `MessageScopingId` ASC, `MessageId` ASC, `IsRead` ASC) USING BTREE,
  CONSTRAINT `FK_YaDeaMessageNotifications_YaDeaMessages_MessageId` FOREIGN KEY (`MessageId`) REFERENCES `yadeamessages` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_YaDeaMessageNotifications_YaDeaMessageScopes_MessageScopingId` FOREIGN KEY (`MessageScopingId`) REFERENCES `yadeamessagescopes` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yadeamessagenotifications
-- ----------------------------
INSERT INTO `yadeamessagenotifications` VALUES ('005104fb-5fd3-4d7d-a8a7-6a2c7250b980', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '3a11def7-e6ca-7127-f3a3-5d92c21aa24a', '3a11def7-e715-356d-d57d-a9530011e4a7', 1, '2024-04-11 18:54:07.737446');
INSERT INTO `yadeamessagenotifications` VALUES ('084b2c4d-512d-40a8-9327-b10bcfb101de', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '3a11d943-dbc6-4150-bbd7-aa639bf3fd1d', '3a11d943-dbd4-c817-e8b6-4caa6a0e7c84', 1, '2024-04-11 18:53:34.425837');
INSERT INTO `yadeamessagenotifications` VALUES ('37dda174-a50a-4ac0-92a7-9711762eb41d', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '3a11d924-c3be-175a-1f79-c37aa9362fb2', '3a11d924-c47d-6b1e-a2b7-e548956a267e', 1, '2024-04-11 19:02:41.433734');
INSERT INTO `yadeamessagenotifications` VALUES ('67e94274-3848-48a3-b3eb-b9dc5e66cfe7', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '3a121c62-4c1e-cc74-8a93-c1ace8a814c3', '3a121c62-4c2c-4b0f-be7a-8beb20858659', 1, '2024-04-23 17:07:11.792501');
INSERT INTO `yadeamessagenotifications` VALUES ('84c6dc31-9a02-42bd-acbf-293bc71f7ad8', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '3a11d30d-2913-f94c-980d-82453146ad3a', '3a11d30d-2928-07dc-fdfa-ab895d8d6feb', 1, '2024-04-11 18:36:34.550092');
INSERT INTO `yadeamessagenotifications` VALUES ('8812c320-782e-40b4-b8d5-f773ab1974c4', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '3a11d943-ab92-3edd-448e-2402141d2daa', '3a11d943-aba1-f4be-e8be-a10dd93ea12e', 1, '2024-04-11 18:53:37.523786');
INSERT INTO `yadeamessagenotifications` VALUES ('8e117b51-6dc7-4210-b41a-36eda251e807', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '3a11d943-7541-199d-310b-a6907c57edf0', '3a11d943-7550-f472-b0f8-7e823d1f1e37', 1, '2024-04-18 16:04:31.524443');
INSERT INTO `yadeamessagenotifications` VALUES ('e392c16f-e5c5-4ef9-b857-eb15b71f4181', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '3a1221ae-d208-fc49-1276-dac0ab38fd69', '3a1221ae-d2b2-be37-f240-2d964c0415a1', 1, '2024-04-25 23:36:05.574813');
INSERT INTO `yadeamessagenotifications` VALUES ('f1394c6f-3d8a-42b2-b241-14e5e03a0d1b', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '3a11d934-bf88-56a7-5eeb-483b56065efa', '3a11d934-bf97-79bd-4101-70953d3a1116', 1, '2024-04-23 17:06:17.102520');
INSERT INTO `yadeamessagenotifications` VALUES ('f4fe7ca2-ed41-49f5-a3b0-323a01a56dc7', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '3a11d96d-bc00-3d99-80cc-eab6a0c0fb48', '3a11d96d-bcbc-bb97-819d-7ba9537080ab', 1, '2024-04-11 18:36:06.359917');
INSERT INTO `yadeamessagenotifications` VALUES ('fc9f5092-adb3-4539-ad3d-fde730018984', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '3a121c61-e648-756e-64ff-5aaec67d5ed9', '3a121c61-e683-6e34-bde3-a77a21ad597b', 1, '2024-04-23 17:06:50.402338');

-- ----------------------------
-- Table structure for yadeamessages
-- ----------------------------
DROP TABLE IF EXISTS `yadeamessages`;
CREATE TABLE `yadeamessages`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ApplicationName` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属系统名称（消息发起系统）',
  `MessageType` int NOT NULL COMMENT '消息类型 1：通知，2：预警，99：其他 ...',
  `PushProviderCode` int NOT NULL COMMENT '消息推送方式 1：系统消息，2：短信消息，4：邮件消息 ...',
  `Title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '消息标题',
  `Content` varchar(4010) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '消息内容',
  `DelayedSend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否定时发送（延迟发送）0：否 1：是',
  `SendTime` datetime(6) NOT NULL COMMENT '发送时间',
  `SendUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT '发送人Id',
  `SendUserName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '发送人姓名',
  `ExpirationTime` datetime(6) NULL DEFAULT NULL COMMENT '到期时间（到期后收件人不可查看）',
  `RecalledUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL COMMENT '撤回人Id',
  `RecalledUserName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '撤回人Id',
  `RecalledTime` datetime(6) NULL DEFAULT NULL COMMENT '撤回时间',
  `Status` int NOT NULL DEFAULT 1 COMMENT '消息状态 1：已发布，2：已发送，3：已撤回',
  `Tag` bigint NULL DEFAULT NULL COMMENT '标签 二进制编码，用于扩展',
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
  INDEX `IX_YaDeaMessages_ApplicationName_MessageType_Title`(`ApplicationName` ASC, `MessageType` ASC, `Title` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yadeamessages
-- ----------------------------
INSERT INTO `yadeamessages` VALUES ('3a11d2a8-914d-05b9-b7c5-bd11ea232ffa', 'Net', 1, 1, '333', '333', 0, '2024-04-09 09:32:04.464545', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '7dfc161d32c849baa2a431aab45fd2ca', '2024-04-09 09:32:13.248912', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2a9-5eb2-1c06-a2ac-8fef40d91d7a', 'Net', 1, 1, '333', '333', 0, '2024-04-09 09:32:50.249324', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', 'e9ec68d51bad4473a7cc253f7118036c', '2024-04-09 09:32:50.251332', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2a9-8041-b18b-4e92-9cbad3cc12ef', 'Net', 1, 1, '333', '333', 0, '2024-04-09 09:32:58.834842', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '9c117987c22940fead0dd5e6aa0e7c1a', '2024-04-09 09:32:58.835878', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2ab-464a-0d85-8cd1-9265c2a82bb8', 'Net', 1, 1, '333', '333', 0, '2024-04-09 09:34:55.681684', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '0a8ae0faaa5b4844b9bd78d8db45ea2e', '2024-04-09 09:35:10.612654', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2af-0275-f739-2ca0-4a87ea99e81d', 'Net', 1, 1, '333', '333', 0, '2024-04-09 09:39:00.480211', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '896b21872a514582af7206c1eae8dda8', '2024-04-09 09:39:03.202624', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2af-4e9f-a5e7-a335-462b6f9fa652', 'Net', 1, 1, '333', '333', 0, '2024-04-09 09:39:19.392249', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '41870d86e4fb4f3fba5af5d1c80b55db', '2024-04-09 09:39:19.393470', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2bd-1170-f0e2-af99-49be5fa0cad6', 'Net', 1, 1, '333', '333', 0, '2024-04-09 09:54:21.836556', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '2f9cf62527de41978cd8b692d4bd943f', '2024-04-09 09:54:21.938875', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2bd-4e57-1a79-06f3-d66e62f59c59', 'Net', 1, 1, '333', '333', 0, '2024-04-09 09:54:36.839031', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '5f9002b48b904547b67af571eeefc3bd', '2024-04-09 09:54:36.840519', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2be-945a-92db-e8bc-6590eedd8d4f', 'Net', 1, 1, '333', '333', 0, '2024-04-09 09:56:27.287494', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '62d226102e75404095f1719f680d8374', '2024-04-09 09:56:27.400691', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2bf-8a68-a206-93db-c4f562e02083', 'Net', 1, 1, '333', '333', 0, '2024-04-09 09:57:21.671853', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '4c1e8a57ab1348ccaf5b4483194244e6', '2024-04-09 09:57:21.772983', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2c0-d2db-e06b-05aa-8a704977e1bf', 'Net', 1, 1, '333', '333', 0, '2024-04-09 09:59:22.219240', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '4d425917c56b4fffbe19118cfa120c1f', '2024-04-09 09:59:22.260120', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2c1-db8a-83f3-4999-18db4fda5ecb', 'Net', 1, 1, '333', '333', 0, '2024-04-09 09:59:42.266942', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '634db05655bb4cbf93eea138027fa085', '2024-04-09 09:59:42.269719', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2c5-7ad0-4980-a5af-c608bf9d0e0a', 'Net', 1, 1, '333', '333', 0, '2024-04-09 10:03:43.855548', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '82e1201792414052a98bc86a2ab2cd3f', '2024-04-09 10:03:43.965283', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2c5-c3a2-841c-f14d-4cecc7111232', 'Net', 1, 1, '333', '333', 0, '2024-04-09 10:03:54.643656', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', 'da6e4863b32c4d148abe3f4647da72da', '2024-04-09 10:03:54.648455', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2c7-6973-2277-5cf5-ed803b80529f', 'Net', 1, 1, '333', '333', 0, '2024-04-09 10:05:42.413197', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '74da8f9b432340bb8e58876ec8acc978', '2024-04-09 10:05:42.532366', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2c7-875b-c6b6-1ce3-71f3042ba2e1', 'Net', 1, 1, '333', '333', 0, '2024-04-09 10:05:50.153675', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '42efa1dee5fc425291b0f910e07e1979', '2024-04-09 10:05:50.155210', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2cb-7fdc-d693-c1f8-ebbed474e395', 'Net', 1, 1, '333', '333', 0, '2024-04-09 10:10:07.578784', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '50e25386f34f47499df40f15093558b5', '2024-04-09 10:10:07.685090', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2cb-a5e5-3320-3b7c-42e4d02ca513', 'Net', 1, 1, '333', '333', 0, '2024-04-09 10:10:16.744304', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '4bb3a245eafa4295be3921d9e522ffe4', '2024-04-09 10:10:16.746274', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2cd-40cb-da1e-1189-0e3f8be0746f', 'Net', 1, 1, '333', '333', 0, '2024-04-09 10:12:02.543638', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '8b708441fc324046b67a506516ffd720', '2024-04-09 10:12:02.647590', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2cd-a118-4b5d-d962-9048cb1f6ad0', 'Net', 1, 1, '333', '333', 0, '2024-04-09 10:12:27.205140', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', 'feb77786b00841159889366c259c437b', '2024-04-09 10:12:27.320587', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2cd-c6a3-e12d-270e-c61eebc0d9fb', 'Net', 1, 1, '333', '333', 0, '2024-04-09 10:12:36.199140', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', 'cf9fde4d67274a039f3e1cbdb0dd97ec', '2024-04-09 10:12:36.200426', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2cd-db61-5440-dac2-f3bc39e0a968', 'Net', 1, 1, '333', '333', 0, '2024-04-09 10:12:41.463737', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '3fa0ea66e7b24091bedd13fd9e6a71e3', '2024-04-09 10:12:41.465183', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2cd-f286-d69b-6ae7-55c33c394c5f', 'Net', 1, 1, '333', '333', 0, '2024-04-09 10:12:47.379993', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '3b29781f2cd14efc9f47d3e93488c5d3', '2024-04-09 10:12:47.381528', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2d0-0cc0-a04e-8999-4b33f1490f7c', 'Net', 1, 1, '333', '333', 0, '2024-04-09 10:15:05.866103', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '532702be4ecc45fc9a116bcc6bdc9492', '2024-04-09 10:15:05.971562', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2d0-2a29-7851-737b-7b2ed34733b5', 'Net', 1, 1, '333', '333', 0, '2024-04-09 10:15:12.761429', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', 'b1be54e3a6514046a24b5e36c36ae873', '2024-04-09 10:15:12.764231', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2d8-cb16-b289-2d05-5a1a58f1f7c0', 'Net', 1, 1, '333', '333', 0, '2024-04-09 10:24:38.790604', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '6f2dc97790c3443f9862c7537ca1acbb', '2024-04-09 10:24:38.899538', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2d9-1c3b-2d46-e054-f7aa28ff6bdc', 'Net', 1, 1, '333', '333', 0, '2024-04-09 10:24:59.008083', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', 'e9322820ca0948fd8671083f50ee11bf', '2024-04-09 10:24:59.009579', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2d9-7359-7579-df05-b3aafe50bb08', 'Net', 1, 1, '333', '333', 0, '2024-04-09 10:25:59.868692', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', 'f984115ed58b4f32be4aaed2d0fef27b', '2024-04-09 10:25:59.880389', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2dc-17af-a73d-8178-5b2f41d9593b', 'Net', 1, 1, '333', '333', 0, '2024-04-09 10:28:28.626678', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '874d11f361ec471280113a3af5a82446', '2024-04-09 10:28:28.731662', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2dc-6065-d75e-8e61-8b4cd56de2d6', 'Net', 1, 1, '333', '333', 0, '2024-04-09 10:28:56.946973', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', 'cbb6425c16634d0187853c44b528533f', '2024-04-09 10:28:57.906558', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2dc-dba9-538b-195a-b4cecb3c0426', 'Net', 1, 1, '333', '333', 0, '2024-04-09 10:29:07.004797', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '0b60ad87537f438ea7ad2a1706eae2e6', '2024-04-09 10:29:07.013827', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d2e0-6c75-0022-a72a-06d5b01fc285', 'Net', 1, 1, '333', '333', 0, '2024-04-09 10:32:58.901046', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 1, NULL, '{}', '8aef7b86c91540be9391150603b11561', '2024-04-09 10:32:59.008440', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d307-b0be-a484-3c28-4eb8637b11dc', 'Net', 1, 1, '4444', '343', 0, '2024-04-09 11:16:01.096773', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', 'bdc97cc2b49b49bd9756f97c36a0aad3', '2024-04-09 11:16:01.209310', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-09 11:16:11.639915', NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d308-3e5c-d204-9c0a-5146a9c07a62', 'Net', 1, 1, '777', '7777', 0, '2024-04-09 11:16:30.039099', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', '7b9c3c39966a4ed9b6fc584d947b6aac', '2024-04-09 11:16:30.104320', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-09 11:16:30.188879', NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d308-edf2-3907-82cd-69ead7665fa4', 'Net', 1, 1, '56756', '56756', 0, '2024-04-09 11:17:12.839029', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', '8dc477256e4543a7a65a6b4c44e86011', '2024-04-09 11:17:12.854086', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-09 11:17:26.998175', NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d30a-e46e-9b02-2c45-9b65fe77607e', 'Net', 1, 1, '4442423', '42242423', 0, '2024-04-09 11:19:21.721391', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', 'c1bda0c6d4f446389848997053c21ff2', '2024-04-09 11:19:21.889893', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-09 11:19:29.807566', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d30c-c8b6-5549-3fb4-620e4b2e9ebe', 'Net', 1, 1, '3434', '3434', 0, '2024-04-09 11:21:25.921394', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', '5244776189e9483c93da1ce2744f278d', '2024-04-09 11:21:26.027213', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-09 11:21:26.103921', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d30d-2913-f94c-980d-82453146ad3a', 'Net', 1, 1, '我发布了', '34534534', 0, '2024-04-09 11:21:50.120225', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', '4c4d5c6369264f0d945cc9433b4674f1', '2024-04-09 11:21:50.121577', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-09 11:21:50.130082', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d450-5135-c0a6-0efd-67f3353e70e1', 'Net', 1, 1, 'rtrtrt', '<blockquote>ytyty<strong>rtryrtyr</strong></blockquote>', 0, '2024-04-09 17:14:48.702063', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', '8374db0c4bb844ef9173912abb4012c0', '2024-04-09 17:14:48.805681', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-09 17:14:48.865771', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d835-1f5f-8d1c-c441-999f4eb66432', 'Net', 1, 1, '3333', '<p><img src=\"https://localhost:44368/api/basics/files/1177eee81a79652c3a017fe58b3e23e4\" alt=\"1\" data-href=\"https://localhost:44368/api/basics/files/1177eee81a79652c3a017fe58b3e23e4\" style=\"width: 176.14px;height: 87.91px;\"/></p>', 0, '2024-04-10 11:23:35.381042', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', 'fd3112376edf40299fe6574b81d886f3', '2024-04-10 11:23:35.556307', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-10 11:23:35.619108', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d836-c508-7c39-c9b1-e0da53ff1127', 'Net', 1, 1, '3332222', '<p><img src=\"https://localhost:44368/api/basics/files/8ed289da8701ac44426ea354e29d449c\" alt=\"image\" data-href=\"https://localhost:44368/api/basics/files/8ed289da8701ac44426ea354e29d449c\" style=\"\"/></p>', 0, '2024-04-10 11:25:23.094137', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', 'ca549c1cf6994141a9f94b4a8526d120', '2024-04-10 11:25:23.095388', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-10 11:25:23.101501', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d838-57db-2fa3-cce9-ead511bcec8a', 'Net', 1, 1, '333', '<p><br></p>', 0, '2024-04-10 11:27:06.217465', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', '47a69a68e8114cc099e180c61f8577d1', '2024-04-10 11:27:06.218554', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-10 11:27:06.222974', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d83a-19c1-647e-15a9-6c890b1e3b57', 'Net', 1, 1, '444', '<p><br></p>', 0, '2024-04-10 11:29:01.402470', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', 'b2b615eaa1fe4c68b3cf741f3c3f2fb1', '2024-04-10 11:29:01.404905', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-10 11:29:01.415597', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d83c-3028-57d9-bd7a-0d2adb7aca22', 'Net', 1, 1, '333', '<p><br></p>', 0, '2024-04-10 11:31:18.197624', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', '29b6eb4891924d46b77240a8a5f66478', '2024-04-10 11:31:18.198917', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-10 11:31:18.203266', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d90e-b1a3-3ed1-23d9-977d4bd6fd40', 'Net', 1, 1, 'ee', '<p>rer</p>', 0, '2024-04-10 15:21:13.934994', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', '92c4d492f94d46f7b279b559ddda1bc1', '2024-04-10 15:21:13.942023', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-10 15:21:13.980606', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d90f-a216-63db-5913-70f81a26a2c4', 'Net', 1, 1, '4', '<p>4</p>', 0, '2024-04-10 15:22:15.460280', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', '2f964944dd774592bbc42bf417291131', '2024-04-10 15:22:15.461454', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-10 15:22:15.485397', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d924-c3be-175a-1f79-c37aa9362fb2', 'Net', 1, 1, '656', '<p>566</p>', 0, '2024-04-10 15:45:20.507035', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', 'eb2a7c2d8e9743198d55aa7e8f770234', '2024-04-10 15:45:20.600838', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-10 15:45:20.649174', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d924-f866-5eec-2d2c-18b7954cbf18', 'Net', 1, 1, '454', '<p>4545</p>', 0, '2024-04-10 15:45:33.820697', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', 'd30b0c2ab4ed48ada3e607215659927f', '2024-04-10 15:45:33.821934', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-10 15:45:33.831337', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d934-bf88-56a7-5eeb-483b56065efa', 'Net', 1, 1, '444', '<p>555</p>', 0, '2024-04-10 16:02:47.831327', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', '9abc936cc262417dbf15f1341b34687c', '2024-04-10 16:02:47.832903', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-10 16:02:47.838001', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d943-7541-199d-310b-a6907c57edf0', 'Net', 1, 1, 'tuty', '<p>tytuty</p>', 0, '2024-04-10 16:18:51.856299', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', 'd54189570df94a5e906234735a5abdeb', '2024-04-10 16:18:51.857626', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-10 16:18:51.864306', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d943-ab92-3edd-448e-2402141d2daa', 'Net', 1, 1, '67', '<p>6767</p>', 0, '2024-04-10 16:19:05.761436', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', '74d7ec7c3f3647d38c7258f022f7fc7d', '2024-04-10 16:19:05.762435', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-10 16:19:05.767091', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d943-dbc6-4150-bbd7-aa639bf3fd1d', 'Net', 1, 1, '676776', '<p>6767</p>', 0, '2024-04-10 16:19:18.100855', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', 'e27b15401a034fc796f5042f574a1a18', '2024-04-10 16:19:18.102031', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-10 16:19:18.110295', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11d96d-bc00-3d99-80cc-eab6a0c0fb48', 'Net', 1, 1, '67', '<p>6776</p>', 0, '2024-04-10 17:05:02.649619', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', '3a2e55e314da4b4dbd44fd25de4a8d14', '2024-04-10 17:05:02.726442', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-10 17:05:02.815896', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a11def7-e6ca-7127-f3a3-5d92c21aa24a', 'Net', 1, 1, 'erere', '<p>erreerre<img src=\"https://localhost:44368/api/basics/files/1177eee81a79652c3a017fe58b3e23e4\" alt=\"1\" data-href=\"https://localhost:44368/api/basics/files/1177eee81a79652c3a017fe58b3e23e4\" style=\"\"/></p>', 0, '2024-04-11 18:54:03.539271', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', 'c9bd98ccb3c24f6b99db9bd1c5085d4a', '2024-04-11 18:54:03.547991', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-11 18:54:03.614124', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a121c61-e648-756e-64ff-5aaec67d5ed9', 'Net', 1, 1, '```122', '<blockquote>454455</blockquote>', 0, '2024-04-23 17:06:40.382403', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', '1ebd65d4bb5b48e7a1ae4c890c66b5d7', '2024-04-23 17:06:40.393411', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-23 17:06:40.440957', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a121c62-4c1e-cc74-8a93-c1ace8a814c3', 'Net', 1, 1, '``2`', '<blockquote>3444334</blockquote>', 0, '2024-04-23 17:07:06.412728', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', 'ac593a836cda452a8b123705f7ede89c', '2024-04-23 17:07:06.413888', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-23 17:07:06.420098', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a1221ae-d208-fc49-1276-dac0ab38fd69', 'Net', 1, 1, '4', '<p>454</p>', 0, '2024-04-24 17:48:47.650274', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 'admin', NULL, NULL, NULL, NULL, 2, NULL, '{}', '4b875f3bc2994ce6a89ede8285163935', '2024-04-24 17:48:47.797454', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', '2024-04-24 17:48:47.903803', '3a114eb4-8d58-ab1d-4971-f5ab5f615d45', 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a135b88-ce7c-b08e-85b0-dd21d76ebe8a', 'xa', 1, 16, 'xxx', 'xx', 0, '2024-06-24 16:28:04.836051', '599814c9-c783-4ebe-b663-6e771ce14354', 'ddddd', '9999-12-31 23:59:59.999999', NULL, NULL, NULL, 2, NULL, '{}', 'e74eca7fe4ed46cc98fca1a45a57232c', '2024-06-24 16:28:32.101574', NULL, '2024-06-24 16:28:33.908878', NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a135b8b-1aa1-99ac-d8d1-b05a7898a48d', 'xa', 1, 16, 'xxx', 'xx', 0, '2024-06-24 16:30:32.611069', 'a8a62c02-7664-492b-a203-9f01a503ef06', 'ddddd', '9999-12-31 23:59:59.999999', NULL, NULL, NULL, 1, NULL, '{}', '1058fbbce9cc45ed856600f9822a04d4', '2024-06-24 16:30:44.130556', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a135b8c-988c-ac3e-b671-f899a11b6a10', 'xa', 1, 16, 'xxx', 'xx', 0, '2024-06-24 16:32:10.382518', 'fcc9b500-5412-40b5-bc35-4a8a0007ff27', 'ddddd', '9999-12-31 23:59:59.999999', NULL, NULL, NULL, 2, NULL, '{}', '0c15894795e542b691d50b1ab51be6e2', '2024-06-24 16:32:14.894561', NULL, '2024-06-24 16:32:40.596569', NULL, 0, NULL, NULL);
INSERT INTO `yadeamessages` VALUES ('3a135b8d-3b25-cc28-4d83-22fd5324ba76', 'xa', 1, 16, 'xxx', 'xx', 0, '2024-06-24 16:32:52.005478', '5d5f3f00-8063-4eba-8cce-8b461344f01e', 'ddddd', '9999-12-31 23:59:59.999999', NULL, NULL, NULL, 2, NULL, '{}', '115a6e0cbce540d0abda2408bc320bde', '2024-06-24 16:33:05.785055', NULL, '2024-06-24 16:33:16.092908', NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for yadeamessagescopes
-- ----------------------------
DROP TABLE IF EXISTS `yadeamessagescopes`;
CREATE TABLE `yadeamessagescopes`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `MessageId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT '消息Id',
  `ProviderName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '关联提供商类型（S：全局系统消息，A：系统，O：机构/部门，R：角色，G：群组，U：用户）',
  `ProviderKey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '关联提供商类型名称（S：All，A：Number，O：Number，D：Number，R：RoleName，G：Number，U：UserName）',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_YaDeaMessageScopes_MessageId_ProviderName_ProviderKey`(`MessageId` ASC, `ProviderName` ASC, `ProviderKey` ASC) USING BTREE,
  CONSTRAINT `FK_YaDeaMessageScopes_YaDeaMessages_MessageId` FOREIGN KEY (`MessageId`) REFERENCES `yadeamessages` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yadeamessagescopes
-- ----------------------------
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2a8-abf5-96b6-787b-d7d86153deb8', '3a11d2a8-914d-05b9-b7c5-bd11ea232ffa', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2a9-5ec9-7b90-634f-0ad42311eb7e', '3a11d2a9-5eb2-1c06-a2ac-8fef40d91d7a', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2a9-8052-625f-b8c9-06d4205ea99c', '3a11d2a9-8041-b18b-4e92-9cbad3cc12ef', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2ab-8291-af20-0fb0-93bde4d1b1b0', '3a11d2ab-464a-0d85-8cd1-9265c2a82bb8', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2af-0f32-4674-560b-8bb0e6b44994', '3a11d2af-0275-f739-2ca0-4a87ea99e81d', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2af-4ee0-30c5-4e62-9dd5efd5a26b', '3a11d2af-4e9f-a5e7-a335-462b6f9fa652', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2bd-140e-a223-1838-039dcb309791', '3a11d2bd-1170-f0e2-af99-49be5fa0cad6', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2bd-4ea7-5d84-39fe-49e710e87300', '3a11d2bd-4e57-1a79-06f3-d66e62f59c59', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2be-fe19-9738-9a60-a4f1fefe108a', '3a11d2be-945a-92db-e8bc-6590eedd8d4f', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2bf-d28a-6587-7951-df2556953aed', '3a11d2bf-8a68-a206-93db-c4f562e02083', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2c1-a96b-83dd-d50a-819b98eb712d', '3a11d2c0-d2db-e06b-05aa-8a704977e1bf', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2c1-f7bb-777d-37fc-4788b3273e1c', '3a11d2c1-db8a-83f3-4999-18db4fda5ecb', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2c5-a772-a38f-6277-ee7e459a4a07', '3a11d2c5-7ad0-4980-a5af-c608bf9d0e0a', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2c5-d193-6f8d-8f59-312b3bd67df7', '3a11d2c5-c3a2-841c-f14d-4cecc7111232', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2c7-7690-e291-a7ca-7cab7b75f067', '3a11d2c7-6973-2277-5cf5-ed803b80529f', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2c7-94c9-dfc4-cb3c-9477839f61dd', '3a11d2c7-875b-c6b6-1ce3-71f3042ba2e1', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2cb-825e-91d7-59b9-bc01b388ed24', '3a11d2cb-7fdc-d693-c1f8-ebbed474e395', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2cb-a628-284b-8b17-09fc11db417b', '3a11d2cb-a5e5-3320-3b7c-42e4d02ca513', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2cd-4373-b9b5-cbae-aaca2a4de87f', '3a11d2cd-40cb-da1e-1189-0e3f8be0746f', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2cd-a3c8-d1e1-a31e-8a6308659234', '3a11d2cd-a118-4b5d-d962-9048cb1f6ad0', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2cd-c6e7-faee-652c-e3b1b7e33dd6', '3a11d2cd-c6a3-e12d-270e-c61eebc0d9fb', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2cd-db77-bcdf-83dc-cd0f7ef7bf41', '3a11d2cd-db61-5440-dac2-f3bc39e0a968', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2cd-f294-95b6-c43b-5e969b0ada3d', '3a11d2cd-f286-d69b-6ae7-55c33c394c5f', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2d0-0f8c-6cf7-40c8-eed078a26bb5', '3a11d2d0-0cc0-a04e-8999-4b33f1490f7c', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2d0-2a79-ff1e-7a0e-a2adbd3d36bd', '3a11d2d0-2a29-7851-737b-7b2ed34733b5', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2d8-cd88-12b6-22cf-8c09ccb36069', '3a11d2d8-cb16-b289-2d05-5a1a58f1f7c0', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2d9-1c80-4b81-8670-f5721d2b8217', '3a11d2d9-1c3b-2d46-e054-f7aa28ff6bdc', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2da-0a3c-80b7-c33d-ecac68105202', '3a11d2d9-7359-7579-df05-b3aafe50bb08', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2dc-4f55-5a4b-fb09-e1ff7d1c7760', '3a11d2dc-17af-a73d-8178-5b2f41d9593b', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2dc-bdf3-7331-a5e6-5d1e8bd79adc', '3a11d2dc-6065-d75e-8e61-8b4cd56de2d6', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2dc-e53c-e542-4e8a-f5772bffdf2d', '3a11d2dc-dba9-538b-195a-b4cecb3c0426', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d2e0-6f16-294e-33d8-5f2f0e3bcc4b', '3a11d2e0-6c75-0022-a72a-06d5b01fc285', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d307-d5cc-d7a5-dafd-cc200a2b8fc0', '3a11d307-b0be-a484-3c28-4eb8637b11dc', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d308-46d7-0a4e-e8a8-4440601a6ef4', '3a11d308-3e5c-d204-9c0a-5146a9c07a62', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d308-ee07-62ca-1d7c-8279cb61db6f', '3a11d308-edf2-3907-82cd-69ead7665fa4', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d30a-e57c-039d-4585-db1c6e4791fb', '3a11d30a-e46e-9b02-2c45-9b65fe77607e', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d30c-caa4-9c91-3946-41331707c10d', '3a11d30c-c8b6-5549-3fb4-620e4b2e9ebe', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d30d-2928-07dc-fdfa-ab895d8d6feb', '3a11d30d-2913-f94c-980d-82453146ad3a', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d450-5203-fd47-5f23-23b11eb9e8aa', '3a11d450-5135-c0a6-0efd-67f3353e70e1', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d835-205e-f350-8e5d-e428d34c6e34', '3a11d835-1f5f-8d1c-c441-999f4eb66432', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d836-c516-41ff-8b62-2499c91e640b', '3a11d836-c508-7c39-c9b1-e0da53ff1127', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d838-57e9-083c-90ef-a940cd0ffbe9', '3a11d838-57db-2fa3-cce9-ead511bcec8a', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d83a-19da-91de-d184-6a7e82e036a0', '3a11d83a-19c1-647e-15a9-6c890b1e3b57', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d83c-3035-2d39-8b20-3236209063ca', '3a11d83c-3028-57d9-bd7a-0d2adb7aca22', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d90e-b1d0-1897-56b8-3ba07580fd5f', '3a11d90e-b1a3-3ed1-23d9-977d4bd6fd40', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d90f-a224-f403-e1c7-2b16cab4e154', '3a11d90f-a216-63db-5913-70f81a26a2c4', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d924-c47d-6b1e-a2b7-e548956a267e', '3a11d924-c3be-175a-1f79-c37aa9362fb2', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d924-f87c-eacf-5bc9-9fd84ed5a412', '3a11d924-f866-5eec-2d2c-18b7954cbf18', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d934-bf97-79bd-4101-70953d3a1116', '3a11d934-bf88-56a7-5eeb-483b56065efa', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d943-7550-f472-b0f8-7e823d1f1e37', '3a11d943-7541-199d-310b-a6907c57edf0', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d943-aba1-f4be-e8be-a10dd93ea12e', '3a11d943-ab92-3edd-448e-2402141d2daa', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d943-dbd4-c817-e8b6-4caa6a0e7c84', '3a11d943-dbc6-4150-bbd7-aa639bf3fd1d', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11d96d-bcbc-bb97-819d-7ba9537080ab', '3a11d96d-bc00-3d99-80cc-eab6a0c0fb48', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a11def7-e715-356d-d57d-a9530011e4a7', '3a11def7-e6ca-7127-f3a3-5d92c21aa24a', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a121c61-e683-6e34-bde3-a77a21ad597b', '3a121c61-e648-756e-64ff-5aaec67d5ed9', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a121c62-4c2c-4b0f-be7a-8beb20858659', '3a121c62-4c1e-cc74-8a93-c1ace8a814c3', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a1221ae-d2b2-be37-f240-2d964c0415a1', '3a1221ae-d208-fc49-1276-dac0ab38fd69', 'S', '');
INSERT INTO `yadeamessagescopes` VALUES ('3a135b88-df96-d590-b600-3c3ca905a804', '3a135b88-ce7c-b08e-85b0-dd21d76ebe8a', 'xx', 'xx');
INSERT INTO `yadeamessagescopes` VALUES ('3a135b88-f815-fed1-42cd-73f6c4c0a689', '3a135b88-ce7c-b08e-85b0-dd21d76ebe8a', 'xx2', 'xx1');
INSERT INTO `yadeamessagescopes` VALUES ('3a135b8b-1aa5-d17e-6109-3a3ad742c36e', '3a135b8b-1aa1-99ac-d8d1-b05a7898a48d', 'xx', 'xx');
INSERT INTO `yadeamessagescopes` VALUES ('3a135b8b-1aa6-30f9-c7da-e0c2680b792f', '3a135b8b-1aa1-99ac-d8d1-b05a7898a48d', 'xx2', 'xx1');
INSERT INTO `yadeamessagescopes` VALUES ('3a135b8c-9893-7de7-ba8b-db325b04ae19', '3a135b8c-988c-ac3e-b671-f899a11b6a10', 'xx', 'xx');
INSERT INTO `yadeamessagescopes` VALUES ('3a135b8c-9894-2ad9-b473-ea7a935061a5', '3a135b8c-988c-ac3e-b671-f899a11b6a10', 'xx2', 'xx1');
INSERT INTO `yadeamessagescopes` VALUES ('3a135b8d-3b25-fc97-4fe3-9a1fe720a0ff', '3a135b8d-3b25-cc28-4d83-22fd5324ba76', 'xx', 'xx');
INSERT INTO `yadeamessagescopes` VALUES ('3a135b8d-3b25-deda-df66-62e26730d132', '3a135b8d-3b25-cc28-4d83-22fd5324ba76', 'xx2', 'xx1');

SET FOREIGN_KEY_CHECKS = 1;
