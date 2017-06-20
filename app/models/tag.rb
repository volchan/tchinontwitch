class Tag < ApplicationRecord
  belongs_to :toon
  belongs_to :raid

  enum status: { pending: 0, accepted: 1, refused: 2 }

  validates :toon, uniqueness: { scope: :raid_id, message: 'You allready applied with this character' }
  validate :uniqueness_users, if: :validate_user

  after_create :publish_on_card_channel
  after_update :publish_on_roster_channel

  attr_accessor :validate_user

  private

  def uniqueness_users
    user = self.toon.user
    raid = self.raid
    unless Tag.where(raid: raid).joins(:toon).where(toons: {user: user}).empty?
      self.errors[:toon] << 'You can apply only once to this raid'
    end
  end

  def publish_pending_on_card_channel
    ActionCable.server.broadcast(
      "raid_#{self.raid.id}",
      raid_id: self.raid.id
    )
  end

  def publish_on_roster_channel
    ActionCable.server.broadcast(
    "roster_#{self.raid.id}",
      tag_id: self.id,
      raid_id: self.raid.id
    )
  end
end
