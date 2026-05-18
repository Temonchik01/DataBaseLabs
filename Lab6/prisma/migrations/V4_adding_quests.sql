CREATE TABLE Quests (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    reward_item_id INT REFERENCES Item(id) ON DELETE SET NULL,
    required_level INT DEFAULT 1,
    is_repeatable BOOLEAN DEFAULT FALSE
);

INSERT INTO Quests (title, description, reward_item_id, required_level, is_repeatable)
VALUES  
    ('Полювання на брухт', 'Зберіть 10 деталей обшивки та отримайте базову броню.', 4, 1, FALSE),
    ('Критичний перегрів', 'Знешкодьте скаженого вогняного робота.', 1, 5, TRUE);