/*
 * Represents destroyed objects during the execution of a action.
 * Important: This relates to multiple tables! (e.g. BUILDING_TYPE and BUILDING or UNIT_TYPE and UNIT)
 */
/*
 * Casualties are related to the following tables:
 *  - ACTION: The action in which this casualty did occur
 *  - other tables: depends on the value of ACCA_TYPE
 */
CREATE TABLE `ACTION_CASUALTY` (
  `ACCA_GUID` uuid NOT NULL,
  `ACCA_ACTION` uuid NOT NULL COMMENT 'In which action did this happen?',
  `ACCA_TYPE` varchar(100) NOT NULL DEFAULT 'UNIT' COMMENT 'What type of object did get destroyed?',
  `ACCA_IDENT` varchar(100) NOT NULL COMMENT 'Which instance got damaged or destroyed?',
  PRIMARY KEY (`ACCA_GUID`),
  CONSTRAINT `ACTION_CASUALTY_ACTION_FK` FOREIGN KEY (`ACCA_GUID`) REFERENCES `ACTION` (`ACTI_GUID`) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='Represents things that got destroyed during the execution of a action. Used for mainly units and buildings.\r\n\r\nThe "TYPE" represents "what" (which table in essence) was damaged and the ident represents the actual instance.';