TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `test_partners`.`tr_BU_clients_sites_statuses` BEFORE UPDATE ON `test_partners`.`clients_sites_statuses`\nFOR EACH ROW BEGIN\n\nIF OLD.`status_id` != NEW.`status_id` THEN\n    SET NEW.`when_checked` = NOW();\nEND IF;\n\nEND'
sql_modes=1342177280
definers='root@localhost'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='utf8_general_ci'
created=153375877590
