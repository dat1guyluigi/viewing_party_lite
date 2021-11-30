class AddTimeToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :time, :integer
  end
end
