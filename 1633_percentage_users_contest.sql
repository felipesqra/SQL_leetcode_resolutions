SELECT
    r.contest_id,
    ROUND(CAST(COUNT(r.contest_id) AS numeric)/(SELECT COUNT(*) FROM users)*100,2) AS percentage
FROM
    Register r
GROUP BY
    r.contest_id
ORDER BY
    percentage DESC,
    contest_id ASC;
