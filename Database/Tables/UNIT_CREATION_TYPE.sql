/*
 * Raw type of unit. Controls where units can be built and how the UNIT_TYPE itself is created (reference to database function)
 * Examples: Land vehicle, barrage balloon, ship, airship, bigairship and so on
 */
CREATE TABLE `UNIT_CREATION_TYPE` (
  `UCTY_IDENT` varchar(100) NOT NULL,
  `UCTY_PRODUCTION_NODE` varchar(100) DEFAULT NULL,
  `UCTY_CREATION_FUNCTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UCTY_IDENT`),
  KEY `UNIT_CREATION_TYPE_BUILDING_TYPE_FK` (`UCTY_PRODUCTION_NODE`),
  CONSTRAINT `UNIT_CREATION_TYPE_BUILDING_TYPE_FK` FOREIGN KEY (`UCTY_PRODUCTION_NODE`) REFERENCES `BUILDING_TYPE` (`BUTY_IDENT`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Raw type of unit. Controls where units can be built and how the UNIT_TYPE itself is created (reference to database function)';