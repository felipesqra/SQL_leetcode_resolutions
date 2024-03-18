select distinct
    query_name,
    ROUND(SUM(CAST(rating as numeric)/position)/count(query_name),2) as quality,
    ROUND(CAST(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) AS numeric)/count(query_name) * 100, 2) AS poor_query_percentage
from
    Queries
where query_name is not null
group by
    query_name;