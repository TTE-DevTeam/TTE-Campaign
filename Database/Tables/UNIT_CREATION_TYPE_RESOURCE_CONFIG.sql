/*
 * Used for configuring the costs of unit types when they are created
 * Controls the divisors and fixed values as well as which blocks count as that resource
 */
CREATE TABLE `UNIT_CREATION_TYPE_RESOURCE_CONFIG` (
  `UTRC_TYPE` varchar(100) NOT NULL,
  `UTRC_RESOURCE_TYPE` varchar(100) NOT NULL COMMENT 'Relevant resource',
  `UTRC_BLOCK_FILTER` varchar(200) DEFAULT NULL COMMENT 'Filter for counting blocks to determine the amount',
  `UTRC_IGNORE_FILTER` varchar(200) DEFAULT NULL COMMENT 'Blocks that will be ignored',
  `UTRC_DIVISOR` int(11) DEFAULT NULL COMMENT 'If fixed costs are not set, this is used to divide stuff',
  `UTRC_FIXED_VALUE` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Wether or not this has fixed costs or not',
  `UTRC_BASE_VALUE` double NOT NULL DEFAULT 0 COMMENT 'Value to use when fixed value is set',
  KEY `UNIT_CREATION_TYPE_RESOURCE_CONFIG_UNIT_CREATION_TYPE_FK` (`UTRC_TYPE`),
  KEY `UNIT_CREATION_TYPE_RESOURCE_CONFIG_RESOURCE_TYPE_FK` (`UTRC_RESOURCE_TYPE`),
  CONSTRAINT `UNIT_CREATION_TYPE_RESOURCE_CONFIG_RESOURCE_TYPE_FK` FOREIGN KEY (`UTRC_RESOURCE_TYPE`) REFERENCES `RESOURCE_TYPE` (`RETY_IDENT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `UNIT_CREATION_TYPE_RESOURCE_CONFIG_UNIT_CREATION_TYPE_FK` FOREIGN KEY (`UTRC_TYPE`) REFERENCES `UNIT_CREATION_TYPE` (`UCTY_IDENT`) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='Used to generate the costs of a unit type and related to unit type creation';