SELECT 
    CASE 
        WHEN flying.point_from < flying.point_to THEN flying.point_from
        ELSE flying.point_to
    END AS origin,
    CASE 
        WHEN flying.point_from < flying.point_to THEN flying.point_to
        ELSE flying.point_from
    END AS destination,
    COUNT(fly_mapping.id) AS flight_count
FROM 
    flying
JOIN 
    fly_mapping ON flying.id = fly_mapping.flying_id
GROUP BY origin, destination
