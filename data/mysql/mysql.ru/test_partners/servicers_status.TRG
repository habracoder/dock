TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `servicers_status_add` AFTER INSERT ON `servicers_status`\n FOR EACH ROW BEGIN\n\n  INSERT IGNORE INTO `servicers_status_notifies`(`id`) VALUES (NEW.`id`)\n    ON DUPLICATE KEY UPDATE when_change = NOW();\n\nEND'
sql_modes=1342177280
definers='root@localhost'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='utf8_general_ci'
created=153375877666
