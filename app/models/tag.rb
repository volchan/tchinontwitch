class Tag < ApplicationRecord
  belongs_to :toon
  belongs_to :raid

  enum status: { pending: 0, accepted: 1, refused: 2 }

  validates :toon, uniqueness: { scope: :raid_id, message: 'You allready applied with this character' }
  validate :uniqueness_users

  after_create :publish_pending_on_cable

  private

  def uniqueness_users
    user = self.toon.user
    raid = self.raid
    unless Tag.where(raid: raid).joins(:toon).where(toons: {user: user}).empty?
      self.errors[:toon] << 'You can apply only once to this raid'
    end
  end

  def publish_pending_on_cable
    ActionCable.server.broadcast(
      "raid_#{self.raid.id}",
      # html: ApplicationController.renderer.render(partial: 'raids/pending_card', locals: { tag: self, user: self.toon.user.id }, layout: false)
      json: self.to_json
    )
  end
end
