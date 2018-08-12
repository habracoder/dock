TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `test_partners`.`tr_AI_goodsblock_position_page`\n        AFTER INSERT\n        ON `goodsblock_position_page`\n        FOR EACH ROW\nBEGIN\n\nINSERT INTO `test_partners_changes`.`goodsblock_position_page_changes`(`id`, `position`, `event`, `when`, `who`)\n	VALUES(NEW.id, NEW.position, \'insert\', NOW(), USER());\n\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER `test_partners`.`tr_BD_goodsblock_position_page`\n        AFTER DELETE\n        ON `goodsblock_position_page`\n        FOR EACH ROW\nBEGIN\n\nINSERT INTO `test_partners_changes`.`goodsblock_position_page_changes`(`id`, `position`, `event`, `when`, `who`)\n	VALUES(OLD.id, OLD.position, \'delete\', NOW(), USER());\n\nEND'
sql_modes=1342177280 1342177280
definers='root@localhost' 'root@localhost'
client_cs_names='utf8' 'utf8'
connection_cl_names='utf8_general_ci' 'utf8_general_ci'
db_cl_names='utf8_general_ci' 'utf8_general_ci'
created=153375877634 153375877635
