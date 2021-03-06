class StageBot
  URL_BASE = "http://viradacultural.org/programacao?em_ajax=true&query=GlobalMapData"

  def self.each(&block)
    data.each do |item|
      yield StageItemBot.new(item)
    end
  end

  def self.url
    URL_BASE
  end

  def self.data
    JSON.parse open(url,"User-Agent" => "Dukes Bot" ).read
  end
end

class StageItemBot < ItemBot
  def attributes_to_create
    @item['id'] = @item['location_id']
    super
  end
end
