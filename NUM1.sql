SELECT 
    passengers.name AS 'Имя пассажира',
    SUM(flying.price) AS 'Общие траты на полёты'
FROM passengers
JOIN fly_mapping ON passengers.id = fly_mapping.passenger_id
JOIN flying ON fly_mapping.flying_id = flying.id
GROUP BY passengers.id, passengers.name
