class Raid < ApplicationRecord
  belongs_to :dungeon
  belongs_to :leader, class_name: :Toon, foreign_key: :leader_id

  has_many :tags, dependent: :destroy

  validates :dungeon, :date, :faction, presence: true

  enum difficulty: { normal: 0, heroic: 1, mythic: 2 }

  enum faction: { alliance: 0, horde: 1 }
end
