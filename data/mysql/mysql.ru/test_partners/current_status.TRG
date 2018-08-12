TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `current_status_add` AFTER INSERT ON `current_status`\n FOR EACH ROW BEGIN \n\n  INSERT IGNORE INTO `current_status_notifies`(`key`) VALUES (NEW.`key`)\n    ON DUPLICATE KEY UPDATE when_change = NOW();\n\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER test_partners.mysql_lag\n	BEFORE UPDATE\n	ON test_partners.current_status\n	FOR EACH ROW\nIF (NEW.`key` = \'mysql_reserveslave_lag\' OR NEW.`key` = \'mysql_slave_lag\') AND (NEW.`value` - OLD.`value`) > 0 AND TO_SECONDS(NOW()) - TO_SECONDS(OLD.when_change) < (NEW.`value` - OLD.`value`) AND ROUND(RAND()*10) != 0 THEN \n\nSET NEW.value = OLD.value; SET NEW.when_change = OLD.when_change;\nEND IF' 'CREATE DEFINER=`root`@`localhost` TRIGGER `test_partners`.`tr_BU_current_status` BEFORE UPDATE ON `current_status`\n FOR EACH ROW BEGIN\n\nIF OLD.`value` != NEW.`value`\n|| OLD.`text` != NEW.`text`\n|| OLD.`host_name` != NEW.`host_name`\n|| OLD.`ord` != NEW.`ord`\nTHEN\n    SET NEW.`when_change` = NOW();\nEND IF;\n\nEND'
sql_modes=1342177280 1342177280 1342177280
definers='root@localhost' 'root@localhost' 'root@localhost'
client_cs_names='utf8' 'utf8' 'utf8'
connection_cl_names='utf8_general_ci' 'utf8_general_ci' 'utf8_general_ci'
db_cl_names='utf8_general_ci' 'utf8_general_ci' 'utf8_general_ci'
created=153375877594 153375877595 153375877596
