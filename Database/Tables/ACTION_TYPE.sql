/*
 * Represents the type of action (e.g. Route assault, city assault or deployment)
 * Holds the reference to the database function to call when this action is started and resolved.
 * Also holds the limit per settlement for this type of action
 */
/*
 * Action types are not directly related to any other tables. They are a dependency of the ACTION table
 */
CREATE TABLE `ACTION_TYPE` (
  `ACTY_IDENT` varchar(100) NOT NULL,
  `ACTY_START_FUNCTION` varchar(100) NOT NULL,
  `ACTY_RESOLVE_FUNCTION` varchar(100) NOT NULL,
  `ACTY_LIMIT_PER_CITY_AND_TURN` smallint(5) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`ACTY_IDENT`)
) COMMENT='Defines the type of a action.\r\nHolds the reference to the database functions to call when this action is resolved or started.\r\n\r\nAlso contains the limit per settlement for this action';