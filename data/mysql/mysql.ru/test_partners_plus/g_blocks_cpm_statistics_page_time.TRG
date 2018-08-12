TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `test_partners_plus`.`g_blocks_cpm_statistics_page_time_changes_before` BEFORE UPDATE ON `g_blocks_cpm_statistics_page_time`\nFOR EACH ROW BEGIN\n  IF (\n    @g_blocks_cpm_rotation_seconds IS NOT NULL AND\n    @g_blocks_cpm_rotation_shows_count IS NOT NULL\n  ) THEN\n    IF (\n      NEW.shows - NEW.shows_2 >= @g_blocks_cpm_rotation_shows_count OR\n      UNIX_TIMESTAMP(NEW.last_rotation_time) <= UNIX_TIMESTAMP() - @g_blocks_cpm_rotation_seconds\n    ) THEN\n      SET NEW.shows = NEW.shows - NEW.shows_2;\n      SET NEW.shows_2 = NEW.shows;\n\n      SET NEW.revenue = NEW.revenue - NEW.revenue_2;\n      SET NEW.revenue_2 = NEW.revenue;\n\n      SET NEW.last_rotation_time = CURRENT_TIMESTAMP();\n    END IF;\n  END IF;\nEND'
sql_modes=1342177280
definers='root@localhost'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='utf8_general_ci'
created=153375877803
