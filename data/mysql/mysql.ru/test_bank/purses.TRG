TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `update_purse` AFTER UPDATE ON `purses` FOR EACH ROW INSERT INTO `purse_log_check` \n\n  SET id = NEW.last_id,\n    account = NEW.account,\n    currency = NEW.currency,\n    money = NEW.money - OLD.money,\n    equiv = NEW.last_equiv,\n    tax = NEW.last_tax,\n    fee = NEW.last_fee,\n    last_rest = OLD.money,\n    new_rest = NEW.money,\n    who = NEW.who,\n    operation = NEW.last_operation,\n    dt = NEW.last_dt,\n    comment = NEW.last_comment,\n    partner = NEW.last_partner,\n    partner_type = NEW.last_partner_type,\n    `key` = NEW.last_key'
sql_modes=0
definers='root@localhost'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='utf8_general_ci'
created=153375875434
