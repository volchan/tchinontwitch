class Toon < ApplicationRecord
  belongs_to :user
  belongs_to :realm

  has_many :tags

  validates :name, uniqueness: true

  enum faction: { horde: 1, alliance: 0 }

  enum race_id: {
    'Human' => 1,
    'Orc' => 2,
    'Dwarf' => 3,
    'Night Elf' => 4,
    'Undead' => 5,
    'Tauren' => 6,
    'Gnome' => 7,
    'Troll' => 8,
    'Goblin' => 9,
    'Blood Elf' => 10,
    'Draenei' => 11,
    'Worgen' => 22,
    'Pandaren' => 24,
    'Pandaren' => 25,
    'Pandaren' => 26
  }

  enum class_id: {
    'Warrior' => 1,
    'Paladin' => 2,
    'Hunter' => 3,
    'Rogue' => 4,
    'Priest' => 5,
    'Death Knight' => 6,
    'Shaman' => 7,
    'Mage' => 8,
    'Warlock' => 9,
    'Monk' => 10,
    'Druid' => 11,
    'Demon Hunter' => 12
  }
end
