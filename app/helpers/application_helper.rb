module ApplicationHelper
  def toon_picture(toon)
    "background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.2)), url('https://render-eu.worldofwarcraft.com/character/#{toon.thumbnail.gsub('avatar', 'inset')}');"
  end

  def toon_picture_accepted(toon)
    "background-image: linear-gradient(rgba(0,0,0, 0), rgba(0,0,0, 0.9)), url('https://render-eu.worldofwarcraft.com/character/#{toon.thumbnail.gsub('avatar', 'main')}');"
  end

  def spec_img(toon)
    image_tag "https://blzmedia-a.akamaihd.net/wow/icons/56/#{toon.spec_icon}.jpg"
  end

  def class_img(toon)
    case toon.class_id
    when 'Warrior' then image_tag 'http://media.blizzard.com/wow/icons/18/class_1.jpg'
    when 'Paladin' then image_tag 'http://media.blizzard.com/wow/icons/18/class_2.jpg'
    when 'Hunter' then image_tag 'http://media.blizzard.com/wow/icons/18/class_3.jpg'
    when 'Rogue' then image_tag 'http://media.blizzard.com/wow/icons/18/class_4.jpg'
    when 'Priest' then image_tag 'http://media.blizzard.com/wow/icons/18/class_5.jpg'
    when 'Death Knight' then image_tag 'http://media.blizzard.com/wow/icons/18/class_6.jpg'
    when 'Shaman' then image_tag 'http://media.blizzard.com/wow/icons/18/class_7.jpg'
    when 'Mage' then image_tag 'http://media.blizzard.com/wow/icons/18/class_8.jpg'
    when 'Warlock' then image_tag 'http://media.blizzard.com/wow/icons/18/class_9.jpg'
    when 'Monk' then image_tag 'http://media.blizzard.com/wow/icons/18/class_10.jpg'
    when 'Druid' then image_tag 'http://media.blizzard.com/wow/icons/18/class_11.jpg'
    when 'Demon Hunter' then image_tag 'http://media.blizzard.com/wow/icons/18/class_12.jpg'
    end
  end

  def spec_role_img(role)
    case role
    when 'TANK' then image_tag 'https://vignette4.wikia.nocookie.net/wowwiki/images/7/7e/Icon-class-role-tank-42x42.png'
    when 'HEALING' then image_tag 'https://vignette4.wikia.nocookie.net/wowwiki/images/0/07/Icon-class-role-healer-42x42.png'
    when 'DPS' then image_tag 'https://vignette4.wikia.nocookie.net/wowwiki/images/3/3f/Icon-class-role-dealer-42x42.png'
    end
  end

  def toon_armory(toon)
    "https://worldofwarcraft.com/fr-fr/character/#{toon.realm.slug}/#{toon.name.downcase}"
  end

  def user_raids(user)
    past_raids = 0
    user.toons.each do |toon|
      toon.tags.where(status: 1).each do |tag|
        past_raids += 1 if tag.raid.date <= Time.now.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
    past_raids
  end

  def raid_difficulty_display(raid)
    case raid.difficulty
    when 'normal' then '(N)'
    when 'heroic' then '(H)'
    when 'mythic' then '(M)'
    end
  end

  def raid_slots(raid)
    "(#{raid.tags.where(status: 1).count}/30)"
  end

  def faction_pic(instance)
    instance.faction == 'alliance' ? 'https://wow.zamimg.com/images/icons/alliance.png' : 'https://wow.zamimg.com/images/icons/horde.png'
  end

  def find_last_tag
    Tag.last
  end
end
