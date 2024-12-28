/*
 * This table represents existing building types 
 * A building type is a type of node.
 * It has a optional requirement for biomes where it can be placed.
 * Also a potential default schematic that can be used.
 * Also has fields for tonnage production and resource storage.
 */
 /*
  * Building types are related to the following tables:
  *  - BUILDING: Buildings that are of this type. If the type is deleted, all associated buildings are deleted too
  *  - BUILDING_TYPE_ECONOMY VALUES: Represents cost, production rate, repair costs and consumption rates per resource for this type
  *  - RESOURCE_TYPE: The resource that this building can store or is associated with (e.g. a sawmill is associated with CONSTRUCTION but cant store them while a CONSTRUCTION WAREHOUSE can store it)
  *  - SETTLEMENT_TYPE_BUILDING_CONSTRAINTS: Settlement to type relation that controls which settlement can place which building
  *  - UNIT_CREATION_TYPE: Represents creation requirements for UNIT_TYPEs. For example for ships this would represent a shipyard
  */
CREATE TABLE `BUILDING_TYPE` (
  `BUTY_IDENT` varchar(100) NOT NULL,
  `BUTY_STORED_RESOURCE` varchar(100) DEFAULT NULL COMMENT 'Represents the resource that this building can store',
  `BUTY_STORAGE_CAPACITY` mediumint(8) unsigned DEFAULT 0 COMMENT 'How much of the aforementioned resource can be stored?',
  `BUTY_SCHEMATIC` blob DEFAULT NULL,
  `BUTY_BIOME_TAG` varchar(255) DEFAULT NULL COMMENT 'In which biomes can this building be placed?',
  `BUTY_TONNAGE_PRODUCTION_RATE` mediumint(8) unsigned NOT NULL DEFAULT 0 COMMENT 'How much craft blocks can this building produce per turn?',
  PRIMARY KEY (`BUTY_IDENT`),
  KEY `BUILDING_TYPE_RESOURCE_TYPE_FK` (`BUTY_STORED_RESOURCE`),
  CONSTRAINT `BUILDING_TYPE_RESOURCE_TYPE_FK` FOREIGN KEY (`BUTY_STORED_RESOURCE`) REFERENCES `RESOURCE_TYPE` (`RETY_IDENT`) ON DELETE SET NULL ON UPDATE SET NULL
) COMMENT='Represents building types (e.g. shipyard, sawmill, science lab, warehouse).';