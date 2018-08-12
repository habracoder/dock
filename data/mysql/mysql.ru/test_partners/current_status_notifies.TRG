TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `test_partners`.`current_status_notifies_changes`\nAFTER UPDATE\nON `current_status_notifies`\nFOR EACH ROW\nBEGIN\n\n  IF OLD.no_time_notify != NEW.no_time_notify OR (ISNULL(OLD.no_time_notify) AND NOT ISNULL(NEW.no_time_notify)) THEN\n    INSERT INTO `test_partners_changes`.`current_status_notifies_changes` (`key`, `who`, `field`, `old_value`, `new_value`, `when`, `mysql_user`)\n    VALUES (NEW.key, @auth_login, \'no_time_notify\', OLD.no_time_notify, NEW.no_time_notify, NOW(), USER());\n  END IF;\n\n  IF OLD.comment_notity != NEW.comment_notity THEN\n    INSERT INTO `test_partners_changes`.`current_status_notifies_changes` (`key`, `who`, `field`, `old_value`, `new_value`, `when`, `mysql_user`)\n    VALUES (NEW.key, @auth_login, \'comment_notity\', OLD.comment_notity, NEW.comment_notity, NOW(), USER());\n  END IF;\n\nEND'
sql_modes=1342177280
definers='root@localhost'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='utf8_general_ci'
created=153375877597
