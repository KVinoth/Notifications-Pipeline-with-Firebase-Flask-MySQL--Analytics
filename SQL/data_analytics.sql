use notifications_db;

#---Count Notifications by Source
SELECT `source`,COUNT(*) notification_count
FROM notifications
GROUP BY `source`
ORDER BY notification_count DESC;

#---Most Recent Notifications per Source
SELECT `source`,MAX(received_at) AS most_recent_notification
FROM notifications
GROUP BY `source`;

SELECT `source`,MAX(TIME(received_at)) AS most_recent_notification,
	(SELECT title 
    FROM notifications n2 
    WHERE n2.`source`=n1.`source`
    ORDER BY n2.received_at DESC
    LIMIT 1) AS most_resent_titile
FROM notifications n1
GROUP BY `source`;

WITH ranked_notifications AS (
	SELECT `source`,title,received_at,
	ROW_NUMBER () OVER (PARTITION BY `source` ORDER BY received_at  DESC) AS row_num
	FROM notifications
)
SELECT `source`,title,received_at
FROM ranked_notifications
WHERE row_num = 1;

#---Notifications Count by Type (Foreground vs Background)

SELECT `type`,COUNT(*) AS count_nofifications
FROM notifications
GROUP BY `type`
ORDER BY COUNT(*) DESC;


#---Daily Notification Counts

SELECT DATE(received_at) AS notification_date,COUNT(*) AS notification_count
FROM notifications
GROUP BY notification_date
ORDER BY notification_date DESC;

#---Average Time Between Notifications per Source

SELECT `source`,
	AVG(TIMESTAMPDIFF(HOUR,received_at,LEAD(received_at) OVER(PARTITION BY `source` ORDER BY received_at))) AS avarage_time
FROM notifications
GROUP BY source;

SELECT n1.source,
       AVG(TIMESTAMPDIFF(SECOND, n1.received_at, n2.received_at)) AS avg_time_diff_seconds
FROM notifications n1
JOIN notifications n2 
    ON n1.source = n2.source 
    AND n1.received_at < n2.received_at
WHERE NOT EXISTS (
    SELECT 1 FROM notifications n3
    WHERE n3.source = n1.source 
    AND n3.received_at < n2.received_at 
    AND n3.received_at > n1.received_at
)
GROUP BY n1.source;

#---Count of Notifications by Source and Day of Week

SELECT `source`,DAYNAME(received_at) day_of_week,COUNT(*) AS notification_count
FROM notifications
GROUP BY `source`,day_name;

#---Notifications Sent Within a Specific Time Window
#---Find notifications sent between 6 PM and 10 PM.

SELECT *
FROM notifications
WHERE HOUR(received_at) BETWEEN 18 AND 22
ORDER BY received_at DESC;


#---Top 5 Sources with the Most Recent Notifications

SELECT `source`,
	MAX(received_at) AS last_arival
FROM notifications
GROUP BY `source`
ORDER BY last_arival DESC
LIMIT 5;

#---Identify Notification Gaps Between Sources

SELECT `source`, MAX(TIMESTAMPDIFF(SECOND, received_at, LEAD(received_at) OVER (PARTITION BY `source` ORDER BY received_at))) AS max_gap_seconds
FROM notifications
GROUP BY `source`
ORDER BY max_gap_seconds DESC;

#---Notifications for User Engagement Analysis (From Source)
#---Track notifications that are related to user engagement (e.g., follows, likes, or messages).

SELECT * 
FROM notifications
WHERE body LIKE '%follow%' OR body LIKE '%like%' OR body LIKE '%comment%' OR body LIKE 'message';

SELECT source, COUNT(*) AS notification_count
FROM notifications
WHERE body LIKE '%follow%' OR body LIKE '%like%' OR body LIKE '%message%'
GROUP BY source
ORDER BY notification_count DESC;


#---Notifications by Type with Source Breakdown
SELECT `source`, type, COUNT(*) AS notification_count
FROM notifications
GROUP BY `source`, type
ORDER BY `source`, notification_count DESC;

#---Long-term Notification Trends (Weekly, Monthly)
SELECT YEAR(received_at) AS `year`, MONTH(received_at) AS `month`, WEEK(received_at) AS `week`, COUNT(*) AS notification_count
FROM notifications
GROUP BY `year`, `month`, `week`
ORDER BY `year` DESC, `month` DESC, `week` DESC;

#---Predictive Analysis (Using Window Functions)
#---Predict how many notifications will be received next week based on previous data.

SELECT `source`, received_at,
	COUNT(*) OVER (PARTITION BY `source` ORDER BY received_at ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS rolling_7_day_count
FROM notifications;

#---Segment Notifications by User Behavior (Advanced Filtering)
SELECT user_age_group, COUNT(*) AS notification_count
FROM notifications
JOIN users ON notifications.user_id = users.user_id
GROUP BY user_age_group
ORDER BY notification_count DESC;



