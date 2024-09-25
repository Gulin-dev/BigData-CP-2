SELECT
    --Выводим Имя пассажира
    passengers.name,
    --Выводим Счёт количества полётов
    COUNT(fly_mapping.flying_id) AS flight_count
    --Откуда выводим
FROM passengers
    --Присоединяем таблицу fly_mapping
JOIN fly_mapping ON passengers.id = fly_mapping.passenger_id
    --Сортируем
GROUP BY passengers.id, passengers.name
    --Делаем фильтрацию
HAVING 
    --Счётчик
    COUNT(fly_mapping.flying_id) =
  (
        SELECT MAX(flight_count)
        FROM 
        (
            SELECT COUNT(flying_id) AS flight_count
            FROM fly_mapping
            GROUP BY passenger_id
        ) AS subquery
    );
