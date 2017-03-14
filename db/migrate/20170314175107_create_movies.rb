class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :vote
      t.string :image_url
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
