-- # Database create
CREATE DATABASE IF NOT EXISTS ATMOSYNC_Proj_2_DB;
USE DATABASE ATMOSYNC_Proj_2_DB;

-- RAW Schema create
CREATE SCHEMA IF NOT EXISTS RAW;
USE SCHEMA RAW;

-- Warehouse check/create
CREATE WAREHOUSE IF NOT EXISTS ATMOSYNC_Proj_2_WH
WITH
WAREHOUSE_SIZE = 'XSMALL'
AUTO_SUSPEND = 60
AUTO_RESUME = TRUE;
USE WAREHOUSE ATMOSYNC_Proj_2_WH;


-- RAW IoT table create for senor data
CREATE TABLE IF NOT EXISTS ATMOSYNC_Proj_2_DB.RAW.IOT_SENSOR_DATA (
    event_id       VARCHAR(20),
    container_id   VARCHAR(20),
    product_id     VARCHAR(20),
    timestamp      TIMESTAMP_NTZ,
    temperature    FLOAT,
    humidity       FLOAT,
    vibration      FLOAT,
    latitude       FLOAT,
    longitude      FLOAT,
    location       VARCHAR(100)
);

-- Table check
SHOW TABLES;
DESC TABLE ATMOSYNC_Proj_2_DB.RAW.IOT_SENSOR_DATA;

-- Show table 
SELECT * 
from ATMOSYNC_Proj_2_DB.RAW.IOT_SENSOR_DATA;



-- RAW IoT table create for Container data
CREATE TABLE IF NOT EXISTS ATMOSYNC_PROJ_2_DB.RAW.CONTAINER_DETAILS (
    container_id   VARCHAR(20),
    product_id     VARCHAR(20),
    quantity       NUMBER,
    source         VARCHAR(100),
    destination    VARCHAR(100),
    dispatch_date  DATE
);

-- Table check
SHOW TABLES;
DESC TABLE ATMOSYNC_PROJ_2_DB.RAW.CONTAINER_DETAILS;

-- Show table 
SELECT * 
from ATMOSYNC_PROJ_2_DB.RAW.CONTAINER_DETAILS;

-- RAW IoT table create for Commodity data
CREATE TABLE IF NOT EXISTS ATMOSYNC_PROJ_2_DB.RAW.COMMODITY_PRICE (
    container_id   VARCHAR(20),
    product_id     VARCHAR(20),
    commodity      VARCHAR(100),
    market         VARCHAR(100),
    price          FLOAT,
    date           DATE
);

-- Table check
SHOW TABLES;
DESC TABLE ATMOSYNC_Proj_2_DB.RAW.COMMODITY_PRICE;

-- Show table 
SELECT * 
from ATMOSYNC_Proj_2_DB.RAW.COMMODITY_PRICE;


-- RAW IoT table create for Market data
CREATE TABLE IF NOT EXISTS ATMOSYNC_Proj_2_DB.RAW.MARKET_DETAILS (
    market_id    VARCHAR(20),
    product_id   VARCHAR(20),
    market       VARCHAR(100),
    city         VARCHAR(100),
    state        VARCHAR(100)
);

-- Table check
SHOW TABLES;
DESC TABLE ATMOSYNC_Proj_2_DB.RAW.MARKET_DETAILS;

-- Show table 
SELECT * 
from ATMOSYNC_Proj_2_DB.RAW.MARKET_DETAILS;