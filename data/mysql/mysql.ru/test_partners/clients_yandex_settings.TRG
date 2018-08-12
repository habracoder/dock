TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `test_partners`.`yd_settings_add` AFTER INSERT ON `test_partners`.`clients_yandex_settings`\nFOR EACH ROW BEGIN\n\nINSERT INTO `test_partners_changes`.`clients_yandex_settings_changes` (`client_id`, `action`, `when`, `who`, `mysql_user`)\nVALUES (NEW.clients_id, \'add\', NOW(), @auth_login, USER());\n\n\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER `test_partners`.`yd_settings_update` AFTER UPDATE ON `test_partners`.`clients_yandex_settings`\nFOR EACH ROW BEGIN\n\nINSERT INTO `test_partners_changes`.`clients_yandex_settings_changes` (`client_id`, `action`, `when`, `who`, `mysql_user`)\nVALUES (OLD.clients_id, \'edit\', NOW(), @auth_login, USER());\n\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER `test_partners`.`yd_settings_del` AFTER DELETE ON `test_partners`.`clients_yandex_settings`\nFOR EACH ROW BEGIN\n\nINSERT INTO `test_partners_changes`.`clients_yandex_settings_changes` (`client_id`, `action`, `when`, `who`, `mysql_user`)\nVALUES (OLD.clients_id, \'delete\', NOW(), @auth_login, USER());\n\nEND'
sql_modes=1342177280 1342177280 1342177280
definers='root@localhost' 'root@localhost' 'root@localhost'
client_cs_names='utf8' 'utf8' 'utf8'
connection_cl_names='utf8_general_ci' 'utf8_general_ci' 'utf8_general_ci'
db_cl_names='utf8_general_ci' 'utf8_general_ci' 'utf8_general_ci'
created=153375877591 153375877592 153375877593
