class CreateShowings < ActiveRecord::Migration[5.2]
  def change
    create_table :showings do |t|
      t.string :title
      t.integer :min_age
      t.integer :cost, :default => 10
      t.datetime :time
    end
  end
end
