SELECT
    --Выводим Возростную группу
    age_group as 'Возрастная группа',
    --Выводим и (округляем и делаем среднее) Время полётов (точность до минут)
    ROUND(AVG(flight_time), 2) AS 'Среднее время'
    --Откуда выводим
FROM passengers
    --Присоединяем таблицу fly_mapping
JOIN fly_mapping ON passengers.id = fly_mapping.passenger_id
    --Присоединяем таблицу flying
JOIN flying ON fly_mapping.flying_id = flying.id
    --Сортируем
GROUP BY age_group;
