TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `tickers_filters_delete_check` BEFORE DELETE ON `tickers_filters`\n FOR EACH ROW BEGIN\n\nIF @auth_login IS null THEN\n    INSERT INTO `test_partners_changes`.`null_who_change`(id, `who_change`) VALUES(null, @auth_login);\nEND IF;\n\nIF (LENGTH(@key) > 0) THEN\n    INSERT INTO `test_partners_changes`.`tickers_filters_changes`(`parent_id`, `src_id`, `who`, `field`, `old_value`, `when`, `new_value`)\n        VALUES(OLD.parent_id, OLD.`src_id`, @auth_login, \'delete\', @key, NOW(), \'\');\nELSE\n    INSERT INTO `test_partners_changes`.`tickers_filters_changes`(`invalid_key`) VALUES(\'access_denied\');\nEND IF;\n\nEND'
sql_modes=1342177280
definers='root@localhost'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='utf8_general_ci'
created=153375877678
