TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `test_partners`.`g_hits_1_geo_zones_auction_data_before_update` BEFORE UPDATE ON `g_hits_1_geo_zones_auction_data`\nFOR EACH ROW BEGIN\n  IF ((NOW() - INTERVAL 1 HOUR) >= NEW.when_last_rotated) THEN\n    IF (NEW.shows_small - NEW.shows_small_2) > 50000  THEN\n      SET NEW.shows_small = NEW.shows_small - NEW.shows_small_2;\n      SET NEW.shows_small_2 = NEW.shows_small;\n\n      IF (NEW.clicks_small > NEW.clicks_small_2) THEN\n        SET NEW.clicks_small = NEW.clicks_small - NEW.clicks_small_2;\n        SET NEW.clicks_small_2 = NEW.clicks_small;\n      ELSE\n        SET NEW.clicks_small = 0;\n        SET NEW.clicks_small_2 = 0;\n      END IF;\n\n      SET NEW.when_last_rotated = NOW();\n\n    END IF;\n  END IF;\nEND'
sql_modes=1342177280
definers='root@localhost'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='utf8_general_ci'
created=153375877614
