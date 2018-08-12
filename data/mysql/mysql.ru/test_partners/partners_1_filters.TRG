TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `test_partners`.`tr_BI_partners_1_filters`\n        BEFORE INSERT\n        ON `partners_1_filters`\n        FOR EACH ROW\nBEGIN\n\n  SELECT `uid` FROM `tickers` WHERE `id` = NEW.`src_id` INTO @uid;\n  SET NEW.`tickers_uid` = @uid;\n\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER `test_partners`.`tr_BU_partners_1_filters`\n        BEFORE UPDATE\n        ON `partners_1_filters`\n        FOR EACH ROW\nBEGIN\n\n  SELECT `uid` FROM `tickers` WHERE `id` = NEW.`src_id` INTO @uid;\n  SET NEW.`tickers_uid` = @uid;\n\nEND'
sql_modes=1342177280 1342177280
definers='root@localhost' 'root@localhost'
client_cs_names='utf8' 'utf8'
connection_cl_names='utf8_general_ci' 'utf8_general_ci'
db_cl_names='utf8_general_ci' 'utf8_general_ci'
created=153375877652 153375877653
