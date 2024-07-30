-- Example 1: CURRENT_DATE() and CURRENT_TIME()
SELECT CURRENT_DATE() AS current_date, CURRENT_TIME() AS current_time;

-- Example 2: NOW() and SYSDATE()
SELECT NOW() AS now, SYSDATE() AS sysdate;

-- Example 3: DATE_ADD() and DATE_SUB()
SELECT 
    DATE_ADD('2024-07-30', INTERVAL 10 DAY) AS add_days,
    DATE_SUB('2024-07-30', INTERVAL 10 DAY) AS sub_days;

-- Example 4: DATE_FORMAT()
SELECT DATE_FORMAT('2024-07-30 14:25:53', '%Y-%m-%d') AS formatted_date;

-- Example 5: STR_TO_DATE()
SELECT STR_TO_DATE('30-07-2024', '%d-%m-%Y') AS date_converted;

-- Example 6: TIMESTAMPDIFF()
SELECT TIMESTAMPDIFF(DAY, '2024-07-30', '2024-08-30') AS day_diff;

-- Example 7: TIMESTAMPADD()
SELECT TIMESTAMPADD(MINUTE, 10, '2024-07-30 14:25:53') AS add_minutes;

-- Example 8: EXTRACT()
SELECT 
    EXTRACT(YEAR FROM '2024-07-30') AS year,
    EXTRACT(MONTH FROM '2024-07-30') AS month,
    EXTRACT(DAY FROM '2024-07-30') AS day;

-- Example 9: DATEDIFF()
SELECT DATEDIFF('2024-08-30', '2024-07-30') AS diff_days;

-- Example 10: ADDDATE() and SUBDATE()
SELECT 
    ADDDATE('2024-07-30', INTERVAL 10 DAY) AS add_days,
    SUBDATE('2024-07-30', INTERVAL 10 DAY) AS sub_days;
