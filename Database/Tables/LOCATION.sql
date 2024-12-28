/*
 * Represents a location in the game world. Consists of worldname, x, y and z components
 */
/*
 * Locations are related to the following tables:
 *  - BUILDING: the location this building is at
 *  - UNIT_INSTANCE: where this unit was last released or piloted at
 */
CREATE TABLE `LOCATION` (
  `LOCA_WORLD` varchar(100) NOT NULL,
  `LOCA_X` int(11) NOT NULL,
  `LOCA_Y` int(11) NOT NULL,
  `LOCA_Z` int(11) NOT NULL,
  `LOCA_UUID` uuid NOT NULL DEFAULT uuid() COMMENT 'Automatically generated ID for this location, used for referencing',
  PRIMARY KEY (`LOCA_UUID`)
) COMMENT='Represents a location in the game world';