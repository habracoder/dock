TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `test_partners`.`tr_news_fulltext_bi`\n        BEFORE INSERT\n        ON `news_fulltext`\n        FOR EACH ROW\nBEGIN\n  IF @auth_login IS null THEN\n    INSERT INTO `test_partners_changes`.`null_who_change`(id, `who_change`) VALUES(null, @auth_login);\n  END IF;\n  SET NEW.who_change = @auth_login;\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER `test_partners`.`tr_news_fulltext_bu`\n        BEFORE UPDATE\n        ON `news_fulltext`\n        FOR EACH ROW\nBEGIN\n  IF @auth_login IS null THEN\n    INSERT INTO `test_partners_changes`.`null_who_change`(id, `who_change`) VALUES(null, @auth_login);\n  END IF;\n  SET NEW.who_change = @auth_login;\nEND'
sql_modes=1342177280 1342177280
definers='root@localhost' 'root@localhost'
client_cs_names='utf8' 'utf8'
connection_cl_names='utf8_general_ci' 'utf8_general_ci'
db_cl_names='utf8_general_ci' 'utf8_general_ci'
created=153375877640 153375877641
