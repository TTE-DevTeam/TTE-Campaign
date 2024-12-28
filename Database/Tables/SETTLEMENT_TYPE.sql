/*
 * Defines available settlement types
 * The settlement type controls the starting resources for that (reference to table SETTLEMENT_TYPE_ECONOMY_VALUES), starting lifes and how many of this type can be created per faction
 */
/*
 * Settlement storage is related to the following tables:
 *  - SETTLEMENT: Settlements of this type. If the type is deleted, all settlements of this type are deleted
 *  - SETTLEMENT_TYPE_BUILDING_CONSTRAINTS: Buildings that can be built at settlements of this type
 *  - SETTLEMENT_TYPE_ECONOMY_VALUES: Starting resources for cities of this type
 */
CREATE TABLE `SETTLEMENT_TYPE` (
  `SETY_IDENT` varchar(100) NOT NULL,
  `SETY_MIN_PLAYER_COUNT` tinyint(3) unsigned NOT NULL DEFAULT 2,
  `SETY_LIFE_COUNT` tinyint(3) unsigned NOT NULL DEFAULT 3,
  `SETY_MAX_TONNAGE` int(10) unsigned NOT NULL DEFAULT 0,
  `SETY_MAX_COUNT_PER_FACTION` tinyint(4) DEFAULT -1 COMMENT 'Max. amount of this city type per faction. Set to -1 to disable',
  PRIMARY KEY (`SETY_IDENT`),
  CONSTRAINT `SETTLEMENT_TYPE_CHECK` CHECK (`SETY_MIN_PLAYER_COUNT` >= 0)
) COMMENT='Type of a settlement. Controls the starting resources and building constraints. Also controls default lifes and max. craft blocks for being stationed at a city of this type';