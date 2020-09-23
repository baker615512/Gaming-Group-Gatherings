class CreateGatherings < ActiveRecord::Migration[6.0]
  def change
    create_table :gatherings do |t|
      t.string :game_cafe
      t.string :day_of_week
      t.belongs_to :gamer, null: false, foreign_key: true
      t.belongs_to :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
