class RemoveAddedOnFromCars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :added_on
  end
end
