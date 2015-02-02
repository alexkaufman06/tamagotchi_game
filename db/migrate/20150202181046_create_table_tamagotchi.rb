class CreateTableTamagotchi < ActiveRecord::Migration
  def change
    create_table :tamagotchis do |t|
      t.column :name, :string
      t.column :food_level, :int
      t.column :activity_level, :int
      t.column :sleep_level, :int

      t.timestamp null: false
    end
  end
end
