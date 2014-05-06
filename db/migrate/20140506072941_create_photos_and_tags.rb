class CreatePhotosAndTags < ActiveRecord::Migration
  def change
    create_table :photos_and_tags, id: false do |t|
      t.integer :photo_id
      t.integer :tag_id
    end
  end
end
