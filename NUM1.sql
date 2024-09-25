SELECT 
    passengers.name AS passenger_name,
    SUM(flying.price) AS total_spent
FROM passengers
JOIN fly_mapping ON passengers.id = fly_mapping.passenger_id
JOIN flying ON fly_mapping.flying_id = flying.id
GROUP BY passengers.id, passengers.name
ORDER BY total_spent DESC;
