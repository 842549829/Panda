CREATE TABLE IF NOT EXISTS `__EFMigrationsHistory` (
    `MigrationId` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `ProductVersion` varchar(32) CHARACTER SET utf8mb4 NOT NULL,
    CONSTRAINT `PK___EFMigrationsHistory` PRIMARY KEY (`MigrationId`)
) CHARACTER SET=utf8mb4;

START TRANSACTION;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20240418063153_init') THEN

    ALTER DATABASE CHARACTER SET utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20240418063153_init') THEN

    CREATE TABLE `WorkflowDefinitions` (
        `Id` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
        `Version` int NOT NULL DEFAULT 1,
        `TenantId` char(36) COLLATE ascii_general_ci NULL,
        `Title` varchar(256) CHARACTER SET utf8mb4 NOT NULL,
        `Description` longtext CHARACTER SET utf8mb4 NULL,
        `Icon` varchar(50) CHARACTER SET utf8mb4 NULL,
        `Color` varchar(50) CHARACTER SET utf8mb4 NULL,
        `Group` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
        `Inputs` longtext CHARACTER SET utf8mb4 NOT NULL,
        `Nodes` longtext CHARACTER SET utf8mb4 NOT NULL,
        `CreationTime` datetime(6) NOT NULL,
        `CreatorId` char(36) COLLATE ascii_general_ci NULL,
        `LastModificationTime` datetime(6) NULL,
        `LastModifierId` char(36) COLLATE ascii_general_ci NULL,
        `IsDeleted` tinyint(1) NOT NULL DEFAULT FALSE,
        `DeleterId` char(36) COLLATE ascii_general_ci NULL,
        `DeletionTime` datetime(6) NULL,
        CONSTRAINT `PK_WorkflowDefinitions` PRIMARY KEY (`Id`, `Version`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20240418063153_init') THEN

    CREATE TABLE `WorkflowEvents` (
        `Id` char(36) COLLATE ascii_general_ci NOT NULL,
        `TenantId` char(36) COLLATE ascii_general_ci NULL,
        `EventName` varchar(200) CHARACTER SET utf8mb4 NULL,
        `EventKey` varchar(200) CHARACTER SET utf8mb4 NULL,
        `EventData` longtext CHARACTER SET utf8mb4 NULL,
        `EventTime` datetime(6) NOT NULL,
        `IsProcessed` tinyint(1) NOT NULL,
        `CreationTime` datetime(6) NOT NULL,
        `CreatorId` char(36) COLLATE ascii_general_ci NULL,
        CONSTRAINT `PK_WorkflowEvents` PRIMARY KEY (`Id`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20240418063153_init') THEN

    CREATE TABLE `WorkflowExecutionErrors` (
        `Id` char(36) COLLATE ascii_general_ci NOT NULL,
        `WorkflowId` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
        `ExecutionPointerId` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
        `ErrorTime` datetime(6) NOT NULL,
        `Message` longtext CHARACTER SET utf8mb4 NOT NULL,
        CONSTRAINT `PK_WorkflowExecutionErrors` PRIMARY KEY (`Id`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20240418063153_init') THEN

    CREATE TABLE `WorkflowSubscriptions` (
        `Id` char(36) COLLATE ascii_general_ci NOT NULL,
        `WorkflowId` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
        `StepId` int NOT NULL,
        `ExecutionPointerId` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
        `EventName` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
        `EventKey` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
        `SubscribeAsOf` datetime(6) NOT NULL,
        `SubscriptionData` longtext CHARACTER SET utf8mb4 NOT NULL,
        `ExternalToken` varchar(200) CHARACTER SET utf8mb4 NULL,
        `ExternalWorkerId` varchar(200) CHARACTER SET utf8mb4 NULL,
        `ExternalTokenExpiry` datetime(6) NULL,
        CONSTRAINT `PK_WorkflowSubscriptions` PRIMARY KEY (`Id`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20240418063153_init') THEN

    CREATE TABLE `Workflows` (
        `Id` char(36) COLLATE ascii_general_ci NOT NULL,
        `WorkflowDefinitionId` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
        `Version` int NOT NULL,
        `Description` varchar(500) CHARACTER SET utf8mb4 NOT NULL,
        `Reference` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
        `NextExecution` bigint NULL,
        `Data` longtext CHARACTER SET utf8mb4 NOT NULL,
        `CreateTime` datetime(6) NOT NULL,
        `CompleteTime` datetime(6) NULL,
        `Status` int NOT NULL,
        `CreateUserIdentityName` longtext CHARACTER SET utf8mb4 NOT NULL,
        `TenantId` char(36) COLLATE ascii_general_ci NULL,
        `CreationTime` datetime(6) NOT NULL,
        `CreatorId` char(36) COLLATE ascii_general_ci NULL,
        `LastModificationTime` datetime(6) NULL,
        `LastModifierId` char(36) COLLATE ascii_general_ci NULL,
        `IsDeleted` tinyint(1) NOT NULL DEFAULT FALSE,
        `DeleterId` char(36) COLLATE ascii_general_ci NULL,
        `DeletionTime` datetime(6) NULL,
        CONSTRAINT `PK_Workflows` PRIMARY KEY (`Id`),
        CONSTRAINT `FK_Workflows_WorkflowDefinitions_WorkflowDefinitionId_Version` FOREIGN KEY (`WorkflowDefinitionId`, `Version`) REFERENCES `WorkflowDefinitions` (`Id`, `Version`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20240418063153_init') THEN

    CREATE TABLE `WorkflowExecutionPointers` (
        `Id` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
        `WorkflowId` char(36) COLLATE ascii_general_ci NOT NULL,
        `StepId` int NOT NULL,
        `StepName` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
        `Active` tinyint(1) NOT NULL,
        `SleepUntil` datetime(6) NULL,
        `PersistenceData` longtext CHARACTER SET utf8mb4 NOT NULL,
        `StartTime` datetime(6) NULL,
        `EndTime` datetime(6) NULL,
        `EventName` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
        `EventKey` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
        `EventPublished` tinyint(1) NOT NULL,
        `EventData` longtext CHARACTER SET utf8mb4 NOT NULL,
        `RetryCount` int NOT NULL,
        `Children` longtext CHARACTER SET utf8mb4 NOT NULL,
        `ContextItem` longtext CHARACTER SET utf8mb4 NOT NULL,
        `PredecessorId` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
        `Outcome` longtext CHARACTER SET utf8mb4 NOT NULL,
        `Status` int NOT NULL,
        `Scope` longtext CHARACTER SET utf8mb4 NOT NULL,
        CONSTRAINT `PK_WorkflowExecutionPointers` PRIMARY KEY (`Id`),
        CONSTRAINT `FK_WorkflowExecutionPointers_Workflows_WorkflowId` FOREIGN KEY (`WorkflowId`) REFERENCES `Workflows` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20240418063153_init') THEN

    CREATE TABLE `WorkflowAuditors` (
        `Id` char(36) COLLATE ascii_general_ci NOT NULL,
        `WorkflowId` char(36) COLLATE ascii_general_ci NOT NULL,
        `ExecutionPointerId` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
        `Status` int NOT NULL,
        `AuditTime` datetime(6) NULL,
        `Remark` varchar(500) CHARACTER SET utf8mb4 NOT NULL,
        `UserId` char(36) COLLATE ascii_general_ci NOT NULL,
        `UserIdentityName` longtext CHARACTER SET utf8mb4 NOT NULL,
        `UserHeadPhoto` longtext CHARACTER SET utf8mb4 NOT NULL,
        `TenantId` char(36) COLLATE ascii_general_ci NULL,
        `CreationTime` datetime(6) NOT NULL,
        `CreatorId` char(36) COLLATE ascii_general_ci NULL,
        CONSTRAINT `PK_WorkflowAuditors` PRIMARY KEY (`Id`),
        CONSTRAINT `FK_WorkflowAuditors_WorkflowExecutionPointers_ExecutionPointerId` FOREIGN KEY (`ExecutionPointerId`) REFERENCES `WorkflowExecutionPointers` (`Id`) ON DELETE CASCADE,
        CONSTRAINT `FK_WorkflowAuditors_Workflows_WorkflowId` FOREIGN KEY (`WorkflowId`) REFERENCES `Workflows` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20240418063153_init') THEN

    CREATE TABLE `WorkflowExtensionAttributes` (
        `Id` bigint NOT NULL AUTO_INCREMENT,
        `ExecutionPointerId` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
        `AttributeKey` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
        `AttributeValue` longtext CHARACTER SET utf8mb4 NOT NULL,
        CONSTRAINT `PK_WorkflowExtensionAttributes` PRIMARY KEY (`Id`),
        CONSTRAINT `FK_WorkflowExtensionAttributes_WorkflowExecutionPointers_Execut~` FOREIGN KEY (`ExecutionPointerId`) REFERENCES `WorkflowExecutionPointers` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20240418063153_init') THEN

    CREATE INDEX `IX_WorkflowAuditors_ExecutionPointerId` ON `WorkflowAuditors` (`ExecutionPointerId`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20240418063153_init') THEN

    CREATE INDEX `IX_WorkflowAuditors_WorkflowId` ON `WorkflowAuditors` (`WorkflowId`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20240418063153_init') THEN

    CREATE INDEX `IX_WorkflowExecutionPointers_WorkflowId` ON `WorkflowExecutionPointers` (`WorkflowId`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20240418063153_init') THEN

    CREATE INDEX `IX_WorkflowExtensionAttributes_ExecutionPointerId` ON `WorkflowExtensionAttributes` (`ExecutionPointerId`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20240418063153_init') THEN

    CREATE INDEX `IX_Workflows_WorkflowDefinitionId_Version` ON `Workflows` (`WorkflowDefinitionId`, `Version`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20240418063153_init') THEN

    INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
    VALUES ('20240418063153_init', '8.0.0');

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

COMMIT;

