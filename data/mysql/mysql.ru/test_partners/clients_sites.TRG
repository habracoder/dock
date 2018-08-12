TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `clients_sites_delete_check` BEFORE DELETE ON `clients_sites`\n FOR EACH ROW BEGIN\n\n\n\n\n\nIF ((SELECT COUNT(id) FROM clients_sites_statuses WHERE client_site_id = OLD.id)>1) THEN\n    UPDATE clients_sites_statuses SET this_site_have_more_then_one_variations_in_clients_site_statuses=1 WHERE id=9999999;\nEND IF;\n\nEND'
sql_modes=1342177280
definers='root@localhost'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='utf8_general_ci'
created=153375877589
