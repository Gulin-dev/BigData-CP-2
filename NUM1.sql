SELECT
    --Выводим Имя пассажира
    passengers.name AS 'Имя пассажира',
    --Выводим Сумму стоимости полётов
    SUM(flying.price) AS 'Общие траты на полёты'
    --Откуда выводим
FROM passengers
    --Присоединяем таблицу fly_mapping
JOIN fly_mapping ON passengers.id = fly_mapping.passenger_id
    --Присоединяем таблицу flying
JOIN flying ON fly_mapping.flying_id = flying.id
    --Сортируем
GROUP BY passengers.id, passengers.name
