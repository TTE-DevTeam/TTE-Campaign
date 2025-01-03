/*
 * Represents the storage of resources of settlements
 * One row per settlement and resource
 */
/*
 * Settlement storage is related to the following tables:
 *  - SETTLEMENT: The associated settlement
 *  - RESOURCE_TYPE: The associated resource
 */
CREATE TABLE `SETTLEMENT_STORAGE` (
  `SEST_SETTLEMENT` varchar(100) NOT NULL,
  `SEST_RESOURCE_TYPE` varchar(100) NOT NULL COMMENT 'Associated resource',
  `SEST_COUNT` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Amount of that resource',
  KEY `SETTLEMENT_STORAGE_SETTLEMENT_FK` (`SEST_SETTLEMENT`),
  KEY `SETTLEMENT_STORAGE_RESOURCE_TYPE_FK` (`SEST_RESOURCE_TYPE`),
  CONSTRAINT `SETTLEMENT_STORAGE_RESOURCE_TYPE_FK` FOREIGN KEY (`SEST_RESOURCE_TYPE`) REFERENCES `RESOURCE_TYPE` (`RETY_IDENT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SETTLEMENT_STORAGE_SETTLEMENT_FK` FOREIGN KEY (`SEST_SETTLEMENT`) REFERENCES `SETTLEMENT` (`SETT_IDENT`) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='Storage of resources at a settlement';