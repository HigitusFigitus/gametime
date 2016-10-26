require 'json'

Tag.destroy_all
Game.destroy_all

default_tag = Tag.create(name: "Party Game")

100.times do |i|
  response = JSON.parse(HTTParty.get("https://bgg-json.azurewebsites.net/thing/#{i+1}"))

  if response['mechanics']
    tag = Tag.find_or_create_by(name: response['mechanics'][0])
  end

  id = tag ? tag.id : default_tag.id

  Game.create(name: response['name'], image_url: response['image'], thumbnail_url: response['thumbnail'], min_players: response['minPlayers'], max_players: response['maxPlayers'], play_time: response['playingTime'], publish_year: response['yearPublished'], description: response['description'], vote: 12, tag_id: id)
end
