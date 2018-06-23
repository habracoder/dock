CREATE TABLE statistics_tmp.widget_statistics_clicks_goods
(
    date Date,
    timestamp UInt32,
    site UInt32 DEFAULT CAST(0 AS UInt32),
    composite UInt32 DEFAULT CAST(0 AS UInt32),
    uid UInt32,
    widget_category UInt8 DEFAULT 0,
    widget_subnet UInt8 DEFAULT 0,
    show_hash String DEFAULT '',
    muidn String,
    country UInt32,
    device Enum8('desktop' = 1, 'mobile' = 2, 'tablet' = 3),
    os UInt8,
    page UInt32 DEFAULT CAST(0 AS UInt32),
    traffic_source String DEFAULT '',
    traffic_type String DEFAULT 'Direct',
    subid UInt32,
    clicks UInt8 DEFAULT 0,
    rejected_reason UInt8 DEFAULT 0,
    wages Int64 DEFAULT CAST(0 AS UInt64),
    type Int8,
    sign Int8 DEFAULT CAST(1 AS Int8),
    teaser UInt64 DEFAULT CAST(0 AS UInt64),
    teaser_category UInt8 DEFAULT 0,
    partner UInt32 DEFAULT CAST(0 AS UInt32),
    ad_types String DEFAULT '',
    ip String DEFAULT '',
    referer String DEFAULT '',
    region UInt32 DEFAULT CAST(0 AS UInt32),
    browser UInt8 DEFAULT 0,
    revenue Float64 DEFAULT CAST(0 AS Float64),
    g_partners_wages UInt64 DEFAULT CAST(0 AS UInt64),
    quality_factor Float32 DEFAULT CAST(1 AS Float32),
    show_hash_md5 String DEFAULT CAST(lower(hex(MD5(show_hash))) AS String),
    logline UInt32 DEFAULT CAST(0 AS UInt32),
    agent_ghits_wages Int64 DEFAULT CAST(0 AS Int64),
    landing_type String DEFAULT ''
)
ENGINE = CollapsingMergeTree(sign)
PARTITION BY date
ORDER BY (site, composite, uid, teaser, muidn, timestamp, type, show_hash, logline, partner)
