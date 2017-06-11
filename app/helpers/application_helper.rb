module ApplicationHelper
  def toon_picture(toon)
    "background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.2)), url('https://render-eu.worldofwarcraft.com/character/#{toon.thumbnail}');"
  end

  def faction_pic(instance)
    instance.faction == 'alliance' ? 'http://wow.zamimg.com/images/icons/alliance.png' : 'http://wow.zamimg.com/images/icons/horde.png'
  end
end
