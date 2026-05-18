CREATE TABLE Factions (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    description TEXT,
    base_hostility INT DEFAULT 0 CHECK (base_hostility BETWEEN -100 AND 100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Factions (name, description, base_hostility)
VALUES  
    ('Залізна Варта', 'Елітний підрозділ важкоброньованих механоїдів', 50),
    ('Іржаві Рейдери', 'Бандити та шукачі брухту на околицях пустелі', -80);
