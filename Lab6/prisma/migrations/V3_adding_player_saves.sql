CREATE TABLE PlayerSaves (
    id SERIAL PRIMARY KEY,
    save_name TEXT NOT NULL,
    combatant_id INT REFERENCES Combatant(id) ON DELETE CASCADE,
    playtime_seconds INT DEFAULT 0 CHECK (playtime_seconds >= 0),
    last_saved TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO PlayerSaves (save_name, combatant_id, playtime_seconds)
VALUES  
    ('Збереження_Перед_Босом', 1, 3600),
    ('Спідран_Спроба_3', 1, 7200);