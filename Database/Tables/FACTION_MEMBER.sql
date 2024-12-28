/*
 * This table represents the campaign participants
 * A participant has a minecraft UUID, discord ID and a faction associated with them
 * In addition there is a "VALID" flag which represents if this member is actually to be respected (represents if active or not)
 */
 /*
  * Faction members are related to the following tables:
  *  - FACTION: The faction this member belongs to
  */
CREATE TABLE `FACTION_MEMBER` (
  `FAME_MINECRAFT_UUID` varchar(36) NOT NULL,
  `FAME_DISCORD_USERID` varchar(100) NOT NULL,
  `FAME_FACTION` varchar(100) NOT NULL,
  `FAME_VALID` tinyint(1) NOT NULL DEFAULT 1,
  `FAME_DISCORD_TAG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FAME_DISCORD_USERID`),
  KEY `FACTION_MEMBER_FACTION_FK` (`FAME_FACTION`),
  CONSTRAINT `FACTION_MEMBER_FACTION_FK` FOREIGN KEY (`FAME_FACTION`) REFERENCES `FACTION` (`FACT_IDENT`) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='Represents a member of a faction.\r\nContains discord user ID, minecraft UUID and the faction to associate where a user belongs to';