class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.column:email, :string
      t.column:telephone, :integer
      t.column:subject, :string
      t.column:message, :text

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
