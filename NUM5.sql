SELECT
    --Кейс по таблице origin
    CASE
        WHEN flying.point_from < flying.point_to THEN flying.point_from
        ELSE flying.point_to
    END AS origin,
    --Кейс по таблице destination
    CASE 
        WHEN flying.point_from < flying.point_to THEN flying.point_to
        ELSE flying.point_from
    END AS destination,
    --Счётчик
    COUNT(fly_mapping.id) AS flight_count
    -- Откуда выводим
FROM flying
    --Присоединяем таблицу fly_mapping
JOIN fly_mapping ON flying.id = fly_mapping.flying_id
    --Сортируем
GROUP BY origin, destination
