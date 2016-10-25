class CreatePointTransactions < ActiveRecord::Migration
  def change
    create_table :point_transactions do |t|
      t.integer :point_change
      t.references :user, index: true, foreign_key: true
      t.references :transaction_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
