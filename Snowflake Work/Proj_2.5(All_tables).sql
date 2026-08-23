-- IoT + Container Details
SELECT
    i.event_id,
    i.container_id,
    i.product_id,
    i.temperature,
    i.humidity,
    i.vibration,
    c.source,
    c.destination,
    c.quantity
FROM ATMOSYNC_PROJ_2_DB.RAW.IOT_SENSOR_DATA i
JOIN ATMOSYNC_PROJ_2_DB.RAW.CONTAINER_DETAILS c
    ON i.container_id = c.container_id;
    -- limit 1;

-- COMTAINER + COMMODITY PRICE 
SELECT
    c.container_id,
    c.product_id,
    c.quantity,
    c.source,
    c.destination,
    p.commodity,
    p.market,
    p.price
FROM ATMOSYNC_PROJ_2_DB.RAW.CONTAINER_DETAILS c
JOIN ATMOSYNC_PROJ_2_DB.RAW.COMMODITY_PRICE p
    ON c.container_id = p.container_id
   AND c.product_id = p.product_id
LIMIT 1;

-- COMBINE ALL 4 TABLE THROUGH JOIN 
SELECT
    i.event_id,
    i.container_id,
    i.product_id,
    i.temperature,
    i.humidity,
    i.vibration,
    c.quantity,
    c.source,
    c.destination,
    p.commodity,
    p.market,
    p.price,
    m.city,
    m.state
FROM ATMOSYNC_PROJ_2_DB.RAW.IOT_SENSOR_DATA i

JOIN ATMOSYNC_PROJ_2_DB.RAW.CONTAINER_DETAILS c
    ON i.container_id = c.container_id
   AND i.product_id = c.product_id

JOIN ATMOSYNC_PROJ_2_DB.RAW.COMMODITY_PRICE p
    ON c.container_id = p.container_id
   AND c.product_id = p.product_id

JOIN ATMOSYNC_PROJ_2_DB.RAW.MARKET_DETAILS m
    ON p.product_id = m.product_id
   AND p.market = m.market;


-- SELECT
--     i.event_id,
--     i.container_id,
--     i.product_id,
--     i.temperature,
--     i.humidity,
--     i.vibration,
--     c.source,
--     c.destination,
--     c.quantity
-- FROM ATMOSYNC_PROJ_2_DB.RAW.IOT_SENSOR_DATA i
-- JOIN ATMOSYNC_PROJ_2_DB.RAW.CONTAINER_DETAILS c
--     ON i.container_id = c.container_id
--    AND i.product_id = c.product_id;

-- select 
--     container_id,
--     product_id,
--     count(*) as cnt
-- from atmosync_proj_2_db.raw.container_details
-- group by container_id,product_id
-- HAVING count(*) > 1
-- order by cnt desc;



-- SELECT
--     container_id,
--     product_id,
--     source,
--     destination,
--     quantity,
--     COUNT(*) AS cnt
-- FROM ATMOSYNC_PROJ_2_DB.RAW.CONTAINER_DETAILS
-- GROUP BY
--     container_id,
--     product_id,
--     source,
--     destination,
--     quantity
-- HAVING COUNT(*) > 1
-- ORDER BY cnt DESC;

-- CREATE OR REPLACE TABLE ATMOSYNC_PROJ_2_DB.RAW.CONTAINER_DETAILS_CLEAN AS
-- SELECT *
-- FROM ATMOSYNC_PROJ_2_DB.RAW.CONTAINER_DETAILS
-- QUALIFY ROW_NUMBER() OVER (
--     PARTITION BY
--         container_id,
--         product_id,
--         source,
--         destination,
--         quantity
--     ORDER BY dispatch_date
-- ) = 1;

-- select * 
-- from ATMOSYNC_PROJ_2_DB.RAW.CONTAINER_DETAILS_CLEAN
-- limit 20;

-- SELECT
--     container_id,
--     product_id,
--     source,
--     destination,
--     quantity,
--     COUNT(*) AS cnt
-- FROM ATMOSYNC_PROJ_2_DB.RAW.CONTAINER_DETAILS_CLEAN
-- GROUP BY
--     container_id,
--     product_id,
--     source,
--     destination,
--     quantity
-- HAVING COUNT(*) > 1;




-- SELECT
--     s.event_id,
--     s.container_id,
--     s.product_id,
--     s.temperature,
--     s.humidity,
--     s.vibration,
--     c.source,
--     c.destination,
--     c.quantity
-- FROM ATMOSYNC_PROJ_2_DB.RAW.CONTAINER_DETAILS_CLEAN s
-- JOIN ATMOSYNC_PROJ_2_DB.RAW.CONTAINER_DETAILS c
--     ON i.container_id = c.container_id;

    