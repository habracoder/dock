TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `test_partners`.`geo_zones_groups_consistency_before_insert` BEFORE INSERT ON `test_partners`.`geo_zones_groups`\nFOR EACH ROW BEGIN\n\nIF new.geo_zones_ids LIKE \'% %\' THEN\n  SIGNAL SQLSTATE \'45000\'\n      SET MESSAGE_TEXT = \'Whitespace is not allowed in `geo_zones_ids`(TriggerError)\', MYSQL_ERRNO = 1001;\nEND IF;\n\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER `test_partners`.`geo_zones_groups_consistency_before_update` BEFORE UPDATE ON `test_partners`.`geo_zones_groups`\nFOR EACH ROW BEGIN\n\nIF new.geo_zones_ids LIKE \'% %\' THEN\n  SIGNAL SQLSTATE \'45000\'\n      SET MESSAGE_TEXT = \'Whitespace is not allowed in `geo_zones_ids`(TriggerError)\', MYSQL_ERRNO = 1001;\nEND IF;\n\nEND'
sql_modes=1342177280 1342177280
definers='root@localhost' 'root@localhost'
client_cs_names='utf8' 'utf8'
connection_cl_names='utf8_general_ci' 'utf8_general_ci'
db_cl_names='utf8_general_ci' 'utf8_general_ci'
created=153375877629 153375877630
