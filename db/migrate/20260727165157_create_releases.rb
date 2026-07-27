class CreateReleases < ActiveRecord::Migration[7.2]
  def change
    create_table :releases do |t|
      t.string :title
      t.integer :release_year
      t.string :release_type
      t.integer :rating
      t.text :notes
      t.integer :artist_id

      t.timestamps
    end
  end
end
