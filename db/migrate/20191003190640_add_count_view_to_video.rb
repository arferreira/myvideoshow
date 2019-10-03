class AddCountViewToVideo < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :count_view, :integer, default: 0
  end
end
