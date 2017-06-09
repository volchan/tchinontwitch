class Tag < ApplicationRecord
  belongs_to :toon
  belongs_to :raid

  enum status: { pending: 0, accepted: 1, refused: 2 }
end
