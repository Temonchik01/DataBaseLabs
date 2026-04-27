CREATE TABLE BaseCharacter (
	id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    max_hp INT CHECK (max_hp > 0),
    max_attack INT CHECK (max_attack > 0),
    max_defence INT CHECK (max_defence > 0),
    max_ammo INT CHECK (max_ammo > 0),
    max_speed INT CHECK (max_speed > 0)
);

CREATE TABLE Attacks (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	power INT CHECK (power > 0),
	accuracy INT CHECK (accuracy BETWEEN 0 AND 100),
	base_ammo_cost INT CHECK (base_ammo_cost >= 0)
);

CREATE TABLE Effect (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL, 
	description VARCHAR(255) NOT NULL, 
	modifier_value FLOAT
);

CREATE TABLE Item (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL, 
	effect_id INT REFERENCES Effect(id)
);	

CREATE TABLE Combatant (
    id SERIAL PRIMARY KEY,
    base_character_id INT REFERENCES BaseCharacter(id),
    instance_name VARCHAR(255) NOT NULL,
    current_hp INT CHECK (current_hp >= 0),
    current_attack INT CHECK (current_attack >= 0),
    current_defence INT CHECK (current_defence >= 0),
    current_ammo INT CHECK (current_ammo >= 0),
    current_speed INT CHECK (current_speed >= 0),
    item_id INT REFERENCES Item(id)
);

CREATE TABLE CombatantAttacks (
	id SERIAL PRIMARY KEY,
	attack_id INT REFERENCES Attacks(id)
);	

CREATE TABLE AttackEffects (
	attack_id INT REFERENCES Attacks(id),
	effect_id INT REFERENCES Effect(id)
);

INSERT INTO BaseCharacter (name, max_hp, max_attack, max_defence, max_ammo, max_speed)
VALUES  ('Drilldozer', 190, 100, 70, 30, 20),
		('Tank', 50, 120, 20, 50, 90),
		('Mecha', 70, 120, 40, 50, 120);

ALTER TABLE Attacks
ADD COLUMN description TEXT;

ALTER TABLE Effect 
ALTER COLUMN description TYPE TEXT;

ALTER TABLE Item
ADD COLUMN description TEXT;

INSERT INTO Attacks (name, power, accuracy, base_ammo_cost, description)
VALUES  ('Drill', 100, 100, 5, 'Drilling the enemy'),
		('Blast', 100, 100, 5, 'Blast from gun'),
		('Jab', 100, 100, 5, 'Punch the enemy');

INSERT INTO Effect (name, description, modifier_value)
VALUES  ('Burn', 'Burn enemy', -40),
		('Corrosion','Reduces the opponents defense', -40),
		('Paralysis','Reduces the opponents speed', -40);

INSERT INTO Item (name, description, effect_id)
VALUES  ('Flamethrower Nozzle', 'A mod that burns enemies', 1),
   		('Acid Canister', 'Coats weapon in acid', 2),   
    	('Taser Battery', 'Adds shocking effect', 3), 
		('Standard Armor', 'Just a heavy piece of metal', NULL);


