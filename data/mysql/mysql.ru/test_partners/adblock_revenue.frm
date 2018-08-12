TYPE=VIEW
query=select `test_partners`.`g_blocks_sources_statistics`.`date` AS `date`,(sum(`test_partners`.`g_blocks_sources_statistics`.`revenue`) / 1000) AS `revenue` from `test_partners`.`g_blocks_sources_statistics` where ((`test_partners`.`g_blocks_sources_statistics`.`id_source` = 9999) and (year(`test_partners`.`g_blocks_sources_statistics`.`date`) = year(now())) and (month(`test_partners`.`g_blocks_sources_statistics`.`date`) = month(now()))) group by `test_partners`.`g_blocks_sources_statistics`.`date`
md5=495b751a5e0dbd6e84eb661dea46b32e
updatable=0
algorithm=0
definer_user=user_korniychuk
definer_host=%
suid=1
with_check_option=0
timestamp=2018-08-08 20:06:15
create-version=1
source=select `g_blocks_sources_statistics`.`date` AS `date`,(sum(`g_blocks_sources_statistics`.`revenue`) / 1000) AS `revenue` from `g_blocks_sources_statistics` where ((`g_blocks_sources_statistics`.`id_source` = 9999) and (year(`g_blocks_sources_statistics`.`date`) = year(now())) and (month(`g_blocks_sources_statistics`.`date`) = month(now()))) group by `g_blocks_sources_statistics`.`date`
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_unicode_ci
view_body_utf8=select `test_partners`.`g_blocks_sources_statistics`.`date` AS `date`,(sum(`test_partners`.`g_blocks_sources_statistics`.`revenue`) / 1000) AS `revenue` from `test_partners`.`g_blocks_sources_statistics` where ((`test_partners`.`g_blocks_sources_statistics`.`id_source` = 9999) and (year(`test_partners`.`g_blocks_sources_statistics`.`date`) = year(now())) and (month(`test_partners`.`g_blocks_sources_statistics`.`date`) = month(now()))) group by `test_partners`.`g_blocks_sources_statistics`.`date`
