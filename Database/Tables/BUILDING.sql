/*
 * This table represents all buildings. 
 * A building always has the following attributes:
 *  - Type => What kind of node is this?
 *  - Size => How big is this node?
 *  - Location => Where is this building located?
 *  - Settlement => Which settlement does this building belong to?
 *
 * The column for the turn it was built in is automatically filled.
 */
 /*
  * Buildings are related to the following tables:
  *  - BUILDING_TYPE: The type of building this belongs to. If the type gets deleted, all of it's associated buildings will be deleted too
  *  - SETTLEMENT: The settlement that owns this building. If the settlement is deleted, all of it's buildings get deleted too
  *  - TURN: The turn this building was constructed in. If the turn is deleted, the building is deleted too.
  *  - LOCATION: The location this building is located at. If the location is deleted, the location field of the building is nulled
  */
CREATE TABLE `BUILDING` (
  `BUIL_TYPE` varchar(100) NOT NULL,
  `BUIL_SETTLEMENT` varchar(100) NOT NULL,
  `BUIL_NODE_SIZE` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `BUIL_LOCATION` uuid DEFAULT NULL,
  `BUIL_STATE` int(11) NOT NULL DEFAULT 0 COMMENT 'Bitmask for the state of the building:\r\nBit 0: Approved or not\r\nBit 1: Active or not\r\nBit 2: Damaged or not\r\nBit 3: Destroyed',
  `BUIL_TURN_BUILT` uuid DEFAULT NULL,
  `BUIL_TURN_DESTROYED` uuid DEFAULT NULL,
  KEY `BUILDING_BUILDING_TYPE_FK` (`BUIL_TYPE`),
  KEY `BUILDING_SETTLEMENT_FK` (`BUIL_SETTLEMENT`),
  KEY `BUILDING_LOCATION_FK` (`BUIL_LOCATION`),
  KEY `BUILDING_TURN_FK` (`BUIL_TURN_BUILT`),
  CONSTRAINT `BUILDING_BUILDING_TYPE_FK` FOREIGN KEY (`BUIL_TYPE`) REFERENCES `BUILDING_TYPE` (`BUTY_IDENT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BUILDING_LOCATION_FK` FOREIGN KEY (`BUIL_LOCATION`) REFERENCES `LOCATION` (`LOCA_UUID`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `BUILDING_SETTLEMENT_FK` FOREIGN KEY (`BUIL_SETTLEMENT`) REFERENCES `SETTLEMENT` (`SETT_IDENT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BUILDING_TURN_FK` FOREIGN KEY (`BUIL_TURN_BUILT`) REFERENCES `TURN` (`TURN_GUID`) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='Represents instances of a building.\r\n\r\nHolds the size of the node as well as the turn it was built and it''s state and when it got destroyed.\r\n\r\nMust always contain the settlement it belongs to, how big it''s node is and where it is. Automatically determines when it was built';