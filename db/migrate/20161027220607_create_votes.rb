class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.string   :votable_type
      t.integer  :votable_id
      t.boolean  :vote_direction

      t.integer  :user_id

      t.timestamps
    end
  end
end
