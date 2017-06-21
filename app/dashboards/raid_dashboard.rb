require "administrate/base_dashboard"

class RaidDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    dungeon: Field::BelongsTo,
    leader: Field::BelongsTo.with_options(class_name: "Toon"),
    tags: Field::HasMany,
    id: Field::Number,
    date: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    difficulty: Field::String.with_options(searchable: false),
    leader_id: Field::Number,
    faction: Field::String.with_options(searchable: false),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :dungeon,
    :leader,
    :tags,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :dungeon,
    :leader,
    :tags,
    :id,
    :date,
    :created_at,
    :updated_at,
    :difficulty,
    :leader_id,
    :faction,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :dungeon,
    :leader,
    :tags,
    :date,
    :difficulty,
    :leader_id,
    :faction,
  ].freeze

  # Overwrite this method to customize how raids are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(raid)
  #   "Raid ##{raid.id}"
  # end
end
