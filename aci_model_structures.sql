USE `aci` ;

DELIMITER $$

CREATE TRIGGER update_connection_date_updated
BEFORE UPDATE ON connection
FOR EACH ROW
BEGIN
        SET NEW.date_updated = NOW();
END $$

DELIMITER ;


CREATE VIEW all_connections AS
SELECT *
FROM connection;

DELIMITER $$

CREATE TRIGGER update_alert_date_updated
BEFORE UPDATE ON alert
FOR EACH ROW
BEGIN
    SET NEW.date_updated = NOW();
END $$

DELIMITER ;

CREATE VIEW all_alerts AS
SELECT *
FROM alert;


DELIMITER $$

CREATE TRIGGER update_training_date_updated
BEFORE UPDATE ON training
FOR EACH ROW
BEGIN
    SET NEW.date_updated = NOW();
END $$

DELIMITER ;

CREATE VIEW all_trainings AS
SELECT *
FROM training;

DELIMITER ;

DELIMITER $$

CREATE TRIGGER update_insight_date_updated
BEFORE UPDATE ON insight
FOR EACH ROW
BEGIN
    SET NEW.date_updated = NOW();
END $$

DELIMITER ;

CREATE VIEW all_insights AS
SELECT *
FROM insight;

DELIMITER $$

CREATE TRIGGER update_category_date_updated
BEFORE UPDATE ON category
FOR EACH ROW
BEGIN
    SET NEW.date_updated = NOW();
END $$

DELIMITER ;

CREATE VIEW all_categories AS
SELECT *
FROM category;

CREATE VIEW all_insights_with_category AS
SELECT category.identifier, category.denomination, insight.identifier as "insight.identifier", insight.denomination AS "insight.denomination" FROM insight
LEFT JOIN category ON insight.category_identifier = category.identifier;


CREATE VIEW all_alerts_with_training AS
SELECT training.identifier, training.denomination, alert.identifier as "alert.identifier", alert.intervene_contact, alert.intervene_agent, alert.original_routing_profile, alert.destination_routing_profile, alert.transfered_agent, alert.is_solved AS "alert.is_solved", alert.date_registered AS "alert.date_registered"
FROM training LEFT JOIN alert ON alert.training_identifier = training.identifier;


DELIMITER //

CREATE PROCEDURE get_all_connections()
BEGIN
    SELECT * FROM all_connections;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE get_all_alerts()
BEGIN
    SELECT * FROM all_alerts;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE get_all_trainings()
BEGIN
    SELECT * FROM all_trainings;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE get_all_insights()
BEGIN
    SELECT * FROM all_insights;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE get_all_categories()
BEGIN
    SELECT * FROM all_categories;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE get_connection_by_identifier(IN id INT UNSIGNED)
BEGIN
    SELECT uid, supervisor, denomination, description, date_joined FROM connection WHERE identifier = id;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE get_alert_by_identifier(IN id BIGINT UNSIGNED)
BEGIN
    SELECT connection_identifier, insight_identifier, training_identifier, intervene_contact, intervene_agent, original_routing_profile, destination_routing_profile, transfered_agent, date_registered, is_solved, date_training_completed FROM alert WHERE identifier = id;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE get_training_by_identifier(IN id SMALLINT UNSIGNED)
BEGIN
    SELECT denomination, description, date_joined FROM training WHERE identifier = id;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE get_insight_by_identifier(IN id SMALLINT UNSIGNED)
BEGIN
    SELECT denomination, description, date_registered FROM insight WHERE identifier = id;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE get_category_by_identifier(IN id TINYINT UNSIGNED)
BEGIN
    SELECT denomination, description, priority, date_registered FROM insight WHERE identifier = id;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE get_insight_with_category_by_identifier(IN id TINYINT UNSIGNED)
BEGIN
    SELECT category.identifier, category.denomination, insight.identifier as "insight.identifier", insight.denomination AS "insight.denomination" FROM insight
LEFT JOIN category ON insight.category_identifier = category.identifier WHERE category.identifier = id;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE get_alert_with_training_by_identifier(IN id BIGINT UNSIGNED)
BEGIN
SELECT training.identifier, training.denomination, alert.identifier as "alert.identifier", alert.intervene_contact, alert.intervene_agent, alert.original_routing_profile, alert.destination_routing_profile, alert.transfered_agent, alert.is_solved AS "alert.is_solved", alert.date_registered AS "alert.date_registered"
FROM training LEFT JOIN alert ON alert.training_identifier = training.identifier WHERE alert.identifier = id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE insert_connection(IN uid_value VARCHAR(200), IN supervisor_value VARCHAR(200), IN denomination_value VARCHAR(100), IN description_value TINYTEXT)
BEGIN
INSERT INTO connection(uid, supervisor, denomination, description) VALUE (uid_value, supervisor_value, denomination_value, description_value);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE insert_training(IN denomination_value VARCHAR(100), IN description_value TEXT)
BEGIN
INSERT INTO training(denomination, description) VALUE (denomination_value, description_value);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE insert_category(IN denomination_value VARCHAR(100), IN description_value TINYTEXT, IN priority_value TINYINT UNSIGNED)
BEGIN
INSERT INTO category(denomination, description, priority) VALUE (denomination_value, description_value, priority_value);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE insert_insight(IN category_identifier_value TINYINT UNSIGNED, IN denomination_value VARCHAR(100), IN description_value TEXT)
BEGIN
INSERT INTO insight(category_identifier, denomination, description) VALUE (category_identifier_value, denomination_value, description_value);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE insert_alert(IN connection_identifier_value INT UNSIGNED, IN insight_identifier_value SMALLINT UNSIGNED, IN training_identifier_value SMALLINT UNSIGNED, IN intervene_contact_value VARCHAR(200), IN intervene_agent_value VARCHAR(200), IN original_routing_profile_value VARCHAR(200), IN destination_routing_profile_value VARCHAR(200), IN transfered_agent VARCHAR(200), IN resource_value VARCHAR(200))
BEGIN
INSERT INTO alert(connection_identifier, insight_identifier, training_identifier, intervene_contact, intervene_agent, original_routing_profile, destination_routing_profile, transfered_agent, resource) VALUE (connection_identifier_value, insight_identifier_value, training_identifier_value, intervene_contact_value, intervene_agent_value, original_routing_profile_value, destination_routing_profile_value, transfered_agent_value, resource_value);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE complete_alert_training(IN alert_identifier_value BIGINT UNSIGNED)
BEGIN
UPDATE alert SET date_training_completed = NOW() WHERE identifier = alert_identifier_value;
END //

DELIMITER ;
