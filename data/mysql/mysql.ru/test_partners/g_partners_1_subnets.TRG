TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `tr_AI_g_partners_1_subnets` AFTER INSERT ON `g_partners_1_subnets` FOR EACH ROW BEGIN\n\nUpdate `g_partners_1` g\n  set g.updated_time = Now()\n  where g.id = NEW.id;\n\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER `tr_AU_g_partners_1_subnets`\n        AFTER UPDATE\n        ON `g_partners_1_subnets`\n        FOR EACH ROW\nBEGIN\n\nIF new.subnet_id <> OLD.subnet_id then\n\nUpdate `g_partners_1` g\n  set g.updated_time = Now()\n  where g.id = NEW.id;\n\nend if;\n\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER `tr_AD_g_partners_1_subnets` AFTER DELETE ON `g_partners_1_subnets` FOR EACH ROW BEGIN\n\n\nUpdate `g_partners_1` g\n  set g.updated_time = Now()\n  where g.id = OLD.id;\n\nEND'
sql_modes=1342177280 0 1342177280
definers='root@localhost' 'root@localhost' 'root@localhost'
client_cs_names='utf8mb4' 'utf8' 'utf8mb4'
connection_cl_names='utf8mb4_unicode_ci' 'utf8_general_ci' 'utf8mb4_unicode_ci'
db_cl_names='utf8_general_ci' 'utf8_general_ci' 'utf8_general_ci'
created=153375877622 153375877623 153375877624
