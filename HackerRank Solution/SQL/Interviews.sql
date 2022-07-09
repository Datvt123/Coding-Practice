SELECT 
contests.contest_id, 
contests.hacker_id, 
contests.name, 
SUM(total_submissions), 
SUM(total_accepted_submissions), 
SUM(total_views), 
SUM(total_unique_views) 
FROM contests
INNER JOIN colleges ON contests.contest_id = colleges.contest_id
INNER JOIN challenges ON challenges.college_id = colleges.college_id
LEFT JOIN 
(SELECT challenge_id, SUM(total_views) AS total_views, SUM(total_unique_views) AS total_unique_views FROM View_Stats GROUP BY challenge_id) AS vs ON vs.challenge_id = challenges.challenge_id
LEFT JOIN 
(SELECT challenge_id, SUM(total_submissions) AS total_submissions, SUM(total_accepted_submissions) AS total_accepted_submissions FROM Submission_Stats GROUP BY challenge_id) AS ss ON ss.challenge_id = challenges.challenge_id
GROUP BY contests.contest_id, contests.hacker_id, contests.name
HAVING 
SUM(total_submissions) > 0 AND
SUM(total_accepted_submissions) > 0 AND
SUM(total_views) >0 AND SUM(total_unique_views) >0
ORDER BY contests.contest_id;