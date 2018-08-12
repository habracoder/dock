TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `g_properties_add` AFTER INSERT ON `g_properties`\n FOR EACH ROW BEGIN \n\nIF (NEW.type = 2) THEN\n\nINSERT INTO `test_partners_changes`.`g_properties_changes`(`parent_id`, `when`, `mysql_user`, `who`, `trc_id`)\nVALUES(NEW.parent_id, NOW(), CONCAT(\'insert_type2\', USER()), @auth_login, NEW.trc_id);\n\nEND IF;\n\nIF (NEW.type = 3) THEN\n\nINSERT INTO `test_partners_changes`.`g_properties_changes`(`parent_id`, `when`, `mysql_user`, `who`, `trc_id`)\nVALUES(NEW.parent_id, NOW(), CONCAT(\'insert_type3\', USER()), @auth_login, NEW.trc_id);\n\nEND IF;\n\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER `g_properties_delete_check` BEFORE DELETE ON `g_properties`\n FOR EACH ROW BEGIN\n\nIF (OLD.type = 2) THEN\n\nINSERT INTO `test_partners_changes`.`g_properties_changes`(`parent_id`, `when`, `mysql_user`, `who`, `trc_id`)\nVALUES(OLD.parent_id, NOW(), CONCAT(\'delete_type2\', USER() ), @auth_login, OLD.trc_id);\n\nEND IF;\n\nIF (OLD.type = 3) THEN\n\nINSERT INTO `test_partners_changes`.`g_properties_changes`(`parent_id`, `when`, `mysql_user`, `who`, `trc_id`)\nVALUES(OLD.parent_id, NOW(), CONCAT(\'delete_type3\', USER() ), @auth_login, OLD.trc_id);\n\nEND IF;\n\nEND'
sql_modes=0 0
definers='root@localhost' 'root@localhost'
client_cs_names='utf8' 'utf8'
connection_cl_names='utf8_general_ci' 'utf8_general_ci'
db_cl_names='utf8_general_ci' 'utf8_general_ci'
created=153375877625 153375877627
