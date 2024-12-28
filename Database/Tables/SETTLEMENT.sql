/*
 * Represents individual settlements
 * Settlements have a unique name and a faction that currently holds it.
 * It also always has lifes, the turn it was founded and the location it is at
 * Optionally a worldguard region can be specified
 */
/*
 * Resource types are related to the following tables:
 *  - SETTLEMENT_STORAGE: Resources stored here
 *  - SETTLEMENT_TYPE: The type of this settlement
 *  - BUILDING: Buildings of this settlement
 *  - ACTION: actions initiated by this settlement
 *  - TRADE_ROUTE: trades going to or coming from this settlement
 *  - FACTION: Current holder of this settlement
 *  - UNIT_INSTANCE: Units currently stationed here
 */
CREATE TABLE `SETTLEMENT` (
  `SETT_IDENT` varchar(100) NOT NULL,
  `SETT_FACTION` varchar(100) NOT NULL COMMENT 'Who currently owns this settlement?',
  `SETT_TYPE` varchar(100) NOT NULL,
  `SETT_LIFES` tinyint(3) unsigned NOT NULL COMMENT 'How many lifes does this settlement still have?',
  `SETT_LOCATION` uuid NOT NULL COMMENT 'Where is this settlement located?',
  `SETT_WORLDGUARD_REGION` varchar(255) DEFAULT NULL COMMENT 'Optional, which worldguard region belongs to this settlement?',
  `SETT_TURN_FOUNDED` uuid DEFAULT NULL COMMENT 'When was this settlement created?',
  PRIMARY KEY (`SETT_IDENT`),
  KEY `SETTLEMENT_SETTLEMENT_TYPE_FK` (`SETT_TYPE`),
  KEY `SETTLEMENT_SETT_FACTION_IDX` (`SETT_FACTION`) USING BTREE,
  CONSTRAINT `SETTLEMENT_FACTION_FK` FOREIGN KEY (`SETT_FACTION`) REFERENCES `FACTION` (`FACT_IDENT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SETTLEMENT_SETTLEMENT_TYPE_FK` FOREIGN KEY (`SETT_TYPE`) REFERENCES `SETTLEMENT_TYPE` (`SETY_IDENT`) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='Represents a settlement. Holds the lifes of the settlement, it''s location and optional worldguard region';