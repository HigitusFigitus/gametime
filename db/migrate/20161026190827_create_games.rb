class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string  :name
      t.text    :description
      t.integer :vote

      t.integer :tag_id

      t.timestamps
    end
  end
end
