class RemoveSlugFromWiki < ActiveRecord::Migration
  def up
	remove_column :wikis, :slug
  end

  def down
	add_column :wikis, :slug, :string, unique: true
  end
end
