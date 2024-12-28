/*
 * This table represents the costs of a building type per single node
 * Buildings have a initial, running and repair cost as well as a production rate
 * This is configured per resource
 */
 /*
  * Building type economy values are related to the following tables:
  *  - BUILDING_TYPE: The building type associated, if the type is deleted, the economy values are deleted too
  *  - RESOURCE_TYPE: The associated resource for this cost. If the resource is deleted, the relevant row is deleted too
  */
CREATE TABLE `BUILDING_TYPE_ECONOMY_VALUES` (
  `BTEV_BUILDING_TYPE` varchar(100) NOT NULL,
  `BTEV_RESOURCE_TYPE` varchar(100) NOT NULL,
  `BTEV_CONSUMPTION_RATE` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `BTEV_PRODUCTION_RATE` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `BTEV_CONSTRUCTION_COST` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `BTEV_REPAIR_COSTS` mediumint(8) unsigned NOT NULL DEFAULT 0,
  KEY `BUILDING_TYPE_ECONOMY_VALUES_BUILDING_TYPE_FK` (`BTEV_BUILDING_TYPE`),
  KEY `BUILDING_TYPE_ECONOMY_VALUES_RESOURCE_TYPE_FK` (`BTEV_RESOURCE_TYPE`),
  CONSTRAINT `BUILDING_TYPE_ECONOMY_VALUES_BUILDING_TYPE_FK` FOREIGN KEY (`BTEV_BUILDING_TYPE`) REFERENCES `BUILDING_TYPE` (`BUTY_IDENT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BUILDING_TYPE_ECONOMY_VALUES_RESOURCE_TYPE_FK` FOREIGN KEY (`BTEV_RESOURCE_TYPE`) REFERENCES `RESOURCE_TYPE` (`RETY_IDENT`) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='Represents the initial and running costs of a building type per single node';