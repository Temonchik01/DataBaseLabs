INSERT INTO Combatant (base_character_id, instance_name, current_hp, current_attack, current_defence, current_ammo, current_speed, item_id)
VALUES 
    (3, 'Black Mech', 70, 120, 35, 20, 110, 1),
    (1, 'Red Tank', 23, 15, 36, 45, 43, 3);

SELECT instance_name, item_id FROM Combatant;

UPDATE Combatant
SET item_id = 2
WHERE id = 1;

DELETE FROM Combatant
WHERE id = 2 AND item_id = 3;