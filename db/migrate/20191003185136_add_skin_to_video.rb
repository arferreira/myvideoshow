class AddSkinToVideo < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :skin, :string
  end
end
