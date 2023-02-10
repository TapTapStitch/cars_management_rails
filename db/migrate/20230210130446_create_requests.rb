# frozen_string_literal: true

class CreateRequests < ActiveRecord::Migration[7.0]
  # rubocop:disable all
  def change
    create_table :requests do |t|
      t.integer :user_id, null: false
      t.string :make
      t.string :model
      t.integer :year_from
      t.integer :year_to
      t.integer :odometer_from
      t.integer :odometer_to
      t.integer :price_from
      t.integer :price_to
      t.timestamps
    end
  end
  # rubocop:enable all
end
