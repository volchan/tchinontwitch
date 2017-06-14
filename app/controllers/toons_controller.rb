class ToonsController < ApplicationController
  before_action :find_toon, only: %i[update destroy]

  def index
    @toons = Toon.where(user: current_user)
  end

  def show; end

  def new
    @toon = Toon.new
    @realms = Realm.all.order(name: :asc)
  end

  def create
    call_params = toons_params
    realm = Realm.find_by(id: call_params['realm_id'])
    bnet_url = URI.encode("https://eu.api.battle.net/wow/character/#{realm.slug}/#{call_params['name']}?fields=items,guild,talents&locale=en_GB&apikey=#{ENV['BNET_KEY']}")
    bnet_api_call = RestClient.get(bnet_url)
    parsed_api_call = JSON.parse(bnet_api_call)
    toon_spec = parsed_api_call['talents'].find('selected').first['spec']
    @toon = Toon.new(
      name: parsed_api_call['name'],
      realm: realm,
      class_id: parsed_api_call['class'],
      race_id: parsed_api_call['race'],
      level: parsed_api_call['level'],
      i_level: parsed_api_call['items']['averageItemLevelEquipped'],
      thumbnail: parsed_api_call['thumbnail'],
      faction: parsed_api_call['faction'],
      guild_name: parsed_api_call['guild'].try(:[], 'name'),
      guild_realm: parsed_api_call['guild'].try(:[], 'realm'),
      spec_name: toon_spec['name'],
      spec_role: toon_spec['role'],
      spec_icon: toon_spec['icon'],
      user: current_user
    )
    if @toon.save
      redirect_to toons_path
    else
      render :new
    end
  end

  def update
    bnet_url = URI.encode("https://eu.api.battle.net/wow/character/#{@toon.realm.slug}/#{@toon.name.downcase}?fields=items,guild,talents&locale=en_GB&apikey=#{ENV['BNET_KEY']}")
    bnet_api_call = RestClient.get(bnet_url)
    parsed_api_call = JSON.parse(bnet_api_call)
    toon_spec = parsed_api_call['talents'].find('selected').first['spec']
    @toon.update(
      class_id: parsed_api_call['class'],
      race_id: parsed_api_call['race'],
      level: parsed_api_call['level'],
      i_level: parsed_api_call['items']['averageItemLevelEquipped'],
      thumbnail: parsed_api_call['thumbnail'],
      faction: parsed_api_call['faction'],
      guild_name: parsed_api_call['guild'].try(:[], 'name'),
      guild_realm: parsed_api_call['guild'].try(:[], 'realm'),
      spec_name: toon_spec['name'],
      spec_role: toon_spec['role'],
      spec_icon: toon_spec['icon']
    )
    redirect_to toons_path
  end

  def destroy
    toon.destroy
    redirect_to toons_path
  end

  private

  def find_toon
    @toon = Toon.find(params[:id])
  end

  def toons_params
    params.require(:toon).permit(:name, :realm_id)
  end
end
