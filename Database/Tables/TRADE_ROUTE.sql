/*
 * Represents a resource transfer between two settlements
 */
/* TODO: Rework, needs a state and the current turn. The state represents the result too */
CREATE TABLE `TRADE_ROUTE` (
  `TRRO_SOURCE_SETTLEMENT` varchar(100) NOT NULL COMMENT 'Initiating settlement',
  `TRRO_DESTINATION_SETTLEMENT` varchar(100) NOT NULL COMMENT 'Target settlement',
  `TRRO_ACTIVE` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'If this transport is still in progress or not',
  `TRRO_IDENT` uuid NOT NULL DEFAULT uuid(),
  `TRRO_UNIT` uuid NOT NULL COMMENT 'Unit carrying the resources',
  PRIMARY KEY (`TRRO_IDENT`),
  KEY `TRADE_ROUTE_SETTLEMENT_FK` (`TRRO_SOURCE_SETTLEMENT`),
  KEY `TRADE_ROUTE_SETTLEMENT_FK_1` (`TRRO_DESTINATION_SETTLEMENT`),
  KEY `TRADE_ROUTE_UNIT_INSTANCE_FK` (`TRRO_UNIT`),
  CONSTRAINT `TRADE_ROUTE_SETTLEMENT_FK` FOREIGN KEY (`TRRO_SOURCE_SETTLEMENT`) REFERENCES `SETTLEMENT` (`SETT_IDENT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TRADE_ROUTE_SETTLEMENT_FK_1` FOREIGN KEY (`TRRO_DESTINATION_SETTLEMENT`) REFERENCES `SETTLEMENT` (`SETT_IDENT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TRADE_ROUTE_UNIT_INSTANCE_FK` FOREIGN KEY (`TRRO_UNIT`) REFERENCES `UNIT_INSTANCE` (`UNIN_IDENT`) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='Represents a resource transfer between two settlements';