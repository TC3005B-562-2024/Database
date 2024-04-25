INSERT INTO connection(denomination) VALUE ("Amazon AWS");
INSERT INTO training(denomination) VALUE ("Health environment");
INSERT INTO training(denomination) VALUE ("Nice environment");
INSERT INTO category(denomination, priority) VALUE ("Working", 4);
INSERT INTO insight(category_identifier, denomination) VALUE (1, "Productivity");
INSERT INTO alert(connection_identifier, insight_identifier, training_identifier, resource) VALUE (1, 1, 1, "JKL");

CALL insert_connection("Google Inc", NULL);
CALL insert_training("Harmony environment", NULL);
CALL insert_category("Harmony", NULL, 4);
CALL insert_insight(2, "Nice relationships", NULL);
CALL insert_alert(2, 2, 1, "ABC");

SELECT * FROM alert;
