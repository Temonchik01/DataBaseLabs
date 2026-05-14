-- CreateTable
CREATE TABLE "attackeffects" (
    "attack_id" INTEGER,
    "effect_id" INTEGER,
    "duration_turns" INTEGER NOT NULL DEFAULT 1
);

-- CreateTable
CREATE TABLE "attacks" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "power" INTEGER,
    "accuracy" INTEGER,
    "base_ammo_cost" INTEGER,
    "description" TEXT,

    CONSTRAINT "attacks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "basecharacter" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "max_hp" INTEGER,
    "max_attack" INTEGER,
    "max_defence" INTEGER,
    "max_ammo" INTEGER,
    "max_speed" INTEGER,

    CONSTRAINT "basecharacter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "combatant" (
    "id" SERIAL NOT NULL,
    "base_character_id" INTEGER,
    "instance_name" VARCHAR(255) NOT NULL,
    "current_hp" INTEGER,
    "current_attack" INTEGER,
    "current_defence" INTEGER,
    "current_ammo" INTEGER,
    "current_speed" INTEGER,
    "item_id" INTEGER,

    CONSTRAINT "combatant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "combatantattacks" (
    "id" SERIAL NOT NULL,
    "attack_id" INTEGER,

    CONSTRAINT "combatantattacks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "effect" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "modifier_value" DOUBLE PRECISION,

    CONSTRAINT "effect_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "item" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "effect_id" INTEGER,
    "description" TEXT,

    CONSTRAINT "item_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "battle_history" (
    "id" SERIAL NOT NULL,
    "winner_name" VARCHAR(255) NOT NULL,
    "duration_minute" INTEGER NOT NULL,
    "battle_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "battle_history_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "attackeffects" ADD CONSTRAINT "attackeffects_attack_id_fkey" FOREIGN KEY ("attack_id") REFERENCES "attacks"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "attackeffects" ADD CONSTRAINT "attackeffects_effect_id_fkey" FOREIGN KEY ("effect_id") REFERENCES "effect"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "combatant" ADD CONSTRAINT "combatant_base_character_id_fkey" FOREIGN KEY ("base_character_id") REFERENCES "basecharacter"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "combatant" ADD CONSTRAINT "combatant_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "item"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "combatantattacks" ADD CONSTRAINT "combatantattacks_attack_id_fkey" FOREIGN KEY ("attack_id") REFERENCES "attacks"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "item" ADD CONSTRAINT "item_effect_id_fkey" FOREIGN KEY ("effect_id") REFERENCES "effect"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
