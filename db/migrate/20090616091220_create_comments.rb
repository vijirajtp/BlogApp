class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.column :name, :string
      t.column :email, :string
      t.column :website, :string
      t.column :message, :text
      
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
