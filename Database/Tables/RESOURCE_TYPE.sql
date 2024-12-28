/*
 * Represents a abstract resource togehter with the tag used to count it in buildings and units
 */
/*
 * Resource types are related to the following tables:
 *  - SETTLEMENT_STORAGE: the amount per resource that the settlement holds. If the resource is deleted, the stocks are deleted too
 *  - SETTLEMENT_TYPE_ECONOMY_VALUES: Resources this settlement grants upon construction (starting resources)
 *  - BUILDING_TYPE: The resource associated with this building
 *  - BUILDING_TYPE_ECONOMY_VALUES: Resource for construction, repair, upkeep costs as well as production rate
 *  - TRADE_ROUTE_RESOURCES: Resource getting transported in this trade route
 *  - UNIT_CREATION_TYPE_RESOURCE_CONFIG: Configuration per unit type (construction and upkeep costs); Used to create the actual UNIT_TYPE_COSTS for a UNIT_TYPE
 *  - UNIT_TYPE_COSTS: Actual costs of a Unit
 */
CREATE TABLE `RESOURCE_TYPE` (
  `RETY_IDENT` varchar(100) NOT NULL,
  `RETY_DATAPACK_TAG` varchar(255) DEFAULT NULL COMMENT 'Datapack tag used for counting this resource in units',
  `RETY_MINECRAFT_ITEM` varchar(256) DEFAULT NULL COMMENT 'Item associated in minecraft, currently unused but maybe useful for displaying stuff',
  PRIMARY KEY (`RETY_IDENT`)
) COMMENT='Represents a resource';