/*
 * Represents available types of unit (e.g. destroyer Mk III, Goliath, Eris)
 * Holds wether or not this design is public or not (public designs can be produced by everyone, otherwise only by the owning faction)
 * Contains reference to the raw (UNIT_CREATION_TYPE) type that created this unit type
 */
CREATE TABLE `UNIT_TYPE` (
  `UNTY_IDENT` varchar(100) NOT NULL,
  `UNTY_APPROVED` tinyint(1) NOT NULL DEFAULT 0,
  `UNTY_SCHEMATIC` blob DEFAULT NULL,
  `UNTY_SCHEMATIC_NAME` varchar(255) DEFAULT NULL,
  `UNTY_TYPE` varchar(100) NOT NULL COMMENT 'Raw type of this unit type',
  `UNTY_FACTION` varchar(100) DEFAULT NULL,
  `UNTY_IS_PUBLIC` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`UNTY_IDENT`),
  KEY `UNIT_TYPE_UNIT_CREATION_TYPE_FK` (`UNTY_TYPE`),
  KEY `UNIT_TYPE_FACTION_FK` (`UNTY_FACTION`),
  CONSTRAINT `UNIT_TYPE_FACTION_FK` FOREIGN KEY (`UNTY_FACTION`) REFERENCES `FACTION` (`FACT_IDENT`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `UNIT_TYPE_UNIT_CREATION_TYPE_FK` FOREIGN KEY (`UNTY_TYPE`) REFERENCES `UNIT_CREATION_TYPE` (`UCTY_IDENT`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Represents available unit types for approval. Holds reference to the faction and if it is approved or not and public. Also holds reference to the associated creation/raw type and optionally to a schematic or the path to one';