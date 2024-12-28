/*
 * This table represents all actions. 
 * A action has a type which represents what is being done. 
 * It belongs to the issuer, settlement and the turn it was issued at. 
 * A action always has a result and can have a target ID.
 */
 /*
  * Actions are related to the following tables:
  *  - ACTION_CASUALTY: Things that got destroyed during the execution of a action (e.g. a building)
  *  - SETTLEMENT: The settlement that issued this action. It is also used to retrieve the owning faction of this action
  *  - TURN: The turn this action was issued in
  */
CREATE TABLE `ACTION` (
  `ACTI_GUID` uuid NOT NULL DEFAULT uuid(),
  `ACTI_INITIATOR_SETTLEMENT` varchar(100) NOT NULL,
  `ACTI_TARGET_ID` varchar(100) DEFAULT NULL,
  `ACTI_TYPE` varchar(100) DEFAULT NULL,
  `ACTI_RESULT` varchar(100) NOT NULL,
  `ACTI_TARGET_TYPE` varchar(100) NOT NULL DEFAULT 'SETTLEMENT',
  `ACTI_TURN` uuid DEFAULT NULL,
  PRIMARY KEY (`ACTI_GUID`),
  KEY `ACTION_SETTLEMENT_FK` (`ACTI_INITIATOR_SETTLEMENT`),
  KEY `ACTION_TURN_FK` (`ACTI_TURN`),
  CONSTRAINT `ACTION_SETTLEMENT_FK` FOREIGN KEY (`ACTI_INITIATOR_SETTLEMENT`) REFERENCES `SETTLEMENT` (`SETT_IDENT`) ON UPDATE CASCADE,
  CONSTRAINT `ACTION_TURN_FK` FOREIGN KEY (`ACTI_TURN`) REFERENCES `TURN` (`TURN_GUID`) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='This table represents all actions. A action has a type which represents what is being done. It belongs to the issuer and the turn it was issued at. A action always has a result and can have a target ID. It also always has a settlement it belongs too';;