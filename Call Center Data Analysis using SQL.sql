SELECT * FROM call_center.`01 call-center-dataset`;

--- We are going to solve questions with SQL queries 

--- Q1). Find the Total Number of calls made to the call center?

SELECT COUNT(*) FROM `01 call-center-dataset`;

--- Q2). Find the Total Number of calls Resolved by each Agent?

SELECT Agent,COUNT(Resolved) as Total_Calls_Resolved
FROM `01 call-center-dataset`
WHERE Resolved = "Y"
GROUP BY Agent;

--- Q3). What is the Average Speed of Answer for all calls?

SELECT AVG(`Speed of answer in seconds`) as Average_Speed_of_Answer
FROM `01 call-center-dataset`;

--- Q4). Find the call with the longest talk duration?

SELECT *
FROM `01 call-center-dataset`
ORDER BY AvgTalkDuration DESC
LIMIT 1;

--- Q5). Find the Average Satisfaction Rating for all calls?

SELECT ROUND(AVG(`Satisfaction rating`),2) as Average_satisfaction_rate
FROM `01 call-center-dataset`;

--- Q6). List the Topics that were answered by agents?

SELECT DISTINCT(Topic)
FROM `01 call-center-dataset`
WHERE `Answered (Y/N)` = "Y";

--- Q7). Find the agent with the highest average satisfaction rate?

SELECT Agent, AVG(`Satisfaction rating`) AS Average_satisfaction_rate
FROM `01 call-center-dataset`
GROUP BY Agent
ORDER BY Average_satisfaction_rate DESC
LIMIT 1;

--- Q8). List the calls that were not Resolved?

 SELECT *
 FROM `01 call-center-dataset`
 WHERE Resolved = "N";
 
--- Q9). Find the Total number of calls handled by each agent on a specific date?

SELECT Agent, Date, count(*) as Total_calls
FROM `01 call-center-dataset`
WHERE Date = '2021-01-01'
GROUP BY Agent, Date;

--- Q10). What is the average talk duration for calls related to a specific topic?

SELECT Topic, AVG(AvgTalkDuration) as average_talk_duration
FROM `01 call-center-dataset`
WHERE Topic = 'Technical Support'
GROUP BY Topic;

--- Q11). Find the call with the fastest speed of answer?

SELECT * 
FROM `01 call-center-dataset`
ORDER BY `Speed of answer in seconds` ASC
LIMIT 1;

--- Q12). Find the total number of calls made during a specific time range?

SELECT COUNT(*) AS TOTAL_CALLS
FROM `01 call-center-dataset`
WHERE Time = '9.12.58' AND '11.31.12';

--- Q13). Find the Top 3 Agents with the highest average satisfaction rate for calls resolved?

SELECT Agent, Avg ( `Satisfaction rating` ) as Avg_satisfaction_rate
FROM `01 call-center-dataset`
WHERE Resolved = 'Y'
GROUP BY Agent
ORDER BY Avg_satisfaction_rate DESC
LIMIT 3;

--- Q14). What is the average talk duration for calls answered by agent who have an average satisfaction rate above 4.5?

SELECT Agent, AVG(AvgTalkDuration) as average_talk_duration
FROM `01 call-center-dataset`
WHERE `Satisfaction rating` >4.5
GROUP BY Agent ;

--- Q15). What is the total number of calls resolved by each agent for each topic?

SELECT Agent, Topic, COUNT(*) AS Total_calls_Resolved
FROM `01 call-center-dataset`
WHERE Resolved = 'Y'
GROUP BY Agent, Topic;

--- Q16). Find the calls with the longest talk duration for each topic?

WITH LongestCalls AS (
    SELECT Topic, MAX(AvgTalkDuration)
    FROM `01 call-center-dataset`
    GROUP BY Topic
					)
 SELECT * FROM LongestCalls;
                    
                    
