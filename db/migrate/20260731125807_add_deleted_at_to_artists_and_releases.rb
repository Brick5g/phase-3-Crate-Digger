class AddDeletedAtToArtistsAndReleases < ActiveRecord::Migration[7.2]
  def change
    add_column :artists, :deleted_at, :datetime
    add_column :releases, :deleted_at, :datetime
  end
end
