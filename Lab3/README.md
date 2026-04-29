# Лабораторна робота №3 Виконали: Стіренко Тимофій та Клименко Андрій
## Вимоги
**Мета:** Практичне використання операторів DML (Data Manipulation Language) у PostgreSQL. Виконання запитів для додавання (`INSERT`), вибірки (`SELECT`), оновлення (`UPDATE`) та видалення (`DELETE`) даних, щоб протестувати реляційну базу даних нашої відеогри.
## SQL код
```sql
-- Insertion of combatants into Combatant table, with reference to base characters and items, and their respective current stats
INSERT INTO Combatant (base_character_id, instance_name, current_hp, current_attack, current_defence, current_ammo, current_speed, item_id)
VALUES 
    (3, 'Black Mech', 70, 120, 35, 20, 110, 1),
    (1, 'Red Tank', 23, 15, 36, 45, 43, 3);

-- Query to select all combatants with their instance name and item id
SELECT instance_name, item_id FROM Combatant;

-- Update the item of a combatant
UPDATE Combatant
SET item_id = 2
WHERE id = 1;

-- Delete a combatant with specific id and item_id
DELETE FROM Combatant
WHERE id = 2 AND item_id = 3;
```
### Сріншот виконаної команди
![Результати команд](./results_photo.jpg)
## Висновок
У ході виконання лабораторної роботи ми успішно закріпили навички маніпулювання даними (DML) у PostgreSQL. Виконуючи транзакційні запити, ми протестували нашу базу даних відеогри: успішно додали нових екземплярів бійців на поле бою (INSERT), здійснили вибірку необхідних даних (SELECT), а також безпечно оновили екіпірування (UPDATE) та видалили записи (DELETE) з обов'язковим використанням умови WHERE. Виконання цих операцій без помилок підтвердило коректність налаштованих раніше зовнішніх ключів та загальну працездатність нашої реляційної схеми.# Лабораторна робота №3 Виконали: Стіренко Тимофій та Клименко Андрій
