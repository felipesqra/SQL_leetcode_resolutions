SELECT DISTINCT
    query_name,
    ROUND(SUM(CAST(rating AS NUMERIC)/position)/count(query_name),2) AS quality,
    ROUND(CAST(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) AS NUMERIC)/count(query_name) * 100, 2) AS poor_query_percentage
FROM
    Queries
WHERE query_name IS NOT NULL
GROUP BY
    query_name;