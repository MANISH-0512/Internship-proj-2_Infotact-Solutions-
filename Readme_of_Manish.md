# Week 1 Workflow – AtmoSync
## 1.Generate Data → The Python simulator generates realistic container sensor data.
## 2.Stream Data → The Python Kafka Producer sends the data to the container_telemetry topic.
## 3.Verify Data → The Kafka Consumer is used to verify that the data is being received successfully.
## 4.Store Data → The Snowflake database, warehouse, RAW schema, and raw IoT table are prepared to store the data.
## 5.Connect Systems → Kafka and Snowflake are connected using the Snowflake Kafka Connector.
