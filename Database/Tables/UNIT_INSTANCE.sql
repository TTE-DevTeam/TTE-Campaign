/*
 * Represents any constructed unit
 * Holds when it was built or destroyed, where it currently is stationed and in what state it is in. Also tracks in how many actions it already partook in. If it was damaged in a action there is a flag that can be set
 * IMPORTANT: the state is a bitmask, so a unit can have multiple states at the same time
 * Last location should be set when movecraft pilots the ship and when it releases it
 */
CREATE TABLE `UNIT_INSTANCE` (
  `UNIN_IDENT` uuid NOT NULL DEFAULT uuid(),
  `UNIN_LAST_LOCATION` uuid NOT NULL,
  `UNIN_STATE` int(11) NOT NULL DEFAULT 0 COMMENT 'Bitmask for the state\r\nBit 0: Placed or not\r\nBit 1: Active or not\r\nBit 2: Damaged or not\r\nBit 3: Destroyed or not',
  `UNIN_TYPE` varchar(100) NOT NULL,
  `UNIN_FACTION` varchar(100) NOT NULL,
  `UNIN_STATIONED_SETTLEMENT` varchar(100) NOT NULL,
  `UNIN_TURN_DEPLOYED` uuid DEFAULT NULL,
  `UNIN_TURN_DESTROYED` uuid DEFAULT NULL,
  `UNIN_ACTION_COUNTER` int(10) unsigned NOT NULL DEFAULT 0,
  `UNIN_DAMAGED` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`UNIN_IDENT`),
  KEY `UNIT_INSTANCE_LOCATION_FK` (`UNIN_LAST_LOCATION`),
  KEY `UNIT_INSTANCE_UNIT_TYPE_FK` (`UNIN_TYPE`),
  KEY `UNIT_INSTANCE_FACTION_FK` (`UNIN_FACTION`),
  KEY `UNIT_INSTANCE_SETTLEMENT_FK` (`UNIN_STATIONED_SETTLEMENT`),
  KEY `UNIT_INSTANCE_TURN_FK` (`UNIN_TURN_DEPLOYED`),
  KEY `UNIT_INSTANCE_TURN_FK_1` (`UNIN_TURN_DESTROYED`),
  CONSTRAINT `UNIT_INSTANCE_FACTION_FK` FOREIGN KEY (`UNIN_FACTION`) REFERENCES `FACTION` (`FACT_IDENT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `UNIT_INSTANCE_LOCATION_FK` FOREIGN KEY (`UNIN_LAST_LOCATION`) REFERENCES `LOCATION` (`LOCA_UUID`),
  CONSTRAINT `UNIT_INSTANCE_SETTLEMENT_FK` FOREIGN KEY (`UNIN_STATIONED_SETTLEMENT`) REFERENCES `SETTLEMENT` (`SETT_IDENT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `UNIT_INSTANCE_TURN_FK` FOREIGN KEY (`UNIN_TURN_DEPLOYED`) REFERENCES `TURN` (`TURN_GUID`),
  CONSTRAINT `UNIT_INSTANCE_TURN_FK_1` FOREIGN KEY (`UNIN_TURN_DESTROYED`) REFERENCES `TURN` (`TURN_GUID`),
  CONSTRAINT `UNIT_INSTANCE_UNIT_TYPE_FK` FOREIGN KEY (`UNIN_TYPE`) REFERENCES `UNIT_TYPE` (`UNTY_IDENT`) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='Represents an actual unit.\r\nIt always has a faction, type and last known location as well as the settlement it currently is at';