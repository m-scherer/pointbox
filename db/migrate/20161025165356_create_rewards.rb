class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.integer :cost
      t.string :name

      t.timestamps null: false
    end
  end
end
