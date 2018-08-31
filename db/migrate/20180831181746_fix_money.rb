class FixMoney < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :money, 100)
  end
end
