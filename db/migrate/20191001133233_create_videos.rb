class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :name
      t.text :description
      t.string :url
      t.references :user, foreign_key: true
      t.integer :status, :default =>  :inactive

      t.timestamps
    end
  end
end
