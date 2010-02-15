class CreatePostsCategories < ActiveRecord::Migration
  def self.up
    create_table :posts_categories do |t|
      t.column :post_id, :integer
      t.column :category_id, :integer

      t.timestamps
    end
  end

  def self.down
    drop_table :posts_categories
  end
end
