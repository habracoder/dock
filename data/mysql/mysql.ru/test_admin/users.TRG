TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `admin_users_changes` AFTER UPDATE ON `users`\nFOR EACH ROW BEGIN\n\nIF OLD.is_manager != NEW.is_manager THEN\n    INSERT INTO `test_partners_changes`.`admin_users_changes`(`user`, `who`, `field`, `old_value`, `when`, `new_value`, `mysql_user`)\n        VALUES(NEW.login, @auth_login, \'is_manager\', OLD.is_manager, NOW(), NEW.is_manager, USER());\nEND IF;\n\n\n\n\nEND'
sql_modes=1342177280
definers='root@localhost'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='utf8_general_ci'
created=153375875357
