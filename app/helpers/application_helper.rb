module ApplicationHelper
  def toon_picture(toon)
    "background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.2)), url('https://render-eu.worldofwarcraft.com/character/#{toon.thumbnail}');"
  end

  def class_img(toon)
    image_tag "https://blzmedia-a.akamaihd.net/wow/icons/56/#{toon.spec_icon}.jpg"
  end

  def spec_role_img(role)
    case role
    when 'Tank' then image_tag "https://vignette4.wikia.nocookie.net/wowwiki/images/7/7e/Icon-class-role-tank-42x42.png"
    when 'Healer' then image_tag "https://vignette4.wikia.nocookie.net/wowwiki/images/0/07/Icon-class-role-healer-42x42.png"
    when 'DPS' then image_tag "https://vignette4.wikia.nocookie.net/wowwiki/images/3/3f/Icon-class-role-dealer-42x42.png"
    end
  end

  def toon_armory(toon)
    "https://worldofwarcraft.com/fr-fr/character/#{toon.realm.slug}/#{toon.name.downcase}"
  end

  def raid_difficulty_display(raid)
    case raid.difficulty
    when 'normal' then '(N)'
    when 'heroic' then '(H)'
    when 'mythic' then '(M)'
    end
  end

  def faction_pic(instance)
    instance.faction == 'alliance' ? 'http://wow.zamimg.com/images/icons/alliance.png' : 'http://wow.zamimg.com/images/icons/horde.png'
  end
end
