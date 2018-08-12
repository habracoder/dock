TYPE=VIEW
query=select `d`.`alias` AS `alias`,`d`.`type` AS `type`,concat(`b`.`width`,\'x\',`b`.`height`) AS `banner_size`,`g`.`tickers_composite_id` AS `tickers_composite_id`,(`g`.`revenue_today` / 1000) AS `revenue`,(`g`.`wages_today` / 1000) AS `wages`,((`g`.`revenue_today` - `g`.`wages_today`) / 1000) AS `profit` from (((`test_partners`.`g_blocks` `g` join `test_partners`.`dsp_endpoints_widgets` `dw` on((`g`.`tickers_composite_id` = `dw`.`tickers_composite_id`))) join `test_partners`.`dsp_endpoints` `d` on((`d`.`id` = `dw`.`endpoint_id`))) left join `test_partners`.`banner_formats` `b` on((`b`.`banner_id` = `dw`.`banner_size`))) where ((`g`.`is_ssp` = 1) and (`g`.`wages_today` > 0)) order by `g`.`revenue_today` desc
md5=042e077f14f6b5ff96e4b5c4089ef189
updatable=0
algorithm=0
definer_user=user_korniychuk
definer_host=%
suid=1
with_check_option=0
timestamp=2018-08-08 20:06:15
create-version=1
source=select `d`.`alias` AS `alias`,`d`.`type` AS `type`,concat(`b`.`width`,\'x\',`b`.`height`) AS `banner_size`,`g`.`tickers_composite_id` AS `tickers_composite_id`,(`g`.`revenue_today` / 1000) AS `revenue`,(`g`.`wages_today` / 1000) AS `wages`,((`g`.`revenue_today` - `g`.`wages_today`) / 1000) AS `profit` from (((`g_blocks` `g` join `dsp_endpoints_widgets` `dw` on((`g`.`tickers_composite_id` = `dw`.`tickers_composite_id`))) join `dsp_endpoints` `d` on((`d`.`id` = `dw`.`endpoint_id`))) left join `banner_formats` `b` on((`b`.`banner_id` = `dw`.`banner_size`))) where ((`g`.`is_ssp` = 1) and (`g`.`wages_today` > 0)) order by `g`.`revenue_today` desc
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_unicode_ci
view_body_utf8=select `d`.`alias` AS `alias`,`d`.`type` AS `type`,concat(`b`.`width`,\'x\',`b`.`height`) AS `banner_size`,`g`.`tickers_composite_id` AS `tickers_composite_id`,(`g`.`revenue_today` / 1000) AS `revenue`,(`g`.`wages_today` / 1000) AS `wages`,((`g`.`revenue_today` - `g`.`wages_today`) / 1000) AS `profit` from (((`test_partners`.`g_blocks` `g` join `test_partners`.`dsp_endpoints_widgets` `dw` on((`g`.`tickers_composite_id` = `dw`.`tickers_composite_id`))) join `test_partners`.`dsp_endpoints` `d` on((`d`.`id` = `dw`.`endpoint_id`))) left join `test_partners`.`banner_formats` `b` on((`b`.`banner_id` = `dw`.`banner_size`))) where ((`g`.`is_ssp` = 1) and (`g`.`wages_today` > 0)) order by `g`.`revenue_today` desc
