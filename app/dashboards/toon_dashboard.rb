require "administrate/base_dashboard"

class ToonDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    realm: Field::BelongsTo,
    tags: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    class_id: Field::String.with_options(searchable: false),
    race_id: Field::String.with_options(searchable: false),
    level: Field::Number,
    i_level: Field::Number,
    thumbnail: Field::String,
    faction: Field::String.with_options(searchable: false),
    tag_status: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    spec_name: Field::String,
    spec_role: Field::String,
    spec_icon: Field::String,
    guild_name: Field::String,
    guild_realm: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :realm,
    :tags,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :realm,
    :tags,
    :id,
    :name,
    :class_id,
    :race_id,
    :level,
    :i_level,
    :thumbnail,
    :faction,
    :tag_status,
    :created_at,
    :updated_at,
    :spec_name,
    :spec_role,
    :spec_icon,
    :guild_name,
    :guild_realm,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :realm,
    :tags,
    :name,
    :class_id,
    :race_id,
    :level,
    :i_level,
    :thumbnail,
    :faction,
    :tag_status,
    :spec_name,
    :spec_role,
    :spec_icon,
    :guild_name,
    :guild_realm,
  ].freeze

  # Overwrite this method to customize how toons are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(toon)
  #   "Toon ##{toon.id}"
  # end
end
