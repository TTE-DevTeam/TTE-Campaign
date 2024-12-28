/*
 * Represents the turns of the game
 * The currently active turn is the first turn that has the "ACTIVE" flag set ordered by the start date (descending)
 */
CREATE TABLE `TURN` (
  `TURN_GUID` uuid NOT NULL DEFAULT uuid(),
  `TURN_START_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `TURN_END_DATE` datetime DEFAULT NULL,
  `TURN_ACTIVE` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`TURN_GUID`)
) COMMENT='Represents the game turns. There at most can only ever be one active turn';