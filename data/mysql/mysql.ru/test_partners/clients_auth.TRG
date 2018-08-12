TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `test_partners`.`tr_AU_clients_auth`\n        AFTER UPDATE\n        ON `clients_auth`\n        FOR EACH ROW\nBEGIN\n\n  IF OLD.password != NEW.password THEN\n    INSERT INTO `test_partners_changes`.`overall_log`(`table`, `table_id`, `who`, `action`, `old_values`, `new_values`)\n          VALUES (\'clients_auth\', OLD.id, CONCAT(@auth_login, \' / \', USER()), \'UPDATE\', OLD.password, NEW.password);\n  END IF;\n\nEND'
sql_modes=1342177280
definers='root@localhost'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='utf8_general_ci'
created=153375877580
