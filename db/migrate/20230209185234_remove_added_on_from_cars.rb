# frozen_string_literal: true

class RemoveAddedOnFromCars < ActiveRecord::Migration[7.0]
  # rubocop:disable all
  def change
    remove_column :cars, :added_on
  end

  # rubocop:enable all
end
