# frozen_string_literal: true

class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :make, null: false
      t.string :model, null: false
      t.integer :year, null: false
      t.float :odometer, null: false
      t.float :price, null: false
      t.text :description
      t.date :added_on, null: false
      t.timestamps
    end
  end
end
