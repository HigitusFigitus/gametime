class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string  :name
      t.string  :image_url
      t.string  :thumbnail_url
      t.string  :min_players, :max_players, :play_time, :publish_year
      t.text    :description

      t.integer :tag_id, default: 1

      t.timestamps
    end
  end
end
