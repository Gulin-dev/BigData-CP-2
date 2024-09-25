SELECT
    age_group as 'Возрастная группа',
    ROUND(AVG(flight_time), 2) AS 'Среднее время'
FROM passengers
JOIN fly_mapping ON passengers.id = fly_mapping.passenger_id
JOIN flying ON fly_mapping.flying_id = flying.id
GROUP BY age_group;
