SELECT 
    AVG(power) AS average_power, 
    MAX(power) AS max_power 
FROM Attacks;

SELECT 
    base_character_id, 
    COUNT(*) AS instances_on_field 
FROM Combatant
GROUP BY base_character_id;

SELECT MAX(max_speed) AS highest_speed
FROM BaseCharacter;

SELECT COUNT(*) AS total_items
FROM Item;

SELECT effect_id, COUNT(*) AS related_items_count
FROM Item
GROUP BY effect_id
HAVING COUNT(*) >= 2;

SELECT AVG(accuracy) AS average_accuracy
FROM attacks;

SELECT SUM(base_ammo_cost) as sum_ammo
FROM attacks;

SELECT 
    Item.name AS item_name, 
    Effect.name AS effect_name
FROM Item
LEFT JOIN Effect ON Item.effect_id = Effect.id;