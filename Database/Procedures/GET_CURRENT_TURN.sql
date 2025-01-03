CREATE FUNCTION `tte-campaign`.`GET_CURRENT_TURN`() RETURNS uuid
    DETERMINISTIC
BEGIN
	DECLARE RESULT UUID;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
		RETURN NULL;
	END;

	BEGIN
		SELECT 
			TURN_GUID INTO RESULT
		FROM
			TURN
		WHERE 
			TURN_ACTIVE = FALSE
		ORDER BY
			TURN_START_DATE DESC
		FETCH FIRST 1 ROW ONLY;
	END;
END