class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :date
      t.integer :length
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
