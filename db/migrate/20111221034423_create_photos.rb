class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.string :photographer
      t.string :path
      t.string :name
      t.references :album

      t.timestamps
    end
    add_index :photos, :album_id
  end
end
