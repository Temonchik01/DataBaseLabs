“‘mermaid
erDiagram
    BaseCharacter ||--|| Combatant : "is a"
    Combatant }|--o{ Attacks : "has"
    Combatant ||--o| Item : "holds"
    Attacks }|--o{ Effect : "applies"
    Item ||--o| Effect : "triggers"

    BaseCharacter {
        int ID PK
        string name
        int max_hp
        int max_attack
        int max_defence
        int max_ammo
        int max_speed
    }

    Combatant {
        int ID PK
        string name
        int max_hp
        int current_hp
        int max_attack
        int current_attack
        int max_defence
        int current_defence
        int max_ammo
        int current_ammo
        int max_speed
        int current_speed
    }

    Attacks {
        int ID PK
        string name
        int power
        string effects
        int accuracy
        int ammo
    }

    Item {
        int ID PK
        string name
        string effect
    }

    Effect {
        int ID PK
        string name
        string effect
    }
“‘