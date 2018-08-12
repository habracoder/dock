TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER use_trc_changes_before\nBEFORE UPDATE ON use_trc\nFOR EACH ROW\nBEGIN\n	IF OLD.type = 3 AND NEW.type !=3 THEN\n\n	INSERT INTO `test_partners_changes`.`use_trc_changes`(`parent_id`, `when`, `mysql_user`, `who`, `trc_id`)\n	VALUES(OLD.parent_id, NOW(), USER(), CONCAT(@auth_login, \'---type---\', NEW.type), OLD.trc_id);\n\n	END IF;\n\n	IF OLD.parent_id != NEW.parent_id THEN\n\n	INSERT INTO `test_partners_changes`.`use_trc_changes`(`parent_id`, `when`, `mysql_user`, `who`, `trc_id`)\n	VALUES(OLD.parent_id, NOW(), USER(), CONCAT(@auth_login, \'---parent_id---\', NEW.parent_id), OLD.trc_id);\n\n	END IF;\n    END' 'CREATE DEFINER=`root`@`localhost` TRIGGER `use_trc_delete_check` BEFORE DELETE ON `use_trc`\nFOR EACH ROW BEGIN\n\nIF (OLD.type = 3) THEN\n\nINSERT INTO `test_partners_changes`.`use_trc_changes`(`parent_id`, `when`, `mysql_user`, `who`, `trc_id`)\nVALUES(OLD.parent_id, NOW(), USER(), @auth_login, OLD.trc_id);\n\nEND IF;\n\nEND'
sql_modes=0 0
definers='root@localhost' 'root@localhost'
client_cs_names='utf8' 'utf8'
connection_cl_names='utf8_general_ci' 'utf8_general_ci'
db_cl_names='utf8_general_ci' 'utf8_general_ci'
created=153375877683 153375877684
