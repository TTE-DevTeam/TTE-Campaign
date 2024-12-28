/*
 * This table represents a faction and if it is valid or not
 */
 /*
  * Factions are related to the following tables:
  *  - FACTION_MEMBER: the members of this faction
  *  - UNIT_TYPE: faction that owns this unit type
  *  - SETTLEMENT: settlements of this faction
  *  - UNIT_INSTANCE: faction that this unit belongs to
  */
CREATE TABLE `FACTION` (
  `FACT_IDENT` varchar(100) NOT NULL,
  `FACT_ACTIVE` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`FACT_IDENT`)
) COMMENT='Represents a faction and if this faction is active or not. Consists of a single ident and a boolean';