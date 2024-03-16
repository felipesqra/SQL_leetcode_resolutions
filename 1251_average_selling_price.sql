SELECT
    p.product_id,
    COALESCE(ROUND(SUM(CAST(p.price AS numeric) * u.units)/SUM(u.units),2), 0) AS average_price
FROM
    Prices p
LEFT OUTER JOIN UnitsSold u ON p.product_id = u.product_id AND u.purchase_date BETWEEN p.Start_date AND p.end_date
GROUP BY p.product_id;