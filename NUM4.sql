SELECT 
    passengers.name,
    COUNT(fly_mapping.flying_id) AS flight_count
FROM passengers
JOIN fly_mapping ON passengers.id = fly_mapping.passenger_id
GROUP BY passengers.id, passengers.name
HAVING 
    COUNT(fly_mapping.flying_id) > 
  (
        SELECT AVG(flight_count)
        FROM 
        (
            SELECT COUNT(flying_id) AS flight_count
            FROM fly_mapping
            GROUP BY passenger_id
        ) AS subquery
    );
